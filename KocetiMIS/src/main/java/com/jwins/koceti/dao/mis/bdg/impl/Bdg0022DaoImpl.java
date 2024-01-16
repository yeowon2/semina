package com.jwins.koceti.dao.mis.bdg.impl;

import com.jwins.koceti.dao.mis.bdg.Bdg0022Dao;
import com.jwins.koceti.model.common.Code;
import com.jwins.koceti.model.mis.bdg.BdgPlcItmCd;
import com.jwins.koceti.model.mis.bdg.dto.Bdg0022Tree;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class Bdg0022DaoImpl implements Bdg0022Dao {

    @Autowired
    SqlSession sql;

    @Override
    public List<BdgPlcItmCd> findByBdgPlcItmCdList(Map<String, String> params) {
        return sql.selectList("bdg0022.findByBdgPlcItmCdList", params);
    }

    @Override
    public List<Bdg0022Tree> findByBdgPlcList(Map<String, String> params) {
        return sql.selectList("bdg0022.findByBdgPlcList", params);
    }

    @Override
    public List<Code> findByBdgStdCodeList(Map<String, String> params) {
        return sql.selectList("bdg0022.findByBdgStdCodeList", params);
    }
}
