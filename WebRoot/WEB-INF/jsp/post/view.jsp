<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>社区与论坛</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/user/css/style.css">
    <script src="${ctx}/resource/user/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
    <script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="${ctx}/resource/user/js/jquery-1.8.3.min.js"></script>
    <link  rel="stylesheet" type="text/css" href="${ctx}/resource/layui/css/layui.css"/>
    <script type="text/javascript" src="${ctx}/resource/layui/layui.js"/>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
        html,body{
            height: 100%;
            background-color:#f0f0f0;
        }
        .myclass{
            height: 100%;
            width: 100%;
            background-size: 100%;
        }
    </style>
</head>
<body>
<%@include file="/common/utop.jsp"%>
<div class="container-fluid">
    <div class="row" >
        <div class="col-md-1">
            <a class="btn btn-info" href="${ctx}/community/toPostIndex?code=0">返回</a>
        </div>
        <div class="col-md-10">

        </div>
        <div class="col-md-1">
            <a class="btn btn-info" href="${ctx}/community/review?id=${post.id}">回复</a>
        </div>
    </div>
</div>
<ul class="layui-timeline">
<div class="container " style="background-color:#ffffff;">
    <ul class="layui-timeline">

        <li class="layui-timeline-item">
            <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
            <div class="row layui-timeline-content layui-text" style="margin-top: 20px">
                        <div class="col-md-12" style="border-bottom: 1px dashed #ddd">
                            <h3 class="layui-timeline-title"><fmt:formatDate value="${post.addTime}" pattern="yyyy-MM-dd HH:mm:ss"/></h3>

                            <div style="text-align: center">
                                <h3> ${post.title}</h3>
                            </div>
                            <div style="text-align: center">
                                <h3>${post.user.userName}</h3>
                            </div>
                            <div style="margin-top: 20px;margin-left: 15px">
                                ${post.content}
                            </div>
            </div>
        </div>
        </li>
    <c:forEach items="${pagers.datas}" var="data" varStatus="status">
        <li class="layui-timeline-item">
            <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
        <div class="row layui-timeline-content layui-text">
            <div class="col-md-12" style="border-bottom: 1px dashed #ddd">
        <h3 class="layui-timeline-title"><fmt:formatDate value="${data.addTime}" pattern="yyyy-MM-dd HH:mm:ss"/></h3>
                <div><h4>用户名:${data.user.userName}</h4></div>
                <h4><h4>${status.index+2}楼回复:</h4></h4>
                <div style="margin-top: 20px;margin-left: 15px">
                        ${data.content}
                </div>
            </div>
        </div>
        </li>
    </c:forEach>
    </ul>
</div>





</body>
</html>



















