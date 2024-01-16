package com.jwins.koceti.controller.mis.act;

import com.jwins.koceti.model.common.DataSourceRes;
import com.jwins.koceti.model.mis.act.ActFsDtl;
import com.jwins.koceti.model.mis.act.ActFsMstTree;
import com.jwins.koceti.util.TreeUtil;
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
import java.util.stream.Collectors;

@Controller
@RequestMapping("/mis/act/act-0003")
public class Act0003Controller {
    @Autowired
    SqlSession sql;

    @GetMapping
    public String main(HttpSession session) {
        session.setAttribute("currentMenu", "act-0003");

        return "mis/act/act_0003";
    }

    @ResponseBody
    @GetMapping("/act-fs-list")
    public DataSourceRes<ActFsMstTree> act_cd_list(@RequestParam Map<String, Object> params) {
        List<ActFsMstTree> list = sql.selectList("act_0003.act_fs_list", params);
        List<ActFsMstTree> collect = list.stream().filter(item -> item.getUpCd() == null).collect(Collectors.toList());

        TreeUtil.makeTree(list);

        DataSourceRes<ActFsMstTree> res = new DataSourceRes<>();

        res.makeSuccessRes(1, collect);

        return res;
    }

    @ResponseBody
    @GetMapping("/act-fsDtl-list")
    public DataSourceRes<ActFsDtl> act_fsDtl_list(@RequestParam Map<String, Object> params) {
        List<ActFsDtl> list = sql.selectList("act_0003.act_fsDtl_list", params);
        DataSourceRes<ActFsDtl> res = new DataSourceRes<>();
        res.makeSuccessRes(1, list);

        return res;
    }
}
