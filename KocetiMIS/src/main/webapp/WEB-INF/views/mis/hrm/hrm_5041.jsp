<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="<c:url value="/resources/css/common/modal.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/mis/hrm/hrm_5041.css"/>"/>
<div class="hrm5041">
    <div class="modal_bg">
        <div class="modal" style="max-width: 1200px; width: 100%;">
            <%--            <div class="modal_close_btn">
                            <span class="material-symbols-outlined weight-500">close</span>
                        </div>--%>
            <h2 class="modal_title">교육신청</h2>
            <div class="btn_container">
                <button class="btn gray_btn">결재상신</button>
                <button class="btn primary_btn">저장</button>
                <button class="btn danger_btn">삭제</button>
                <button class="btn white_btn" id="hrm5041CloseBtn">닫기</button>
            </div>

            <div class="main_container">
                <span class="sub_title">신청정보</span>
                <div class="main_header_wrap">
                    <div class="input_wrap">
                        <label>신청번호</label>
                        <input type="text" name="eduRqstNo" class="input_text input_readonly" placeholder="신청번호는 자동으로 생성됩니다." readonly/>
                    </div>
                    <div class="input_wrap">
                        <label>신청일자</label>
                        <input type="date" name="" class="input_text input_readonly" readonly/>
                    </div>
                    <div class="input_wrap input_wrap_emp">
                        <label>신청자</label>
                        <input type="text" name="" class="input_text input_readonly input_width25" readonly>
                        <input type="text" name="" class="input_text input_readonly input_width25" readonly>
                        <%-- 본인정보 가져오기 --%>
                        <%--<button class = "btn primary_btn">검색</button>--%>
                    </div>
                </div>
                <span class="sub_title">교육정보</span>
                <div class="main_middle_wrap">
                    <div class="input_wrap input_width50">
                        <label>교육명</label>
                        <input type="text" name="" class="input_text input_width80">
                    </div>
                    <div class="input_wrap input_width50">
                        <label>과제코드</label>
                        <input type="text" name="" class="input_text">
                        <button class="btn primary_btn">검색</button>
                    </div>
                    <div class="input_wrap input_width50 input_margin">
                        <label>교육기간</label>
                        <input type="date" name="" class="input_text">
                        <span>~</span>
                        <input type="date" name="" class="input_text">
                        <input style="margin-left:5px" type="time" name="" class="input_text">
                        <span>~</span>
                        <input type="time" name="" class="input_text">
                    </div>
                    <div class="input_wrap input_width25">
                        <label>총 교육시간</label>
                        <input type="number" name="" class="input_text">
                    </div>
                    <div class="input_wrap input_width25">
                        <label>교육구분</label>
                        <select class="input_text">
                            <option></option>
                        </select>
                    </div>
                    <div class="input_wrap input_width50">
                        <label>교육기간</label>
                        <input type="text" name="" class="input_text input_width80">
                    </div>
                    <div class="input_wrap input_width25">
                        <label>교육비(1인)</label>
                        <input type="number" name="" class="input_text">
                    </div>
                    <div class="input_wrap input_width25">
                        <label>교육유형</label>
                        <select class="input_text">
                            <option></option>
                        </select>
                    </div>
                    <div class="input_wrap input_width50">
                        <label>교육장소</label>
                        <input type="text" name="" class="input_text input_width80">
                    </div>
                    <div class="input_wrap input_width50 input_wrap_radio">
                        <label>환급여부</label>
                        <input type="radio" value="y" class="input_text">환급있음
                        <input style="margin-left : 10px;" type="radio" value="n" class="input_text">환급없음
                    </div>
                    <div class="input_wrap input_width100">
                        <label>교육내용</label>
                        <textarea class="input_text input_width90"></textarea>
                    </div>
                    <div class="input_wrap input_width100">
                        <label>비고</label>
                        <input type="text" class="input_text input_width90">
                    </div>
                </div>

                <span class="sub_title">교육대상자</span>
                <div class="main_grid_wrap">
                    <div id="hrm5041Grid">
                        <div class="btn_container">
                            <button id="grid_row_add" class="btn primary_btn">행추가</button>
                            <button id="grid_row_delete" class="btn danger_btn">행삭제</button>
                        </div>
                    </div>
                </div>

                <span class="sub_title">첨부파일</span>
                <div class="main_file_wrap">
                    <div class="btn_container">
                        <button class="btn primary_btn">행추가</button>
                        <button class="btn danger_btn">행삭제</button>
                    </div>
                    <form>
                        <div></div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    let hrm5041Modal;

    class Hrm5041Modal {
        parentEduRqstNoEl;
        hrm5041ResultGrid;

        constructor(parentEduRqstNoEl) {
            this.parentEduRqstNoEl = parentEduRqstNoEl;
            this.hrm5041LoadGrid();

            document.getElementById('hrm5041CloseBtn').addEventListener('click', () => {
                hrm5041Modal.hrm5041ModalClose();
            })
            document.getElementById('grid_row_add').addEventListener('click', () => {
                this.hrm5041ResultGrid.appendRow();
            })
            document.getElementById('grid_row_delete').addEventListener('click', () => {
                this.hrm5041ResultGrid.removeRow();
            })
        }

        hrm5041LoadGrid() {
            const columns = [
                {
                    header: '선택',
                    name: '',
                },
                {
                    header: '상태',
                    name: '',
                },
                {
                    header: '사번',
                    name: '',
                },
                {
                    header: '성명',
                    name: '',
                },
                {
                    header: '부서명',
                    name: '',
                },
                {
                    header: '직급',
                    name: '',
                },
            ];

            const dataSource = {
                api: {
                    readData: {url: "/mis/hrm/hrm-5041/findByList", method: 'GET'},
                    serializer(params) {
                        return Qs.stringify(params);
                    },
                    initialRequest: false
                }
            }

            this.hrm5041ResultGrid = new Grid({
                el: document.getElementById('hrm5041Grid'),
                columns: columns,
                data: dataSource,
            });
        }

        hrm5041ModalOpen = (param) => {
            if (param !== null && param !== undefined && param !== '') {
                // 데이터 조회 formData -> formData -> grid -> file

            } else {
                //신규데이터(신청정보 세팅)
            }
            document.querySelector('.hrm5041 > .modal_bg').classList.add('show');
            document.querySelector('body').style.overflow = 'hidden';
        }

        hrm5041ModalClose = () => {
            document.querySelector('.hrm5041 > .modal_bg').classList.remove('show');
            document.querySelector('body').style.overflow = 'initial';
        }
    }
</script>