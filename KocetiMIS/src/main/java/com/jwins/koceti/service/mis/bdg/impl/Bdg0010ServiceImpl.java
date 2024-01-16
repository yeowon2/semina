package com.jwins.koceti.service.mis.bdg.impl;

import com.jwins.koceti.dao.mis.bdg.Bdg0010Dao;
import com.jwins.koceti.model.mis.bdg.PadBdgStdMgt;
import com.jwins.koceti.model.mis.bdg.dto.Bdg0010Tree;
import com.jwins.koceti.service.mis.bdg.Bdg0010Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class Bdg0010ServiceImpl implements Bdg0010Service {

    @Autowired
    Bdg0010Dao bdg0010Dao;

    @Override
    public List<PadBdgStdMgt> findByBdgList(Map<String, String> params) {
        return bdg0010Dao.findByBdgList(params);
    }

    @Override
    public List<Bdg0010Tree> findByBdgDtlListY(Map<String, String> params) {
        return bdg0010Dao.findByBdgDtlListY(params);
    }

    @Override
    public List<Bdg0010Tree> findByBdgDtlListN(Map<String, String> params) {
        return bdg0010Dao.findByBdgDtlListN(params);
    }
}
