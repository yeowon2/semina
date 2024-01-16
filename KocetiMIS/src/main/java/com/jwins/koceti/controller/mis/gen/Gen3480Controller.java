package com.jwins.koceti.controller.mis.gen;

import com.jwins.koceti.model.common.DataSourceRes;
import com.jwins.koceti.model.mis.gen.GenDormRqst;
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
@RequestMapping("/mis/gen/gen-3480")
public class Gen3480Controller {

    @Autowired
    SqlSession sql;

    @GetMapping
    public String main(HttpSession session){
        session.setAttribute("currentMenu", "gen-3480");
        return "mis/gen/gen_3480";
    }

    @ResponseBody
    @GetMapping("/dorm-rqst-list")
    public  DataSourceRes<GenDormRqst> dormRqst_list(@RequestParam Map<String, Object> params){
        List<GenDormRqst> list=sql.selectList("gen_3480.dorm_rqst_list",params);

        DataSourceRes<GenDormRqst> res=new DataSourceRes<>();


        res.makeSuccessRes(1,list);
        return res;
    }

    @GetMapping("/dorm-rqst-item")
    @ResponseBody
    public GenDormRqst dorm_item(@RequestParam String rqstNo){
        GenDormRqst item =sql.selectOne("gen_3490.dorm_rqst_item",rqstNo);
        // System.out.println("-----------"+ item.getRqstGrdNm());
        return item;
    }
}
