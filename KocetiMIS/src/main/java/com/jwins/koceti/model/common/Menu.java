package com.jwins.koceti.model.common;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class Menu {

    private String menuId;          // 메뉴아이디
    private String menuNm;          // 메뉴명
    private String menuEngNm;       // 메뉴영문명
    private String lev;             // 레벨
    private String upMenuId;        // 상위메뉴아이디
    private String useYn;           // 사용여부
    private String imgPath;         // 이미지 경로
    private String imgOverPath;     // 이미지 오버 경로
    private String leftImgPath;     // 좌측이미지
    private String param;           // 파라미터
    private String menuTp;          // 메뉴유형
    private int ordNo;              // 정렬번호
    private String clsCd;           // 분류코드
    private String wdtSz;           // 가로사이즈
    private String hgtSz;           // 세로사이즈
    private String helpId;          // 도움말ID
    private String rmk;             // 비고
    private String imgEngPath;      //이미지경로_영문
    private String helpSubNm;       // 도움말
    private String imgOverEngPath;  //이미지 오버 영문경로
    private String pgmId;           //프로그램 아이디
    private String pgmLink;          // 경로
    private String pgmUrl;          // url경로
    private String insId;           // 등록자
    private Date insDt;           // 등록일자
    private String uptId;           // 수정자
    private Date uptDt;           // 수정일자

    public MenuTree toTree() {
        MenuTree tree = new MenuTree();
        tree.setMenuId(this.menuId);
        tree.setUpMenuId(this.upMenuId);
        tree.setMenuNm(this.menuNm);
        tree.setLev(this.lev);
        tree.setPgmId(this.pgmId);
        tree.setPgmLink(this.pgmLink);
        tree.setPgmUrl(this.pgmUrl);
        return tree;
    }
}
