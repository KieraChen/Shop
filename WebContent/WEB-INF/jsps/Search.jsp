<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>搜索页面</title>

		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />

		<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />

		<link href="../css/seastyle.css" rel="stylesheet" type="text/css" />
		
		<link href="../css/hmstyle.css" rel="stylesheet" type="text/css"/>
		<link href="../css/skin.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="../basic/js/jquery-1.7.min.js"></script>
		<script type="text/javascript" src="../js/script.js"></script>
    	<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="../AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
		<script language='javascript' src='${pageContext.request.contextPath}/js/tool.js'></script>
	</head>

	<body>
	<div class="hmtop">
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
			</div>
			<div class="banner">
                      <!--轮播 -->
						<div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
							<ul class="am-slides">
								<li class="banner1"><a href="introduction.html"><img src="../images/ad1.jpg" /></a></li>
								<li class="banner2"><a><img src="../images/ad2.jpg" /></a></li>
								<li class="banner3"><a><img src="../images/ad3.jpg" /></a></li>
								<li class="banner4"><a><img src="../images/ad4.jpg" /></a></li>

							</ul>
						</div>
						<div class="clear"></div>	
			</div>
			<div class="shopNav">
				<div class="slideall">
					
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
					   <div class="nav-cont">
							<ul>
								<li class="index"><a href="${pageContext.request.contextPath }/product/Index.do">首页</a></li>
                                <li class="qc"><a href="${pageContext.request.contextPath }/product/List.do">商品列表页</a></li>
                                <li class="qc last"><a href="${pageContext.request.contextPath }/product/List.do?csid=${pfp.productForSearch.csid}">
                                <c:forEach items="${cs}" var="catecorysecond">
									<c:forEach items="${catecorysecond}" var="cs2">
										<c:if test="${cs2.csId == pfp.productForSearch.csid }">
										    ${cs2.csName }
										</c:if>
									</c:forEach>
								</c:forEach>
                                </a></li>
                                
							</ul>
						    
						</div>					
		        				
						<!--侧边导航 -->
						<div id="nav" class="navfull">
							<div class="area clearfix">
								<div class="category-content" id="guide_2">
									
									<div class="category">
										<ul class="category-list" id="js_climit_li">
											<li class="appliance js_toggle relative first">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="../images/cake.png"></i><a class="ml-22" title="点心">${category[0].cName}</a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort">
																		<dt><span>${category[0].cName}</span></dt>
															<c:forEach items="${cs[0]}" var="catecorysecond">
															<dd><a  href="${pageContext.request.contextPath }/product/List.do?csid=${catecorysecond.csId }"><span>
																 ${catecorysecond.csName}  
															</span></a></dd>
															</c:forEach>
															
																	</dl>
																	

																</div>
																
															</div>
														</div>
													</div>
												</div>
											<b class="arrow"></b>	
											</li>
											<li class="appliance js_toggle relative">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="../images/cookies.png"></i><a class="ml-22" title="饼干、膨化">${category[1].cName}</a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort">
																		<dt><span >${category[1].cName}</span></dt>
																		<c:forEach items="${cs[1]}" var="catecorysecond">
															                <dd><a  href="${pageContext.request.contextPath }/product/List.do?csid=${catecorysecond.csId }"><span>
																            ${catecorysecond.csName}  
																			</span></a></dd>
																		</c:forEach>
																	</dl>
																	
																
																</div>
																
															</div>
														</div>
													</div>
												</div>
                                             <b class="arrow"></b>
											</li>
											<li class="appliance js_toggle relative">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="../images/meat.png"></i><a class="ml-22" title="熟食、肉类">${category[2].cName}</a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort">
																		<dt><span >${category[2].cName}</span></dt>
																		<c:forEach items="${cs[2]}" var="catecorysecond">
															                <dd><a  href="${pageContext.request.contextPath }/product/List.do?csid=${catecorysecond.csId }"><span>
																            ${catecorysecond.csName}  
																			</span></a></dd>
																		</c:forEach>
																	</dl>
																	
																</div>
																
															</div>
														</div>
													</div>
												</div>
                                            <b class="arrow"></b>
											</li>
											<li class="appliance js_toggle relative">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="../images/bamboo.png"></i><a class="ml-22" title="素食、卤味">${category[3].cName}</a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort">
																		<dt><span >${category[3].cName}</span></dt>
																		<c:forEach items="${cs[3]}" var="catecorysecond">
															                <dd><a  href="${pageContext.request.contextPath }/product/List.do?csid=${catecorysecond.csId }"><span>
																            ${catecorysecond.csName}  
																			</span></a></dd>
																		</c:forEach>
																	</dl>
																	
																</div>
																
															</div>
														</div>
													</div>
												</div>
                                             <b class="arrow"></b>
											</li>
											<li class="appliance js_toggle relative">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="../images/nut.png"></i><a class="ml-22" title="坚果、炒货">${category[4].cName}</a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort">
																		<dt><span >${category[4].cName}</span></dt>
																		<c:forEach items="${cs[4]}" var="catecorysecond">
															                <dd><a  href="${pageContext.request.contextPath }/product/List.do?csid=${catecorysecond.csId }"><span>
																            ${catecorysecond.csName}  
																			</span></a></dd>
																		</c:forEach>
																	</dl>
																	
																</div>
																
															</div>
														</div>
													</div>
												</div>
												<b class="arrow"></b>
											</li>
											<li class="appliance js_toggle relative">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="../images/candy.png"></i><a class="ml-22" title="糖果、蜜饯">${category[5].cName}</a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort">
																		<dt><span >${category[5].cName}</span></dt>
																		<c:forEach items="${cs[5]}" var="catecorysecond">
															                <dd><a  href="${pageContext.request.contextPath }/product/List.do?csid=${catecorysecond.csId }"><span>
																            ${catecorysecond.csName}  
																			</span></a></dd>
																		</c:forEach>
																	</dl>
																	
																</div>
																
															</div>
														</div>
													</div>
												</div>
                                            <b class="arrow"></b>
											</li>
											<li class="appliance js_toggle relative">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="../images/chocolate.png"></i><a class="ml-22" title="巧克力">${category[6].cName}</a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort">
																		<dt><span >${category[6].cName}</span></dt>
																		<c:forEach items="${cs[6]}" var="catecorysecond">
															                <dd><a  href="${pageContext.request.contextPath }/product/List.do?csid=${catecorysecond.csId }"><span>
																            ${catecorysecond.csName}  
																			</span></a></dd>
																		</c:forEach>
																	</dl>
																
																</div>
																
															</div>
														</div>
													</div>
												</div>
												<b class="arrow"></b>
											</li>
											<li class="appliance js_toggle relative">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="../images/fish.png"></i><a class="ml-22" title="海味、河鲜">${category[7].cName}</a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort">
																		<dt><span >${category[7].cName}</span></dt>
																		<c:forEach items="${cs[7]}" var="catecorysecond">
															                <dd><a  href="${pageContext.request.contextPath }/product/List.do?csid=${catecorysecond.csId }"><span>
																            ${catecorysecond.csName}  
																			</span></a></dd>
																		</c:forEach>
																	</dl>
																	
																</div>
																
															</div>
														</div>
													</div>
												</div>
                                             <b class="arrow"></b>
											</li>
											<li class="appliance js_toggle relative">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="../images/tea.png"></i><a class="ml-22" title="花茶、果茶">${category[8].cName}</a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort">
																		<dt><span >${category[8].cName}</span></dt>
																		<c:forEach items="${cs[8]}" var="catecorysecond">
															                <dd><a  href="${pageContext.request.contextPath }/product/List.do?csid=${catecorysecond.csId }"><span>
																            ${catecorysecond.csName}  
																			</span></a></dd>
																		</c:forEach>
																	</dl>
																	
																</div>
																
															</div>
														</div>
													</div>
												</div>
												<b class="arrow"></b>
											</li>
											<li class="appliance js_toggle relative last">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="../images/package.png"></i><a class="ml-22" title="品牌、礼包">${category[9].cName}</a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort">
																		<dt><span >${category[9].cName}</span></dt>
																		<c:forEach items="${cs[9]}" var="catecorysecond">
															                <dd><a  href="${pageContext.request.contextPath }/product/List.do?csid=${catecorysecond.csId }"><span>
																            ${catecorysecond.csName}  
																			</span></a></dd>
																		</c:forEach>
																	</dl>
																	
																</div>
																
															</div>
														</div>
													</div>
												</div>

											</li>
										</ul>
									</div>
								</div>

							</div>
						</div>
						
						
						<!--轮播-->
						
						<script type="text/javascript">
							(function() {
								$('.am-slider').flexslider();
							});
							$(document).ready(function() {
								$("li").hover(function() {
									$(".category-content .category-list li.first .menu-in").css("display", "none");
									$(".category-content .category-list li.first").removeClass("hover");
									$(this).addClass("hover");
									$(this).children("div.menu-in").css("display", "block")
								}, function() {
									$(this).removeClass("hover")
									$(this).children("div.menu-in").css("display", "none")
								});
							})
						</script>
				
					<div class="clear"></div>
				</div>
				<script type="text/javascript">
					if ($(window).width() < 640) {
						function autoScroll(obj) {
							$(obj).find("ul").animate({
								marginTop: "-39px"
							}, 500, function() {
								$(this).css({
									marginTop: "0px"
								}).find("li:first").appendTo(this);
							})
						}
						$(function() {
							setInterval('autoScroll(".demo")', 3000);
						})
					}
				</script>
			</div>
	
	
	
	
	
	
	
	
	
					<div class="am-g am-g-fixed">
						<div class="am-u-sm-12 am-u-md-12">
	                  	
							<div class="search-content">
								<div class="sort">
									<li class="first"><a title="综合" href="${pageContext.request.contextPath}/product/List.do?csid=${pfp.productForSearch.csid}&pname=${pfp.productForSearch.pname}">综合排序</a></li>
									<li><a title="热门" href="${pageContext.request.contextPath}/product/List.do?csid=${pfp.productForSearch.csid}&pname=${pfp.productForSearch.pname}&sort=1">热门排序</a></li>
									<li><a title="价格" href="${pageContext.request.contextPath}/product/List.do?csid=${pfp.productForSearch.csid}&pname=${pfp.productForSearch.pname}&sort=2">价格优先</a></li>
									<li class="big"><a title="最新" href="${pageContext.request.contextPath}/product/List.do?csid=${pfp.productForSearch.csid}&pname=${pfp.productForSearch.pname}&sort=3">最新商品</a></li>
								</div>
								<div class="clear"></div>
								
                                <!-- 商品列表 -->
								<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
								<c:forEach items="${pfp.list}" var="product">
					                <li>
										<div class="i-pic limit">
											<img src="../${product.image }" />											
											<a href="${pageContext.request.contextPath }/product/Detail.do?pid=${product.pId}&csid=${pfp.productForSearch.csid}&pname=${pfp.productForSearch.pname}&sort=${pfp.productForSearch.sort}"><p class="title fl">${product.pName }</p></a>
											<p class="price fl">
												<b>¥</b>
												<strong>${product.shopPrice }</strong>
											</p>
											<p class="number fl">
												<span></span>
											</p>
										</div>
									</li>
								</c:forEach>
									
									
								</ul>
							</div>
							
							
							
							
							
							
							
							<div class="search-side">

								<div class="side-title">
									经典搭配
								</div>

								<li>
									<div class="i-pic check">
										<img src="../images/cp.jpg" />
										<p class="check-title">萨拉米 1+1小鸡腿</p>
										<p class="price fl">
											<b>¥</b>
											<strong>29.90</strong>
										</p>
										<p class="number fl">
											销量<span>1110</span>
										</p>
									</div>
								</li>
								<li>
									<div class="i-pic check">
										<img src="../images/cp2.jpg" />
										<p class="check-title">ZEK 原味海苔</p>
										<p class="price fl">
											<b>¥</b>
											<strong>8.90</strong>
										</p>
										<p class="number fl">
											销量<span>1110</span>
										</p>
									</div>
								</li>
								<li>
									<div class="i-pic check">
										<img src="../images/cp.jpg" />
										<p class="check-title">萨拉米 1+1小鸡腿</p>
										<p class="price fl">
											<b>¥</b>
											<strong>29.90</strong>
										</p>
										<p class="number fl">
											销量<span>1110</span>
										</p>
									</div>
								</li>

							</div>
							<div class="clear"></div>
							<!--分页 -->
							<ul class="am-pagination am-pagination-right">
							    <li>${pfp.pageNow }/${pfp.pageCount }</li>
							    <li>总记录数：${pfp.rowCount }</li>
								<c:if test="${pfp.pageNow > 1 }">
									<li><a href="${pageContext.request.contextPath }/product/List.do?pageNow=1&csid=${pfp.productForSearch.csid}&pname=${pfp.productForSearch.pname}&sort=${pfp.productForSearch.sort}">首页</a></li>
									<li><a href="${pageContext.request.contextPath }/product/List.do?pageNow=${(pfp.pageNow-1)}&csid=${pfp.productForSearch.csid}&pname=${pfp.productForSearch.pname}&sort=${pfp.productForSearch.sort}">&laquo;</a></li>
								</c:if>
								
								  <%--页数 --%>
							    <c:if test="${pfp.pageCount > 5}">
								    <c:set var="aa" value="0"></c:set>
								    <c:if test="${pfp.pageNow < 3}">
								      <c:set var="aa" value="3"></c:set>
								    </c:if>
								    <c:if test="${(pfp.pageNow+2) > pfp.pageCount}">
								      <c:set var="aa" value="${pfp.pageCount-2}"></c:set>
								    </c:if>
								    <c:if test="${pfp.pageNow >= 3 && (pfp.pageNow+2) <= pfp.pageCount}">
								      <c:set var="aa" value="${pfp.pageNow}"></c:set>
								    </c:if>
							    
								    <c:forEach begin="${aa-2 }" end="${aa+2 }" step="1" var="i">
								        <li><a href="${pageContext.request.contextPath }/product/List.do?pageNow=${i }&csid=${pfp.productForSearch.csid}&pname=${pfp.productForSearch.pname}&sort=${pfp.productForSearch.sort}">${i }</a></li>
								    </c:forEach>
							    </c:if>
							  
							    <c:if test="${pfp.pageCount <= 5}">
							      <c:forEach begin="1" end="${pfp.pageCount}" step="1" var="i">
							          <li><a href="${pageContext.request.contextPath }/product/List.do?pageNow=${i }&csid=${pfp.productForSearch.csid}&pname=${pfp.productForSearch.pname}&sort=${pfp.productForSearch.sort}">${i }</a></li>
							      </c:forEach>
							    </c:if>
								
								<c:if test="${pfp.pageNow < pfp.pageCount }">
							        <li><a href="${pageContext.request.contextPath }/product/List.do?pageNow=${(pfp.pageNow+1)}&csid=${pfp.productForSearch.csid}&pname=${pfp.productForSearch.pname}&sort=${pfp.productForSearch.sort}">&raquo;</a></li>
							        <li><a href="${pageContext.request.contextPath }/product/List.do?pageNow=${pfp.pageCount}&csid=${pfp.productForSearch.csid}&pname=${pfp.productForSearch.pname}&sort=${pfp.productForSearch.sort}">尾页</a></li>
							    </c:if>
							    
							</ul>

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
			<li><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li><a href="../person/index.html"><i class="am-icon-user"></i>我的</a></li>					
		</div>

		<!--菜单 -->
		<div class=tip>
			<div id="sidebar">
				<div id="wrap">
					<div id="prof" class="item">
						<a href="#">
							<span class="setting"></span>
						</a>
						<div class="ibar_login_box status_login">
							<div class="avatar_box">
								<p class="avatar_imgbox"><img src="../images/no-img_mid_.jpg" /></p>
								<ul class="user_info">
									<li>用户名：sl1903</li>
									<li>级&nbsp;别：普通会员</li>
								</ul>
							</div>
							<div class="login_btnbox">
								<a href="#" class="login_order">我的订单</a>
								<a href="#" class="login_favorite">我的收藏</a>
							</div>
							<i class="icon_arrow_white"></i>
						</div>

					</div>
					<div id="shopCart" class="item">
						<a href="#">
							<span class="message"></span>
						</a>
						<p>
							购物车
						</p>
						<p class="cart_num">0</p>
					</div>
					<div id="asset" class="item">
						<a href="#">
							<span class="view"></span>
						</a>
						<div class="mp_tooltip">
							我的资产
							<i class="icon_arrow_right_black"></i>
						</div>
					</div>

					<div id="foot" class="item">
						<a href="#">
							<span class="zuji"></span>
						</a>
						<div class="mp_tooltip">
							我的足迹
							<i class="icon_arrow_right_black"></i>
						</div>
					</div>

					<div id="brand" class="item">
						<a href="#">
							<span class="wdsc"><img src="../images/wdsc.png" /></span>
						</a>
						<div class="mp_tooltip">
							我的收藏
							<i class="icon_arrow_right_black"></i>
						</div>
					</div>

					<div id="broadcast" class="item">
						<a href="#">
							<span class="chongzhi"><img src="../images/chongzhi.png" /></span>
						</a>
						<div class="mp_tooltip">
							我要充值
							<i class="icon_arrow_right_black"></i>
						</div>
					</div>

					<div class="quick_toggle">
						<li class="qtitem">
							<a href="#"><span class="kfzx"></span></a>
							<div class="mp_tooltip">客服中心<i class="icon_arrow_right_black"></i></div>
						</li>
						<!--二维码 -->
						<li class="qtitem">
							<a href="#none"><span class="mpbtn_qrcode"></span></a>
							<div class="mp_qrcode" style="display:none;"><img src="../images/weixin_code_145.png" /><i class="icon_arrow_white"></i></div>
						</li>
						<li class="qtitem">
							<a href="#top" class="return_top"><span class="top"></span></a>
						</li>
					</div>

					<!--回到顶部 -->
					<div id="quick_links_pop" class="quick_links_pop hide"></div>

				</div>

			</div>
			<div id="prof-content" class="nav-content">
				<div class="nav-con-close">
					<i class="am-icon-angle-right am-icon-fw"></i>
				</div>
				<div>
					我
				</div>
			</div>
			<div id="shopCart-content" class="nav-content">
				<div class="nav-con-close">
					<i class="am-icon-angle-right am-icon-fw"></i>
				</div>
				<div>
					购物车
				</div>
			</div>
			<div id="asset-content" class="nav-content">
				<div class="nav-con-close">
					<i class="am-icon-angle-right am-icon-fw"></i>
				</div>
				<div>
					资产
				</div>

				<div class="ia-head-list">
					<a href="#" target="_blank" class="pl">
						<div class="num">0</div>
						<div class="text">优惠券</div>
					</a>
					<a href="#" target="_blank" class="pl">
						<div class="num">0</div>
						<div class="text">红包</div>
					</a>
					<a href="#" target="_blank" class="pl money">
						<div class="num">￥0</div>
						<div class="text">余额</div>
					</a>
				</div>

			</div>
			<div id="foot-content" class="nav-content">
				<div class="nav-con-close">
					<i class="am-icon-angle-right am-icon-fw"></i>
				</div>
				<div>
					足迹
				</div>
			</div>
			<div id="brand-content" class="nav-content">
				<div class="nav-con-close">
					<i class="am-icon-angle-right am-icon-fw"></i>
				</div>
				<div>
					收藏
				</div>
			</div>
			<div id="broadcast-content" class="nav-content">
				<div class="nav-con-close">
					<i class="am-icon-angle-right am-icon-fw"></i>
				</div>
				<div>
					充值
				</div>
			</div>
		</div>
		<script>
			window.jQuery || document.write('<script src="basic/js/jquery-1.9.min.js"><\/script>');
		</script>
		<script type="text/javascript" src="../basic/js/quick_links.js"></script>

<div class="theme-popover-mask"></div>

	</body>

</html>