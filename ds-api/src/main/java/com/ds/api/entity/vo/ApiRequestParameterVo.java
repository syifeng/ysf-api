package com.ds.api.entity.vo;

import com.ds.api.entity.model.ApiRequestParameter;

import java.io.Serializable;

public class ApiRequestParameterVo implements Serializable {
    private Long uid;

    private String uname;

    private String fieldValue;

    private String fieldDefault;

    private String intro;

    private Integer fieldGrade;

    private Integer fieldType;

    private Long apiRequestId;

    private String fieldKey;

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

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro == null ? null : intro.trim();
    }

    public Integer getFieldGrade() {
        return fieldGrade;
    }

    public void setFieldGrade(Integer fieldGrade) {
        this.fieldGrade = fieldGrade;
    }

    public Integer getFieldType() {
        return fieldType;
    }

    public void setFieldType(Integer fieldType) {
        this.fieldType = fieldType;
    }

    public Long getApiRequestId() {
        return apiRequestId;
    }

    public void setApiRequestId(Long apiRequestId) {
        this.apiRequestId = apiRequestId;
    }

    public String getFieldKey() {
        return fieldKey;
    }

    public void setFieldKey(String fieldKey) {
        this.fieldKey = fieldKey;
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
        ApiRequestParameter other = (ApiRequestParameter) that;
        return (this.getApiRequestId() == null ? other.getApiRequestId() == null : this.getApiRequestId().equals(other.getApiRequestId()))
                && (this.getFieldKey() == null ? other.getFieldKey() == null : this.getFieldKey().equals(other.getFieldKey()))
                && (this.getUid() == null ? other.getUid() == null : this.getUid().equals(other.getUid()))
                && (this.getUname() == null ? other.getUname() == null : this.getUname().equals(other.getUname()))
                && (this.getFieldValue() == null ? other.getFieldValue() == null : this.getFieldValue().equals(other.getFieldValue()))
                && (this.getFieldDefault() == null ? other.getFieldDefault() == null : this.getFieldDefault().equals(other.getFieldDefault()))
                && (this.getIntro() == null ? other.getIntro() == null : this.getIntro().equals(other.getIntro()))
                && (this.getFieldGrade() == null ? other.getFieldGrade() == null : this.getFieldGrade().equals(other.getFieldGrade()))
                && (this.getFieldType() == null ? other.getFieldType() == null : this.getFieldType().equals(other.getFieldType()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getApiRequestId() == null) ? 0 : getApiRequestId().hashCode());
        result = prime * result + ((getFieldKey() == null) ? 0 : getFieldKey().hashCode());
        result = prime * result + ((getUid() == null) ? 0 : getUid().hashCode());
        result = prime * result + ((getUname() == null) ? 0 : getUname().hashCode());
        result = prime * result + ((getFieldValue() == null) ? 0 : getFieldValue().hashCode());
        result = prime * result + ((getFieldDefault() == null) ? 0 : getFieldDefault().hashCode());
        result = prime * result + ((getIntro() == null) ? 0 : getIntro().hashCode());
        result = prime * result + ((getFieldGrade() == null) ? 0 : getFieldGrade().hashCode());
        result = prime * result + ((getFieldType() == null) ? 0 : getFieldType().hashCode());
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
        sb.append(", fieldValue=").append(fieldValue);
        sb.append(", fieldDefault=").append(fieldDefault);
        sb.append(", intro=").append(intro);
        sb.append(", fieldGrade=").append(fieldGrade);
        sb.append(", fieldType=").append(fieldType);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}