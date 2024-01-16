function initMenuIcon() {
    let icons = document.querySelectorAll('.top_nav .icon');
    let iconNameList = [
        'group',
        'edit_note',
        'account_balance_wallet',
        'view_list',
        'cut',
        'payments',
        'savings',
        'cycle',
        'vaccines'
    ];

    icons.forEach((icon, index) => icon.innerText = iconNameList[index]);
};

// 모바일 접속시에 좌측 사이드바 접어주는 함수
function checkViewport() {
    let gridLayout = document.querySelector('.grid_layout');
    let topNav = document.querySelector('.top_nav');
    let subNav = document.querySelector('.sub_nav');

    if (window.innerWidth < 900) {
        topNav.style.transition = 'transform 0s ease-in-out';
        subNav.style.transition = 'transform 0s ease-in-out';
        gridLayout.classList.add('nav_toggle');
        setTimeout(() => {
            subNav.removeAttribute('style')
            topNav.removeAttribute('style')
        }, 250);
    }
}

// 모바일 화면 네비게이션 뒷배경 클릭 이벤트
document.querySelector('.grid_layout .grid_layout_bg').addEventListener('click', function () {
    document.querySelector('.grid_layout').classList.add('nav_toggle');
});

// Depth2 메뉴 클릭 이벤트
document.querySelectorAll('.menu_depth1 .menu_wrap').forEach(menuWrap => {
    menuWrap.addEventListener('click', function () {
        let menuDepth2 = this.closest('.menu').querySelector('.menu_depth2');
        let icon = this.querySelector('.more_btn');

        if (menuDepth2.clientHeight === 0) {
            menuDepth2.style.height = menuDepth2.scrollHeight + 'px';
            icon.style.transform = 'rotate(-180deg)';
        } else {
            menuDepth2.style.height = '0px';
            icon.style.transform = '';
        }
    });
});


// 좌측 상단 메뉴 아이콘 클릭 이벤트
document.getElementById('navToggleBtn').addEventListener('click', function () {
    document.querySelector('.grid_layout').classList.toggle('nav_toggle');
});

// 대메뉴 클릭 이벤트
document.querySelectorAll('.top_nav .menu_list .menu').forEach(menu => {
    menu.addEventListener('click', function () {
        let menuId = this.dataset.menuId;
        openMenu(menuId);
    });
});

document.querySelector('.profile_container').addEventListener('click', function() {
    this.classList.toggle('on');
});

function openMenu(menuId) {
    document.querySelectorAll('.top_nav .menu_list .menu.show')
        .forEach(menu => menu.classList.remove('show'));
    document.querySelectorAll('.sub_nav .menu_depth1.show')
        .forEach(menu =>  menu.classList.remove('show'));

    let topMenuEl = document.querySelector(`.top_nav .menu_list .menu[data-menu-id=${menuId}]`);
    let childMenuEl = document.querySelector(`.sub_nav .menu_depth1[data-menu-id=${menuId}]`);

    topMenuEl.classList.add('show');
    childMenuEl.classList.add('show');
}

// Toast-Grid 라이브러리 반응형 대응
document.querySelector('.sub_nav').addEventListener('transitionstart', () => {
    let startTime;

    function animate(currentTime) {
        if (!startTime)
            startTime = currentTime;

        // 경과 시간
        const elapsedTime = currentTime - startTime;

        // 0.25초(250ms)가 지났으면 종료
        if (elapsedTime >= 250) {
            window.dispatchEvent(new Event('resize'));
            return;
        }

        window.dispatchEvent(new Event('resize'));

        requestAnimationFrame(animate);
    }

    // 첫 프레임 시작
    requestAnimationFrame(animate);
});

initMenuIcon();
checkViewport();
initMenu();


// // 뷰포트 변경시 <html> --vh 변경 이벤트
// window.addEventListener('resize', setScreenSize);

function initMenu() {
    let currentMenu = document.getElementById('sessionCurrentMenu').value;
    let path = document.getElementById('path').value;
    let menuId;

    if(path === 'mis') {
        menuId ='M_MIS_01';
    } else if(path === "pms") {
        menuId = 'M_PMS_01';
    } else if(path ==="adm") {
        menuId = 'M_ADM_01';
    }

    if (currentMenu === '') {
        openMenu(menuId);
        return;
    }

    let menuList = document.querySelectorAll('.menu[data-menu-pgm-url]');
    for (let menu of menuList) {
        let menuUrl = menu.dataset.menuPgmUrl;
        if (menuUrl === currentMenu) {
            menu.classList.add('current_menu');
            openParentMenu(menu);
            break;
        }
    }
}

function openParentMenu(childMenu) {
    let menuId = childMenu.closest('.menu_depth1').dataset.menuId;
    childMenu.closest('.menu_depth2')
        .closest('.menu')
        .querySelector('.menu_wrap')
        .click();
    openMenu(menuId);
}
