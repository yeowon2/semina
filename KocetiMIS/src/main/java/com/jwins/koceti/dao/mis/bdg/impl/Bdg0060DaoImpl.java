package com.jwins.koceti.dao.mis.bdg.impl;

import com.jwins.koceti.dao.mis.bdg.Bdg0060Dao;
import com.jwins.koceti.model.mis.bdg.BdgExpnCstCd;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class Bdg0060DaoImpl implements Bdg0060Dao {

    @Autowired
    SqlSession sql;

    @Override
    public List<BdgExpnCstCd> findByExpnCstList(Map<String, String> params) {
        return sql.selectList("bdg0060.findByExpnCstList", params);
    }
}
