package com.ds.api.web.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ds.api.entity.mapper.*;
import com.ds.api.entity.model.ApiResponse;
import com.ds.api.entity.vo.*;
import com.ds.api.util.ResponseError;
import com.ds.api.util.ResponseOk;
import com.ds.api.util.SnowFlake;
import org.springframework.http.ResponseEntity;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.*;

/**
 * Created by ds-yifeng 2017/11/25.
 */
@Service
public class ApiRequestService {
    private Logger logger = Logger.getLogger(ApiRequestService.class);
    @Resource
    private ApiRequestMapper apiRequestMapper;
    @Resource
    private ApiRequestParameterMapper apiRequestParameterMapper;
    @Resource
    private ApiResponseMapper apiResponseMapper;
    @Resource
    private ApiResponseFieldMapper apiResponseFieldMapper;
    @Resource
    private ApiProjectMapper apiProjectMapper;
    @Resource
    private ApiModuleMapper apiModuleMapper;
    @Resource
    private SnowFlake snowFlake;
    public boolean recorded(String uri) {
        try {
            ApiRequestVo apiRequestVo = new ApiRequestVo();
            apiRequestVo.setRequestUri(uri);
            List<ApiRequestVo> apiRequests = apiRequestMapper.selectByVo(apiRequestVo);
            if (apiRequests != null && apiRequests.size() > 0) {
                return true;
            }
        } catch (Exception e) {
            logger.error("", e);
        }
        return false;
    }

    /**
     * 新增API对象数据，包括api对象，响应结果及字段数据
     * @param apiRequest 当前请求API数据
     * @param parameterMap 请求参数
     * @param responseJson 结果字串
     */
    public void insert(ApiRequestVo apiRequest, Map<String, String[]> parameterMap, JSONObject responseJson) {
        try {
            String[] reqInfo = apiRequest.getRequestUri().split("/");
            if(reqInfo==null||reqInfo.length<2)return;
            if(("api").equals(reqInfo[1])) return;
            //项目【project】
            ApiProjectVo apiProjectVo = apiProjectMapper.selectByHostName(reqInfo[1]);
            if(apiProjectVo==null){
                apiProjectVo = new ApiProjectVo();
                apiProjectVo.setUid(snowFlake.nextId());
                apiProjectVo.setHostName(reqInfo[1]);
                apiProjectVo.setCreateTime(new Date());
                apiProjectMapper.insertVo(apiProjectVo);
            }
            //模块【module】……参数
            ApiModuleVo apiModuleVo = apiModuleMapper.selectByApiCode(reqInfo[2]);
            if(apiModuleVo==null){
                apiModuleVo = new ApiModuleVo();
                apiModuleVo.setUid(snowFlake.nextId());
                apiModuleVo.setApiProjectId(apiProjectVo.getUid());
                apiModuleVo.setApiCode(reqInfo[2]);
                apiModuleMapper.insertVo(apiModuleVo);
            }
            apiRequest.setApiProjectId(apiProjectVo.getUid());
            apiRequest.setApiModuleId(apiModuleVo.getUid());
            apiRequest.setCreateTime(new Date());
            apiRequest.setUid(snowFlake.nextId());
            apiRequestMapper.insertVo(apiRequest);
            insertResponse(parameterMap, responseJson, apiRequest);
        } catch (Exception e) {
            logger.error("", e);
        }
    }

    public ResponseEntity pageList(ApiRequestVo apiRequestVo, Integer pageNum, Integer pageSize) {
        try {
            pageNum = (pageNum == null ? 1 : pageNum);
            pageSize = (pageSize == null ? 12 : pageSize);
            PageHelper.startPage(pageNum, pageSize);
            List<ApiRequestVo> apiRequestVoList = apiRequestMapper.selectByVo(apiRequestVo);
            PageInfo pageInfo = new PageInfo(apiRequestVoList);
            return ResponseOk.create(pageInfo);
        } catch (Exception e) {
            logger.error("", e);
        }
        return ResponseError.create("");
    }


