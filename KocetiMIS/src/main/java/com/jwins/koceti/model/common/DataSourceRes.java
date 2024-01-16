package com.jwins.koceti.model.common;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * tui grid datasource 응답객체
 */
@Getter
@Setter
@JsonInclude(JsonInclude.Include.NON_EMPTY)
public class DataSourceRes<T> {

    private boolean result;
    private Data data;
    private String message;

    /**
     * Toast Grid 라이브러리 DataSource 성공 응답을 만듬.
     * @param page     DB에서 가져온 데이터의 페이지 번호
     * @param contents response에 담을 데이터
     */
    public void makeSuccessRes(Integer page, List<T> contents) {
        this.result = true;
        this.data = new Data();
        this.data.contents = contents;
        this.data.pagination.page = page;
        this.data.pagination.totalCount = contents.size();
    }

    /**
     * Toast Grid 라이브러리 DataSource 실패 응답을 만듬.
     * @param message 에러메세지
     */
    public void makeErrorRes(String message){
        this.result = false;
        this.message = message;
    }

    @Getter
    @Setter
    private class Data {
        private List<T> contents;
        private Pagination pagination;

        public Data() {
            this.pagination = new Pagination();
        }

        @Getter
        @Setter
        private class Pagination {
            private Integer page;
            private Integer totalCount;
        }
    }
}
