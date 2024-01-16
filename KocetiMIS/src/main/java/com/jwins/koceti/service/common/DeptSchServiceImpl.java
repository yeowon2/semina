package com.jwins.koceti.service.common;

import com.jwins.koceti.dao.common.DeptSchDao;
import com.jwins.koceti.model.common.DeptTree;
import com.jwins.koceti.model.common.HrmDeptStruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DeptSchServiceImpl implements DeptSchService {

    @Autowired
    DeptSchDao dao;

    @Override
    public List<HrmDeptStruct> findStructList() {
        return dao.findStructList();
    }

    @Override
    public List<DeptTree> findByDeptList(Map<String, String> params) {
        return dao.findByDeptList(params);
    }
}
