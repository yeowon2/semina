/**
 * 공통코드 불러오는 함수
 * @param {string} prefixes 공통코드 접두어
 * @returns {Promise<{code: string, name: string}[][]>} 불러온 코드 목록 반환
 */
async function getCommonCodes(...prefixes) {
    const res = await axios.get('/common/codes', {
        params: {
            prefixes: prefixes
        },
        paramsSerializer: function (params) {
            return Qs.stringify(params, {arrayFormat: 'comma'})
        },
    });

    return res.data;
}

/**
 * 인사발령코드 불러오는 함수
 * @returns {Promise<{code: string, name: string}[]>} 불러온 코드 목록 반환
 */
async function getAppntCodes() {
    const res = await axios.get('/common/codes/appnt');
    return res.data;
}

async function getBdgStdCodeList(params) {
    const res = await axios.get('/mis/bdg/bdg-0022/findByBdgStdCodeList', {params});
    return res.data;
}
/**
 * getCommonCodes 함수를 통해 가져온 코드 포맷 변경
 * @param {{code: string, name: string}[]} codes 변환할 코드 목록
 * @returns {{value: string, text: string}[]} 변환된 코드 목록 반환
 */
function formatCommonCodes(codes) {
    return codes.map(item => {
        return {value: item.code, text: item.name};
    });
}

/**
 * 서버측 세션 데이터 가져오는 함수
 * @param {string} key key name
 * @returns {Promise<*>} 세션 데이터 반환
 */
async function getSessionData(key) {
    let response = await axios.get(`/common/session/${key}`);
    return response.data;
}

/**
 * tui-Grid 라이브러리의 css display:grid 속성 일부 기능 미지원으로 인한 문제 해결 함수
 * @param grid tui-Grid Object
 */
function setRefreshObserver(grid) {
    let observer = new ResizeObserver(function (entries) {
        entries.forEach(() => {
            grid.refreshLayout();
        });
    });
    observer.observe(document.querySelector('.body'));
}

/**
 *  yyyyMMdd 포맷 날짜 문자열을 yyyy-MM-dd 포맷으로 변경
 *  @param {string} date 변경할 날짜 문자열
 *  @return {string} 변경된 날짜 문자열
 * */
function dateFormatter(date) {
    const year = date.substring(0, 4);
    const month = date.substring(4, 6);
    const day = date.substring(6, 8);

    return `${year}-${month}-${day}`;
}

/**
 * 그룹웨어 문서 호출
 * @param {string} gwDocNo 그룹웨어 문서 번호
 */
function loadGwDoc(gwDocNo) {
    let rqURL = 'https://gw.koceti.re.kr/ATWork/main/gwDocView.jsp';
    let empCode = 'admin' //TODO 임시사원번호

    let params = Qs.stringify({
        EMPCODE: empCode,
        APPRID: gwDocNo
    }, {addQueryPrefix: true});

    window.open(rqURL + params);
}

/*
* 검색조건이 YYYY일 때, `년도설정, 4자리설정
* */
let numberMaxLengthCheck = (param, cls) => {
    let inputLength= param.value.length;
    let maxLength = param.maxLength;

    if(cls === 'year') {
        let now = new Date();
        let nowYear = now.getFullYear();

        if (inputLength > maxLength) {
            param.value = nowYear;
        }
    }
}