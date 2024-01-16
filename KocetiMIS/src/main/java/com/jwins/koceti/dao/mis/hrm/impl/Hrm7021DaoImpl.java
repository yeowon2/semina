package com.jwins.koceti.dao.mis.hrm.impl;

import com.jwins.koceti.dao.mis.hrm.Hrm7021Dao;
import com.jwins.koceti.model.mis.hrm.Hrm_7021;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class Hrm7021DaoImpl implements Hrm7021Dao {

    @Autowired
    SqlSession sql;

    @Override
    public List<Hrm_7021> findByRetireeList(Map<String, Object> params) {
        return sql.selectList("hrm_7021.findByRetireeList", params);
    }
}
