package com.jwins.koceti.model.mis.bdg;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class BdgExpnJoinMgt {

    /*
    name    : BDG_EXPN_JOIN_MGT
    comment : 예산관리_원예산코드_비목연계관리
    */

    private String plcBudgCd;   // 원예산코드
    private String expnItmCd;   // 비목코드
    private String insId;       // 등록자
    private Date insDt;         // 등록일시
    private String uptId;       // 수정자
    private Date uptDt;         // 수정일시
}
