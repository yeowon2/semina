package com.jwins.koceti.dao.common;

import com.jwins.koceti.model.common.Menu;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MenuDaoImpl implements MenuDao {

    @Autowired
    SqlSession sql;

    @Override
    public List<Menu> findByMenuList(String menuCls) {
        return sql.selectList("Menu.findByMenuList", menuCls);
    }
}
