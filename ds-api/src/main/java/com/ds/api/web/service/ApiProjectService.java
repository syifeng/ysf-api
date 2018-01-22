package com.ds.api.web.service;

import com.ds.api.entity.mapper.ApiProjectMapper;
import com.ds.api.entity.model.ApiProject;
import com.ds.api.entity.vo.ApiProjectVo;
import com.ds.api.util.ResponseError;
import com.ds.api.util.ResponseOk;
import com.ds.api.util.SnowFlake;
import org.springframework.http.ResponseEntity;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by ds-yifeng on 2017/11/25.
 */
@Service
public class ApiProjectService {
    private Logger logger = Logger.getLogger(ApiProjectService.class);
    @Resource
    private ApiProjectMapper apiProjectMapper;
    @Resource
    private SnowFlake snowFlake;
    public ResponseEntity page(ApiProjectVo apiProjectVo, Integer pageNum, Integer pageSize) {
        try {
            PageHelper.startPage(pageNum==null?1:pageNum, pageSize==null?12:pageSize);
            List<ApiProjectVo> apiRequestVoList = apiProjectMapper.selectByVo(apiProjectVo);
            PageInfo pageInfo = new PageInfo(apiRequestVoList);
            return ResponseOk.create(pageInfo);
        }catch (Exception e){
            logger.error("", e);
        }
        return ResponseError.create("");
    }

    public ResponseEntity detail(Long uid) {
        try {
            ApiProjectVo apiProjectVo = apiProjectMapper.selectVo(uid);
            return ResponseOk.create(apiProjectVo);
        }catch (Exception e){
            logger.error("", e);
        }
        return ResponseError.create("");
    }
    public ResponseEntity add(ApiProjectVo apiProjectVo) {
        try {
            apiProjectVo.setCreateTime(new Date());
            apiProjectVo.setUid(snowFlake.nextId());
            apiProjectMapper.insertVo(apiProjectVo);
            return ResponseOk.create(apiProjectVo);
        }catch (Exception e){
            logger.error("", e);
        }
        return ResponseError.create("");
    }
    public ResponseEntity edit(ApiProject apiProject) {
        try {
            apiProjectMapper.updateByPrimaryKeySelective(apiProject);
            return ResponseOk.create();
        }catch (Exception e){
            logger.error("", e);
        }
        return ResponseError.create("");
    }
    public ResponseEntity del(Long uid) {
        try {
            apiProjectMapper.deleteByPrimaryKey(uid);
            return ResponseOk.create();
        }catch (Exception e){
            logger.error("", e);
        }
        return ResponseError.create("");
    }
}
