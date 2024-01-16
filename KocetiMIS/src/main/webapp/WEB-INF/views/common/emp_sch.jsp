<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="<c:url value="/resources/css/common/modal.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/common/emp_sch.css"/>"/>
<div class="modal_bg emp_sch">
    <div class="modal">
        <div class="modal_close_btn">
            <span class="material-symbols-outlined weight-500">close</span>
        </div>
        <h2 class="modal_title">사원조회</h2>
        <div class="search_container">
            <form id="empSchModalSearchForm">
                <div>
                    <div>
                        <label>사원번호</label>
                        <input type="text" name="empNo" id="schEmpNo" class="input_text"/>
                    </div>
                    <div>
                        <label>사원명</label>
                        <input type="text" name="empNm" id="schEmpNm" class="input_text"/>
                    </div>
                    <div>
                        <label>재직구분</label>
                        <select name="holdOffi" id="schHoldOffi" class="input_text">
                            <option value="">선택</option>
                            <option value="101-010" selected>재직</option>
                            <option value="101-050">퇴직</option>
                            <option value="101-040">정직</option>
                            <option value="101-030">휴직</option>
                            <option value="101-020">파견</option>
                        </select>
                    </div>
                </div>
                <div>
                    <div>
                        <label>부서명</label>
                        <input type="text" name="deptNm" id="schDeptNm" class="input_text"/>
                    </div>
                    <div>
                        <label>고용형태</label>
                        <select name="empCls" id="schEmpCls" class="input_text">
                            <option value="">선택</option>
                            <option value="102-010">정규직</option>
                            <option value="102-020">계약직</option>
                            <option value="102-030">기타</option>
                        </select>
                    </div>
                    <div class="btn_container">
                        <button type="button" class="btn white_btn reset_btn">초기화</button>
                        <button type="button" class="btn primary_btn submit_btn">검색</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="emp_grid_wrap">
            <div id="modalDeptGrid"></div>
            <div id="modalEmpGrid"></div>
        </div>
    </div>
</div>
<script>
    let empSchModal;

    class EmpSchModal {
        empSchModalEl;
        searchForm;

        deptGrid;
        empGrid;

        selectedEmpInfo;
        selectEvent;

        constructor() {
            this.empSchModalEl = document.querySelector('.modal_bg.emp_sch');
            this.searchForm = document.getElementById('empSchModalSearchForm');

            this.initEvent();
            this.initDeptGrid();
            this.initEmpGrid();
        }

        initEvent() {
            this.empSchModalEl.querySelector('.reset_btn').addEventListener('click', this.resetSearchForm);
            this.empSchModalEl.querySelector('.submit_btn').addEventListener('click', this.search);
            this.empSchModalEl.querySelector('.modal_close_btn').addEventListener('click', this.modalClose);
            this.searchForm.empNo.addEventListener('keypress', (ev) => {
                if (ev.keyCode === 13)
                    this.search();
            });
            this.searchForm.empNm.addEventListener('keypress', (ev) => {
                if (ev.keyCode === 13)
                    this.search();
            });
        }

        initDeptGrid() {
            const columns = [
                {
                    header: '부서코드',
                    name: 'deptCd',
                    hidden: true
                },
                {
                    header: '부서',
                    name: 'deptNm'
                },
                {
                    header: '부모부서코드',
                    name: 'upDeptCd',
                    hidden: true
                }
            ];

            const dataSource = {
                api: {
                    readData: {url: '/emp-sch/get-dept', method: 'GET'}
                }
            };

            this.deptGrid = new Grid({
                el: document.getElementById('modalDeptGrid'),
                rowHeight: 25,
                minRowHeight: 25,
                width: 300,
                bodyHeight: 450,
                columns: columns,
                data: dataSource,
                treeColumnOptions: {
                    name: 'deptNm',
                    useIcon: false,
                    useCascadingCheckbox: false
                },
                onGridUpdated: () => {
                    this.deptGrid.expandAll();
                }
            });

            this.deptGrid.on('dblclick', (ev) => {
                let deptCd = this.deptGrid.getValue(ev.rowKey, 'deptCd');
                let form = document.getElementById('empSchModalSearchForm');

                let params = {
                    empNo: form.empNo.value,
                    empNm: form.empNm.value,
                    holdOffi: form.holdOffi.value,
                    deptCd: deptCd,
                    deptNm: form.deptNm.value,
                    empCls: form.empCls.value
                }
                this.empGrid.readData(undefined, params, true);
            });
        }

        initEmpGrid() {
            const columns = [
                {
                    header: '부서',
                    name: 'deptNm',
                    width: 160
                },
                {
                    header: '직위',
                    name: 'jobPostNm',
                    align: 'center'
                },
                {
                    header: '직위',
                    name: 'grdNm',
                    align: 'center'
                },
                {
                    header: '사번',
                    name: 'empNo',
                    align: 'center'
                },
                {
                    header: '성명',
                    name: 'empNm',
                    align: 'center'
                }
            ];

            const dataSource = {
                api: {
                    readData: {url: '/emp-sch/get-emp', method: 'GET'}
                },
                serializer(params) {
                    return Qs.stringify(params);
                },
                initialRequest: false
            };

            this.empGrid = new Grid({
                el: document.getElementById('modalEmpGrid'),
                rowHeight: 30,
                minRowHeight: 30,
                width: 600,
                bodyHeight: 450,
                data: dataSource,
                columns: columns
            });

            this.empGrid.on('dblclick', (ev) => {
                this.selectedEmpInfo = this.empGrid.getRow(ev.rowKey);
                this.modalClose();
                this.selectEvent();
            });
        }

        modalOpen() {
            document.querySelector('.modal_bg.emp_sch').classList.add('show');
            document.querySelector('body').style.overflow = 'hidden';
        }

        modalClose = () => {
            document.querySelector('.modal_bg.emp_sch').classList.remove('show');
            document.querySelector('body').style.overflow = 'initial';
            this.resetSearchForm();
        }

        resetSearchForm() {
            this.searchForm.reset();
        }

        search = () => {
            let params = {
                empNo: this.searchForm.empNo.value,
                empNm: this.searchForm.empNm.value,
                holdOffi: this.searchForm.holdOffi.value,
                deptNm: this.searchForm.deptNm.value,
                empCls: this.searchForm.empCls.value
            };

            this.empGrid.readData(undefined, params, true);
        }
    }
</script>