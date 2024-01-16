package com.jwins.koceti.model.common;

public class Employee {
    private String deptNm;          //부서명
    private String jobPostNm;       //직위
    private String grdNm;           //직급
    private String empNo;           //사번
    private String empNm;           //성명

    public String getDeptNm() {
        return deptNm;
    }

    public void setDeptNm(String deptNm) {
        this.deptNm = deptNm;
    }

    public String getJobPostNm() {
        return jobPostNm;
    }

    public void setJobPostNm(String jobPostNm) {
        this.jobPostNm = jobPostNm;
    }

    public String getGrdNm() {
        return grdNm;
    }

    public void setGrdNm(String grdNm) {
        this.grdNm = grdNm;
    }

    public String getEmpNo() {
        return empNo;
    }

    public void setEmpNo(String empNo) {
        this.empNo = empNo;
    }

    public String getEmpNm() {
        return empNm;
    }

    public void setEmpNm(String empNm) {
        this.empNm = empNm;
    }
}
