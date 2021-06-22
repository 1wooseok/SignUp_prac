const name_edit_btn = document.querySelector(".name_edit_btn");
const email_edit_btn = document.querySelector(".email_edit_btn");
const phone_edit_btn = document.querySelector(".phone_edit_btn");


const name_setting_form = document.querySelector(".name_setting_form");
const email_setting_form = document.querySelector(".email_setting_form");
const phone_setting_form = document.querySelector(".phone_setting_form");

const cancle_btn = document.querySelector(".cancle_btn");
const cancle_btn2 = document.querySelector(".cancle_btn2");
const cancle_btn3 = document.querySelector(".cancle_btn3");


function activate_name_feild() {
	name_edit_btn.classList.add('none');
    name_setting_form.classList.remove('none');
}

function deactivate_name_feild() {
    name_edit_btn.classList.remove('none');
    name_setting_form.classList.add('none');  
}



function activate_email_feild() {
	email_edit_btn.classList.add('none');
    email_setting_form.classList.remove('none');
}

function deactivate_email_feild() {
    email_edit_btn.classList.remove('none');
    email_setting_form.classList.add('none');  
}



function activate_phone_feild() {
	phone_edit_btn.classList.add('none');
    phone_setting_form.classList.remove('none');
}

function deactivate_phone_feild() {
    phone_edit_btn.classList.remove('none');
    phone_setting_form.classList.add('none');  
}


function init() {
    cancle_btn.addEventListener('click', deactivate_name_feild);
    cancle_btn2.addEventListener('click', deactivate_email_feild);
    cancle_btn3.addEventListener('click', deactivate_phone_feild);
    
    name_edit_btn.addEventListener('click', activate_name_feild);
    email_edit_btn.addEventListener('click', activate_email_feild);
    phone_edit_btn.addEventListener('click', activate_phone_feild);
}

init();