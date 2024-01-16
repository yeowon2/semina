package com.jwins.koceti.model.mis.bdg;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class BdgExpnCstCd {
    
    /*
    * 테이블 명 : BDG_EXPN_CST_CD
    * 한글      : 예산관리_비용코드 관리
    */
    private String expnCstCd;           // 비용코드
    private String expnCstNm;           // 비용명
    private String expnCstEngNm;        // 비용 영문명
    private String busiPlcCd;           // 사업장코드
    private String cstDiv;              // 비용분류코드
    private String useYn;               // 사용여부
    private String rmk;                 // 비고
    private String bfCnvCd01;           // 구컨버젼 코드
    private String insId;               // 등록자
    private Date insDt;                 // 등록일자
    private String uptId;               // 수정자
    private Date uptDt;                 // 수정일자
}
