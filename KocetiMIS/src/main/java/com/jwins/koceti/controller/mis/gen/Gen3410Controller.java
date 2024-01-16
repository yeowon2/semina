package com.jwins.koceti.controller.mis.gen;

import com.jwins.koceti.model.common.DataSourceRes;
import com.jwins.koceti.model.mis.gen.GenDorm;
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
@RequestMapping("/mis/gen/gen-3410")
public class Gen3410Controller {

    @Autowired
    SqlSession sql;

    @GetMapping
    public String main(HttpSession session){
        session.setAttribute("currentMenu", "gen-3410");
        return "mis/gen/gen_3410";
    }
    @GetMapping("/dorm-list")
    @ResponseBody
    public DataSourceRes<GenDorm> dorm_list(@RequestParam Map<String, Object> params){
        List<GenDorm> list =sql.selectList("gen_3410.dorm_list",params);

        DataSourceRes<GenDorm> res=new DataSourceRes<>();
        res.makeSuccessRes(1,list);
        return res;
    }
}
