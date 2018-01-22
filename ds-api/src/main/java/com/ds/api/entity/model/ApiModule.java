package com.ds.api.entity.model;


import com.ds.api.base.BaseModel;

import java.io.Serializable;

public class ApiModule extends BaseModel implements Serializable {
    private Long uid;

    private Long apiProjectId;

    private String uname;

    private String intro;

    private String apiCode;

    private static final long serialVersionUID = 1L;

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public Long getApiProjectId() {
        return apiProjectId;
    }

    public void setApiProjectId(Long apiProjectId) {
        this.apiProjectId = apiProjectId;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname == null ? null : uname.trim();
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro == null ? null : intro.trim();
    }

    public String getApiCode() {
        return apiCode;
    }

    public void setApiCode(String apiCode) {
        this.apiCode = apiCode == null ? null : apiCode.trim();
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
        ApiModule other = (ApiModule) that;
        return (this.getUid() == null ? other.getUid() == null : this.getUid().equals(other.getUid()))
            && (this.getApiProjectId() == null ? other.getApiProjectId() == null : this.getApiProjectId().equals(other.getApiProjectId()))
            && (this.getUname() == null ? other.getUname() == null : this.getUname().equals(other.getUname()))
            && (this.getIntro() == null ? other.getIntro() == null : this.getIntro().equals(other.getIntro()))
            && (this.getApiCode() == null ? other.getApiCode() == null : this.getApiCode().equals(other.getApiCode()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getUid() == null) ? 0 : getUid().hashCode());
        result = prime * result + ((getApiProjectId() == null) ? 0 : getApiProjectId().hashCode());
        result = prime * result + ((getUname() == null) ? 0 : getUname().hashCode());
        result = prime * result + ((getIntro() == null) ? 0 : getIntro().hashCode());
        result = prime * result + ((getApiCode() == null) ? 0 : getApiCode().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", uid=").append(uid);
        sb.append(", apiProjectId=").append(apiProjectId);
        sb.append(", uname=").append(uname);
        sb.append(", intro=").append(intro);
        sb.append(", apiCode=").append(apiCode);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}