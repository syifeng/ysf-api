package com.ds.api.entity.model;

import com.ds.api.base.BaseModel;

import java.io.Serializable;
import java.util.Date;

public class ApiProject extends BaseModel implements Serializable {
    private Long uid;

    private String uname;

    private String testDomain;

    private String readyDomain;

    private String productDomain;

    private String intro;

    private Date createTime;

    private String proNum;

    private String hostName;

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

    public String getTestDomain() {
        return testDomain;
    }

    public void setTestDomain(String testDomain) {
        this.testDomain = testDomain == null ? null : testDomain.trim();
    }

    public String getReadyDomain() {
        return readyDomain;
    }

    public void setReadyDomain(String readyDomain) {
        this.readyDomain = readyDomain == null ? null : readyDomain.trim();
    }

    public String getProductDomain() {
        return productDomain;
    }

    public void setProductDomain(String productDomain) {
        this.productDomain = productDomain == null ? null : productDomain.trim();
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro == null ? null : intro.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getProNum() {
        return proNum;
    }

    public void setProNum(String proNum) {
        this.proNum = proNum == null ? null : proNum.trim();
    }

    public String getHostName() {
        return hostName;
    }

    public void setHostName(String hostName) {
        this.hostName = hostName == null ? null : hostName.trim();
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
        ApiProject other = (ApiProject) that;
        return (this.getUid() == null ? other.getUid() == null : this.getUid().equals(other.getUid()))
            && (this.getUname() == null ? other.getUname() == null : this.getUname().equals(other.getUname()))
            && (this.getTestDomain() == null ? other.getTestDomain() == null : this.getTestDomain().equals(other.getTestDomain()))
            && (this.getReadyDomain() == null ? other.getReadyDomain() == null : this.getReadyDomain().equals(other.getReadyDomain()))
            && (this.getProductDomain() == null ? other.getProductDomain() == null : this.getProductDomain().equals(other.getProductDomain()))
            && (this.getIntro() == null ? other.getIntro() == null : this.getIntro().equals(other.getIntro()))
            && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()))
            && (this.getProNum() == null ? other.getProNum() == null : this.getProNum().equals(other.getProNum()))
            && (this.getHostName() == null ? other.getHostName() == null : this.getHostName().equals(other.getHostName()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getUid() == null) ? 0 : getUid().hashCode());
        result = prime * result + ((getUname() == null) ? 0 : getUname().hashCode());
        result = prime * result + ((getTestDomain() == null) ? 0 : getTestDomain().hashCode());
        result = prime * result + ((getReadyDomain() == null) ? 0 : getReadyDomain().hashCode());
        result = prime * result + ((getProductDomain() == null) ? 0 : getProductDomain().hashCode());
        result = prime * result + ((getIntro() == null) ? 0 : getIntro().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        result = prime * result + ((getProNum() == null) ? 0 : getProNum().hashCode());
        result = prime * result + ((getHostName() == null) ? 0 : getHostName().hashCode());
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
        sb.append(", testDomain=").append(testDomain);
        sb.append(", readyDomain=").append(readyDomain);
        sb.append(", productDomain=").append(productDomain);
        sb.append(", intro=").append(intro);
        sb.append(", createTime=").append(createTime);
        sb.append(", proNum=").append(proNum);
        sb.append(", hostName=").append(hostName);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}