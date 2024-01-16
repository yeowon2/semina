package com.jwins.koceti.model.mis.act;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ExchangeRate {
    private String currCd; //통화구분
    private String currNm; //통화명
    private String basicRate; //기준환율
    private String ttSellRate; //전신환매입율
    private String ttBuyRate; //전신환매도율
    private String cashSellRate; //현찰매입율
    private String cashBuyRate; //현찰매도율
    private String usaRate; //대미환산율
    private String tcSellRate; //T/C매도율

}
