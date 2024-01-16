package com.jwins.koceti.dao.mis.bdg.impl;

import com.jwins.koceti.dao.mis.bdg.Bdg0030Dao;
import com.jwins.koceti.model.mis.bdg.BdgExpnCd;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class Bdg0030DaoImpl implements Bdg0030Dao {

    @Autowired
    SqlSession sql;

    @Override
    public List<BdgExpnCd> findByExpnItemList(Map<String, String> params) {
        return sql.selectList("bdg0030.findByExpnItemList", params);
    }
}