    public ResponseEntity detail(Long uid) {
        try {
            ApiRequestVo apiRequestVo = apiRequestMapper.selectVo(uid);
            if(apiRequestVo==null)return ResponseError.create("未找到该对象");
            ApiResponseVo apiResponseVo = apiResponseMapper.selectByRequest(apiRequestVo.getUid());
            List<ApiResponseFieldVo> fieldVos = apiResponseFieldMapper.selectByRequest(apiRequestVo.getUid());
            List<ApiRequestParameterVo> parameterVos = apiRequestParameterMapper.selectByRequest(apiRequestVo.getUid());
            apiRequestVo.setParameterVos(parameterVos);
            apiRequestVo.setApiResponseVo(apiResponseVo);
            apiRequestVo.setFieldVos(fieldVos);
            return ResponseOk.create(apiRequestVo);
        } catch (Exception e) {
            logger.error("", e);
        }
        return ResponseError.create("");
    }

    public ResponseEntity edit(ApiRequestVo apiRequestVo) {
        try {
            apiRequestMapper.updateVo(apiRequestVo);
            return ResponseOk.create();
        } catch (Exception e) {
            logger.error("", e);
        }
        return ResponseError.create("");
    }
    public ResponseEntity add(ApiRequestVo apiRequestVo) {
        try {
            apiRequestMapper.insertVo(apiRequestVo);
            return ResponseOk.create();
        } catch (Exception e) {
            logger.error("", e);
        }
        return ResponseError.create("");
    }

    /**
     * 根据ID 删除对应对象，包括其关联相关响应数据
     * @param uid 当前删除api请求 id
     * @return
     */
    public ResponseEntity del(Long uid) {
        try {
            //删除请求参数
            apiRequestParameterMapper.deleteByRequest(uid);

            //删除请求结果集
            apiResponseFieldMapper.deleteByRequest(uid);

            //删除请求结果
            apiResponseMapper.deleteByRequest(uid);
            //删除请求
            apiRequestMapper.deleteByPrimaryKey(uid);
            deleteResponse(uid);
            return ResponseOk.create();
        } catch (Exception e) {
            logger.error("", e);
        }
        return ResponseError.create("");
    }

    /**
     * 解析JSONObject 对象 成 List<ApiResponseFieldVo>
     * @param jsonObject 解析对象
     * @param apiResponse 当前请求响应兑现
     * @return 返回 List<ApiResponseFieldVo> 列表
     */
    @Deprecated
    public List<ApiResponseFieldVo> parseResponse(JSONObject jsonObject, ApiResponse apiResponse, Integer grade) {
        List<ApiResponseFieldVo> responseFieldVos = new ArrayList<>();
        Set<String> entries = jsonObject.keySet();
        ApiResponseFieldVo apiResponseFieldVo;
        Iterator iterator = entries.iterator();
        String valStr;
        while (iterator.hasNext()) {
            String key = (String) iterator.next();
            Object value = jsonObject.get(key);
            apiResponseFieldVo = new ApiResponseFieldVo();
            if (value instanceof JSONObject) {
                grade++;
                responseFieldVos.addAll(parseResponse((JSONObject) value, apiResponse, grade));
                continue;
            } else if (value instanceof JSONArray) {
                Object jo1 = ((JSONArray) value).get(0);
                if (jo1 instanceof JSONObject) {
                    grade++;
                    responseFieldVos.addAll(parseResponse((JSONObject) jo1, apiResponse, grade));
                    continue;
                } else {
                    value = jo1;

                }
            }
            apiResponseFieldVo.setFieldKey(key);
            valStr = JSON.toJSONString(value);
            if(!StringUtils.isEmpty(valStr) && valStr.length() > 50)
                valStr=valStr.substring(0,10)+"……"+valStr.substring(valStr.length()-10, valStr.length());
            apiResponseFieldVo.setFieldValue(valStr);
            apiResponseFieldVo.setApiRequestId(apiResponse.getApiRequestId());
            apiResponseFieldVo.setUid(snowFlake.nextId());
            apiResponseFieldVo.setFieldType(getObjType(value));
            apiResponseFieldVo.setFieldGrade(grade);
            apiResponseFieldVo.setIsBottom(1);
            grade = 1;
            responseFieldVos.add(apiResponseFieldVo);
        }
        return responseFieldVos;
    }

