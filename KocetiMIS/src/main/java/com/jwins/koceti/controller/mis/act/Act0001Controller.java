package com.jwins.koceti.controller.mis.act;

import com.jwins.koceti.model.common.Code;
import com.jwins.koceti.model.common.DataSourceRes;
import com.jwins.koceti.model.mis.act.ActAcctCdTree;
import com.jwins.koceti.model.mis.act.ActMgt;
import com.jwins.koceti.util.TreeUtil;
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
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/mis/act/act-0001")
public class Act0001Controller {
    @Autowired
    SqlSession sql;

    @GetMapping
    public String main(HttpSession session, Model model) {
        session.setAttribute("currentMenu", "act-0001");

        List<Code> list=sql.selectList("common.getCommonCodeList","304");
        model.addAttribute("acctCharList",list);
        return "mis/act/act_0001";
    }

    @ResponseBody
    @GetMapping("/act-cd-list")
    public DataSourceRes<ActAcctCdTree> act_cd_list(@RequestParam Map<String, Object> params) {
        List<ActAcctCdTree> list = sql.selectList("act_0001.act_cd_list", params);
        List<ActAcctCdTree> collect = list.stream().filter(item -> item.getUpAcctCd() == null).collect(Collectors.toList());

        TreeUtil.makeTree(list);

        DataSourceRes<ActAcctCdTree> res = new DataSourceRes<>();

        res.makeSuccessRes(1, collect);
        return res;
    }

    @ResponseBody
    @GetMapping("/act-mgt-list")
    public DataSourceRes<ActMgt> act_mgt_list(@RequestParam String acctCd) {
        List<ActMgt> list = sql.selectList("act_0001.act_mgt_list", acctCd);
        DataSourceRes<ActMgt> res = new DataSourceRes<>();
        res.makeSuccessRes(1, list);

        return res;
    }

}
