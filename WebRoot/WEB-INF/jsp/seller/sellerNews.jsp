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
</head>
<body>

<div class="width100 hidden_yh" style="background: #f0f0f0;padding-top:34px;padding-bottom: 34px;">
    <div class="panel admin-panel">
        <div id="vipRight" style="width: 1200px">
            <div class="fon24" style="height: 60px;line-height: 60px;text-indent: 50px;background: #f5f8fa;border-bottom: 1px solid #ddd;">
                公告列表
            </div>
            <div class="hidden_yh" style="padding:20px;width:898px;">
                <c:forEach items="${pagers.datas}" var="data" varStatus="l">
                    <a href="${ctx}/news/sellerView?id=${data.id}">
                        <div class="width100 hidden_yh" style="border-bottom: 1px dashed #ddd; padding-top:10px;padding-bottom: 10px;">
                            <div class="left_yh" style="width:580px;">
                                <font color="red"> ${data.name}</font>
                            </div>
                            <div class="right_yh">
                                <font color="black"><fmt:formatDate value="${data.addTime}" pattern="yyyy-MM-dd HH:mm:ss"/></font>
                            </div>
                        </div>
                    </a>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

</body>
</html>



















