package com.jwins.koceti.controller.common;

import com.jwins.koceti.model.common.DataSourceRes;
import com.jwins.koceti.model.common.DeptTree;
import com.jwins.koceti.model.common.HrmDeptStruct;
import com.jwins.koceti.service.common.DeptSchService;
import com.jwins.koceti.util.TreeUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/dept-sch")
public class DeptSchController {

    private final DeptSchService deptSchService;

    @ResponseBody
    @GetMapping("/findStructList")
    public List<HrmDeptStruct> findStructList() {
        return deptSchService.findStructList();
    }

    @ResponseBody
    @GetMapping("/findByDeptList")
    public DataSourceRes<DeptTree> findByDeptList(@RequestParam Map<String, String> params) {

        List<DeptTree> deptList = deptSchService.findByDeptList(params);

        ArrayList<DeptTree> trees = TreeUtil.makeDeptTree(deptList);

        DataSourceRes<DeptTree> res = new DataSourceRes<>();
        res.makeSuccessRes(1, trees);

        return res;
    }
}