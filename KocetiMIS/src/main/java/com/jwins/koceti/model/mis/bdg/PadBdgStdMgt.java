package com.jwins.koceti.model.mis.bdg;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class PadBdgStdMgt {

    /*
        name    : PAD_BDG_STD_MGT
        comment : 관리_예산분류관리 테이블
    */
    private String bdgStdCd;    // 예산분류코드
    private String bdgStdNm;    // 예산분류명
    private String bdgMthd;     // 예산분류약어
    private String busiYn;      // 사업여부
    private String bfCnvCd01;   // 구컨버젼코드
    private String budgYy;      // 예산년도
    private String privBdgStdCd;    // 이전예산분류코드
    private String insId;           // 등록자아이디(사번)
    private Date insDt;             // 등록일시
    private String uptId;           // 수정자아이디(사번)
    private Date uptDt;             // 수정일시
}
