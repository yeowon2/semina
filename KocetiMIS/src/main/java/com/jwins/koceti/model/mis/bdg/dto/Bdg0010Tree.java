package com.jwins.koceti.model.mis.bdg.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.jwins.koceti.model.common.Tree;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class Bdg0010Tree implements Tree<Bdg0010Tree> {
    private String div;
    private String divCd;
    private String upDivCd;
    private int lev;


    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private List<Bdg0010Tree> _children;

    public Bdg0010Tree() {
        this._children = new ArrayList<>();
    }


    @Override
    public String getCode() {
        return this.divCd;
    }

    @Override
    public String getParentCode() {
        return this.upDivCd;
    }

    @Override
    public List<Bdg0010Tree> getChildren() {
        return this._children;
    }

    public void set_children(List<Bdg0010Tree> _children) {
        this._children = _children;
    }
}
