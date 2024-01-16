package com.jwins.koceti.controller.mis.bdg;

import com.jwins.koceti.model.common.Code;
import com.jwins.koceti.model.common.ComCorp;
import com.jwins.koceti.model.common.DataSourceRes;
import com.jwins.koceti.model.mis.bdg.BdgExpnCd;
import com.jwins.koceti.service.common.CommonService;
import com.jwins.koceti.service.mis.bdg.Bdg0030Service;
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

@Controller
@RequestMapping("/mis/bdg/bdg-0030")
public class Bdg0030Controller {

    @Autowired
    CommonService commonService;

    @Autowired
    Bdg0030Service bdg0030Service;

    @GetMapping
    public String main(Model model, HttpSession session) {
        session.setAttribute("currentMenu", "bdg-0030");
        List<ComCorp> busiList = commonService.findByBusiPlcCd();
        List<Code> commonCodeList = commonService.getCodeList("823");

        model.addAttribute("busiList", busiList);
        model.addAttribute("commonCodeList", commonCodeList);


        return "/mis/bdg/bdg_0030";
    }

    @ResponseBody
    @GetMapping("/findByExpnItemList")
    public DataSourceRes<BdgExpnCd> findByExpnItemList(@RequestParam Map<String, String> params) {
        List<BdgExpnCd> resultList = bdg0030Service.findByExpnItemList(params);

        DataSourceRes<BdgExpnCd> res = new DataSourceRes<>();
        res.makeSuccessRes(1, resultList);

        return res;
    }
}
