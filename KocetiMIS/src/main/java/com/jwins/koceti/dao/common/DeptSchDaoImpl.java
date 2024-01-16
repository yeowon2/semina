package com.jwins.koceti.dao.common;

import com.jwins.koceti.model.common.DeptTree;
import com.jwins.koceti.model.common.HrmDeptStruct;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class DeptSchDaoImpl implements DeptSchDao {

    @Autowired
    SqlSession sql;

    @Override
    public List<HrmDeptStruct> findStructList() {
        return sql.selectList("deptSch.findStructList");
    }

    @Override
    public List<DeptTree> findByDeptList(Map<String, String> params) {
        return sql.selectList("deptSch.findByDeptList", params);
    }
}
