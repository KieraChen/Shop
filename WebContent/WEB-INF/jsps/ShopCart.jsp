<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>购物车页面</title>

		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="../css/cartstyle.css" rel="stylesheet" type="text/css" />
		<link href="../css/optstyle.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="../js/jquery.js"></script>
		<script language='javascript' src='${pageContext.request.contextPath}/js/tool.js'></script>

	</head>

	<body>

		<!--顶部导航条 -->
		<div class="am-container header">
			<ul class="message-l">
					<div class="topMessage">
						<div class="menu-hd">
							<c:if test="${empty sessionScope.user}">
								<a href="${pageContext.request.contextPath}/user/Login.do" target="_top" class="h">亲，请登录</a>
								<a href="${pageContext.request.contextPath}/user/Register.do" target="_top">免费注册</a>
							</c:if>
							<c:if test="${!empty sessionScope.user}">
								 欢迎您，用户${sessionScope.user.username }
							</c:if>
						</div>
					</div>
				</ul>
			<ul class="message-r">
					<div class="topMessage home">
						<div class="menu-hd"></div>
					</div>
					<div class="topMessage my-shangcheng">
						<div class="menu-hd MyShangcheng"><a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
					</div>
					<div class="topMessage mini-cart">
						<div class="menu-hd"><a id="mc-menu-hd" href="${pageContext.request.contextPath}/product/ShopCart.do" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span></a></div>
					</div>
					<div class="topMessage favorite">
						<div class="menu-hd"><a href="${pageContext.request.contextPath}/user/exit.do" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>安全退出</span></a></div>
				</ul>
			</div>

			<!--悬浮搜索框-->

			<div class="nav white">
					<div class="logo"><img src="../images/logo.png" /></div>
					<div class="logoBig">
						<li><img src="../images/logobig.png" /></li>
					</div>

					<div class="search-bar pr">
						<a name="index_none_header_sysc" href="#"></a>
						<form action="${pageContext.request.contextPath}/product/List.do" method="post" onsubmit="return checkSearch(this);">
							<input id="searchInput" name="pname" type="text" placeholder="搜索" autocomplete="off" value="${pfp.productForSearch.pname  }">
							<input name="csid" value="${pfp.productForSearch.csid }"  type="hidden">
							<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
						</form>
					</div>
				</div>

			<div class="clear"></div>

			<!--购物车 -->
			<div class="concent">
				<div id="cartTable">
					<div class="cart-table-th">
						<div class="wp">
							<div class="th th-chk">
								<div id="J_SelectAll1" class="select-all J_SelectAll">

								</div>
							</div>
							<div class="th th-item">
								<div class="td-inner">商品信息</div>
							</div>
							<div class="th th-price">
								<div class="td-inner">单价</div>
							</div>
							<div class="th th-amount">
								<div class="td-inner">数量</div>
							</div>
							<div class="th th-sum">
								<div class="td-inner">小计</div>
							</div>
							<div class="th th-op">
								<div class="td-inner">操作</div>
							</div>
						</div>
					</div>
					<div class="clear"></div>

					<tr class="item-list">
						<div class="bundle  bundle-last ">
							<!-- <div class="bundle-hd">
								<div class="bd-promos">
									<div class="bd-has-promo">已享优惠:<span class="bd-has-promo-content">省￥19.50</span>&nbsp;&nbsp;</div>
									<div class="act-promo">
										<a href="#" target="_blank">第二支半价，第三支免费<span class="gt">&gt;&gt;</span></a>
									</div>
									<span class="list-change theme-login">编辑</span>
								</div>
							</div>
							<div class="clear"></div> -->
							<div class="bundle-main">
							
							<c:forEach items="${sessionScope.cart.cartItems }" var="cartItem">
							 <form  name="form" id="form" method="post">
								<ul class="item-content clearfix">
									<li class="td td-chk">
										<div class="cart-checkbox ">
											<!-- <input class="check" id="J_CheckBox_170037950254" name="items[]" value="170037950254" type="checkbox"> -->
											<label for="J_CheckBox_170037950254"></label>
										</div>
									</li>
									<li class="td td-item">
										<div class="item-pic">
											<a href="${pageContext.request.contextPath }/product/Detail.do?pid=${cartItem.key}" target="_blank" data-title="${cartItem.value.product.pName}" class="J_MakePoint" data-point="tbcart.8.12">
												<img src="../${cartItem.value.product.image}" class="itempic J_ItemImg" style="width:80px;height:80px;"></a>
										</div>
										<div class="item-info">
											<div class="item-basic-info">
												<a href="${pageContext.request.contextPath }/product/Detail.do?pid=${cartItem.key}" target="_blank" title="${cartItem.value.product.pName} " class="item-title J_MakePoint" data-point="tbcart.8.11">${cartItem.value.product.pName}</a>
											</div>
										</div>
									</li>
									<li class="td td-info">
										<div class="item-props item-props-can">
											<span class="sku-line">颜色：12#川南玛瑙</span>
											<span class="sku-line">包装：裸装</span>
											<!-- <span tabindex="0" class="btn-edit-sku theme-login">修改</span>
											<i class="theme-login am-icon-sort-desc"></i> -->
										</div>
									</li>
									<li class="td td-price">
										<div class="item-price price-promo-promo">
											<div class="price-content">
												<div class="price-line">
													<em class="price-original">${cartItem.value.product.marketPrice}</em>
												</div>
												<div class="price-line">
													<em class="J_Price price-now" tabindex="0">${cartItem.value.product.shopPrice}</em>
												</div>
											</div>
										</div>
									</li>
									<li class="td td-amount">
										<div class="amount-wrapper ">
											<div class="item-amount ">
												<div class="sl">
													
													<input class="text_box" name="count" type="number" value="" min="1" style="width:30px;" />
													
												</div>
											</div>
										</div>
									</li>
									<li class="td td-sum">
										<div class="td-inner">
											<em tabindex="0" class="J_ItemSum number">${cartItem.value.subTotal}</em>
										</div>
									</li>
									<li class="td td-op">
										<div class="td-inner">
										<input type="button" class="btn-fav" value="编辑" onclick="editShopCart()"/>
										<input type="button" class="btn-fav" value="删除" onclick="deleteShopCart()"/>
											<%-- <a title="编辑" class="btn-fav" href="${pageContext.request.contextPath}/product/editShopCart.do">
                  编辑</a>
											<a title="删除" href="#" class="delete">
                  删除</a> --%>
										</div>
									</li>
								</ul>
								</form>
							</c:forEach>	
		
								
							</div>
						</div>
					</tr>
					<div class="clear"></div>

				

				<div class="float-bar-wrapper">
					<div id="J_SelectAll2" class="select-all J_SelectAll">
						<div class="cart-checkbox">
							<!-- <input class="check-all check" id="J_SelectAllCbx2" name="select-all" value="true" type="checkbox"> -->
							<label for="J_SelectAllCbx2"></label>
						</div>
						<span></span>
					</div>
					<div class="operations">
						<a href="${pageContext.request.contextPath }/product/clearShopCart.do" hidefocus="true" class="deleteAll">清空购物车</a>
						
					</div>
					<div class="float-bar-right">
						<div class="amount-sum">
							<span class="txt"></span>
							<em id="J_SelectedItemsCount"></em><span class="txt"></span>
							<div class="arrow-box">
								<span class="selected-items-arrow"></span>
								<span class="arrow"></span>
							</div>
						</div>
						<div class="price-sum">
							<span class="txt">合计:</span>
							<strong class="price">¥<em id="J_Total">${sessionScope.cart.total}</em></strong>
						</div>
						<div class="btn-area">
							<input type="button" id="J_Go"  value="结算" onclick="goOrder(this)"/>
							<!-- <a href="pay.html" id="J_Go" class="submit-btn submit-btn-disabled" aria-label="请注意如果没有选择宝贝，将无法结算"> -->
								<span>结&nbsp;算</span></a>
						</div>
					</div>

				</div>

				<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="#">恒望科技</a>
							<b>|</b>
							<a href="#">商城首页</a>
							<b>|</b>
							<a href="#">支付宝</a>
							<b>|</b>
							<a href="#">物流</a>
						</p>
					</div>
					<div class="footer-bd">
						<p>
							<a href="#">关于恒望</a>
							<a href="#">合作伙伴</a>
							<a href="#">联系我们</a>
							<a href="#">网站地图</a>
							<em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></em>
						</p>
					</div>
				</div>

			</div>

			
		<!--引导 -->
		<div class="navCir">
			<li><a href="home.html"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
			<li class="active"><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li><a href="../person/index.html"><i class="am-icon-user"></i>我的</a></li>					
		</div>
	</body>

</html>