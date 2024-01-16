package com.jwins.koceti.controller.mis.hrm;

import com.jwins.koceti.model.common.DataSourceRes;
import com.jwins.koceti.model.common.DeptReorganRecord;
import com.jwins.koceti.model.common.HrmDeptStruct;
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

@Controller
@RequestMapping("/mis/hrm/hrm-0021")
public class Hrm0021Controller {

    @Autowired
    SqlSession sql;

    @GetMapping
    public String main(Model model, HttpSession session) {
        session.setAttribute("currentMenu", "hrm-0021");
        List<HrmDeptStruct> list = sql.selectList("hrm_0021.searchStruct");
        model.addAttribute("reorganizationDate", list);
        return "/mis/hrm/hrm_0021";
    }

    @ResponseBody
    @GetMapping("/get-record")
    public DataSourceRes<DeptReorganRecord> getRecord(@RequestParam String structDt) {
        List<DeptReorganRecord> list = sql.selectList("hrm_0021.searchReorganDept", structDt);

        DataSourceRes<DeptReorganRecord> res = new DataSourceRes<>();
        res.makeSuccessRes(1, list);

        return res;
    }
}
