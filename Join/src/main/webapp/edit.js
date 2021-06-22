const change_pswd = document.querySelector('.change_pswd');
const leave_account = document.querySelector('.leave_account');

const change_feild = document.querySelector(".change_feild");
const delete_feild = document.querySelector(".delete_feild");

const cancle_btn = document.querySelector(".cancle_btn");
const cancle_btn2 = document.querySelector(".cancle_btn2");
const confirm_btn = document.querySelector(".confirm_btn");

function activate_change_feild() {
    change_feild.classList.remove('none');
}

function activate_delete_feild() {
    delete_feild.classList.remove('none');  
}

function cancle() {
    change_feild.classList.add('none');
    delete_feild.classList.add('none');
}

function init() {
    cancle_btn.addEventListener('click', cancle);
    cancle_btn2.addEventListener('click', cancle);
    change_pswd.addEventListener('click',  activate_change_feild);
    leave_account.addEventListener('click', activate_delete_feild);
}

init();