    /**
     * 解析JSONObject 对象 成 List<ApiResponseFieldVo>
     * @param jsonObject 解析对象
     * @param apiResponse 当前请求响应兑现
     * @return 返回 List<ApiResponseFieldVo> 列表
     */
    @Deprecated
    public List<ApiResponseFieldVo> parseResponse(String parentKey, JSONObject jsonObject, ApiResponse apiResponse, Integer grade) {
        List<ApiResponseFieldVo> responseFieldVos = new ArrayList<>();
        Set<String> entries = jsonObject.keySet();
        ApiResponseFieldVo apiResponseFieldVo;
        Iterator iterator = entries.iterator();
        String valStr;
        while (iterator.hasNext()) {
            String key = (String) iterator.next();
            Object value = jsonObject.get(key);
            apiResponseFieldVo = new ApiResponseFieldVo();
            if (value instanceof JSONObject) {
                grade++;
                responseFieldVos.addAll(parseResponse(key, (JSONObject) value, apiResponse, grade));
                continue;
            } else if (value instanceof JSONArray) {
                JSONArray va = (JSONArray) value;
                if(va == null || va.size() == 0){
                    continue;
                }
                Object jo1 = va.get(0);
                if (jo1 instanceof JSONObject) {
                    grade++;
                    responseFieldVos.addAll(parseResponse(key, (JSONObject) jo1, apiResponse, grade));
                    continue;
                } else {
                    value = jo1;

                }
            }
            apiResponseFieldVo.setFieldKey(key);
            valStr = JSON.toJSONString(value);
            if(!StringUtils.isEmpty(valStr) && valStr.length() > 50)
                valStr=valStr.substring(0,10)+"……"+valStr.substring(valStr.length()-10, valStr.length());
            apiResponseFieldVo.setParentKey(parentKey);
            apiResponseFieldVo.setFieldValue(valStr);
            apiResponseFieldVo.setApiRequestId(apiResponse.getApiRequestId());
            apiResponseFieldVo.setUid(snowFlake.nextId());
            apiResponseFieldVo.setFieldType(getObjType(value));
            apiResponseFieldVo.setFieldGrade(grade);
            apiResponseFieldVo.setIsBottom(1);
            grade = 1;
            responseFieldVos.add(apiResponseFieldVo);
        }
        return responseFieldVos;
    }
    /**
     * 解析JSONObject 对象 成 List<ApiResponseFieldVo>
     * @param jsonObject 解析对象
     * @param apiResponse 当前请求响应兑现
     * @return 返回 List<ApiResponseFieldVo> 列表
     */
    public List<ApiResponseFieldVo> parseResponse(ApiResponseFieldVo fieldVo, JSONObject jsonObject, ApiResponse apiResponse) {
        List<ApiResponseFieldVo> responseFieldVos = new ArrayList<>();
        Set<String> entries = jsonObject.keySet();
        ApiResponseFieldVo apiResponseFieldVo;
        Iterator iterator = entries.iterator();
        String valStr;
        while (iterator.hasNext()) {
            String key = (String) iterator.next();
            Object value = jsonObject.get(key);
            apiResponseFieldVo = new ApiResponseFieldVo();
            apiResponseFieldVo.setFieldKey(key);
            valStr = JSON.toJSONString(value);
            if(!StringUtils.isEmpty(valStr) && valStr.length() > 50)
                valStr=valStr.substring(0,10)+"……"+valStr.substring(valStr.length()-10, valStr.length());
            if(fieldVo != null) {
                apiResponseFieldVo.setParentKey(fieldVo.getFieldKey());
                apiResponseFieldVo.setFieldGrade(fieldVo.getFieldGrade() + 1);
            }else {
                apiResponseFieldVo.setParentKey("root");
                apiResponseFieldVo.setFieldGrade(1);
            }
            if (value instanceof JSONObject) {
                responseFieldVos.addAll(parseResponse(apiResponseFieldVo, (JSONObject) value, apiResponse));
                continue;
            } else if (value instanceof JSONArray) {
                JSONArray va = (JSONArray) value;
                if(va == null || va.size() == 0){
                    continue;
                }
                Object jo1 = va.get(0);
                if (jo1 instanceof JSONObject) {
                    responseFieldVos.addAll(parseResponse(apiResponseFieldVo, (JSONObject) jo1, apiResponse));
                    continue;
                } else {
                    value = jo1;

                }
            }
            apiResponseFieldVo.setFieldKey(key);
            //解析vlaue
            parseValue(value, apiResponseFieldVo);
//            apiResponseFieldVo.setFieldType(getObjType(value));
            apiResponseFieldVo.setApiRequestId(apiResponse.getApiRequestId());
            apiResponseFieldVo.setUid(snowFlake.nextId());
            apiResponseFieldVo.setIsBottom(1);
            responseFieldVos.add(apiResponseFieldVo);
        }
        return responseFieldVos;
    }

