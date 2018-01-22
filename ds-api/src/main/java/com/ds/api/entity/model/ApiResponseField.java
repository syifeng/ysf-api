package com.ds.api.entity.model;

import com.ds.api.base.BaseModel;

import java.io.Serializable;

public class ApiResponseField extends BaseModel implements Serializable {
    private Long uid;

    private String uname;

    private Long apiRequestId;

    private Integer fieldType;

    private String fieldKey;

    private String fieldValue;

    private String fieldDefault;

    private Integer isBottom;

    private Integer fieldGrade;

    private String parentKey;

    private static final long serialVersionUID = 1L;

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname == null ? null : uname.trim();
    }

    public Long getApiRequestId() {
        return apiRequestId;
    }

    public void setApiRequestId(Long apiRequestId) {
        this.apiRequestId = apiRequestId;
    }

    public Integer getFieldType() {
        return fieldType;
    }

    public void setFieldType(Integer fieldType) {
        this.fieldType = fieldType;
    }

    public String getFieldKey() {
        return fieldKey;
    }

    public void setFieldKey(String fieldKey) {
        this.fieldKey = fieldKey == null ? null : fieldKey.trim();
    }

    public String getFieldValue() {
        return fieldValue;
    }

    public void setFieldValue(String fieldValue) {
        this.fieldValue = fieldValue == null ? null : fieldValue.trim();
    }

    public String getFieldDefault() {
        return fieldDefault;
    }

    public void setFieldDefault(String fieldDefault) {
        this.fieldDefault = fieldDefault == null ? null : fieldDefault.trim();
    }

    public Integer getIsBottom() {
        return isBottom;
    }

    public void setIsBottom(Integer isBottom) {
        this.isBottom = isBottom;
    }

    public Integer getFieldGrade() {
        return fieldGrade;
    }

    public void setFieldGrade(Integer fieldGrade) {
        this.fieldGrade = fieldGrade;
    }

    public String getParentKey() {
        return parentKey;
    }

    public void setParentKey(String parentKey) {
        this.parentKey = parentKey;
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
        ApiResponseField other = (ApiResponseField) that;
        return (this.getUid() == null ? other.getUid() == null : this.getUid().equals(other.getUid()))
            && (this.getUname() == null ? other.getUname() == null : this.getUname().equals(other.getUname()))
            && (this.getApiRequestId() == null ? other.getApiRequestId() == null : this.getApiRequestId().equals(other.getApiRequestId()))
            && (this.getFieldType() == null ? other.getFieldType() == null : this.getFieldType().equals(other.getFieldType()))
            && (this.getFieldKey() == null ? other.getFieldKey() == null : this.getFieldKey().equals(other.getFieldKey()))
            && (this.getFieldValue() == null ? other.getFieldValue() == null : this.getFieldValue().equals(other.getFieldValue()))
            && (this.getFieldDefault() == null ? other.getFieldDefault() == null : this.getFieldDefault().equals(other.getFieldDefault()))
            && (this.getIsBottom() == null ? other.getIsBottom() == null : this.getIsBottom().equals(other.getIsBottom()))
            && (this.getFieldGrade() == null ? other.getFieldGrade() == null : this.getFieldGrade().equals(other.getFieldGrade()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getUid() == null) ? 0 : getUid().hashCode());
        result = prime * result + ((getUname() == null) ? 0 : getUname().hashCode());
        result = prime * result + ((getApiRequestId() == null) ? 0 : getApiRequestId().hashCode());
        result = prime * result + ((getFieldType() == null) ? 0 : getFieldType().hashCode());
        result = prime * result + ((getFieldKey() == null) ? 0 : getFieldKey().hashCode());
        result = prime * result + ((getFieldValue() == null) ? 0 : getFieldValue().hashCode());
        result = prime * result + ((getFieldDefault() == null) ? 0 : getFieldDefault().hashCode());
        result = prime * result + ((getIsBottom() == null) ? 0 : getIsBottom().hashCode());
        result = prime * result + ((getFieldGrade() == null) ? 0 : getFieldGrade().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", uid=").append(uid);
        sb.append(", uname=").append(uname);
        sb.append(", apiRequestId=").append(apiRequestId);
        sb.append(", fieldType=").append(fieldType);
        sb.append(", fieldKey=").append(fieldKey);
        sb.append(", fieldValue=").append(fieldValue);
        sb.append(", fieldDefault=").append(fieldDefault);
        sb.append(", isBottom=").append(isBottom);
        sb.append(", fieldGrade=").append(fieldGrade);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}