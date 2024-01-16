package com.jwins.koceti.service.common;

import com.jwins.koceti.dao.common.MenuDao;
import com.jwins.koceti.model.common.Menu;
import com.jwins.koceti.model.common.MenuTree;
import com.jwins.koceti.util.TreeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    MenuDao menuDao;

    @Override
    public List<MenuTree> findByMenuList(String menuCls) {
        List<Menu> menuList = menuDao.findByMenuList(menuCls);
        List<MenuTree> menuTreeList = new ArrayList<>();

        menuList.forEach(menu -> menuTreeList.add(menu.toTree()));

        TreeUtil.makeTree(menuTreeList);
        List<MenuTree> collect = menuTreeList.stream().filter(item -> item.getLev().equals("2")).collect(Collectors.toList());

        return collect;
    }
}
