<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="<c:url value="/resources/css/common/modal.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/mis/hrm/hrm_0105.css"/>"/>
<div class="modal_bg hrm_0105">
    <div class="modal">
        <div class="modal_close_btn">
            <span class="material-symbols-outlined weight-500">close</span>
        </div>
        <h2 class="modal_title">인사발령신청</h2>
        <div class="root_container">
            <div class="request_info_container">
                <span class="sub_title">신청정보</span>
                <form class="rq_info_form">
                    <div class="input_wrap">
                        <label>신청번호</label>
                        <input type="text" name="appntNo" class="input_text"/>
                    </div>
                    <div class="input_wrap">
                        <label>신청일자</label>
                        <input type="date" name="rqstDt" class="input_text"/>
                    </div>
                    <div class="input_wrap">
                        <label>신청자</label>
                        <input type="text" name="rqstEmpNm" class="input_text"/>
                    </div>
                    <div class="input_wrap">
                        <label>신청부서</label>
                        <input type="text" name="rqstDeptNm" class="input_text"/>
                    </div>
                </form>
            </div>
            <div class="appnt_request_info_container">
                <span class="sub_title">발령신청정보</span>
                <form class="appnt_rq_info_form">
                    <div class="row">
                        <label>발령일</label>
                        <input type="date" name="appntDt" class="input_text"/>
                    </div>
                    <div class="row">
                        <label>제목</label>
                        <input type="text" name="appntSbj" class="input_text"/>
                    </div>
                    <div class="row">
                        <label>비고</label>
                        <input type="text" name="rmk" class="input_text"/>
                    </div>
                </form>
            </div>
            <div class="appnt_emp_info_container">
                <div class="sub_title_wrap">
                    <span class="sub_title">발령자정보</span>
                    <div class="btn_container">
                        <button type="button" class="btn primary_btn add_row_btn">행추가</button>
                        <button type="button" class="btn white_btn remove_row_btn">행삭제</button>
                    </div>
                </div>

                <div class="grid_container">
                    <div id="appntEmpGrid"></div>
                </div>

            </div>
            <div class="attach_container"></div>
        </div>
    </div>
