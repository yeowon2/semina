package com.jwins.koceti.model.common;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class MenuTree implements Tree<MenuTree> {

    private String menuId;
    private String upMenuId;
    private String menuNm;
    private String lev;
    private String pgmId;
    private String pgmLink;
    private String pgmUrl;
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private List<MenuTree> children = new ArrayList<>();

    @Override
    public String getCode() {
        return this.menuId;
    }

    @Override
    public String getParentCode() {
        return this.upMenuId;
    }

    public List<MenuTree> getChildren() {
        return children;
    }

    public void setChildren(List<MenuTree> children) {
        this.children = children;
    }
}
