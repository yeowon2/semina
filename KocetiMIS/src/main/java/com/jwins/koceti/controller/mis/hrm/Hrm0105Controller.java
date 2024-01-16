package com.jwins.koceti.controller.mis.hrm;

import com.jwins.koceti.model.common.ComRqstNo;
import com.jwins.koceti.model.common.DataSourceRes;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/mis/hrm/hrm-0105")
public class Hrm0105Controller {

    @Autowired
    SqlSession sql;

    @ResponseBody
    @GetMapping("/appnt-emp-list")
    public DataSourceRes<ComRqstNo> appntEmpList(@RequestParam Map<String, Object> params) {

        List<ComRqstNo> list = sql.selectList("hrm_0100.searchAppnNoApvLst", params);

        DataSourceRes<ComRqstNo> res = new DataSourceRes<>();
        res.makeSuccessRes(1, list);

        return res;
    }

}
