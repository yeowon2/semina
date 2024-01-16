package com.jwins.koceti.util;

import com.jwins.koceti.model.common.Tree;

import java.util.ArrayList;
import java.util.List;

/**
 * 계층형 데이터 관련 유틸 클래스
 */
public class TreeUtil {

    /*
     * ArrayList를 트리구조로 만들어주는 메서드
     * @param list 트리구조로 만들 리스트
     */
    public static <T extends Tree<T>> ArrayList<T> makeDeptTree(List<T> list) {
        ArrayList<T> tree = new ArrayList<>();

        for (T node : list) {
            boolean status = false;
            for (T node2 : list) {
                if (node2.getCode().equals(node.getParentCode())) {
                    node2.getChildren().add(node);
                    status = true;
                    break;
                }
            }

            if (!status) {
                tree.add(node);
            }
        }
        return tree;
    }

    public static <T extends Tree<T>> void makeTree(List<T> list) {
        if (list.isEmpty()) {
            return;
        }

        for (T node : list) {
            for (T node2 : list) {
                if (node2.getCode().equals(node.getParentCode())) {
                    node2.getChildren().add(node);
                    break;
                }
            }
        }
    }

}