    /**
     * 解析请求参数map为List<ApiRequestParameterVo>
     * @param parameterMap 请求参数map
     * @param apiRequestVo 请求对象
     * @return
     */
    public List<ApiRequestParameterVo> parseParameter(Map<String, String[]> parameterMap, ApiRequestVo apiRequestVo) {
        List<ApiRequestParameterVo> parameterVos = new ArrayList<>();
        if(parameterMap != null){
            ApiRequestParameterVo parameterVo;
            Set<String> entries = parameterMap.keySet();
            Iterator iterator = entries.iterator();
            while (iterator.hasNext()){
                parameterVo = new ApiRequestParameterVo();
                String key = (String) iterator.next();
                parameterVo.setApiRequestId(apiRequestVo.getUid());
                parameterVo.setUid(snowFlake.nextId());
                parameterVo.setFieldKey(key);
//                parameterVo.setFieldValue(JSON.toJSONString(parameterMap.get(key)));
                parseValue(parameterMap.get(key), parameterVo);
                parameterVos.add(parameterVo);
            }
            return parameterVos;
        }else {
            return null;
        }

    }

    /**
     * 解析请求参数为ApiRequestParameterVo
     * @param vo 当前解析对象
     * @param parameterVo 解析target
     */
    public void parseValue(Object vo, ApiRequestParameterVo parameterVo){
        Object param;
        if (vo instanceof String[]) {
            param = ((String[])vo)[0];
        }else{
            param = vo;
        }
        if (param instanceof Integer) {
            parameterVo.setFieldValue(param+"");
            parameterVo.setFieldType(2);
            return;
        }
        if (param instanceof Double) {
            parameterVo.setFieldValue(param + "");
            parameterVo.setFieldType(3);
            return;
        }
        if (param instanceof Float) {
            parameterVo.setFieldValue(param + "");

            parameterVo.setFieldType(4);
            return;
        }
        if (param instanceof Long) {
            parameterVo.setFieldValue(param + "");
            parameterVo.setFieldType(5);
            return;
        }
        if (param instanceof Boolean) {
            parameterVo.setFieldValue(param + "");
            parameterVo.setFieldType(6);
            return;
        }
        if (param instanceof Date) {
            parameterVo.setFieldValue(param + "");
            parameterVo.setFieldType(7);
            return;
        }
        if (param instanceof String) {
            parameterVo.setFieldValue(param + "");
            parameterVo.setFieldType(1);
            return;
        }
        parameterVo.setFieldValue(JSON.toJSONString(param));
        parameterVo.setFieldType(0);
    }

    /**
     * 根据当前请求删除对应响应 及响应字段数据
     * @param uid 请求API对象 主键
     */
    public void deleteResponse(Long uid){
        //删除参数结果
        apiResponseFieldMapper.deleteByRequest(uid);
        //删除当前response
        apiResponseMapper.deleteByRequest(uid);
    }

