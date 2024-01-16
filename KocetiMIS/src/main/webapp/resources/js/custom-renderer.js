class CheckBoxYNRenderer {
    constructor(props) {
        const el = document.createElement('input');
        el.type = 'checkbox';
        el.style.cssText = 'display: block; margin: 0 auto;';
        el.checked = (props.value === 'Y');

        el.addEventListener('change', () => {
            if (props.value === 'Y') {
                props.grid.setValue(props.rowKey, props.columnInfo.name, 'N');
                props.value = 'N';
            } else {
                props.grid.setValue(props.rowKey, props.columnInfo.name, 'Y');
                props.value = 'Y';
            }
        });

        this.el = el;
        this.render(props);
    }

    getElement() {
        return this.el;
    }

    render(props) {
        this.el.value = props.value;
    }
}

/**
 * 그리드 내의 실제값과 화면에 렌더링 될 값이 다를 때 사용하는 렌더러
 * ex) (empNo, empNm) 그리드 내의 값은 empNo로 유지하되 렌더링은 empNm으로 하고 싶을때 사용
 *     아래 포맷으로 사용자옵션 전달
 *     value는 그리드 내의 실제 값, text는 화면에 렌더링될 문자열
 *     [
 *          {value: '1234', text: 'user1'},
 *          {value: '5678', text: 'user2'}
 *     ]
 */
class TextValueRenderer {
    constructor(props) {
        const el = document.createElement('div');
        el.classList.add('tui-grid-cell-content');

        this.el = el;
        this.render(props);
    }

    getElement() {
        return this.el;
    }

    render(props) {
        let textValueOptions = props.columnInfo.renderer.options;

        textValueOptions.listItems.forEach(item => {
            if (item.value === props.value) {
                this.el.innerText = item.text;
            }
        });
    }
}

/**
 * yyyyMMdd 형식의 날짜 문자열을 yyyy-MM-dd형식으로 바꿔주는 렌더러
 */
class DateFormatRenderer {
    constructor(props) {
        const el = document.createElement('div');
        const options = props.columnInfo.renderer.options;
        el.classList.add('tui-grid-cell-content');

        this.el = el;
        this.options = options;

        this.render(props);
    }

    getElement() {
        return this.el;
    }

    render(props) {
        let date = props.value + "";
        this.el.innerText = this.formatDate(date);
    }

    formatDate(date) {

        if(date !== 'null' && date !== undefined && date !== '') {
            let year = date.substring(0, 4);
            let month = date.substring(4, 6);
            let day = date.substring(6, 8);

            return `${year}-${month}-${day}`;
        } else {
            return '';
        }

    }
}

/**
 * 그룹웨어 문서 버튼 렌더러
 */
class GwDocIconRenderer {
    constructor(props) {
        const el = document.createElement('span');
        el.classList.add('material-symbols-outlined', 'weight-200');
        el.style.cssText = 'font-size: 23px; display: block; cursor: pointer;';

        el.innerText = 'description';

        this.el = el;
        this.render(props);
    }

    getElement() {
        return this.el;
    }

    render(props) {
    }
}

/**
 * 검색 버튼 아이콘 렌더러
 */
class SearchIconRenderer {
    constructor(props) {
        const el = document.createElement('span');
        el.style.cssText = 'font-size: 16px; display: flex; cursor: pointer; margin:0 10px ;  background-image:url("data:image/svg+xml,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' width=\'16\' height=\'16\' fill=\'currentColor\' class=\'bi bi-search\' viewBox=\'0 0 16 16\'%3E%3Cpath d=\'M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z\'/%3E%3C/svg%3E"); background-repeat:no-repeat; background-position: right;';
        this.el = el;
        this.render(props);
    }

    getElement() {
        return this.el;
    }

    render(props) {
        this.el.innerText =props.value;
    }

}

/**
 * datePicker input 렌더러
 */
class DatePickerRenderer {
    constructor(props) {
        const el = document.createElement('input');
        el.style.cssText = 'width:100%; border:none;'
        el.type = 'date'

        this.el = el;
        this.render(props);
    }

    getElement() {
        return this.el;
    }

    render(props) {
        let date = props.value + "";
        ;
        this.el.value = this.formatDate(date);
    }

    formatDate(date) {

        if (date !== 'null' && date !== undefined && date !== '') {
            let year = date.substring(0, 4);
            let month = date.substring(4, 6);
            let day = date.substring(6, 8);

            return `${year}-${month}-${day}`;
        } else {
            return '';
        }

    }

}