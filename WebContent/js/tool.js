/**
 * 
 */
//加入购物车
function goShopCart(){
	var form = document.getElementById("form");
	form.action="addShopCart.do";
	form.submit();
}

//检查登录非空
function checkSearch(theform){
	if(theform.pname.value.length==0){
		alert('搜索内容不能为空！');
		theform.pname.focus();
		return false;
	}
	return true;
}
//检查登录
function checkLogin(theform){
	if(theform.username.value.length==0){
		alert('用户名不能为空！');
		theform.username.focus();
		return false;
	}
	if(theform.password.value.length==0){
		alert('密码不能为空！');
		theform.password.focus();
		return false;
	}
	return true;
}

//检查注册
function checkRegister(theform){
	if(theform.username.value.length==0){
		alert('用户名不能为空！');
		theform.username.focus();
		return false;
	}
	if(theform.password.value.length==0){
		alert('密码不能为空！');
		theform.password.focus();
		return false;
	}else{
		if(theform.password.value != theform.passwordRepeat.value){
			alert('两次密码不同！');
			theform.passwordRepeat.focus();
			return false;
		}
	}
	var myreg=/(^1[3|4|5|7|8]\d{9}$)|(^09\d{8}$)/; 
	if(theform.phone.value.length==0){
		alert('手机号不能为空！');
		theform.phone.focus();
		return false;
	}else if (!myreg.test(theform.phone.value)) { 
		alert('手机号格式错误！');
		theform.phone.focus();
		return false;
	}
	var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");
	if(theform.email.value.length==0){
		alert('邮箱不能为空！');
		theform.email.focus();
		return false;
	}else if(!reg.test(theform.email.value)){
		alert('邮箱格式错误！');
		theform.email.focus();
		return false;
	}
	
	return true;
	
}