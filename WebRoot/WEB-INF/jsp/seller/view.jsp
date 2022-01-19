<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>首页</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/user/css/style.css">
    <script src="${ctx}/resource/user/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>


<div class="panel admin-panel" style="background: #f0f0f0;padding-top:34px;padding-bottom: 34px;">
    <div class="width1200 hidden_yh center_yh">
        <div id="vipRight" style="width: 1200px">
            <div class="hidden_yh bj_fff" style="width: 1198px;border: 1px solid #ddd;">
                <div class="width100 font24" style="height: 50px;line-height: 50px;width: 200px;text-align: center;">${obj.name}</div>
                <div class="hidden_yh" style="padding:20px;width: 1100px;margin: 0 auto">
                    <div class="width100 hidden_yh" style="border-bottom: 1px dashed #ddd;padding-top: 10px;padding-bottom: 10px;">
                        <div class="left_yh" style="width:100%;color: black">
                            ${obj.content}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>
<div style="text-align: center" id="return">
    <button id="reBack" class="btn btn-info">返回</button>
</div>
<script type="text/javascript">
    let btn = document.getElementById("reBack");
    btn.addEventListener("click",function () {
        window.history.back();
    });
</script>
</body>
</html>



















