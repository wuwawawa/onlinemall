<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>我的帖子</title>
    <script src="${ctx}/resource/user/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
    <%--    <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui-v2.5.6/css/layui.css" />--%>
    <%--    <script src="https://www.layuicdn.com/layui-v2.5.6/layui.js"></script>--%>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
    <script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
        html,body{
            height: 100%;
        }
        .myclass{
            background:url("${ctx}/resource/images/login/1118.jpg") no-repeat;
            height: 100%;
            width: 100%;
            background-size: 100%;
        }
    </style>
</head>
<body>
<%@include file="/common/utop.jsp"%>


<div class="container myclass">
    <a class="btn btn-info" href="${ctx}/community/toPostIndex?code=0">返回</a>
    <table class="table table-hover" style="margin-top: 5px">
        <thead>
        <tr class="info" style="font-weight:bold;" >
            <th>标题</th>
            <th>发帖时间</th>
            <th>浏览量</th>
            <th>查看详情</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pagers.datas}" var="data" varStatus="1">
            <tr class="danger" id="dataTopic">
                <td>${data.title}</td>
                <td><fmt:formatDate value="${data.addTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>${data.clickAmount}</td>
                <td><a class="btn btn-link" href="${ctx}/community/viewPost?id=${data.id}" style="color: #00aa00">浏览该贴</a></td>
            </tr>
            </a>
        </c:forEach>
        </tbody>
    </table>
    <div class="pagelist" style="text-align: center">
        <!--分页开始-->
        <pg:pager url="${ctx}/community/toPostIndex" maxIndexPages="5" items="${pagers.total}" maxPageItems="15" export="curPage=pageNumber">
            <pg:last>
                共${pagers.total}记录，共${pageNumber}页，
            </pg:last>
            当前第${curPage}页
            <pg:first>
                <a href="${pageUrl}">首页</a>
            </pg:first>
            <pg:prev>
                <a href="${pageUrl}">上一页</a>
            </pg:prev>
            <pg:pages>
                <c:choose>
                    <c:when test="${curPage eq pageNumber}">
                        <font color="red">[${pageNumber}]</font>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageUrl}">${pageNumber}</a>
                    </c:otherwise>
                </c:choose>
            </pg:pages>
            <pg:next>
                <a href="${pageUrl}">下一页</a>
            </pg:next>
            <pg:last>
                <c:choose>
                    <c:when test="${curPage eq pageNumber}">
                        <font color="red">尾页</font>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageUrl}">尾页</a>
                    </c:otherwise>
                </c:choose>
            </pg:last>
        </pg:pager>
    </div>
</div>
</div>
</div>

<script type="text/javascript">
    layui.use('element', function(){
        var element = layui.element;

        element.on('nav(demo)', function(elem){
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
</body>
</html>



















