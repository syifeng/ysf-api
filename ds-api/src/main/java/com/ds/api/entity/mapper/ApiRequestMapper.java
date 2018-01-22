package com.ds.api.entity.mapper;

import com.ds.api.entity.model.ApiRequest;
import com.ds.api.entity.vo.ApiRequestVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface ApiRequestMapper {
    int deleteByPrimaryKey(Long uid);

    int insert(ApiRequest record);

    int insertSelective(ApiRequest record);

    ApiRequest selectByPrimaryKey(Long uid);

    int updateByPrimaryKeySelective(ApiRequest record);

    int updateByPrimaryKey(ApiRequest record);

    List<ApiRequestVo> selectByVo(ApiRequestVo requestVo);

    ApiRequestVo selectVo(Long uid);

    void updateVo(ApiRequestVo apiRequestVo);

    void insertVo(ApiRequestVo apiRequest);

    void deleteByModule(Long uid);
}