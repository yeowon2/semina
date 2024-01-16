package com.jwins.koceti.model.mis.act;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.jwins.koceti.model.common.Tree;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class ActAcctCdTree implements Tree<ActAcctCdTree> {

    private String acctCd; //계정코드
    private String acctNm; //회계계정코드명
    private String acctNmEng; //계정코드영문명
    private int acctLev; //계정레벨
    private String upAcctCd; //상위계정코드
    private String upAcctNm; //상위계정코드명
    private String drCr; //차대 구분
    private String subdCd1; //보조부1
    private String subdNm1; //보조부명1
    private String subdCd2; //보조부2
    private String subdNm2; //보조부명2
    private String acctChar; //계정특성
    private String useYn; //사용유무
    private int ordNo; //오더번호
    private String acctClsf; //계정구분


    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private List<ActAcctCdTree> _children;

    public ActAcctCdTree(){
        this._children=new ArrayList<>();
    }

    @Override
    public String getCode() {
        return this.acctCd;
    }

    @Override
    public String getParentCode() {
        return this.upAcctCd;
    }

    @Override
    public List<ActAcctCdTree> getChildren() {
        return this._children;
    }



    public List<ActAcctCdTree> get_children() {
        return _children;
    }

    public void set_children(List<ActAcctCdTree> _children) {
        this._children = _children;
    }
}
