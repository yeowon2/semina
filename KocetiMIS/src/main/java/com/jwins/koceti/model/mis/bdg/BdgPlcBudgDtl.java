package com.jwins.koceti.model.mis.bdg;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class BdgPlcBudgDtl {

    /*
        테이블명 : BDG_PLC_BUDG_DTL
        한글 명  : 예산관리_원예산편성세부관리
    */
    private String plcBudgCd;   // 원예산코드
    private String expnItmCd;   // 비목코드
    private String deptCd;      // 부서코드
    private String pbdgStdDt;   // 원예산편성기준일자
    private String insId;       // 등록자
    private Date insDt;         // 등록일자
    private String uptId;       // 수정자
    private Date uptDt;         // 수정일자
}
