package com.jwins.koceti.controller.mis.bdg;

import com.jwins.koceti.model.common.Code;
import com.jwins.koceti.model.common.ComCorp;
import com.jwins.koceti.model.common.DataSourceRes;
import com.jwins.koceti.model.mis.bdg.BdgPlcItmCd;
import com.jwins.koceti.model.mis.bdg.dto.Bdg0022Tree;
import com.jwins.koceti.service.common.CommonService;
import com.jwins.koceti.service.mis.bdg.Bdg0022Service;
import com.jwins.koceti.util.TreeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/mis/bdg/bdg-0022")
public class Bdg0022Controller {

    @Autowired
    Bdg0022Service bdg0022Service;
    @Autowired
    CommonService commonService;

    @GetMapping
    public String main(Model model, HttpSession session) {
        session.setAttribute("currentMenu", "bdg-0022");
        List<ComCorp> busiList = commonService.findByBusiPlcCd();
        model.addAttribute("busiList", busiList);

        return "/mis/bdg/bdg_0022";
    }

    @ResponseBody
    @GetMapping("/findByBdgPlcItmCdList")
    public DataSourceRes<BdgPlcItmCd> findByBdgPlcItmCdList(@RequestParam Map<String, String> params) {
        List<BdgPlcItmCd> resultList = bdg0022Service.findByBdgPlcItmCdList(params);

        DataSourceRes<BdgPlcItmCd> res = new DataSourceRes<>();
        res.makeSuccessRes(1, resultList);

        return res;
    }

    @ResponseBody
    @GetMapping("/findByBdgPlcList")
    public DataSourceRes<Bdg0022Tree> findByBdgPlcList(@RequestParam Map<String, String> params) {
        List<Bdg0022Tree> resultList = bdg0022Service.findByBdgPlcList(params);

        TreeUtil.makeTree(resultList);
        List<Bdg0022Tree> collect = resultList.stream().filter(item -> item.getUpPlcBudgCd() == null).collect(Collectors.toList());

        DataSourceRes<Bdg0022Tree> res = new DataSourceRes<>();
        res.makeSuccessRes(1, collect);

        return res;
    }
    /*
         예산관리_예산기준코드(사업여부 N 리스트를 가지고온다)
     */
    @ResponseBody
    @GetMapping("/findByBdgStdCodeList")
    public List<Code> findByBdgStdCodeList(@RequestParam Map<String, String> params) {
        System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@");
        System.out.println(params);
        System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@");
        return bdg0022Service.findByBdgStdCodeList(params);
    }


}
