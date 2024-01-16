package com.jwins.koceti.controller.mis.gen;

import com.jwins.koceti.model.common.DataSourceRes;
import com.jwins.koceti.model.mis.gen.GenDormRqst;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/mis/gen/gen-3420")
public class Gen3420Controller {

    @Autowired
    SqlSession sql;

    @GetMapping
    public String main(HttpSession session){
        session.setAttribute("currentMenu", "gen-3420");
        return "mis/gen/gen_3420";
    }
    @ResponseBody
    @GetMapping("/dorm-rqst-list")
    public DataSourceRes<GenDormRqst> dormRqst_list(@RequestParam Map<String, Object> params){
        List<GenDormRqst> list =sql.selectList("gen_3420.dorm_rqst_list",params);

        DataSourceRes<GenDormRqst> res=new DataSourceRes<>();


        res.makeSuccessRes(1,list);
        return res;
    }

    @GetMapping("/dorm-rqst-item")
    @ResponseBody
    public GenDormRqst dorm_item(@RequestParam String rqstNo){
        GenDormRqst item =sql.selectOne("gen_3430.dorm_rqst_item",rqstNo);
        // System.out.println("-----------"+ item.getRqstGrdNm());
        return item;
    }
}
