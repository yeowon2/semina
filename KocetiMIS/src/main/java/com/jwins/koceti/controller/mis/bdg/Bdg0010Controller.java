package com.jwins.koceti.controller.mis.bdg;

import com.jwins.koceti.model.mis.bdg.PadBdgStdMgt;
import com.jwins.koceti.model.mis.bdg.dto.Bdg0010Tree;
import com.jwins.koceti.model.common.ComCorp;
import com.jwins.koceti.model.common.DataSourceRes;
import com.jwins.koceti.service.mis.bdg.Bdg0010Service;
import com.jwins.koceti.service.common.CommonService;
import com.jwins.koceti.util.TreeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/mis/bdg/bdg-0010")
public class Bdg0010Controller {

    @Autowired
    Bdg0010Service bdg0010Service;

    @Autowired
    CommonService commonService;

    @GetMapping
    public String main(Model model, HttpSession session) {
        session.setAttribute("currentMenu", "bdg-0010");
        List<ComCorp> busiList = commonService.findByBusiPlcCd();
        model.addAttribute("busiList", busiList);
        return "/mis/bdg/bdg_0010";
    }

    @ResponseBody
    @GetMapping("/findByBdgList")
    public DataSourceRes<PadBdgStdMgt> findByBdgList(@RequestParam Map<String, String> params) {
        List<PadBdgStdMgt> resultList = bdg0010Service.findByBdgList(params);

        DataSourceRes<PadBdgStdMgt> res = new DataSourceRes<>();
        res.makeSuccessRes(1, resultList);

         return res;
    }

    @ResponseBody
    @GetMapping("/findByBdgDtlList")
    public DataSourceRes<Bdg0010Tree> findByBdgDtlList(@RequestParam Map<String, String> params) {

        List<Bdg0010Tree> resultList = new ArrayList<>();

        if("Y".equals(params.get("busiYn"))) {                                          // 1. 사업비 일때
            resultList = bdg0010Service.findByBdgDtlListY(params);
        } else if("N".equals(params.get("busiYn"))) {                                   // 2. 운영비일때
            resultList = bdg0010Service.findByBdgDtlListN(params);
        } else {
            System.out.println("Bdg0010Controller.findByBdgDtlList//Error//");
            return null;
        }

        List<Bdg0010Tree> collect = resultList.stream().filter(item -> item.getLev() == 1).collect(Collectors.toList());
        TreeUtil.makeTree(resultList);

        DataSourceRes<Bdg0010Tree> res = new DataSourceRes<>();
        res.makeSuccessRes(1, collect);

        return res;
    }
}
