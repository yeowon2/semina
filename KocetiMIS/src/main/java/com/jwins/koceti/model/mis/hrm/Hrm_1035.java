package com.jwins.koceti.model.mis.hrm;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

/*
    A.HRM_APPNT
        EMP_NO
        DUTY_DEG
        APPNT_DT
        NO_PAID_NM
        EMP_CLS_NM
        AS JOB_NM
        GRD_NM
        JOB_POST_NM
        ASSIN_NM
        TIME_CLS_NM
        PRSN_CLS_NM
        WRK_CLS_NM
        RGLR_YN_NM
        SAL_STEP
        HRM_GRD
        PAY_GRD
        TECH_GRD
        APPNT_TO_DT
        RMK

    B.HRM_BAS_MGT
        EMP_NM

    C.HRM_BAS_DTL
        ENT_DT

    D.HRM_DEPT
        CUR_DEPT_NM

    E.HRM_APPNT_CD
        E.APPNT_NM

    F.HRM_SYNT_GRD
        CUR_SYNT_GRD_NM

    G.HRM_SYNT_GRD
        DEPT_NM

    H.HRM_SYNT_GRD
        SYNT_GRD_NM

    I.HRM_APPNT_CD
        APPNT_DTL_NM

    J.HRM_DEPT
        UP_DEPT_NM
* */
@Getter
@Setter
public class Hrm_1035 {

    // 직업구분 코드, 이름
    private String appntCd;
    private String appntNm;
    private String curDeptCd;
    private String curDeptNm;
    private String curSyntGrdNm;
    private String empNo;
    private String empNm;
    private int dutyDeg;
    private String entDt;
    private String appntDt;
    private String appntDtlNm;
    private String noPaidNm;
    private String deptNm;
    private String upDeptNm;

    private String empClsNm;
    private String jobNm;
    private String grdNm;
    private String jobPostNm;
    private String assinNm;
    private String timeClsNm;
    private String prsnClsNm;
    private String wrkClsNm;
    private String rglrYnNm;
    private String syntGrdNm;
    private String salStep;
    private String hrmGrd;
    private String payGrd;
    private String techGrd;
    private String appntToDt;
    private String rmk;

    // 검색조건
    private List<String> appntCls;
    private String contStartDate;
    private String contEndDate;
    private String contEndYY;



}
