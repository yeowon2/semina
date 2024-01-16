package com.jwins.koceti.dao.mis.hrm.impl;

import com.jwins.koceti.dao.mis.hrm.Hrm1035Dao;
import com.jwins.koceti.model.mis.hrm.Hrm_1035;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class Hrm1035DaoImpl implements Hrm1035Dao {

    @Autowired
    SqlSession sql;


    @Override
    public List<Hrm_1035> findByApntCd() {
        return sql.selectList("hrm_1035.findByApntCd");
    }

    @Override
    public List<Hrm_1035> findByList(Map<String, Object> params) {
        return sql.selectList("hrm_1035.findByList", params);
    }
}
