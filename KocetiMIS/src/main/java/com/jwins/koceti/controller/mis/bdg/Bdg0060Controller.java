package com.jwins.koceti.controller.mis.bdg;

import com.jwins.koceti.model.common.ComCorp;
import com.jwins.koceti.model.common.DataSourceRes;
import com.jwins.koceti.model.mis.bdg.BdgExpnCstCd;
import com.jwins.koceti.service.common.CommonService;
import com.jwins.koceti.service.mis.bdg.Bdg0060Service;
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
@RequestMapping("/mis/bdg/bdg-0060")
public class Bdg0060Controller {

    @Autowired
    CommonService commonService;
    @Autowired
    Bdg0060Service bdg0060Service;

    @GetMapping
    public String main(Model model, HttpSession session) {
        session.setAttribute("currentMenu", "bdg-0060");
        List<ComCorp> busiList = commonService.findByBusiPlcCd();
        model.addAttribute("busiList", busiList);
        return "/mis/bdg/bdg_0060";
    }

    @ResponseBody
    @GetMapping("/findByExpnCstList")
    public DataSourceRes<BdgExpnCstCd> findByExpnCstList(@RequestParam Map<String, String> params) {
        List<BdgExpnCstCd> resultList = bdg0060Service.findByExpnCstList(params);

        DataSourceRes<BdgExpnCstCd> res = new DataSourceRes<>();
        res.makeSuccessRes(1, resultList);

        return res;
    }
}
