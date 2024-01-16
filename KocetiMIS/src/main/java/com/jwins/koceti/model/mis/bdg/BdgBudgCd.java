package com.jwins.koceti.model.mis.bdg;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class BdgBudgCd {

    /*
    name    : BDG_BUDG_CD
    comment : 편성_예산관리
    */

    private String budgCd;          // 예산코드
    private String budgNm;          // 예산명
    private String budgEngNm;       // 예산영문명
    private String budgYy;          // 예산년도
    private String bdgStdCd;        // 예산분류코드
    private String busiPlcCd;       // 사업장코드
    private String budgCls;         // 예산구분
    private String allocCls;        // 배정구분
    private String useJuris;        // 예산사용권한
    private String bdgDeptCd;       // 예산사용부서
    private String bdgFrmDt;        // 예산사용시작일
    private String bdgToDt;         // 예산사용종료일
    private String privBudgCd;      // 전년도예산코드
    private String confYn;          // 확정여부
    private String confDt;          // 확정일자
    private String stopYn;          // 중지여부
    private String stopDt;          // 중단일자
    private String closeYn;         // 마감여부
    private String closeDt;         // 마감일자
    private String supConfDt;       // 가예산확정일자
    private String incmYn;          // 실수입통제여부
    private String mailYn;          // 메일발송여부
    private String actCls;          // 회계지출구분
    private String budgCls2;        // 예산구분2
    private String budgSeq;         // 예산순번
    private String bfCnvCd01;       // 구컨버젼코드
    private String bfCnvCd02;       // 구컨버젼코드2
    private String insId;           // 등록자
    private Date insDt;             // 등록일시
    private String uptId;           // 수정자
    private Date uptDt;             // 수정일시
    private String projCd;          // 과제코드
    private String vatYn;           // 과세구분
    private String bkCd;            // 은행코드
    private String bkAccNo;         // 은행계좌번호
}
