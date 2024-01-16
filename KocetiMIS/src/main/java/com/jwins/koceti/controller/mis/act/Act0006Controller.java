package com.jwins.koceti.controller.mis.act;

import com.jwins.koceti.model.common.DataSourceRes;
import com.jwins.koceti.model.mis.act.ActMgmt;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/mis/act/act-0006")
public class Act0006Controller {
    @Autowired
    SqlSession sql;

    @GetMapping
    public String main(HttpSession session) {
        session.setAttribute("currentMenu", "act-0006");
        return "mis/act/act_0006";
    }

    @ResponseBody
    @GetMapping("/act-mgmt-list")
    public DataSourceRes<ActMgmt> act_mgt_list(@RequestParam Map<String, Object> params) {
        List<ActMgmt> list = sql.selectList("act_0006.act_mgmt_list", params);
        DataSourceRes<ActMgmt> res = new DataSourceRes<>();
        res.makeSuccessRes(1, list);

        return res;
    }
}
