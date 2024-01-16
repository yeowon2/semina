package com.jwins.koceti.service.mis.bdg.impl;

import com.jwins.koceti.dao.mis.bdg.Bdg0022Dao;
import com.jwins.koceti.model.common.Code;
import com.jwins.koceti.model.mis.bdg.BdgPlcItmCd;
import com.jwins.koceti.model.mis.bdg.dto.Bdg0022Tree;
import com.jwins.koceti.service.mis.bdg.Bdg0022Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class Bdg0022ServiceImpl implements Bdg0022Service {

    @Autowired
    Bdg0022Dao bdg0022Dao;

    @Override
    public List<BdgPlcItmCd> findByBdgPlcItmCdList(Map<String, String> params) {
        return bdg0022Dao.findByBdgPlcItmCdList(params);
    }

    @Override
    public List<Bdg0022Tree> findByBdgPlcList(Map<String, String> params) {
        return bdg0022Dao.findByBdgPlcList(params);
    }

    @Override
    public List<Code> findByBdgStdCodeList(Map<String, String> params) {
        return bdg0022Dao.findByBdgStdCodeList(params);
    }
}
