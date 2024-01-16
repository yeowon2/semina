package com.jwins.koceti.model.mis.act;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ActIntyCd {
    private String intyCd;  //업종코드
    private String intyNm; //업종명
    private String necesTaxRate; //필요경비세율
    private String taxRate; //소득세율


}
