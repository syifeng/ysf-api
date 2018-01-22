package com.ds.api.web.service;

import com.ds.api.entity.mapper.ApiResponseFieldMapper;
import com.ds.api.entity.model.ApiResponseField;
import com.ds.api.entity.vo.ApiResponseFieldVo;
import com.ds.api.util.ResponseError;
import com.ds.api.util.ResponseOk;
import com.ds.api.util.SnowFlake;
import org.springframework.http.ResponseEntity;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ds-yifeng on 2017/11/25.
 */
@Service
public class ApiResponseFieldService {
    private Logger logger = Logger.getLogger(ApiResponseFieldService.class);
    @Resource
    private ApiResponseFieldMapper apiResponseFieldMapper;
    @Resource
    private SnowFlake snowFlake;
    public ResponseEntity page(ApiResponseFieldVo apiResponseFieldVo, Integer pageNum, Integer pageSize) {
        try {
            PageHelper.startPage(pageNum==null?1:pageNum, pageSize==null?12:pageSize);
            List<ApiResponseFieldVo> apiRequestVoList = apiResponseFieldMapper.selectByVo(apiResponseFieldVo);
            PageInfo pageInfo = new PageInfo(apiRequestVoList);
            return ResponseOk.create(pageInfo);
        }catch (Exception e){
            logger.error("", e);
        }
        return ResponseError.create("");
    }

    public ResponseEntity detail(Long uid) {
        try {
            ApiResponseFieldVo apiResponseFieldVo = apiResponseFieldMapper.selectVo(uid);
            return ResponseOk.create(apiResponseFieldVo);
        }catch (Exception e){
            logger.error("", e);
        }
        return ResponseError.create("");
    }
    public ResponseEntity add(ApiResponseFieldVo apiResponseFieldVo) {
        try {
            apiResponseFieldVo.setUid(snowFlake.nextId());
            apiResponseFieldMapper.insertVo(apiResponseFieldVo);
            return ResponseOk.create(apiResponseFieldVo);
        }catch (Exception e){
            logger.error("", e);
        }
        return ResponseError.create("");
    }
    public ResponseEntity edit(ApiResponseField apiResponseField) {
        try {
            apiResponseFieldMapper.updateByPrimaryKeySelective(apiResponseField);
            return ResponseOk.create();
        }catch (Exception e){
            logger.error("", e);
        }
        return ResponseError.create("");
    }
    public ResponseEntity del(Long uid) {
        try {
            apiResponseFieldMapper.deleteByPrimaryKey(uid);
            return ResponseOk.create();
        }catch (Exception e){
            logger.error("", e);
        }
        return ResponseError.create("");
    }
}
