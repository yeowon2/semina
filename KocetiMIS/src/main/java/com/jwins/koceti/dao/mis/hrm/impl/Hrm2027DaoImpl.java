package com.jwins.koceti.dao.mis.hrm.impl;

import com.jwins.koceti.dao.mis.hrm.Hrm2027Dao;
import com.jwins.koceti.model.mis.hrm.Hrm_2027;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class Hrm2027DaoImpl implements Hrm2027Dao {

    @Autowired
    SqlSession sql;

    @Override
    public List<Hrm_2027> findByList(Map<String, Object> params) {
        return sql.selectList("hrm_2027.findByList", params);
    }
}
