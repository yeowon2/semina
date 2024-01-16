package com.jwins.koceti.model.mis.gen;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class GenDorm {
    private String houseNo; //동
    private String roomNo; //호실
    private int roomNoSeq; // 호실내순번
    private String cls; //원내/외 구분 원내: 491-010 원외: 491-020
    private String homeCls; //사용처구부 군산: 410-010
    private String floor; //층
    private String roomCls; //호실구분 1인실: 492-010 2인실:492-020 3인실:492-030 4인실:492-040 게스트룸:492-800 귀빈실:492-900 창고:492-990
    private String sexDist; //성별구분  남:M 여:F 공용:A
    private int extent; //평수
    private int useFree; //월사용료
    private int useFreeDay; //일사용료
    private int cncilFree; //자치회비
    private String useYn; //사용여부 사용:Y 미사용:N
    private String rmk; //비고
    private String roomNm; //호실명
    private Date insDt; //등록일시
    private String insId; //둥록자
    private Date uptDt; //수정일시
    private String uptId; //수정자

}
