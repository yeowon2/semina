package com.jwins.koceti.dao.mis.hrm.impl;

import com.jwins.koceti.dao.mis.hrm.Hrm5040Dao;
import com.jwins.koceti.model.mis.hrm.HrmEduRqst;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class Hrm5040DaoImpl implements Hrm5040Dao {

    @Autowired
    SqlSession sql;

    @Override
    public List<HrmEduRqst> findByList(Map<String, Object> params) {
        return sql.selectList("hrm_5040.findByList", params);
    }
}
