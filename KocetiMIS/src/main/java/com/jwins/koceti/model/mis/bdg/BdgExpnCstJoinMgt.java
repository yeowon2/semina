package com.jwins.koceti.model.mis.bdg;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class BdgExpnCstJoinMgt {

    /*
        테이블명 : BDG_EXPN_CST_JOIN_MGT
        한글명   : 예산관리_비목비용코드연계관리
    */
    private String bdgStdCd;        // 예산분류코드
    private String expnItmCd;       // 비목코드
    private int seq;                // 순번
    private String expnCstCd;       // 비용코드
    private String acctCd;          // 계정코드
    private String deptCls;         // 부서구분
    private String dcCls;           // 차대구분(연구)
    private String useYn;           // 사용여부
    private String insId;           // 등록자
    private Date insDt;             // 등록일자
    private String uptId;           // 수정자
    private Date uptDt;             // 수정일자
}