    /**
     * 更新当前请求
     * @param apiRequestVo 更新请求对象
     * @param parameterMap 当前请求参数map
     * @param responseJson 当前请求结果JSONObject 对象
     */
    public void update(ApiRequestVo apiRequestVo, Map<String, String[]> parameterMap, JSONObject responseJson) {
        try {
            //删除响应数据
            deleteResponse(apiRequestVo.getUid());
            //更新
            insertResponse(parameterMap, responseJson, apiRequestVo);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 根据uri 获取对应请求对象
     * @param uri 当前请求参数
     * @return 返回查询 ApiRequestVo 结果，如果不存在返回null
     */
    public ApiRequestVo selectByUri(String uri) {
        try {
            ApiRequestVo apiRequestVo = new ApiRequestVo();
            apiRequestVo.setRequestUri(uri);
            List<ApiRequestVo> apiRequests = apiRequestMapper.selectByVo(apiRequestVo);
            if (apiRequests != null && apiRequests.size() > 0) {
                return apiRequests.get(0);
            }
        } catch (Exception e) {
            logger.error("", e);
        }
        return null;
    }

    /**
     * 插入当前请求的响应数据到数据库，包括响应对象 apiResponse， 响应结果字段列表 ApiResponseFieldVo
     * @param parameterMap 请求参数级
     * @param resultJson 请求结果jsonObject 对象
     * @param apiRequest 请求对象
     */
    public void insertResponse(Map<String, String[]> parameterMap,JSONObject resultJson, ApiRequestVo apiRequest){
        try{
            //解析请求
            String parameters = JSONObject.toJSONString(parameterMap);
            //解析请求参数为list 并存储
            List<ApiRequestParameterVo> parameterVos = parseParameter(parameterMap, apiRequest);
            if(parameterVos!=null && parameterVos.size() > 0)
                apiRequestParameterMapper.replaceVos(parameterVos);
            Integer grade = 1;
            ApiResponse apiResponse = new ApiResponse();
            apiResponse.setUid(snowFlake.nextId());
            apiResponse.setApiRequestId(apiRequest.getUid());
            apiResponse.setCreateTime(new Date());
            apiResponse.setRequestParameters(parameters);
            apiResponse.setResponseResult(resultJson.toJSONString());
            apiResponseMapper.insert(apiResponse);
            List<ApiResponseFieldVo> apiResponseFieldVos = parseResponse(null, resultJson, apiResponse);
            if (apiResponseFieldVos != null && apiResponseFieldVos.size() > 0)
                apiResponseFieldMapper.replaceVos(apiResponseFieldVos);
        }catch (Exception e){
            logger.error("insert response data error:", e);
        }
    }


    /**
     * 获取当前对象类型 1-String，2-Integer，3-Double， 4-Float，5-Long，6-Boolean，7-Date
     * @param param 当前对象
     * @return Integer类型 1-String，2-Integer，3-Double， 4-Float，5-Long，6-Boolean，7-Date
     */
    public Integer getObjType(Object param){
        if (param instanceof Integer) {
            return 2;
        }
        if (param instanceof Double) {
            return 3;
        }
        if (param instanceof Float) {
            return 4;
        }
        if (param instanceof Long) {
            return 5;
        }
        if (param instanceof Boolean) {
            return 6;
        }
        if (param instanceof Date) {
            return 7;
        }
        return 1;
    }
/**
     * 获取当前对象类型 1-String，2-Integer，3-Double， 4-Float，5-Long，6-Boolean，7-Date
     * @param param 当前对象
     * @return Integer类型 1-String，2-Integer，3-Double， 4-Float，5-Long，6-Boolean，7-Date
     */
    public void parseValue(Object param, ApiResponseFieldVo fieldVo){

        if (param instanceof Integer) {
            fieldVo.setFieldValue(param+"");
            fieldVo.setFieldType(2);
            return;
        }
        if (param instanceof Double) {
            fieldVo.setFieldValue(param + "");
            fieldVo.setFieldType(3);
            return;
        }
        if (param instanceof Float) {
            fieldVo.setFieldValue(param + "");

            fieldVo.setFieldType(4);
            return;
        }
        if (param instanceof Long) {
            fieldVo.setFieldValue(param + "");
            fieldVo.setFieldType(5);
            return;
        }
        if (param instanceof Boolean) {
            fieldVo.setFieldValue(param + "");
            fieldVo.setFieldType(6);
            return;
        }
        if (param instanceof Date) {
            fieldVo.setFieldValue(param + "");
            fieldVo.setFieldType(7);
            return;
        }
        if (param instanceof String) {
            fieldVo.setFieldValue(param + "");
            fieldVo.setFieldType(1);
            return;
        }
        fieldVo.setFieldValue(JSON.toJSONString(param));
        fieldVo.setFieldType(0);
    }

    public void requestDetail(){

    }
    public void requestDel(){

    }
}
