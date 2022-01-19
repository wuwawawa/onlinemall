<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>商家后台</title>
    <link rel="stylesheet" href="${ctx}/resource/css/pintuer.css">
    <link rel="stylesheet" href="${ctx}/resource/css/admin.css">
    <script src="${ctx}/resource/js/jquery.js"></script>
    <script src="${ctx}/resource/js/pintuer.js"></script>
</head>
<body style="background-color: #f2f9fd">
<div class="header bg-main my">
    <div class="logo margin-big-left fadein-top">
        <h1 style="color: green">商家后台</h1>
    </div>
    <div class="head-l">
        <a class="button button-little bg-green" href="${ctx}/login/uIndex" target="_blank">
            <span class="icon-home"></span>前台首页
        </a>
        <a class="button button-little bg-red" href="${ctx}/login/sExit">
            <span class="icon-power-off"></span>退出登录
        </a>
    </div>
</div>
<div class="leftnav my">
    <div class="leftnav-title"><strong><span class="icon-list">菜单列表</span> </strong></div>
    <h2><span class="icon-user"></span>基本设置 </h2>
    <ul style="display: block">
        <li><a href="${ctx}/seller/findPersonInf?type=0" target="right"><span class="icon-caret-right"></span>个人信息</a> </li>
        <li><a href="${ctx}/seller/findAllItems?code=0" target="right"><span class="icon-caret-right"></span>商品管理</a> </li>
        <li><a href="${ctx}/seller/findAllOrders" target="right"><span class="icon-caret-right"></span>订单管理</a> </li>
        <li><a href="${ctx}/seller/findAllReviews" target="right"><span class="icon-caret-right"></span>买家评论</a> </li>
        <li><a href="${ctx}/news/sellerList" target="right"><span class="icon-caret-right"></span>系统公告</a> </li>
    </ul>
</div>
<ul class="bread">
    <li><a href="{:}" target="right" class="icon-home">首页</a> </li>
    <li><a href="#">网站信息</a> </li>
    <li><b>欢迎您! 尊敬的用户:${loginSeller.userName}  您的商家ID是:${loginSeller.id}  商家名是:${loginSeller.sellerName}</b></li>
</ul>
<div class="admin">
    <iframe name="right" scrolling="auto" frameborder="0" width="100%" height="100%"></iframe>
</div>
</body>
</html>