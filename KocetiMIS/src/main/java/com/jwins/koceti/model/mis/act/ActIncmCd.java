package com.jwins.koceti.model.mis.act;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ActIncmCd {
    private String incmCd;  //소득코드
    private String incmCls; //소득구분
    private String stanIncmCd; //국가표준코드;
    private String stanIncmSeq; //국가표준순번
    private String IncmNm; //소득명
    private String necesTaxRate; //필요경비세율
    private String taxRate; //소득세율
    private String habtCls; //거주구분
    private String useYn; //사용여부
    private String minTax; //과세최저금액
}
