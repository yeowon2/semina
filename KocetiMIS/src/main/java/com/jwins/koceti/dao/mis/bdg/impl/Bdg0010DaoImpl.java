package com.jwins.koceti.dao.mis.bdg.impl;

import com.jwins.koceti.dao.mis.bdg.Bdg0010Dao;
import com.jwins.koceti.model.mis.bdg.PadBdgStdMgt;
import com.jwins.koceti.model.mis.bdg.dto.Bdg0010Tree;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class Bdg0010DaoImpl implements Bdg0010Dao {

    @Autowired
    SqlSession sql;

    @Override
    public List<PadBdgStdMgt> findByBdgList(Map<String, String> params) {
        return sql.selectList("bdg0010.findByBdgList", params);
    }

    @Override
    public List<Bdg0010Tree> findByBdgDtlListY(Map<String, String> params) {
        return sql.selectList("bdg0010.findByBdgDtlListY", params);
    }

    @Override
    public List<Bdg0010Tree> findByBdgDtlListN(Map<String, String> params) {
        return sql.selectList("bdg0010.findByBdgDtlListN", params);
    }

}
