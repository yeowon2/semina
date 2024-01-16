<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="<c:url value="/resources/css/common/modal.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/common/dept_sch.css"/>"/>
<div class="modal_bg dept_sch">
    <div class="modal">
        <div class="modal_close_btn">
            <span class="material-symbols-outlined weight-500">close</span>
        </div>
        <h2 class="modal_title">부서조회</h2>
        <div class="search_container">
            <div class="btn_container">
                <button type="button" class="btn white_btn reset_btn">초기화</button>
                <button type="button" class="btn primary_btn search_btn">조회</button>
            </div>
            <form id="deptSchModalSearchForm" onsubmit="return false;">
                <div class="input_box_wrap">
                    <div class="input_box">
                        <label>조직개편일</label>
                        <select id="structDt" name="structDt" class="input_text"></select>
                    </div>
                    <div class="input_box">
                        <label>사용여부</label>
                        <select name="useYn" class="input_text">
                            <option value="">전체</option>
                            <option value="Y" selected>사용</option>
                            <option value="N">미사용</option>
                        </select>
                    </div>
                </div>
                <div class="input_box">
                    <label>부서명</label>
                    <input style="text-align: left" name="deptNm" type="text" class="input_text"/>
                </div>
            </form>
        </div>
        <div id="deptSchGrid"></div>
    </div>
</div>

<script>
    let deptSchModal;

    class DeptSchModal {
        grid;
        searchForm;
        selectEvent;
        deptSchModalEl;
        selectedDeptInfo;

        constructor() {
            this.deptSchModalEl = document.querySelector('.modal_bg.dept_sch');
            this.searchForm = document.getElementById('deptSchModalSearchForm');

            this.initSearchForm();
            this.initEvent();
            this.initGrid();
            this.initGridEvent();
        }

        initEvent() {
            this.deptSchModalEl.querySelector('.modal_close_btn').addEventListener('click', this.modalClose);
            this.deptSchModalEl.querySelector('.search_btn').addEventListener('click', this.search);
            this.deptSchModalEl.querySelector('.reset_btn').addEventListener('click', this.resetSearchForm);
            this.searchForm.deptNm.addEventListener('keypress', ev => {
               if(ev.keyCode === 13) this.search();
            });
        }

        initGrid() {
            const columns = [
                {
                    header: '부서코드',
                    name: 'deptCd',
                    hidden: true
                },
                {
                    header: '부서명',
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
                    readData: {url: "/dept-sch/findByDeptList", method: 'GET'}
                },
                initialRequest: false
            };

            this.grid = new Grid({
                el: document.getElementById('deptSchGrid'),
                columns: columns,
                data: dataSource,
                width: 500,
                bodyHeight: 450,
                rowHeight: 25,
                minRowHeight: 25,
                treeColumnOptions: {
                    name: 'deptNm',
                    useIcon: false,
                    useCascadingCheckbox: false
                },
                onGridUpdated: () => {
                    this.grid.expandAll();
                }
            });
        }

        initGridEvent() {
            this.grid.on('dblclick', (ev) => {
                this.selectedDeptInfo = this.grid.getRow(ev.rowKey);
                this.modalClose();
                this.selectEvent();
            });
        }

        initSearchForm = () => {
            axios.get('/dept-sch/findStructList')
                .then(res => {
                    let form = document.getElementById('deptSchModalSearchForm');
                    let data = res.data;
                    let options = '';
                    data.forEach(item => options += '<option value =' + item.structDt + '>' + item.structDtNm + '</option>');
                    form.structDt.innerHTML = options;
                })
                .catch(error => {
                    console.log(error);
                });
        }

        resetSearchForm = () => {
            this.searchForm.reset();
        }

        search = () => {
            let params = {
                useYn: this.searchForm.useYn.value,
                structDt: this.searchForm.structDt.value,
                deptNm: this.searchForm.deptNm.value
            };

            this.grid.readData(undefined, params, true);
        }

        modalOpen = () => {
            this.deptSchModalEl.classList.add('show');
            document.querySelector('body').style.overflow = 'hidden';
        }

        modalClose = () => {
            this.deptSchModalEl.classList.remove('show');
            document.querySelector('body').style.overflow = 'initial';
            this.resetSearchForm();
        }
    }
</script>