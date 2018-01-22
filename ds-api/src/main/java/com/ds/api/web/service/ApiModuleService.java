package com.ds.api.web.service;

import com.ds.api.entity.mapper.*;
import com.ds.api.entity.model.ApiModule;
import com.ds.api.entity.vo.ApiModuleVo;
import com.ds.api.util.ResponseError;
import com.ds.api.util.ResponseOk;
import com.ds.api.util.SnowFlake;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.log4j.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ApiModuleService {
    private final Logger logger = Logger.getLogger(ApiModuleService.class);
    @Resource
    private ApiModuleMapper apiModuleMapper;
    @Resource
    private ApiRequestMapper apiRequestMapper;

    @Resource
    private ApiRequestParameterMapper apiRequestParameterMapper;
    @Resource
    private ApiResponseFieldMapper apiResponseFieldMapper;
    @Resource
    private ApiResponseMapper apiResponseMapper;
    @Resource
    private SnowFlake snowFlake;

    public ResponseEntity page(ApiModuleVo apiModuleVo, Integer pageNum, Integer pageSize) {
        try {
            PageHelper.startPage(pageNum == null ? 1 : pageNum, pageSize == null ? 12 : pageSize);
            List<ApiModuleVo> apiRequestVoList = apiModuleMapper.selectByVo(apiModuleVo);
            PageInfo pageInfo = new PageInfo(apiRequestVoList);
            return ResponseOk.create(pageInfo);
        } catch (Exception e) {
            logger.error("", e);
        }
        return ResponseError.create("");
    }

    public ResponseEntity detail(Long uid) {
        try {
            ApiModuleVo apiModuleVo = apiModuleMapper.selectVo(uid);
            return ResponseOk.create(apiModuleVo);
        } catch (Exception e) {
            logger.error("", e);
        }
        return ResponseError.create("");
    }

    public ResponseEntity add(ApiModuleVo apiModuleVo) {
        try {
            apiModuleVo.setUid(snowFlake.nextId());
            apiModuleMapper.insertVo(apiModuleVo);
            return ResponseOk.create(apiModuleVo);
        } catch (Exception e) {
            logger.error("", e);
        }
        return ResponseError.create("");
    }

    public ResponseEntity edit(ApiModule apiModule) {
        try {
            apiModuleMapper.updateByPrimaryKeySelective(apiModule);
            return ResponseOk.create();
        } catch (Exception e) {
            logger.error("", e);
        }
        return ResponseError.create("");
    }

    /**
     * 删除模块，及模块下所有的请求，请求参数，请求结果
     * @param uid 模块ID
     * @return
     */
    public ResponseEntity del(Long uid) {
        try {
            //删除模块下所有接口请求参数
            apiRequestParameterMapper.deleteByModule(uid);

            //删除模块下素有接口结果参数
            apiResponseFieldMapper.deleteByModule(uid);

            //删除模块下所有response
            apiResponseMapper.deleteByModule(uid);

            //删除模块素有request
            apiRequestMapper.deleteByModule(uid);
            //删除模块
            apiModuleMapper.deleteByPrimaryKey(uid);
            return ResponseOk.create();
        } catch (Exception e) {
            logger.error("", e);
        }
        return ResponseError.create("");
    }
}
