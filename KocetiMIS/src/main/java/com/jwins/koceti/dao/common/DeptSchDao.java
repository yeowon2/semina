package com.jwins.koceti.dao.common;

import com.jwins.koceti.model.common.DeptTree;
import com.jwins.koceti.model.common.HrmDeptStruct;

import java.util.List;
import java.util.Map;

public interface DeptSchDao {

    List<HrmDeptStruct> findStructList();

    List<DeptTree> findByDeptList(Map<String, String> params);
}
