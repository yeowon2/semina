package com.jwins.koceti.dao.common;

import com.jwins.koceti.model.common.Code;
import com.jwins.koceti.model.common.ComCorp;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommonDaoImpl implements CommonDao {

    @Autowired
    SqlSession sql;

    @Override
    public List<Code> getCodeList(String prefix) {
        return sql.selectList("common.getCodeList", prefix);
    }

    @Override
    public List<ComCorp> findByBusiPlcCd() {
        return sql.selectList("common.findByBusiPlcCd");
    }
}
