package com.jwins.koceti.model.mis.hrm;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@JsonInclude(JsonInclude.Include.NON_NULL)
public class HrmAppntApv {
    private String appntNo;
    private String empNo;
    private String empNm;
    private Integer dutyDeg;
    private String appntDt;
    private Integer seq;
    private String dupAppntYn;
    private String appntCd;
    private String busiPlcCd;
    private String appntDtlCd;
    private String noPaidYn;
    private String upDeptCd;
    private String deptCd;
    private String deptNm;
    private String deptOrgCd;
    private String empCls;
    private String jobTp;
    private String grdCd;
    private String jobPost;
    private String assinCd;
    private String timeCls;
    private String prsnCls;
    private String hrmGrd;
    private String payGrd;
    private String techGrd;
    private String wrkCls;
    private String rglrYn;
    private String syntGrdCd;
    private String appntToDt;
    private String rmk;
    private String payDeptCd;
    private String salStep;
    private Date insDt;
    private String insId;
    private Date uptDt;
    private String uptId;
    private Integer ordSeq;
}
