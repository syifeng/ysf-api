package com.ds.api.entity.mapper;

import com.ds.api.entity.model.ApiResponseField;
import com.ds.api.entity.vo.ApiResponseFieldVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface ApiResponseFieldMapper {
    int deleteByPrimaryKey(Long uid);

    int insert(ApiResponseField record);

    int insertSelective(ApiResponseField record);

    ApiResponseField selectByPrimaryKey(Long uid);

    int updateByPrimaryKeySelective(ApiResponseField record);

    int updateByPrimaryKey(ApiResponseField record);

    void insertVos(List<ApiResponseFieldVo> fields);

    void replaceVos(List<ApiResponseFieldVo> fields);

    List<ApiResponseFieldVo> selectByRequest(@Param("requestId") Long requestId);

    void deleteByRequest(Long uid);

    List<ApiResponseFieldVo> selectByVo(ApiResponseFieldVo apiResponseFieldVo);

    ApiResponseFieldVo selectVo(Long uid);

    void insertVo(ApiResponseFieldVo apiResponseFieldVo);

    void deleteByModule(Long uid);
}