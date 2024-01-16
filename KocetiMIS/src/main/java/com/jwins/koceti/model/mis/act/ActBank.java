package com.jwins.koceti.model.mis.act;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ActBank {
    private String bkCd; //은행코드
    private String bkNm; //은행명
    private String bkNmEng; //은행영문명
    private String regNo; //사업자/주민번호
    private String postNo; //우편번호
    private String addr; //주소
    private String addrDtl; //상세주소
    private String telNo; //전화번호
    private String faxNo; //팩스번호
    private String chrgNm; //담당자
    private String hpNo; //핸드폰번호
    private String useYn; //사용여부
}
