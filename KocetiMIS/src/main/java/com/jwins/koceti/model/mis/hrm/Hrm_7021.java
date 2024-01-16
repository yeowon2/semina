package com.jwins.koceti.model.mis.hrm;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

/*
* 1. 테이블 조인
    * HRM_BAS_MGT A, HRM_BAS_DTL B, HEM_DEPT C, HRM_SYNT_GRD_CD D
    * HRM_SCHLA E, HRM_APPNT_CD H

* 2. COLUMN
    empNo               HRM_BAS_MGT
    empNm               HRM_BAS_MGT
    resNo               HRM_BAS_MGT
    deptNm              HEM_DEPT
    syntGrdNm           HRM_SYNT_GRD_CD
    schla               HRM_SCHLA
    mjr                 HEM_SCHLA
    rsignCls            HRM_APPNT_CD
    rsignDt             HRM_BAS_DTL
    endDt               HRM_BAS_DTL
    rmk
    rsignRsn           HRM_BAS_DTL
    rsignCom           HRM_BAS_DTL
    rsignDept          HRM_BAS_DTL
    rsignGrd           HRM_BAS_DTL
    rsignGrd           HRM_BAS_DTL
    rsignAddr          HRM_BAS_DTL
    rsignHmTel         HRM_BAS_DTL
    rsignCellpon       HRM_BAS_DTL
    rsignEmail         HRM_BAS_DTL
    partTime           HRM_BAS_DTL
 */
@Getter
@Setter
public class Hrm_7021 {
    private String empNo;       // 사번
    private String empNm;       // 성명
    private String resNo;       // 주민번호
    private String deptNm;      // 부서명
    private String entDt;        // 입사일자
    private String syntGrdNm;   //통합직급명
    private String schla;       // 학위
    private String mjr;         // 전공
    private String rsignCls;    // 퇴직구분
    private String rsignDt;     // 퇴직일자
    //endDt
    private String rmk;         // 비고
    private String rsignRsn;    // 퇴사사유
    private String rsignCom;    // 이직직장명
    private String rsignDept;   // 이직 부서명
    private String rsignGrd;    // 이직직위명
    private String rsignAddr;   // 이직후 주소
    private String rsignHmTel;  // 이직후 전화번호
    private String rsignCellpon;    //이직후 휴대폰번호
    private String rsignEmail;  // 이직후 이메일
    private int partTime;   // 근무시간

    // 검색조건
    private String startDate;     // 시작일자
    private String endDate;       // 종료일자
    private List<String> empCls;   // 사원구분
}

