<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>首页</title>
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
            background:url("${ctx}/resource/images/login/abc.jpg") no-repeat;
            height: 100%;
            width: 100%;
            background-size: 100%;
        }
    </style>
</head>
<body>
<%@include file="/common/utop.jsp"%>


<div class="container myclass">
    <div class="row"  style="margin-top: 5px">

        <div class="col-md-10">
            <form class="form-inline" action="${ctx}/community/toPostIndex">
                <div class="form-group">
                    <div class="input-group">
                        <input type="text" name="content" class="form-control"  placeholder="请输入帖子内容就行搜索" value="${obj.content}">
                    </div>
                    <input type="hidden" value="0" name="code" id="code"/>
                </div>
                <button type="submit" class="btn btn-success">搜索</button>
                <button class="btn btn-info" id="changeButton">按浏览量排序</button>
            </form>
        </div>
        <div class="col-md-1">
            <a class="btn btn-info" href="${ctx}/community/addPost">我要发帖</a>
        </div>
        <div class="col-md-1">
            <a class="btn btn-default" href="${ctx}/community/myPost">我的帖子</a>
        </div>
    </div>
    <table class="table table-hover" style="margin-top: 5px">
        <thead>
        <tr class="info" style="font-weight:bold;" >
            <th>标题</th>
            <th>发帖人</th>
            <th>发帖时间</th>
            <th>浏览量</th>
            <th>查看详情</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pagers.datas}" var="data" varStatus="1">
            <tr class="danger" id="dataTopic">
                <td>${data.title}</td>
                <td>${data.user.userName}</td>
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
                <a href="${pageUrl}&code=${code}">首页</a>
            </pg:first>
            <pg:prev>
                <a href="${pageUrl}&code=${code}">上一页</a>
            </pg:prev>
            <pg:pages>
                <c:choose>
                    <c:when test="${curPage eq pageNumber}">
                        <font color="red">[${pageNumber}]</font>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageUrl}&code=${code}">${pageNumber}</a>
                    </c:otherwise>
                </c:choose>
            </pg:pages>
            <pg:next>
                <a href="${pageUrl}&code=${code}">下一页</a>
            </pg:next>
            <pg:last>
                <c:choose>
                    <c:when test="${curPage eq pageNumber}">
                        <font color="red">尾页</font>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageUrl}&code=${code}">尾页</a>
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
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
        //监听导航点击
        element.on('nav(demo)', function(elem){
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
    window.onload=function(){
        let co = document.getElementById("code");
        if(${code==1}){
            btn.innerHTML="按发贴时间排序";
            co.setAttribute("value","1");
            btn.setAttribute("class","btn btn-danger");
        }else if(${code==0}){
            btn.innerHTML="按浏览量排序";
            co.setAttribute("value","0");
            btn.setAttribute("class","btn btn-info");
        }else{
            btn.innerHTML="按浏览量排序";
            co.setAttribute("value","0");
            btn.setAttribute("class","btn btn-info");
        }

    };
    let btn = document.getElementById("changeButton");
    btn.addEventListener("click",function () {
        let code = document.getElementById("code");
        if(btn.innerHTML==="按浏览量排序"){
            btn.innerHTML="按发贴时间排序";
            code.setAttribute("value","1");
            btn.setAttribute("class","btn btn-danger")
        }else if(btn.innerHTML==="按发贴时间排序"){
            btn.innerHTML="按浏览量排序";
            code.setAttribute("value","0");
            btn.setAttribute("class","btn btn-info")
        }
    })

</script>
</body>
</html>



















