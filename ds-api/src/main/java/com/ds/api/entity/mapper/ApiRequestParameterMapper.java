package com.ds.api.entity.mapper;

import com.ds.api.entity.model.ApiRequestParameter;
import com.ds.api.entity.vo.ApiRequestParameterVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface ApiRequestParameterMapper {
    int deleteByPrimaryKey(ApiRequestParameter record);

    int insert(ApiRequestParameter record);

    int insertSelective(ApiRequestParameter record);

    ApiRequestParameter selectByPrimaryKey(ApiRequestParameter key);

    int updateByPrimaryKeySelective(ApiRequestParameter record);

    int updateByPrimaryKey(ApiRequestParameter record);


    List<ApiRequestParameterVo> selectByRequest(Long uid);

    List<ApiRequestParameterVo> selectByVo(ApiRequestParameterVo parameterVo);

    void insertVos(List<ApiRequestParameterVo> parameterVos);

    void replaceVos(List<ApiRequestParameterVo> parameterVos);

    void deleteByModule(@Param("moduleId") Long moduleId);

    void deleteByRequest(@Param("requestId")Long requestId);
}