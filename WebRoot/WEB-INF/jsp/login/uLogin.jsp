<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>用户登录</title>
<%--    <link  rel="stylesheet" type="text/css" href="${ctx}/resource/layui/css/layui.css"/>--%>
<%--    <script type="text/javascript" src="${ctx}/resource/layui/layui.js"/>--%>
    <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui-v2.5.6/css/layui.css" />
    <script src="https://www.layuicdn.com/layui-v2.5.6/layui.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.4.1/jquery.js"></script>

    <style type="text/css">
        .container{
            width: 420px;
            height: 320px;
            min-height: 320px;
            max-height: 320px;
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            margin: auto;
            padding: 20px;
            z-index: 130;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 3px 18px rgba(100, 0, 0, .5);
            font-size: 16px;
        }
        .close{
            background-color: white;
            border: none;
            font-size: 18px;
            margin-left: 410px;
            margin-top: -10px;
        }

        .layui-input{
            border-radius: 5px;
            width: 300px;
            height: 40px;
            font-size: 15px;
        }
        .layui-form-item{
            margin-left: -20px;
        }
        #logoid{
            margin-top: -16px;
            padding-left:150px;
            padding-bottom: 15px;
        }
        .layui-btn{
            margin-left: -50px;
            border-radius: 5px;
            width: 350px;
            height: 40px;
            font-size: 15px;
        }
        .verity{
            width: 120px;
        }
        .font-set{
            font-size: 13px;
            text-decoration: none;
            margin-left: 120px;
        }
        a:hover{
            text-decoration: underline;
        }

        *{
            margin: 0;
            padding: 0;
        }
        html,body{
            height: 100%;
        }
        .myclass{
            background:url("${ctx}/resource/images/login/loginBgp.jpg");
            height: 100%;
            width: 100%;
            background-size: 100%;
        }
    </style>
</head>
<body >
<%@include file="/common/utop.jsp"%>
<div class="myclass">


<form class="layui-form" action="${ctx}/login/utoLogin" method="post" id="loginForm">
    <div class="container">
        <button class="close" title="关闭">X</button>
        <div class="layui-form-mid layui-word-aux">
            <img id="logoid" src="${ctx}/resource/images/login/userloginlogo.png" height="35">
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" id="loginUsername" name="userName" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密 &nbsp;&nbsp;码</label>
            <div class="layui-input-block">
                <input type="password" id="loginPassword" name="passWord" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
        </div>



        <div class="layui-form-item">
            <div class="layui-input-block">
                <button id="loginBtn" class="layui-btn"  lay-filter="formDemo">登陆</button>
            </div>
        </div>
        <a href="" class="font-set">忘记密码?</a>  <a href="${ctx}/login/res" class="font-set">立即注册</a>
    </div>
</form>
</div>
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

        //日期
        /* laydate.render({
           elem: '#date'
         });
         laydate.render({
           elem: '#date1'
         });

         //创建一个编辑器
         var editIndex = layedit.build('LAY_demo_editor');

         //自定义验证规则
         form.verify({
           title: function(value){
             if(value.length < 5){
               return '标题至少得5个字符啊';
             }
           }
           ,pass: [
             /^[\S]{6,12}$/
             ,'密码必须6到12位，且不能出现空格'
           ]
           ,content: function(value){
             layedit.sync(editIndex);
           }
         });

         //监听指定开关
         form.on('switch(switchTest)', function(data){
           layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
             offset: '6px'
           });
           layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
         });*/


        //监听提交
        form.on('submit(demo1)', function(data){
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });
    });
    $(function () {
       window.onload=function () {
           if(${msg=="用户名或密码错误！"}){
               layer.alert("用户名或密码错误！")
           }
       }
    });

    // 校验验证码、用户名、密码
    function validateCode() {

        var loginUsername = $('#loginUsername').val();
        var loginPassword = $('#loginPassword').val();
        if ($.trim(loginUsername) === '' || $.trim(loginUsername).length<=0){
            layer.alert("用户名不能为空");
            return false;
        }
        if ($.trim(loginPassword) === '' || $.trim(loginPassword).length<=0){
            layer.alert("密码不能为空");
            return false;
        }
        if (inputCode.length<=0){
            layer.alert("验证码不能为空");
            return false;
        }
        return true;
    }
    // 登录流程
    function login() {
        if (!validateCode()) {
            //阻断提示
        } else {
            $("#loginForm").submit();
        }
    }

</script>



</body>
</html>



















