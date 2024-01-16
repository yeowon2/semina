package com.jwins.koceti.model.mis.bdg;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class BdgExpnCd {

    /*
    name    : BDG_EXPN_CD
    comment : 예산관리_비목코드관리
    */

    private String expnItmCd;       // 비목코드
    private String expnItmNm;       // 비목명
    private String expnItmEngNm;    // 비목영문명
    private String admExpnItmCd;    // 통합비목코드
    private String busiPlcCd;       // 사업장코드
    private String expnDiv;         // 비목분류코드
    private String expnItmCls;      // 비목구분
    private String expnItmCls2;     // 비목구분2
    private String ohCls;           // oh구분
    private String useYn;           // 사용여부
    private String rmk;             // 사용여부
    private String bfCnvCd01;       // 구버전코드
    private String insId;           // 등록자
    private Date insDt;             // 등록일시
    private String uptId;           // 수정자
    private Date uptDt;             // 수정일시
}
