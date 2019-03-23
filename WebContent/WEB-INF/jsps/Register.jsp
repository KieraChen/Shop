<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head lang="en">
		<meta charset="UTF-8">
		<title>注册</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<link rel="stylesheet" href="../AmazeUI-2.4.2/assets/css/amazeui.min.css" />
		<!-- <link href="../css/dlstyle.css" rel="stylesheet" type="text/css"> -->
		<script language='javascript' src='${pageContext.request.contextPath}/js/tool.js'></script>
		<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="../AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
		<script language="javascript">
		$(function(){
			var msg = $("#msg");
			var uname = $("#username");
			var msg1 = $("#msg1");
			var tel = $("#phone");
			uname.blur(function(){ //焦点移开事件
				var timer = new Date().getTime();
				$.ajax({   //ajax调用
					url:"${pageContext.request.contextPath}/user/checkName.do?timer="+timer,
					type:"GET",
					dataType:"text",
					data:{
						username : uname.val(), //传递参数
					},
					success:function(data){
						if(data == "nameExist"){
				        	msg.html("<font color='red'>用户名已被占用</font>");
				        	$("#sb").attr("disabled",true);
				        }else{
				        	msg.html("<font color='blue'>用户名可以使用</font>");
				        	$("#sb").attr("disabled",false);
				        }
				    }
				});
			});
			
            tel.blur(function(){ //焦点移开事件
				var timer = new Date().getTime();
				$.ajax({   //ajax调用
					url:"${pageContext.request.contextPath}/user/checkPhone.do?timer="+timer,
					type:"GET",
					dataType:"text",
					data:{
						phone : tel.val(), //传递参数
					},
					success:function(data){
						if(data == "phoneExist"){
				        	msg1.html("<font color='red'>手机号注册过</font>");
				        	$("#sb").attr("disabled",true);
				        }else{
				        	msg1.html("<font color='blue'>手机号可以使用</font>");
				        	$("#sb").attr("disabled",false);
				        }
				    }
				});
			});
			
					
		});
		</script> 
		<script language="javascript">
		window.onload = function(){
			var img = document.getElementById("img");
			var refresh = document.getElementById("refresh");
			refresh.onclick = function(){
				img.src = "${pageContext.request.contextPath}/user/getCode.do?id="+new Date().getTime();
			};
		}
		</script> 

	</head>

	<body>

		<div class="login-boxtitle">
			<a href="home/demo.html"><img alt="" src="../images/logobig.png" /></a>
		</div>

		<div class="res-banner">
			<div class="res-main">
				<div class="login-banner-bg"><span></span><img src="../images/big.jpg" /></div>
				<div class="login-box">

						<div class="am-tabs" id="doc-my-tabs">
							<ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
								<li class="am-active"><a href="">注册</a></li>
							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-active">
									<form action="${pageContext.request.contextPath}/user/checkRegister.do" method="post" onsubmit="return checkRegister(this);">
					<div class="user-name">
								    <label for="user"><i class="am-icon-user"></i></label>
								    <input type="text" name="username" id="username" placeholder="用户名"><span id="msg"></span>${check.username }
                 </div>
					 <div class="user-phone">
								    <label for="phone"><i class="am-icon-mobile-phone am-icon-md"></i></label>
								    <input type="tel" name="phone" id="phone" placeholder="请输入手机号"><span id="msg1"></span>${check.phone }
                 </div>
										
							   <div class="user-email">
										<label for="email"><i class="am-icon-envelope-o"></i></label>
										<input type="email" name="email" id="email" placeholder="请输入邮箱账号">${check.email }
                 </div>										
                 <div class="user-pass">
								    <label for="password"><i class="am-icon-lock"></i></label>
								    <input type="password" name="password" id="password" placeholder="设置密码">${check.password }
                 </div>										
                 <div class="user-pass">
								    <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
								    <input type="password" name="passwordRepeat" id="passwordRepeat" placeholder="确认密码">${check.passwordRepeat }
                 </div>	
                  <div class="user-pass">
								    <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
								    <input type="text" name="code" id="code" placeholder="请输入验证码"><a id="refresh"><img id="img" src="${pageContext.request.contextPath}/user/getCode.do"></a>${check.code }
                 </div>	
                 
                 
								 
										<div class="am-cf">
											<input type="submit" id="sb" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
										</div>
                                </form>
								</div>

                                
								<script>
									$(function() {
									    $('#doc-my-tabs').tabs();
									  })
								</script>

							</div>
						</div>

				</div>
			</div>
			
					<div class="footer ">
						<div class="footer-hd ">
							<p>
								<a href="# ">恒望科技</a>
								<b>|</b>
								<a href="# ">商城首页</a>
								<b>|</b>
								<a href="# ">支付宝</a>
								<b>|</b>
								<a href="# ">物流</a>
							</p>
						</div>
						<div class="footer-bd ">
							<p>
								<a href="# ">关于恒望</a>
								<a href="# ">合作伙伴</a>
								<a href="# ">联系我们</a>
								<a href="# ">网站地图</a>
								<em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></em>
							</p>
						</div>
					</div>
	</body>

</html>