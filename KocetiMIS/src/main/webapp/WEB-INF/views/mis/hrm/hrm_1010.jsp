<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MIS</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>

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
                <h1>발령코드관리</h1>
            </div>
            <div class="bread_crumb_wrap">
                <div>
                    <span>인사관리</span>
                    <span>/</span>
                    <span>임용관리</span>
                    <span>/</span>
                    <span class="current_menu">발령코드관리</span>
                </div>
            </div>
        </div>

        <div class="body">
            <div class="grid_container">
                <div id="appntGrid"></div>
            </div>
        </div>
    </div>
</div>

<%-- Toast-Grid --%>
<script src="<c:url value="/resources/js/template.js"/>"></script>

<script src="<c:url value="/resources/lib/tui-grid/tui-pagination.js"/>"></script>
<script src="<c:url value="/resources/lib/tui-grid/tui-grid.js"/>"></script>
<script src="<c:url value="/resources/lib/qs.js"/>"></script>

<%-- Toast-Grid Custom Renderer --%>
<script src="<c:url value="/resources/js/custom-renderer.js"/>"></script>
<script>
    let Grid = tui.Grid;
    Grid.setLanguage('ko'); // 한국어 설정

    let appntGrid;
    let loadAppntGrid = () => {
        const columns = [
            {
                header: "상태",
                name: 'tmHeader'
            },
            {
                header: '코드',
                name: 'appntCd'
            },
            {
                header: '발령명',
                name: 'appntNm'
            },
            {
                header: '발령구분',
                name: 'appntCls',
                formatter: 'listItemText',
                editor: {
                    type: 'select',
                    options: {
                        listItems: [
                            {text: '입사발령', value: '125-010'},
                            {text: '인사기록', value: '125-020'},
                            {text: '승진발령', value: '125-030'},
                            {text: '퇴직발령', value: '125-040'},
                            {text: '징계발령', value: '125-050'},
                            {text: '포상발령', value: '125-060'},
                            {text: '부수직무', value: '125-070'},
                            {text: '휴직발령', value: '125-080'},
                            {text: '복직발령', value: '125-090'},
                            {text: '강임발령', value: '125-100'}
                        ]
                    }
                }
            },
            {
                header: '사용여부',
                name: 'useYn',
                renderer: {
                    type: CheckBoxYNRenderer
                }
            },
            {
                header: '겸직여부',
                name: 'dupCdYn',
                renderer: {
                    type: CheckBoxYNRenderer
                }
            },
            {
                header: '순서',
                name: 'ordNo',
                sortable: true,
                sortingType: 'asc',
            }
        ];

        const dataSource = {
            api: {
                readData: {url: '/mis/hrm/hrm-1010/get-appnt', method: 'GET'}
            },
            initialRequest: true
        };

        appntGrid = new Grid({
            el: document.getElementById('appntGrid'),
            columns: columns,
            data: dataSource,
            bodyHeight: 'fitToParent',
            minRowHeight: 20,
            rowHeight: 30,
            rowHeaders: ['rowNum', 'checkbox']
        });
    }

    window.addEventListener('load', () => {
        loadAppntGrid();
    });


    window.addEventListener('load', () => {
        /** 좌측 네비게이션을 통한 레이아웃 변경시 tui-grid가 레이아웃 변경을 감지못하는 버그 해결을 위한 코드 */
        let observer = new ResizeObserver(function (entries) {
            entries.forEach(() => {
                appntGrid.refreshLayout();
            });
        });
        observer.observe(document.querySelector('.body'));
    });

</script>
</body>
</html>
