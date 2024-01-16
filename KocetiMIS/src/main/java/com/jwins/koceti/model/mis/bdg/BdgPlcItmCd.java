package com.jwins.koceti.model.mis.bdg;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class BdgPlcItmCd {

    private String plcItmCd;
    private String plcItmNm;
    private String plcItmEngNm;
    private String admExpnItmCd;
    private String busiPlcCd;
    private String useYn;
    private String rmk;
    private String bfCnvCd01;
    private String insId;
    private Date insDt;
    private String uptId;
    private Date uptDt;
}
