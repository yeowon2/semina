package com.jwins.koceti.model.mis.bdg;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class BdgPlcBudgCd {

    /*
        name    : BDG_PLC_BUDG_CD
        comment : 예산관리_원예산관리
    */

    private String plcBudgCd;   // 원예산코드
    private String plcItmCd;    // 원 비목코드
    private String upPlcItmCd;  // 상위원비목코드
    private String upPlcBudgCd; // 상위원예산코드
    private String plcBudgNm;   // 원예산명
    private String plcBudgEngNm;    // 원예산영문명
    private String budgYy;          // 예산년도
    private String busiPlcCd;       // 사업장코드
    private int busiPlcSeq;     // 원예산코드순서
    private String bdgStdCd;    // 예산분류코드
    private String ieCls;       // 수입/지출구분
    private String bdgRefCd;    // 원예산관련코드
    private String busiYn;      // 사업여부
    private String deptBdgYn;   // 부서운영비 여부
    private int lev;            // 레벨
    private String rmk;         // 비고
    private int ordNo;          // 정렬번호
    private String useYn;       // 사용여부
    private String dsYn;        // 수지대상여부
    private String bfCnvCd01;   // 구컨버젼코드
    private String insId;       // 등록자
    private Date insDt;       // 등록일시
    private String uptId;    // 수정자
    private Date uptDt;   // 수정일자

}
