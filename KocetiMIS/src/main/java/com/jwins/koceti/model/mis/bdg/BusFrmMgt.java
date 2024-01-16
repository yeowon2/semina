package com.jwins.koceti.model.mis.bdg;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class BusFrmMgt {

    /*
        name    : BUS_FRM_MGT
        comment : 사업_예산기준별비목골격관리
    */
    private String bdgStdCd;    // 예산분류코드
    private int seq;            // 순번
    private String expnItmCd;   // 비목코드
    private String upExpnItmCd; // 상위비목코드
    private String bdgStdExpnNm;    // 예산기준항목명
    private int lev;                // 레벨
    private int ordNo;              // 정렬번호
    private String ctrlCd;          // 통제코드
    private String ctrlCd2;         // 통제코드2
    private String expnItmCls;      // 비목구분
    private String expnExeRate;     // 비목집행비율
    private String ohCls;           // oh구분
    private String ohCls2;          // 비목분류
    private int supBdgRate;         // 가예산편성비율
    private String projRqstYn;      // 과제 신청서 사용유무
    private String projPlanYn;      // 과제계획서 사용유무
    private String agrmtYn;         // 협약서 사용유무
    private String bfCnvCd01;       // 구컨버젼코드
    private String insId;           // 등록자
    private Date insDt;             // 등록일시
    private String uptId;           // 수정자
    private Date uptDt;             // 수정일시



}