</div>
<script>
    /**
     * 인사발령신청 모달
     * grid = tui grid 객체
     * modalElement = 최상위 모달 DOM 요소
     * commonCodeObj = 공통코드목록 객체
     * option = 모달창 옵션
     */
    class AppntEmpModal {
        grid;
        modalElement;
        commonCodeObj;
        option;

        constructor() {
            this.modalElement = document.querySelector('.modal_bg.hrm_0105');
            this.init();
        }

        async init() {
            await this.initCommonCodes();
            this.initGrid();
            this.initEvent();
        }

        disableGrid() {
            this.grid.disable();
            document.querySelectorAll('.tui-grid-cell[data-column-name=dupAppntYn] input[type=checkbox]').forEach(el => {
               el.setAttribute('disabled', 'true');
            });
        }

        enableGrid() {
            this.grid.enable();
            document.querySelectorAll('.tui-grid-cell[data-column-name=dupAppntYn] input[type=checkbox]').forEach(el => {
                el.removeAttribute('disabled');
            });
        }

        initGrid() {
            const columns = [
                {
                    header: '사번',
                    name: 'empNo',
                    align: 'center'
                },
                {
                    header: '성명',
                    name: 'empNm',
                    align: 'center'
                },
                {
                    header: '발령구분',
                    name: 'appntCd',
                    align: 'center',
                    width: 100,
                    formatter: 'listItemText',
                    editor: {
                        type: 'select',
                        options: {
                            listItems: this.commonCodeObj['appntCd']
                        }
                    }
                },
                {
                    header: '겸직',
                    name: 'dupAppntYn',
                    align: 'center',
                    renderer: {
                        type: CheckBoxYNRenderer
                    }
                },
                {
                    header: '부서',
                    name: 'deptNm',
                    align: 'center',
                    width: 170
                },
                {
                    header: '고용형태',
                    name: 'empCls',
                    align: 'center',
                    width: 100,
                    formatter: 'listItemText',
                    editor: {
                        type: 'select',
                        options: {
                            listItems: this.commonCodeObj['102']
                        }
                    }
                },
                {
                    header: '직종',
                    name: 'jobTp',
                    align: 'center',
                    width: 100,
                    formatter: 'listItemText',
                    editor: {
                        type: 'select',
                        options: {
                            listItems: this.commonCodeObj['103']
                        }
                    }
                },
                {
                    header: '직위',
                    name: 'jobPost',
                    align: 'center',
                    width: 100,
                    formatter: 'listItemText',
                    editor: {
                        type: 'select',
                        options: {
                            listItems: this.commonCodeObj['105']
                        }
                    }
                },
                {
                    header: '직급',
                    name: 'grdCd',
                    align: 'center',
                    width: 100,
                    formatter: 'listItemText',
                    editor: {
                        type: 'select',
                        options: {
                            listItems: this.commonCodeObj['104']
                        }
                    }
                },
                {
                    header: '연구행정구분',
                    name: 'wrkCls',
                    align: 'center',
                    width: 120,
                    formatter: 'listItemText',
                    editor: {
                        type: 'select',
                        options: {
                            listItems: [
                                {value: 'R', text: '연구'},
                                {value: 'A', text: '행정'}
                            ]
                        }
                    }
                },
                {
                    header: '호봉',
                    name: 'salStep',
                    align: 'center',
                    formatter: 'listItemText',
                    editor: {
                        type: 'select',
                        options: {
                            listItems: this.commonCodeObj['138']
                        }
                    }
                },
                {
                    header: '발령사항',
                    name: 'rmk',
                    width: 600
                },
                {
                    header: '순번',
                    name: 'seq',
                    align: 'center'
                }
            ];
            const dataSource = {
                api: {
                    readData: {url: '/mis/hrm/hrm-0105/appnt-emp-list', method: 'GET'}
                },
                serializer(params) {
                    return Qs.stringify(params);
                },
                initialRequest: false
            };

            this.grid = new Grid({
                el: document.getElementById('appntEmpGrid'),
                rowHeight: 30,
                minRowHeight: 30,
                bodyHeight: 'fitToParent',
                data: dataSource,
                columns: columns,
                columnOptions: {
                    minWidth: 70,
                    frozenCount: 3,
                    frozenBorderWidth: 1
                }
            });
        }

        /**
         * 공통코드 초기화
         * appntCd : 발령구분
         * 102 : 고용형태
         * 103 : 직종
         * 105 : 직위
         * 104 : 직급
         * 138 : 호봉
         */
        async initCommonCodes() {
            try {
                const values = await getCommonCodes('102', '103', '105', '104', '138');

                this.commonCodeObj = Object.fromEntries(values.map((obj) => {
                    return [obj['parentCode'], formatCommonCodes(obj['codeList'])];
                }));

                let appntCodes = formatCommonCodes(await getAppntCodes());
                appntCodes.unshift({value: null, text: '없음'});

                this.commonCodeObj['appntCd'] = appntCodes;

            } catch (error) {
                console.error('공통코드 초기화 에러', error);
            }
        }

        initEvent() {
            this.modalElement.querySelector('.modal_close_btn').addEventListener('click', this.modalClose.bind(this));

            this.grid.on('onGridUpdated', function(ev) {
                this.option.disable ? this.disableGrid() : this.enableGrid();
            }.bind(this));
        }

        setAppntReqInfo(appntReqInfo) {
            const requestInfoForm = this.modalElement.querySelector('.rq_info_form');
            const appntRequestInfoForm = this.modalElement.querySelector('.appnt_rq_info_form');

            requestInfoForm.appntNo.value = appntReqInfo.appntNo;
            requestInfoForm.rqstDt.value = dateFormatter(appntReqInfo.rqstDt);
            requestInfoForm.rqstEmpNm.value = appntReqInfo.rqstEmpNm;
            requestInfoForm.rqstDeptNm.value = appntReqInfo.rqstDeptNm;

            appntRequestInfoForm.appntDt.value = dateFormatter(appntReqInfo.appntDt);
            appntRequestInfoForm.appntSbj.value = appntReqInfo.appntSbj;
            appntRequestInfoForm.rmk.value = appntReqInfo.rmk;
        }

        /**
         * 모달창 열기
         * @param appntNo 신청번호
         * @param option 모달창 옵션
         * @param option.disable 그리드 비활성화 여부
         * @param option.blank 그리드 새창 여부
         */
        modalOpen(appntNo, option) {
            this.option = option;

            option.blank ? this.reset() : null;

            let btnContainer = this.modalElement.querySelector('.appnt_emp_info_container .btn_container');
            option.disable ? btnContainer.style.display = 'none' : btnContainer.style.display = 'flex';

            this.modalElement.classList.add('show');
            document.querySelector('body').style.overflow = 'hidden';

            if(!(appntNo === '' || appntNo === null)) {
                this.grid.readData(undefined, {appntNo: appntNo}, true);
            }
        }

        modalClose() {
            this.modalElement.classList.remove('show');
            document.querySelector('body').style.overflow = 'initial';
        }

        reset() {
            this.modalElement.querySelector('.rq_info_form').reset();
            this.modalElement.querySelector('.appnt_rq_info_form').reset();
            this.grid.clear();
        }
    }
</script>