package com.ds.api.entity.mapper;

import com.ds.api.entity.model.ApiModule;
import com.ds.api.entity.vo.ApiModuleVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface ApiModuleMapper {
    int deleteByPrimaryKey(Long uid);

    int insert(ApiModule record);

    int insertSelective(ApiModule record);

    ApiModule selectByPrimaryKey(Long uid);

    int updateByPrimaryKeySelective(ApiModule record);

    int updateByPrimaryKey(ApiModule record);

    ApiModuleVo selectByApiCode(@Param("apiCode") String apiCode);

    void insertVo(ApiModuleVo apiModuleVo);

    List<ApiModuleVo> selectByVo(ApiModuleVo apiModuleVo);

    ApiModuleVo selectVo(Long uid);
}