package com.jwins.koceti.model.mis.act;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ActBankAcct {
    private String bkCd; //은행코드
    private String bkNm; //은행명
    private String bkAccNo; //은행계좌번호
    private String brncOffc; //지점명
    private String dpsitNm; //통장명
    private String acctCd; //계정코드
    private String dpsitUse;//통장용도
    private String dpsitTp; //예금종류
    private String openDt; //개설일자
    private String termDt; //만기일자
    private String rate; //비율
    private String oprtCls; //운용구분
    private String oprtPps; //운용목적
    private String useYn; //사용여부
    private String rmk; //비고

}
