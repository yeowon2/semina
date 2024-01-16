package com.jwins.koceti.controller.mis.hrm;

import com.jwins.koceti.model.common.DataSourceRes;
import com.jwins.koceti.model.common.DeptTree;
import com.jwins.koceti.model.common.HrmDeptStruct;
import com.jwins.koceti.util.TreeUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@Slf4j
@RequestMapping("/mis/hrm/hrm-0020")
public class Hrm0020Controller {

    @Autowired
    SqlSession sql;

    @GetMapping
    public String main(Model model, HttpSession session) {
        session.setAttribute("currentMenu",  "hrm-0020");
        List<HrmDeptStruct> list = sql.selectList("hrm_0020.searchStruct");
        model.addAttribute("reorganizationDate", list);
        return "/mis/hrm/hrm_0020";
    }

    @ResponseBody
    @GetMapping("/dept-list")
    public DataSourceRes<DeptTree> deptTree(@RequestParam String structDt) {
        List<DeptTree> deptList = sql.selectList("hrm_0020.getDept", structDt);

        TreeUtil.makeTree(deptList);

        List<DeptTree> collect = deptList.stream().filter(item -> item.getUpDeptCd() == null).collect(Collectors.toList());

        DataSourceRes<DeptTree> res = new DataSourceRes<>();
        res.makeSuccessRes(1, collect);

        return res;
    }
}
