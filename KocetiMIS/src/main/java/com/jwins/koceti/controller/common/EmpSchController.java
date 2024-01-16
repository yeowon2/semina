package com.jwins.koceti.controller.common;

import com.jwins.koceti.model.common.DataSourceRes;
import com.jwins.koceti.model.common.DeptTree;
import com.jwins.koceti.model.common.Employee;
import com.jwins.koceti.util.TreeUtil;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/emp-sch")
public class EmpSchController {

    @Autowired
    SqlSession sql;

    @ResponseBody
    @GetMapping("/get-dept")
    public DataSourceRes<DeptTree> getDept() {
        List<DeptTree> deptList = sql.selectList("empSch.getDept");
        
        TreeUtil.makeTree(deptList);

        List<DeptTree> collect = deptList.stream().filter(item -> item.getUpDeptCd() == null).collect(Collectors.toList());

        DataSourceRes<DeptTree> res = new DataSourceRes<>();
        res.makeSuccessRes(1, collect);

        return res;
    }

    @ResponseBody
    @GetMapping("/get-emp")
    public DataSourceRes<Employee> getEmp(@RequestParam Map<String, String> params) {
        List<Employee> empList = sql.selectList("empSch.getEmp", params);

        DataSourceRes<Employee> res = new DataSourceRes<>();
        res.makeSuccessRes(1, empList);

        return res;
    }

}
