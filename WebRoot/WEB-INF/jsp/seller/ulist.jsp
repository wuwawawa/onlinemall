<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>管理员后台</title>
    <link rel="stylesheet" href="${ctx}/resource/css/pintuer.css">
    <link rel="stylesheet" href="${ctx}/resource/css/admin.css">
    <script src="${ctx}/resource/js/jquery.js"></script>
    <script src="${ctx}/resource/js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
    <table class="table table-hover text-center">
        <tr>
            <th>商品名称</th>
            <th>商品主图</th>
            <th>商品单价</th>
            <th>购买数量</th>
            <th>小计</th>
            <th>状态</th>
        </tr>
    <c:forEach items="${pagers.datas}" var="data" varStatus="l">
        <tr>
            <td>${data.item.name}</td>
            <td><img src="${data.item.url1}" alt="" style="width: 100px;height: 100px;"></td>
            <td>${data.item.price}</td>
            <td>${data.num}</td>
            <td>${data.total}</td>
            <td style="color: red">
                <c:if test="${data.status == 0}">
                        未退货
                </c:if>
                <c:if test="${data.status == 1}">
                    已退货
                </c:if>
            </td>

        </tr>
    </c:forEach>

    </table>
</div>
</body>
</html>