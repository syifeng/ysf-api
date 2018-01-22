package com.ds.api.entity.mapper;

import com.ds.api.entity.model.ApiProject;
import com.ds.api.entity.vo.ApiProjectVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface ApiProjectMapper {
    int deleteByPrimaryKey(Long uid);

    int insert(ApiProject record);

    int insertSelective(ApiProject record);

    ApiProject selectByPrimaryKey(Long uid);

    int updateByPrimaryKeySelective(ApiProject record);

    int updateByPrimaryKey(ApiProject record);

    ApiProjectVo selectByHostName(@Param("hostName") String hostName);

    List<ApiProjectVo> selectByVo(ApiProjectVo apiProjectVo);

    void insertVo(ApiProjectVo apiProjectVo);

    ApiProjectVo selectVo(@Param("uid") Long uid);
}