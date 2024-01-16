package com.jwins.koceti.model.common;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class DeptTree implements Tree<DeptTree> {

    private String chgClsCd;
    private String deptCd;
    private String deptNm;
    private String upDeptCd;
    private Integer ordNo;
    private String deptEmpNm;
    private String deptEmpNo;
    private String useYn;
    private String deptEngNm;
    private String lev;
    private String structDt;
    private String postDeptCd;
    private String deptGrpCd;
    private String teamYn;

    /*
    private HrmDept HrmDept;
    private HrmOrgcht hrmOrgcht;*/

    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private List<DeptTree> _children;

    public DeptTree() {
        this._children = new ArrayList<>();
    }

    @Override
    public String getCode() {
        return this.deptCd;
    }

    @Override
    public String getParentCode() {
        return this.upDeptCd;
    }

    @Override
    public List<DeptTree> getChildren() {
        return this._children;
    }

    public List<DeptTree> get_children() {
        return _children;
    }

    public void set_children(List<DeptTree> _children) {
        this._children = _children;
    }

}
