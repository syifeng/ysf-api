package com.ds.api.entity.vo;

import java.io.Serializable;
import java.util.Date;

public class ApiResponseVo implements Serializable {
    private Long uid;

    private Long apiRequestId;

    private String responseVersion;

    private String requestParameters;

    private String responseResult;

    private Date createTime;

    private static final long serialVersionUID = 1L;

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public Long getApiRequestId() {
        return apiRequestId;
    }

    public void setApiRequestId(Long apiRequestId) {
        this.apiRequestId = apiRequestId;
    }

    public String getResponseVersion() {
        return responseVersion;
    }

    public void setResponseVersion(String responseVersion) {
        this.responseVersion = responseVersion == null ? null : responseVersion.trim();
    }

    public String getRequestParameters() {
        return requestParameters;
    }

    public void setRequestParameters(String requestParameters) {
        this.requestParameters = requestParameters == null ? null : requestParameters.trim();
    }

    public String getResponseResult() {
        return responseResult;
    }

    public void setResponseResult(String responseResult) {
        this.responseResult = responseResult == null ? null : responseResult.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        ApiResponseVo other = (ApiResponseVo) that;
        return (this.getUid() == null ? other.getUid() == null : this.getUid().equals(other.getUid()))
            && (this.getApiRequestId() == null ? other.getApiRequestId() == null : this.getApiRequestId().equals(other.getApiRequestId()))
            && (this.getResponseVersion() == null ? other.getResponseVersion() == null : this.getResponseVersion().equals(other.getResponseVersion()))
            && (this.getRequestParameters() == null ? other.getRequestParameters() == null : this.getRequestParameters().equals(other.getRequestParameters()))
            && (this.getResponseResult() == null ? other.getResponseResult() == null : this.getResponseResult().equals(other.getResponseResult()))
            && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getUid() == null) ? 0 : getUid().hashCode());
        result = prime * result + ((getApiRequestId() == null) ? 0 : getApiRequestId().hashCode());
        result = prime * result + ((getResponseVersion() == null) ? 0 : getResponseVersion().hashCode());
        result = prime * result + ((getRequestParameters() == null) ? 0 : getRequestParameters().hashCode());
        result = prime * result + ((getResponseResult() == null) ? 0 : getResponseResult().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", uid=").append(uid);
        sb.append(", apiRequestId=").append(apiRequestId);
        sb.append(", responseVersion=").append(responseVersion);
        sb.append(", requestParameters=").append(requestParameters);
        sb.append(", responseResult=").append(responseResult);
        sb.append(", createTime=").append(createTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}