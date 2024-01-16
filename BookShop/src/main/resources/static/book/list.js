window.addEventListener("load", () => {
    const state = {
        url: "/api",
        url_list: "/api/list",
    };

    // 모달 
    const addModal = new bootstrap.Modal("#addModal");
    const updateModal = new bootstrap.Modal("#updateModal");

    // 검색파트
    document.querySelectorAll("form").forEach(item => {
        item.addEventListener("submit", e => {
            // 이벤트가 전파되는 것을 막아줌 (이벤트 핸들러가 여러개 있는데 그 이벤트 핸들러가 작동되는 것을 막아줌?)
            e.preventDefault(); 

            const search = item.querySelector("select[name='search']").value;
            const keyword = item.querySelector("input[name='keyword']").value;

            console.log(`${search} -> ${keyword}`); 

            getPage(1, {search, keyword});


            // console.log(e);
            // const form = e.target;
            // for (let i = 0; i < form.length; i++) {
            //     const param = form[i];

            //     if(param.name)
            //         console.log(`${param.name}: ${param.value}`);
            // }
        })
    })

    // pagination 관련 코드 시작 (이벤트 캡처링 버전)
    // 이렇게 해주면 이벤트가 걸리는 부분이 pagination 전체에서 click 이벤트가 생기면 이벤트핸들러가 실행되는데 
    // page-link라는 요소가 있으면 getPage를 돌림
    document.querySelector(".pagination").addEventListener("click", e => {
        if(e.target.classList.contains("page-link")) {
            const {search, keyword} = state; // distructuring

            getPage(e.target.dataset.page, {search, keyword});

        }
        }, { capture : true,} 
            // capture: true를 걸어놓으면 이벤트가 버블링이 아닌 캡처링으로 (위에서 밑으로 전달) 됨 
    );

    // list를 불러오는 행위의 중복성 제거를 위한 ramda
    const getPage = (page, option) => { // fetch(`/api/list/${e.target.dataset.page}`) 이 일에 대해서 적어줄 것

        const item = { // body에 넣을 option을 위해서 만든 객체 
            page,
        };

        if(option && option.search && option.keyword){
            item.search = option.search;
            item.keyword = option.keyword;
        }

        fetch(state.url_list, {
            method: "POST",
            body: JSON.stringify(item),
            headers: {
                "Content-Type": "application/json",
            }
        })
        .then(resp => resp.json())
        .then(result => {
                {
                    console.log(result);

                const {list, pager} = result;

                if (option && option.search && option.keyword) {
                    state.search = pager.search;
                    state.keyword = pager.keyword;
                } else {
                    // state.search = null;
                    // state.keyword = null;

                    delete state.search;
                    delete state.keyword;

                }


                /*
                // 2번째 방법
                let html = '';
                result.forEach(item => {
                    html += `<tr>
                                <td>${item.bookid}</td>
                                <td>${item.bookname}</td>
                                <td>${item.publisher}</td>
                                <td>${item.price}</td>
                                <td>
                                    <a class="btn btn-danger" href="delete/${item.bookid}">삭제</a>
                                    <a class="btn btn-warning" href="update/${item.bookid}">변경</a>
                                </td>
                            </tr>`;
                });
                document.querySelector("tbody").innerHTML = html;
                */
                
                document.querySelectorAll("tbody tr:not(#list-empty)").forEach(item => item.remove()); 
               // tr:not(#list-empty) : 조건을 사용하는 것 (list-empty를 제외한다는 것)

                if(list.length > 0 ) { // 조건을 !result.length 이렇게 적어줄 수도 있음
                    document.getElementById("list-empty").classList.add("hide");
                } else {
                    document.getElementById("list-empty").classList.remove("hide");
                }
                
                // 1번째 방법
                list.forEach(item => {
                    const tr = document.createElement("tr");
                    tr.dataset.bookid = item.bookid;
                    tr.dataset.bookname = item.bookname;
                    tr.dataset.publisher = item.publisher;
                    tr.dataset.price = item.price;

                    const bookid = document.createElement("td");
                    bookid.classList.add("bookid");
                    bookid.textContent = item.bookid;
                    tr.append(bookid);

                    const bookname = document.createElement("td");
                    bookname.classList.add("bookname");
                    bookname.textContent = item.bookname;
                    tr.append(bookname);

                    const publisher = document.createElement("td");
                    publisher.classList.add("publisher");
                    publisher.textContent = item.publisher;
                    tr.append(publisher);

                    const price = document.createElement("td");
                    price.classList.add("price");
                    price.textContent = item.price;
                    tr.append(price);

                    const management = document.createElement("td");

                    const remove = document.createElement("a");
                    remove.textContent = "삭제";
                    remove.classList.add("btn", "btn-sm", "btn-danger");
                    remove.addEventListener("click", deleteHandler);
                    management.append(remove);

                    const update = document.createElement("a");
                    update.textContent = "수정";
                    update.classList.add("btn", "btn-sm", "btn-warning");
                    // 모달 이벤트 핸들러
                    update.addEventListener("click", updateHandler);

                    management.append(update);
                    tr.append(management);

                    document.querySelector("tbody").append(tr);

                    // pager 관련 코드
                    document.querySelector(".pagination .first").dataset.page = 1;
                    document.querySelector(".pagination .prev").dataset.page = pager.prev;
                    document.querySelector(".pagination .next").dataset.page = pager.next;
                    document.querySelector(".pagination .last").dataset.page = pager.last;

                    document.querySelectorAll(".pagination .page").forEach(item => item.remove());

                    const next = document.querySelector(".pagination .next");
                    pager.list.forEach(item => {
                        const pageItem = document.createElement("span");
                        pageItem.classList.add("page-item", "page");
                        if(pager.page == item) {
                            pageItem.classList.add("active");
                        }
                        
                        const pageLink = document.createElement("a");
                        pageLink.classList.add("page-link");
                        pageLink.textContent = item;
                        pageLink.dataset.page = item;

                        // 
                        // pageLink.addEventListener("click", e=>{
                        //     getPage(e.target.dataset.page);
                        // })

                        pageItem.append(pageLink);

                        next.parentElement.before(pageItem);

                    });

                });
            } 
        });
    };



    // deleteHandler 시작
    const deleteHandler = e => {
        const bookid = e.target.closest("tr").dataset.bookid;

        fetch(state.url, {
            method: "DELETE",
            body: JSON.stringify({bookid}),
            headers: {
                "Content-Type" : "application/json"
            }
        }).then(resp => resp.json())
        .then(result => {
            console.log(result);

            document.querySelector(`tr[data-bookid='${bookid}']`).remove()

            const list = document.querySelectorAll("tbody tr");

            if(list.length == 1) {
                list[0].classList.remove("hide"); // 화면에 하나도 남아있지 않으면 '검색된 번호가 없습니다.'를 띄우도록 함
            }
        });
    };

    // updateModal 시작
    const updateHandler = e => {
        // 비구조화 (distructuring?)
        const {bookid, bookname, publisher, price} = e.target.closest("tr").dataset;

        document.querySelector("#updateModal input[name='bookid']").value = bookid;
        document.querySelector("#updateModal input[name='bookname']").value = bookname;
        document.querySelector("#updateModal input[name='publisher']").value = publisher;
        document.querySelector("#updateModal input[name='price']").value = price;

        updateModal.show();
    };

    // 서버에 전달해주는 update
    document.querySelector("#updateModal .update").addEventListener("click", e => {

        const item = {
            bookid: document.querySelector("#updateModal input[name='bookid']").value,
            bookname: document.querySelector("#updateModal input[name='bookname']").value,
            publisher: document.querySelector("#updateModal input[name='publisher']").value,
            price: document.querySelector("#updateModal input[name='price']").value,
        }

        fetch(state.url, {
            method: "PUT",
            body: JSON.stringify(item),
            headers: {
                "Content-Type" : "application/json",
            }
        }).then(resp => resp.json())
        .then(result => {
            console.log(result);

            const tr = document.querySelector(`tr[data-bookid='${item.bookid}']`);
            
            for(const attr in item){
                // console.log(attr); 이걸 적으면 key값이 넘어오는 것을 볼 수 있음 
                tr.querySelector(`.${attr}`).textContent = item[attr];
            }
        });
        updateModal.hide();
    });

    // addModal 시작
    document.querySelector("#add").addEventListener("click", e => {
        document.querySelector("#addModal input[name='bookname']").value = "";
        document.querySelector("#addModal input[name='publisher']").value = "";
        document.querySelector("#addModal input[name='price']").value = 0;

        addModal.show(); // addModal.toggle(); 을 사용해도 됨
    })

    document.querySelector("#addModal .add").addEventListener("click", e => {
        const item = {
            // 버튼이 아니라면 target을 이용할 수 있음
            bookname: document.querySelector("#addModal input[name='bookname']").value,
            publisher: document.querySelector("#addModal input[name='publisher']").value,
            price: document.querySelector("#addModal input[name='price']").value
        };
        console.log(item);

        fetch(state.url, {
            method: "POST",
            body: JSON.stringify(item),
            headers: {
                "Content-type" : "application/json"
            }
        }).then(resp => resp.json())
        .then(result => {
            console.log(result);
        });

        // hide를 적지 않아도 toggle을 달아주면 등록버튼을 눌렀을 때 모달창이 사라질거임
        addModal.hide();
    });

    getPage(1);


    // list
    // get으로 보내니까 옵션을 주지 않아도 됨
    // fetch("/api")
    // .catch(reason => console.log(reason))
    // .then(resp => {
    //     if(resp.ok) {
    //         resp.json()
    //         .catch(reason => console.log(reason))
    //         .then(result => {
    //             const {list, pager} = result;

    //             console.log(result);
    //         });
    //     }else {
    //         console.log(resp);
    //     }
    // });

    /*fetch("/api")
    .then(resp => resp.json())
    .then(result => {
        console.log(result);
    });*/
});