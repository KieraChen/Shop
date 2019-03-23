<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>首页</title>

		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />

		<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />

		<link href="../css/hmstyle.css" rel="stylesheet" type="text/css"/>
		<link href="../css/skin.css" rel="stylesheet" type="text/css" />
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
						<div class="menu-hd"><a href="#" target="_top" class="h">商城首页</a></div>
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
								<li class="index"><a href="#">首页</a></li>
                                <li class="qc last"><a href="#">商品列表页</a></li>
                                
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
																		<dt><span >${category[0].cName}</span></dt>
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



					<!--小导航 -->
					<div class="am-g am-g-fixed smallnav">
						<div class="am-u-sm-3">
							<a href="sort.html"><img src="../images/navsmall.jpg" />
								<div class="title">商品分类</div>
							</a>
						</div>
						<div class="am-u-sm-3">
							<a href="#"><img src="../images/huismall.jpg" />
								<div class="title">大聚惠</div>
							</a>
						</div>
						<div class="am-u-sm-3">
							<a href="#"><img src="../images/mansmall.jpg" />
								<div class="title">个人中心</div>
							</a>
						</div>
						<div class="am-u-sm-3">
							<a href="#"><img src="../images/moneysmall.jpg" />
								<div class="title">投资理财</div>
							</a>
						</div>
					</div>

					<!--走马灯 -->

					<div class="marqueen">
						<span class="marqueen-title">商城头条</span>
						<div class="demo">

							<ul>
								<li class="title-first"><a target="_blank" href="#">
									<img src="../images/TJ2.jpg"></img>
									<span>[特惠]</span>商城爆品1分秒								
								</a></li>
								<li class="title-first"><a target="_blank" href="#">
									<span>[公告]</span>商城与广州市签署战略合作协议
								     <img src="../images/TJ.jpg"></img>
								     <p>XXXXXXXXXXXXXXXXXX</p>
							    </a></li>
							    
						<div class="mod-vip">
							<div class="m-baseinfo">
								<a href="../person/index.html">
									<img src="../images/getAvatar.do.jpg">
								</a>
								<em>
									Hi,<span class="s-name">小叮当</span>
									<a href="#"><p>点击更多优惠活动</p></a>									
								</em>
							</div>
							<div class="member-logout">
								<a class="am-btn-warning btn" href="${pageContext.request.contextPath}/user/Login.do">登录</a>
								<a class="am-btn-warning btn" href="${pageContext.request.contextPath}/user/Register.do">注册</a>
							</div>
							<div class="member-login">
								<a href="#"><strong>0</strong>待收货</a>
								<a href="#"><strong>0</strong>待发货</a>
								<a href="#"><strong>0</strong>待付款</a>
								<a href="#"><strong>0</strong>待评价</a>
							</div>
							<div class="clear"></div>	
						</div>																	    
							    
								<li><a target="_blank" href="#"><span>[特惠]</span>洋河年末大促，低至两件五折</a></li>
								<li><a target="_blank" href="#"><span>[公告]</span>华北、华中部分地区配送延迟</a></li>
								<li><a target="_blank" href="#"><span>[特惠]</span>家电狂欢千亿礼券 买1送1！</a></li>
								
							</ul>
                        <div class="advTip"><img src="../images/advTip.jpg"/></div>
						</div>
					</div>
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
			<div class="shopMainbg">
				<div class="shopMain" id="shopmain">

					<!--今日推荐 -->

					<div class="am-g am-g-fixed recommendation">
						<div class="clock am-u-sm-3" ">
							<img src="../images/2016.png "></img>
							<p>今日<br>推荐</p>
						</div>
						<div class="am-u-sm-4 am-u-lg-3 ">
							<div class="info ">
								<h3>真的有鱼</h3>
								<h4>开年福利篇</h4>
							</div>
							<div class="recommendationMain one">
								<img src="../images/tj.png "></img>
							</div>
						</div>						
						<div class="am-u-sm-4 am-u-lg-3 ">
							<div class="info ">
								<h3>囤货过冬</h3>
								<h4>让爱早回家</h4>
							</div>
							<div class="recommendationMain two">
								<img src="../images/tj1.png "></img>
							</div>
						</div>
						<div class="am-u-sm-4 am-u-lg-3 ">
							<div class="info ">
								<h3>浪漫情人节</h3>
								<h4>甜甜蜜蜜</h4>
							</div>
							<div class="recommendationMain three">
								<img src="../images/tj2.png "></img>
							</div>
						</div>

					</div>
					<div class="clear "></div>
					<!--热门活动 -->

					<div class="am-container activity ">
						<div class="shopTitle ">
							<h4>活动</h4>
							<h3>每期活动 优惠享不停 </h3>
							<span class="more ">
                              <a href="# ">全部活动<i class="am-icon-angle-right" style="padding-left:10px ;" ></i></a>
                        </span>
						</div>
					  <div class="am-g am-g-fixed ">
						<div class="am-u-sm-3 ">
							<div class="icon-sale one "></div>	
								<h4>最新</h4>							
							<div class="activityMain ">
								<img src="../images/activity1.jpg "></img>
							</div>
							<div class="info ">
								<h3>过节送礼优选</h3>
							</div>														
						</div>
						
						<div class="am-u-sm-3 ">
						  <div class="icon-sale two "></div>	
							<h4>特惠</h4>
							<div class="activityMain ">
								<img src="../images/activity2.jpg "></img>
							</div>
							<div class="info ">
								<h3>过节送礼优选</h3>								
							</div>							
						</div>						
						
						<div class="am-u-sm-3 ">
							<div class="icon-sale three "></div>
							<h4>综合</h4>
							<div class="activityMain ">
								<img src="../images/activity3.jpg "></img>
							</div>
							<div class="info ">
								<h3>过节送礼优选</h3>
							</div>							
						</div>						

						<div class="am-u-sm-3 last ">
							<div class="icon-sale "></div>
							<h4>热门</h4>
							<div class="activityMain ">
								<img src="../images/activity.jpg "></img>
							</div>
							<div class="info ">
								<h3>过节送礼优选</h3>
							</div>													
						</div>

					  </div>
                   </div>
					<div class="clear "></div>


                    <div id="f1">
					<!--甜点-->
					
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>${category[0].cName}</h4>
							<h3>随便写。。。。。。。。。</h3>
							<div class="today-brands ">
								<c:forEach items="${cs[0]}" var="catecorysecond">
					                <a title="蒸蛋糕" href="#?id=${catecorysecond.csId }">
						            ${catecorysecond.csName}  
									</a>
								</c:forEach>
							</div>
							<span class="more ">
                    <a href="# ">更多美味<i class="am-icon-angle-right" style="padding-left:10px ;" ></i></a>
                        </span>
						</div>
					</div>
					
					<div class="am-g am-g-fixed floodFour">
						<div class="am-u-sm-5 am-u-md-4 text-one list ">
							<!-- <div class="word">
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>	
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>									
							</div> -->
							<a href="# ">
								<div class="outer-con ">
									<div class="title ">
									随便写
									</div>
									<div class="sub-title ">
										随便写。。。
									</div>									
								</div>
                                  <img src="../images/act1.png " />								
							</a>
							<div class="triangle-topright"></div>						
						</div>
						
					         <c:set var="i" value="${0 }"></c:set>
						<c:forEach items="${product[0]}" var="pro">
							
							<c:choose>
								<c:when test="${i==0 }">
								<div class="am-u-sm-7 am-u-md-4 text-two sug">
								</c:when>
								<c:when test="${i==1 }">
								<div class="am-u-sm-7 am-u-md-4 text-two">
								</c:when>
								<c:when test="${i==2 }">
								<div class="am-u-sm-3 am-u-md-2 text-three big">
								</c:when>
								<c:when test="${i==3 }">
								<div class="am-u-sm-3 am-u-md-2 text-three sug">
								</c:when>
								<c:when test="${i==4 }">
								<div class="am-u-sm-3 am-u-md-2 text-three ">
								</c:when>
								<c:otherwise>
								<div class="am-u-sm-3 am-u-md-2 text-three last big ">
								</c:otherwise>	
							</c:choose>
							<c:set var="i" value="${i+1}"></c:set>
							<!-- <div class="am-u-sm-7 am-u-md-4 text-two sug"> -->
								<div class="outer-con ">
									<div class="title ">
										${pro.pName }
									</div>									
									<div class="sub-title ">
										${pro.shopPrice }
									</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div>
								<a href="# "><img src="../${pro.image}" /></a>
							</div>
						</c:forEach>

							
					</div>
                 <div class="clear "></div>  
                 </div>
                 
  
                    <div id="f2">
					<!--坚果-->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>${category[1].cName}</h4>
							<h3>随便写 随便写。。。。</h3>
							<div class="today-brands ">
								<c:forEach items="${cs[1]}" var="catecorysecond">
					                <a title="蒸蛋糕" href="#?id=${catecorysecond.csId }">
						            ${catecorysecond.csName}  
									</a>
								</c:forEach>
							</div>
							<span class="more ">
                    <a href="# ">更多美味<i class="am-icon-angle-right" style="padding-left:10px ;" ></i></a>
                        </span>
						</div>
					</div>
					<div class="am-g am-g-fixed floodThree ">
						<div class="am-u-sm-4 text-four list">
							<div class="word">
								<!-- <a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>	
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>	 -->								
							</div>
							<a href="# ">
								<img src="../images/act1.png " />
								<div class="outer-con ">
									<div class="title ">
										随便写....
									</div>									
								</div>
							</a>
							<div class="triangle-topright"></div>	
						</div>
						
						
						<c:set var="i" value="${0 }"></c:set>
						<c:forEach items="${product[1]}" var="pro">
							
							<c:choose>
								<c:when test="${i==0 }">
								<div class="am-u-sm-4 text-four">
								</c:when>
								<c:when test="${i==1 }">
								<div class="am-u-sm-4 text-four sug">
								</c:when>
								<c:when test="${i==2 }">
								<div class="am-u-sm-6 am-u-md-3 text-five big ">
								</c:when>
								<c:when test="${i==3 }">
								<div class="am-u-sm-6 am-u-md-3 text-five ">
								</c:when>
								<c:when test="${i==4 }">
								<div class="am-u-sm-6 am-u-md-3 text-five sug">
								</c:when>
								<c:otherwise>
								<div class="am-u-sm-6 am-u-md-3 text-five big">
								</c:otherwise>	
							</c:choose>
							<c:set var="i" value="${i+1}"></c:set>
							
						
							<a href="# ">
								<img src="../${pro.image}" />
								<div class="outer-con ">
									<div class="title ">
										${pro.pName }
									</div>								
									<div class="sub-title ">
										${pro.shopPrice }
									</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div>
							</a>
						</div>
						</c:forEach>
						
						
					</div>

					<div class="clear "></div>
					</div>

        
                    <div id="f3">
					<!--甜点-->
					
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>${category[2].cName}</h4>
							<h3>随便写，随便写。。。。</h3>
							<div class="today-brands ">
								<c:forEach items="${cs[2]}" var="catecorysecond">
					                <a title="蒸蛋糕" href="#?id=${catecorysecond.csId }">
						            ${catecorysecond.csName}  
									</a>
								</c:forEach>
								
							</div>
							<span class="more ">
                    <a href="# ">更多美味<i class="am-icon-angle-right" style="padding-left:10px ;" ></i></a>
                        </span>
						</div>
					</div>
					
					<div class="am-g am-g-fixed floodFour">
						<div class="am-u-sm-5 am-u-md-4 text-one list ">
							<div class="word">
								<!-- <a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>	
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>	 -->								
							</div>
							<a href="# ">
								<div class="outer-con ">
									<div class="title ">
									随便写 随便写
									</div>
									<div class="sub-title ">
										随便写。。。
									</div>									
								</div>
                                  <img src="../images/act1.png " />								
							</a>
							<div class="triangle-topright"></div>						
						</div>
						
						
						  <c:set var="i" value="${0 }"></c:set>
						<c:forEach items="${product[2]}" var="pro">
							
							<c:choose>
								<c:when test="${i==0 }">
								<div class="am-u-sm-7 am-u-md-4 text-two sug">
								</c:when>
								<c:when test="${i==1 }">
								<div class="am-u-sm-7 am-u-md-4 text-two">
								</c:when>
								<c:when test="${i==2 }">
								<div class="am-u-sm-3 am-u-md-2 text-three big">
								</c:when>
								<c:when test="${i==3 }">
								<div class="am-u-sm-3 am-u-md-2 text-three sug">
								</c:when>
								<c:when test="${i==4 }">
								<div class="am-u-sm-3 am-u-md-2 text-three ">
								</c:when>
								<c:otherwise>
								<div class="am-u-sm-3 am-u-md-2 text-three last big ">
								</c:otherwise>	
							</c:choose>
							<c:set var="i" value="${i+1}"></c:set>                       
						
						
								<div class="outer-con ">
									<div class="title ">
										${pro.pName }
									</div>									
									<div class="sub-title ">
										${pro.shopPrice }
									</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div>
								<a href="# "><img src="../${pro.image}" /></a>
							</div>
                         </c:forEach>
							

					</div>
                 <div class="clear "></div>                 
                 </div>
  

                    <div id="f4">
					<!--坚果-->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>${category[3].cName}</h4>
							<h3>随便写 随便写</h3>
							<div class="today-brands ">
								<c:forEach items="${cs[3]}" var="catecorysecond">
					                <a title="蒸蛋糕" href="#?id=${catecorysecond.csId }">
						            ${catecorysecond.csName}  
									</a>
								</c:forEach>
							</div>
							<span class="more ">
                    <a href="# ">更多美味<i class="am-icon-angle-right" style="padding-left:10px ;" ></i></a>
                        </span>
						</div>
					</div>
					<div class="am-g am-g-fixed floodThree ">
						<div class="am-u-sm-4 text-four list">
							<div class="word">
								<!-- <a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>	
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>	 -->								
							</div>
							<a href="# ">
								<img src="../images/act1.png " />
								<div class="outer-con ">
									<div class="title ">
										随便写 随便写。。。。
									</div>									
								</div>
							</a>
							<div class="triangle-topright"></div>	
						</div>
						
						
						<c:set var="i" value="${0 }"></c:set>
						<c:forEach items="${product[3]}" var="pro">
							
							<c:choose>
								<c:when test="${i==0 }">
								<div class="am-u-sm-4 text-four">
								</c:when>
								<c:when test="${i==1 }">
								<div class="am-u-sm-4 text-four sug">
								</c:when>
								<c:when test="${i==2 }">
								<div class="am-u-sm-6 am-u-md-3 text-five big ">
								</c:when>
								<c:when test="${i==3 }">
								<div class="am-u-sm-6 am-u-md-3 text-five ">
								</c:when>
								<c:when test="${i==4 }">
								<div class="am-u-sm-6 am-u-md-3 text-five sug">
								</c:when>
								<c:otherwise>
								<div class="am-u-sm-6 am-u-md-3 text-five big">
								</c:otherwise>	
							</c:choose>
							<c:set var="i" value="${i+1}"></c:set>
							
						
							<a href="# ">
								<img src="../${pro.image}" />
								<div class="outer-con ">
									<div class="title ">
										${pro.pName }
									</div>								
									<div class="sub-title ">
										${pro.shopPrice }
									</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div>
							</a>
						</div>
						</c:forEach>
						
						
					</div>

					<div class="clear "></div>
					</div>


                     <div id="f5">
					<!--甜点-->
					
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>${category[4].cName}</h4>
							<h3>随便写，随便写</h3>
							<div class="today-brands ">
								<c:forEach items="${cs[4]}" var="catecorysecond">
					                <a title="蒸蛋糕" href="#?id=${catecorysecond.csId }">
						            ${catecorysecond.csName}  
									</a>
								</c:forEach>
							</div>
							<span class="more ">
                    <a href="# ">更多美味<i class="am-icon-angle-right" style="padding-left:10px ;" ></i></a>
                        </span>
						</div>
					</div>
					
					<div class="am-g am-g-fixed floodFour">
						<div class="am-u-sm-5 am-u-md-4 text-one list ">
							<div class="word">
								<!-- <a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>	
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>	 -->								
							</div>
							<a href="# ">
								<div class="outer-con ">
									<div class="title ">
									随便写，随便写
									</div>
									<div class="sub-title ">
										随便写
									</div>									
								</div>
                                  <img src="../images/act1.png " />								
							</a>
							<div class="triangle-topright"></div>						
						</div>
						
							 <c:set var="i" value="${0 }"></c:set>
						<c:forEach items="${product[4]}" var="pro">
							
							<c:choose>
								<c:when test="${i==0 }">
								<div class="am-u-sm-7 am-u-md-4 text-two sug">
								</c:when>
								<c:when test="${i==1 }">
								<div class="am-u-sm-7 am-u-md-4 text-two">
								</c:when>
								<c:when test="${i==2 }">
								<div class="am-u-sm-3 am-u-md-2 text-three big">
								</c:when>
								<c:when test="${i==3 }">
								<div class="am-u-sm-3 am-u-md-2 text-three sug">
								</c:when>
								<c:when test="${i==4 }">
								<div class="am-u-sm-3 am-u-md-2 text-three ">
								</c:when>
								<c:otherwise>
								<div class="am-u-sm-3 am-u-md-2 text-three last big ">
								</c:otherwise>	
							</c:choose>
							<c:set var="i" value="${i+1}"></c:set>                       
						
						
								<div class="outer-con ">
									<div class="title ">
										${pro.pName }
									</div>									
									<div class="sub-title ">
										${pro.shopPrice }
									</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div>
								<a href="# "><img src="../${pro.image}" /></a>
							</div>
                     </c:forEach>
					</div>
                 <div class="clear "></div>                 
                 </div>
  

                  <div id="f6">
					<!--坚果-->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>${category[5].cName}</h4>
							<h3>随便写，随便写</h3>
							<div class="today-brands ">
								<c:forEach items="${cs[5]}" var="catecorysecond">
					                <a title="蒸蛋糕" href="#?id=${catecorysecond.csId }">
						            ${catecorysecond.csName}  
									</a>
								</c:forEach>
							</div>
							<span class="more ">
                    <a href="# ">更多美味<i class="am-icon-angle-right" style="padding-left:10px ;" ></i></a>
                        </span>
						</div>
					</div>
					<div class="am-g am-g-fixed floodThree ">
						<div class="am-u-sm-4 text-four list">
							<div class="word">
								<!-- <a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>	
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>	 -->								
							</div>
							<a href="# ">
								<img src="../images/act1.png " />
								<div class="outer-con ">
									<div class="title ">
										随便写，随便写
									</div>									
								</div>
							</a>
							<div class="triangle-topright"></div>	
						</div>
						<c:set var="i" value="${0 }"></c:set>
						<c:forEach items="${product[5]}" var="pro">
							
							<c:choose>
								<c:when test="${i==0 }">
								<div class="am-u-sm-4 text-four">
								</c:when>
								<c:when test="${i==1 }">
								<div class="am-u-sm-4 text-four sug">
								</c:when>
								<c:when test="${i==2 }">
								<div class="am-u-sm-6 am-u-md-3 text-five big ">
								</c:when>
								<c:when test="${i==3 }">
								<div class="am-u-sm-6 am-u-md-3 text-five ">
								</c:when>
								<c:when test="${i==4 }">
								<div class="am-u-sm-6 am-u-md-3 text-five sug">
								</c:when>
								<c:otherwise>
								<div class="am-u-sm-6 am-u-md-3 text-five big">
								</c:otherwise>	
							</c:choose>
							<c:set var="i" value="${i+1}"></c:set>
							
						
							<a href="# ">
								<img src="../${pro.image}" />
								<div class="outer-con ">
									<div class="title ">
										${pro.pName }
									</div>								
									<div class="sub-title ">
										${pro.shopPrice }
									</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div>
							</a>
						</div>
						</c:forEach>
						
					</div>

					<div class="clear "></div>
				   </div>
   
   
   
                     <div id="f7">
					<!--甜点-->
					
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>${category[6].cName}</h4>
							<h3>随便写，随便写</h3>
							<div class="today-brands ">
								<c:forEach items="${cs[6]}" var="catecorysecond">
					                <a title="蒸蛋糕" href="#?id=${catecorysecond.csId }">
						            ${catecorysecond.csName}  
									</a>
								</c:forEach>
							</div>
							<span class="more ">
                    <a href="# ">更多美味<i class="am-icon-angle-right" style="padding-left:10px ;" ></i></a>
                        </span>
						</div>
					</div>
					
					<div class="am-g am-g-fixed floodFour">
						<div class="am-u-sm-5 am-u-md-4 text-one list ">
							<div class="word">
								<!-- <a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>	
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>	 -->								
							</div>
							<a href="# ">
								<div class="outer-con ">
									<div class="title ">
									随便写
									</div>
									<div class="sub-title ">
										随便写
									</div>									
								</div>
                                  <img src="../images/act1.png " />								
							</a>
							<div class="triangle-topright"></div>						
						</div>
						
							 <c:set var="i" value="${0 }"></c:set>
						<c:forEach items="${product[6]}" var="pro">
							
							<c:choose>
								<c:when test="${i==0 }">
								<div class="am-u-sm-7 am-u-md-4 text-two sug">
								</c:when>
								<c:when test="${i==1 }">
								<div class="am-u-sm-7 am-u-md-4 text-two">
								</c:when>
								<c:when test="${i==2 }">
								<div class="am-u-sm-3 am-u-md-2 text-three big">
								</c:when>
								<c:when test="${i==3 }">
								<div class="am-u-sm-3 am-u-md-2 text-three sug">
								</c:when>
								<c:when test="${i==4 }">
								<div class="am-u-sm-3 am-u-md-2 text-three ">
								</c:when>
								<c:otherwise>
								<div class="am-u-sm-3 am-u-md-2 text-three last big ">
								</c:otherwise>	
							</c:choose>
							<c:set var="i" value="${i+1}"></c:set>                       
						
						
								<div class="outer-con ">
									<div class="title ">
										${pro.pName }
									</div>									
									<div class="sub-title ">
										${pro.shopPrice }
									</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div>
								<a href="# "><img src="../${pro.image}" /></a>
							</div>
                     </c:forEach>

					</div>
                 <div class="clear "></div>  
                 </div>
                 
                    <div id="f8">
					<!--坚果-->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>${category[7].cName}</h4>
							<h3>随便写，随便写。。。</h3>
							<div class="today-brands ">
								<c:forEach items="${cs[7]}" var="catecorysecond">
					                <a title="蒸蛋糕" href="#?id=${catecorysecond.csId }">
						            ${catecorysecond.csName}  
									</a>
								</c:forEach>
							</div>
							<span class="more ">
                    <a href="# ">更多美味<i class="am-icon-angle-right" style="padding-left:10px ;" ></i></a>
                        </span>
						</div>
					</div>
					<div class="am-g am-g-fixed floodThree ">
						<div class="am-u-sm-4 text-four list">
							<div class="word">
								<!-- <a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>	
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>	 -->								
							</div>
							<a href="# ">
								<img src="../images/act1.png " />
								<div class="outer-con ">
									<div class="title ">
										随便写
									</div>									
								</div>
							</a>
							<div class="triangle-topright"></div>	
						</div>
						<c:set var="i" value="${0 }"></c:set>
						<c:forEach items="${product[7]}" var="pro">
							
							<c:choose>
								<c:when test="${i==0 }">
								<div class="am-u-sm-4 text-four">
								</c:when>
								<c:when test="${i==1 }">
								<div class="am-u-sm-4 text-four sug">
								</c:when>
								<c:when test="${i==2 }">
								<div class="am-u-sm-6 am-u-md-3 text-five big ">
								</c:when>
								<c:when test="${i==3 }">
								<div class="am-u-sm-6 am-u-md-3 text-five ">
								</c:when>
								<c:when test="${i==4 }">
								<div class="am-u-sm-6 am-u-md-3 text-five sug">
								</c:when>
								<c:otherwise>
								<div class="am-u-sm-6 am-u-md-3 text-five big">
								</c:otherwise>	
							</c:choose>
							<c:set var="i" value="${i+1}"></c:set>
							
						
							<a href="# ">
								<img src="../${pro.image}" />
								<div class="outer-con ">
									<div class="title ">
										${pro.pName }
									</div>								
									<div class="sub-title ">
										${pro.shopPrice }
									</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div>
							</a>
						</div>
						</c:forEach>
						
					</div>

					<div class="clear "></div>
					</div>
  
                    <div id="f9">
					<!--甜点-->
					
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>${category[8].cName}</h4>
							<h3>随便写，随便写。。</h3>
							<div class="today-brands ">
								<c:forEach items="${cs[8]}" var="catecorysecond">
					                <a title="蒸蛋糕" href="#?id=${catecorysecond.csId }">
						            ${catecorysecond.csName}  
									</a>
								</c:forEach>
							</div>
							<span class="more ">
                    <a href="# ">更多美味<i class="am-icon-angle-right" style="padding-left:10px ;" ></i></a>
                        </span>
						</div>
					</div>
					
					<div class="am-g am-g-fixed floodFour">
						<div class="am-u-sm-5 am-u-md-4 text-one list ">
							<div class="word">
								<!-- <a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>	
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>	 -->								
							</div>
							<a href="# ">
								<div class="outer-con ">
									<div class="title ">
									随便写
									</div>
									<div class="sub-title ">
										随便写
									</div>									
								</div>
                                  <img src="../images/act1.png " />								
							</a>
							<div class="triangle-topright"></div>						
						</div>
						
							<c:set var="i" value="${0 }"></c:set>
						<c:forEach items="${product[8]}" var="pro">
							
							<c:choose>
								<c:when test="${i==0 }">
								<div class="am-u-sm-7 am-u-md-4 text-two sug">
								</c:when>
								<c:when test="${i==1 }">
								<div class="am-u-sm-7 am-u-md-4 text-two">
								</c:when>
								<c:when test="${i==2 }">
								<div class="am-u-sm-3 am-u-md-2 text-three big">
								</c:when>
								<c:when test="${i==3 }">
								<div class="am-u-sm-3 am-u-md-2 text-three sug">
								</c:when>
								<c:when test="${i==4 }">
								<div class="am-u-sm-3 am-u-md-2 text-three ">
								</c:when>
								<c:otherwise>
								<div class="am-u-sm-3 am-u-md-2 text-three last big ">
								</c:otherwise>	
							</c:choose>
							<c:set var="i" value="${i+1}"></c:set>                       
						
						
								<div class="outer-con ">
									<div class="title ">
										${pro.pName }
									</div>									
									<div class="sub-title ">
										${pro.shopPrice }
									</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div>
								<a href="# "><img src="../${pro.image}" /></a>
							</div>
                     </c:forEach>
					</div>
                 <div class="clear "></div>  
                 </div>
                 
  
                    <div id="f10">
					<!--坚果-->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>${category[9].cName}</h4>
							<h3>随便写，随便写。。</h3>
							<div class="today-brands ">
								<c:forEach items="${cs[9]}" var="catecorysecond">
					                <a title="蒸蛋糕" href="#?id=${catecorysecond.csId }">
						            ${catecorysecond.csName}  
									</a>
								</c:forEach>
							</div>
							<span class="more ">
                    <a href="# ">更多美味<i class="am-icon-angle-right" style="padding-left:10px ;" ></i></a>
                        </span>
						</div>
					</div>
					<div class="am-g am-g-fixed floodThree ">
						<div class="am-u-sm-4 text-four list">
							<div class="word">
								<!-- <a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>	
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>
								<a class="outer" href="#"><span class="inner"><b class="text">核桃</b></span></a>	 -->								
							</div>
							<a href="# ">
								<img src="../images/act1.png " />
								<div class="outer-con ">
									<div class="title ">
										随便写
									</div>									
								</div>
							</a>
							<div class="triangle-topright"></div>	
						</div>
						<c:set var="i" value="${0 }"></c:set>
						<c:forEach items="${product[9]}" var="pro">
							
							<c:choose>
								<c:when test="${i==0 }">
								<div class="am-u-sm-4 text-four">
								</c:when>
								<c:when test="${i==1 }">
								<div class="am-u-sm-4 text-four sug">
								</c:when>
								<c:when test="${i==2 }">
								<div class="am-u-sm-6 am-u-md-3 text-five big ">
								</c:when>
								<c:when test="${i==3 }">
								<div class="am-u-sm-6 am-u-md-3 text-five ">
								</c:when>
								<c:when test="${i==4 }">
								<div class="am-u-sm-6 am-u-md-3 text-five sug">
								</c:when>
								<c:otherwise>
								<div class="am-u-sm-6 am-u-md-3 text-five big">
								</c:otherwise>	
							</c:choose>
							<c:set var="i" value="${i+1}"></c:set>
							
						
							<a href="# ">
								<img src="../${pro.image}" />
								<div class="outer-con ">
									<div class="title ">
										${pro.pName }
									</div>								
									<div class="sub-title ">
										${pro.shopPrice }
									</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div>
							</a>
						</div>
						</c:forEach>

						
					</div>

					<div class="clear "></div>
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

		</div>
		</div>
		<!--引导 -->
		<div class="navCir">
			<li class="active"><a href="home.html"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
			<li><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li><a href="../person/index.html"><i class="am-icon-user"></i>我的</a></li>					
		</div>


		<!--菜单 -->
		<div class=tip>
			<div id="sidebar">
				<div id="wrap">
					<div id="prof" class="item ">
						<a href="# ">
							<span class="setting "></span>
						</a>
						<div class="ibar_login_box status_login ">
							<div class="avatar_box ">
								<p class="avatar_imgbox "><img src="../images/no-img_mid_.jpg " /></p>
								<ul class="user_info ">
									<li>用户名sl1903</li>
									<li>级&nbsp;别普通会员</li>
								</ul>
							</div>
							<div class="login_btnbox ">
								<a href="# " class="login_order ">我的订单</a>
								<a href="# " class="login_favorite ">我的收藏</a>
							</div>
							<i class="icon_arrow_white "></i>
						</div>

					</div>
					<div id="shopCart " class="item ">
						<a href="# ">
							<span class="message "></span>
						</a>
						<p>
							购物车
						</p>
						<p class="cart_num ">0</p>
					</div>
					<div id="asset " class="item ">
						<a href="# ">
							<span class="view "></span>
						</a>
						<div class="mp_tooltip ">
							我的资产
							<i class="icon_arrow_right_black "></i>
						</div>
					</div>

					<div id="foot " class="item ">
						<a href="# ">
							<span class="zuji "></span>
						</a>
						<div class="mp_tooltip ">
							我的足迹
							<i class="icon_arrow_right_black "></i>
						</div>
					</div>

					<div id="brand " class="item ">
						<a href="#">
							<span class="wdsc "><img src="../images/wdsc.png " /></span>
						</a>
						<div class="mp_tooltip ">
							我的收藏
							<i class="icon_arrow_right_black "></i>
						</div>
					</div>

					<div id="broadcast " class="item ">
						<a href="# ">
							<span class="chongzhi "><img src="../images/chongzhi.png " /></span>
						</a>
						<div class="mp_tooltip ">
							我要充值
							<i class="icon_arrow_right_black "></i>
						</div>
					</div>

					<div class="quick_toggle ">
						<li class="qtitem ">
							<a href="# "><span class="kfzx "></span></a>
							<div class="mp_tooltip ">客服中心<i class="icon_arrow_right_black "></i></div>
						</li>
						<!--二维码 -->
						<li class="qtitem ">
							<a href="#none "><span class="mpbtn_qrcode "></span></a>
							<div class="mp_qrcode " style="display:none; "><img src="../images/weixin_code_145.png " /><i class="icon_arrow_white "></i></div>
						</li>
						<li class="qtitem ">
							<a href="#top " class="return_top "><span class="top "></span></a>
						</li>
					</div>

					<!--回到顶部 -->
					<div id="quick_links_pop " class="quick_links_pop hide "></div>

				</div>

			</div>
			<div id="prof-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					我
				</div>
			</div>
			<div id="shopCart-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					购物车
				</div>
			</div>
			<div id="asset-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					资产
				</div>

				<div class="ia-head-list ">
					<a href="# " target="_blank " class="pl ">
						<div class="num ">0</div>
						<div class="text ">优惠券</div>
					</a>
					<a href="# " target="_blank " class="pl ">
						<div class="num ">0</div>
						<div class="text ">红包</div>
					</a>
					<a href="# " target="_blank " class="pl money ">
						<div class="num ">￥0</div>
						<div class="text ">余额</div>
					</a>
				</div>

			</div>
			<div id="foot-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					足迹
				</div>
			</div>
			<div id="brand-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					收藏
				</div>
			</div>
			<div id="broadcast-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					充值
				</div>
			</div>
		</div>
		<script>
			window.jQuery || document.write('<script src="basic/js/jquery.min.js "><\/script>');
		</script>
		<script type="text/javascript " src="../basic/js/quick_links.js "></script>
	</body>

</html>