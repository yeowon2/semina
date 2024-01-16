package com.jwins.koceti.model.mis.act;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.jwins.koceti.model.common.Tree;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class ActFsMstTree implements Tree<ActFsMstTree> {

    private String seq; //순서
    private String disNm; //포시명
    private String ordering; //정렬순서
    private int lev; //레벨
    private String upCd; //상위코드
    private String cnSeq; //충당및누계
    private String fincStatYy; //날짜
    private String fincStatCd; //

    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private List<ActFsMstTree> _children;

    public ActFsMstTree() {
        this._children = new ArrayList<>();
    }

    @Override
    public String getCode() {
        return this.seq;
    }

    @Override
    public String getParentCode() {
        return this.upCd;
    }

    @Override
    public List<ActFsMstTree> getChildren() {
        return this._children;
    }

    public List<ActFsMstTree> get_children() {
        return _children;
    }

    public void set_children(List<ActFsMstTree> _children) {
        this._children = _children;
    }
}
