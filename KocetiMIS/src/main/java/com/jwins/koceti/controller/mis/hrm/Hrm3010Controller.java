package com.jwins.koceti.controller.mis.hrm;

import com.jwins.koceti.model.common.DataSourceRes;
import com.jwins.koceti.model.mis.hrm.Hrm_3010;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/mis/hrm/hrm-3010")
public class Hrm3010Controller {

    private final SqlSession sql;

    @GetMapping
    public String hrm3010() {
        return "/mis/hrm/hrm_3010";
    }

    @ResponseBody
    @GetMapping("/default-list")
    public DataSourceRes<Hrm_3010> defaultList(@RequestParam MultiValueMap<String, String> paramMap) {
        Map<String, String> singleValueMap = paramMap.toSingleValueMap();
        List<Hrm_3010> result = sql.selectList("hrm_3010.searchBasMgt", singleValueMap);

        DataSourceRes<Hrm_3010> res = new DataSourceRes<>();
        res.makeSuccessRes(1, result);

        return res;
    }
}

