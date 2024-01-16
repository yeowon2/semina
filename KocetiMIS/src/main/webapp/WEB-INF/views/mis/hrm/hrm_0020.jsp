<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>부서관리</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/mis/hrm/hrm_0020.css"/>"/>

    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-grid.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-pagination.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-date-picker.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-time-picker.css"/>"/>
</head>
<body>
<div class="grid_layout">
    <%@ include file="../../template.jsp" %>
    <div class="main">
        <div class="head">
            <div class="menu_title_wrap">
                <h1>부서관리</h1>
            </div>
            <div class="bread_crumb_wrap">
                <div>
                    <span>인사관리</span>
                    <span>/</span>
                    <span>기준관리</span>
                    <span>/</span>
                    <span class="current_menu">부서관리</span>
                </div>
            </div>
        </div>

        <div class="body">
            <div class="search_container">
                <select name="structDt">
                    <c:forEach items="${reorganizationDate}" var="date">
                        <fmt:parseDate var="parseDate" value="${date.structDt}" pattern="yyyyMMdd"/>
                        <option value="${date.structDt}">
                            <fmt:formatDate value="${parseDate}" pattern="yyyy-MM-dd"/>
                        </option>
                    </c:forEach>
                </select>
                <button class="primary_btn btn" id="searchBtn">조회</button>
            </div>

            <%@ include file="../../common/emp_sch.jsp" %>

            <div class="grid_container">
                <div id="grid"></div>
            </div>
        </div>
    </div>
</div>

<script src="<c:url value="/resources/js/template.js"/>"></script>
<script src="<c:url value="/resources/lib/tui-grid/tui-pagination.js"/>"></script>
<script src="<c:url value="/resources/lib/tui-grid/tui-grid.js"/>"></script>
<script src="<c:url value="/resources/lib/qs.js"/>"></script>

<script src="<c:url value="/resources/lib/axios.js"/>"></script>
<script src="<c:url value="/resources/js/common.js"/>"></script>

<script>
    let Grid = tui.Grid;
    Grid.setLanguage('ko'); // 한국어 설정

    window.addEventListener('load', init);

    let deptGrid;
    let loadDeptGrid = () => {
        const columnData = [
            {
                header: "상태",
                name: 'tmHeader'
            },
            {
                header: '변경구분',
                name: 'chgClsCd',
                formatter: 'listItemText',
                editor: {
                    type: 'select',
                    options: {
                        listItems: [
                            {text: '변경없음', value: '145-010'},
                            {text: '신설', value: '145-020'},
                            {text: '변경', value: '145-030'},
                            {text: '폐지', value: '145-050'}
                        ]
                    }
                },
                onAfterChange(ev) {
                    deptGrid.check(ev.rowKey);
                    deptGrid.setValue(ev.rowKey, 'tmHeader', 'U', false);
                }
            },
            {
                header: '부서코드',
                name: 'deptCd'
            },
            {
                header: '부서명',
                name: 'deptNm',
                width: 600
            },
            {
                header: '부모부서코드',
                name: 'upDeptCd',
                hidden: true
            },
            {
                header: '정렬순서',
                name: 'ordNo'
            },
            {
                header: '부서장명',
                name: 'deptEmpNm'
            },
            {
                header: '부서장코드',
                name: 'deptEmpNo'
            },
            {
                header: '사용여부',
                name: 'useYN',
                formatter: 'listItemText',
                editor: {
                    type: 'select',
                    options: {
                        listItems: [
                            {text: '사용', value: 'Y'},
                            {text: '미사용', value: 'N'},
                        ]
                    }
                }
            }
        ];
        const dataSource = {
            api: {
                readData: {url: '/mis/hrm/hrm-0020/dept-list', method: 'GET'}
            },
            serializer(params) {
                return Qs.stringify(params);
            },
            initialRequest: false //초기데이터 로딩 여부
        };

        deptGrid = new Grid({
            el: document.getElementById('grid'),
            rowHeaders: ['checkbox'],
            bodyHeight: 'fitToParent',
            minRowHeight: 20,
            rowHeight: 30,
            columns: columnData,
            data: dataSource,
            treeColumnOptions: {
                name: 'deptNm',
                useIcon: true,
                useCascadingCheckbox: false
            },
            /** 그리드의 모든 데이터를 업데이트하고 그리드를 렌더링한 후 호출되는 함수 */
            onGridUpdated: () => {
                deptGrid.expandAll(); //트리 전부 열기
            }
        });

        // 조회 버튼 클릭 이벤트
        document.getElementById('searchBtn').addEventListener('click', () => {
            let structDt = document.querySelector('select[name=structDt]').value;

            deptGrid.readData(undefined, {structDt: structDt}, true);
        });

        // 체크박스 체크해제시 상태 초기화
        deptGrid.on('uncheck', (ev) => {
            deptGrid.setValue(ev.rowKey, 'tmHeader', '', false);
        });

        // 셀 더블클릭 이벤트
        deptGrid.on('dblclick', (ev) => {
            //부서장명 클릭 시 모달 열기
            if (ev.columnName === 'deptEmpNm') {
                empSchModal.modalOpen();
                empSchModal.readData();
            }
        });
    }

    function init() {
        loadDeptGrid();
        setRefreshObserver(deptGrid);
    }
</script>
</body>
</html>
