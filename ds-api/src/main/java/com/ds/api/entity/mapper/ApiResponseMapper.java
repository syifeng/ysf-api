package com.ds.api.entity.mapper;

import com.ds.api.entity.model.ApiResponse;
import com.ds.api.entity.vo.ApiResponseVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
@Mapper
public interface ApiResponseMapper {
    int deleteByPrimaryKey(Long uid);

    int insert(ApiResponse record);

    int insertSelective(ApiResponse record);

    ApiResponse selectByPrimaryKey(Long uid);

    int updateByPrimaryKeySelective(ApiResponse record);

    int updateByPrimaryKey(ApiResponse record);

    ApiResponseVo selectByRequest(@Param("apiRequestId") Long apiRequestId);

    void deleteByRequest(@Param("apiRequestId") Long apiRequestId);

    void deleteByModule(@Param("moduleId") Long moduleId);
}