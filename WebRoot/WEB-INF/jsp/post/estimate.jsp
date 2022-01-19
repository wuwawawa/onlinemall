<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>评价</title>
    <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui-v2.5.6/css/layui.css" />
    <script src="https://www.layuicdn.com/layui-v2.5.6/layui.js"></script>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
        html,body{
            height: 100%;
        }
        .myclass{
            background-image: url("${ctx}/resource/images/dlam.jpg");
            background-repeat: no-repeat;
            height: 100%;
            width: 100%;
            background-size: 100%;
            filter: alpha(opacity=50);
            -moz-opacity:0.5;
            -khtml-opacity: 0.5;
            opacity: 0.5;
            position:absolute;
        }


    </style>
</head>
<body>
<%@include file="/common/utop.jsp"%>
<div class="layui-fluid myclass">
    <div class="layui-row text">
        <div style="text-align: center;"><h2>请您为在本网站的体验打分</h2></div>
    </div>
    <div class="layui-row text" style="margin-top: 100px">
        <div style="text-align: center;"><h2>网站外观:</h2><div id="test1"></div></div>
    </div>
    <div class="layui-row text">
        <div style="text-align: center;"><h2>购买体验:</h2><div id="test2"></div></div>
    </div>
    <div class="layui-row text">
        <div style="text-align: center;"><h2>发货速度:</h2><div id="test3"></div></div>
    </div>
    <div class="layui-row text">
        <div style="text-align: center;"><button class="layui-btn layui-btn-warm" id="btn">提交</button></div>
    </div>
</div>


<script>
    layui.use('rate', function(){
        var rate = layui.rate;

        //渲染
        var ins1 = rate.render({
            elem: '#test1'  //绑定元素
        });
    });
    layui.use('rate', function(){
        var rate = layui.rate;

        //渲染
        var ins1 = rate.render({
            elem: '#test2'  //绑定元素
        });
    });
    layui.use('rate', function(){
        var rate = layui.rate;

        //渲染
        var ins1 = rate.render({
            elem: '#test3'//绑定元素
        });
    });
    let btn = document.getElementById("btn");
    btn.onclick=function () {
        alert("感谢您的评价!");
    }

</script>

</body>
</html>



















