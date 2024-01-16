package com.jwins.koceti.model.common;

/**
 * 조직개편내역
 */

public class DeptReorganRecord {
    private String prevStructDt;    //이전조직개편일
    private String curStructDt;     //현재조직개편일
    private Integer seq;            //순번
    private String chgClsCd;        //변경구분코드
    private String chgClsNm;        //변경구분명
    private String prevDeptCd;      //이전부서코드
    private String prevDeptNm;      //이전부서명
    private String curDeptCd;       //현재부서코드
    private String curDeptNm;       //현재부서명
    private String rmk;             //비고
    private String orgchtDataYN;    //조직개편데이터여부
    private String chkDt;           //수정일시

    public String getPrevStructDt() {
        return prevStructDt;
    }

    public void setPrevStructDt(String prevStructDt) {
        this.prevStructDt = prevStructDt;
    }

    public String getCurStructDt() {
        return curStructDt;
    }

    public void setCurStructDt(String curStructDt) {
        this.curStructDt = curStructDt;
    }

    public Integer getSeq() {
        return seq;
    }

    public void setSeq(Integer seq) {
        this.seq = seq;
    }

    public String getChgClsCd() {
        return chgClsCd;
    }

    public void setChgClsCd(String chgClsCd) {
        this.chgClsCd = chgClsCd;
    }

    public String getChgClsNm() {
        return chgClsNm;
    }

    public void setChgClsNm(String chgClsNm) {
        this.chgClsNm = chgClsNm;
    }

    public String getPrevDeptCd() {
        return prevDeptCd;
    }

    public void setPrevDeptCd(String prevDeptCd) {
        this.prevDeptCd = prevDeptCd;
    }

    public String getPrevDeptNm() {
        return prevDeptNm;
    }

    public void setPrevDeptNm(String prevDeptNm) {
        this.prevDeptNm = prevDeptNm;
    }

    public String getCurDeptCd() {
        return curDeptCd;
    }

    public void setCurDeptCd(String curDeptCd) {
        this.curDeptCd = curDeptCd;
    }

    public String getCurDeptNm() {
        return curDeptNm;
    }

    public void setCurDeptNm(String curDeptNm) {
        this.curDeptNm = curDeptNm;
    }

    public String getRmk() {
        return rmk;
    }

    public void setRmk(String rmk) {
        this.rmk = rmk;
    }

    public String getOrgchtDataYN() {
        return orgchtDataYN;
    }

    public void setOrgchtDataYN(String orgchtDataYN) {
        this.orgchtDataYN = orgchtDataYN;
    }

    public String getChkDt() {
        return chkDt;
    }

    public void setChkDt(String chkDt) {
        this.chkDt = chkDt;
    }
}
