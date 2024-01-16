package com.jwins.koceti.model.mis.act;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ActNtnRate {
    private String incmCd; //소득코드
    private String ntnCd; //국가코드
    private String ntnNm; //국가명
    private String incmRate; //수입세율
    private String inhabtRate; //수입주민세율
}
