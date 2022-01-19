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
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
<div class="panel admin-panel">
    <form action="${ctx}/seller/findAllItems" id="listform" method="post">
        <div class="padding border-bottom">
            <ul class="search" style="padding-left: 10px;">
                <li>
                    <a class="button border-main icon-plus-square-o" href="${ctx}/seller/add">添加商品</a>
                </li>
                <li>
                    <input type="text" placeholder="请输入商品名称" name="name" class="input" value="${obj.name}"
                           style="width: 250px;line-height: 17px;display: inline-block" />
                    <button class="btn btn-info" id="changeButton">切换到已下架商品</button>
                    <a href="javascript:void(0)" onclick="changeSearch()" class="button border-main icon-search">搜索</a>
                </li>
            </ul>
            <input type="hidden" name="code" value="0" id="code"/>
        </div>
    </form>
    <table class="table table-hover text-center">
        <tr>
            <th>商品名称</th>
            <th>商品主图</th>
            <th>商品价格</th>
            <th>商品一级分类</th>
            <th>商品二级分类</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${pagers.datas}" var="data" varStatus="l">
            <tr>
                <td>${data.name}</td>
                <td><img src="${data.url1}" alt="" style="width: 100px;height: 100px;"></td>
                <td>${data.price}</td>
                <td>${data.yiji.name}</td>
                <td>${data.erji.name}</td>
                <td>
                    <a class="button border-main" href="${ctx}/seller/update?id=${data.id}"><span class="icon-edit">修改</span> </a>
                    <c:if test="${code==0}">
                        <a class="button border-red" href="${ctx}/seller/deleteItem?id=${data.id}"><span class="icon-trash-o">下架</span> </a>
                    </c:if>
                    <c:if test="${code==1}">
                        <a class="button border-green" href="${ctx}/seller/unsealItem?id=${data.id}"><span class="icon-trash-o">上架</span></a>
                    </c:if>

                </td>

            </tr>
        </c:forEach>
        <tr>
            <td colspan="8">
                <div class="pagelist">
                    <!--分页开始-->
                    <pg:pager url="${ctx}/seller/findAllItems" maxIndexPages="5" items="${pagers.total}" maxPageItems="15" export="curPage=pageNumber">
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
            </td>
        </tr>
    </table>
</div>
<script>
    function changeSearch(){
        $("#listform").submit();
    }
    window.onload=function(){
        let co = document.getElementById("code");
        if(${code==1}){
            btn.innerHTML="切换到已上架商品";

            co.setAttribute("value","1");
            btn.setAttribute("class","btn btn-danger");
        }else if(${code==0}){
            btn.innerHTML="切换到已下架商品";
            co.setAttribute("value","0");
            btn.setAttribute("class","btn btn-info");
        }else{
            btn.innerHTML="切换到已下架商品";
            co.setAttribute("value","0");
            btn.setAttribute("class","btn btn-info");
        }

    };


    let btn = document.getElementById("changeButton");
    btn.addEventListener("click",function () {
        let code = document.getElementById("code");
        if(btn.innerHTML==="切换到已下架商品"){
            btn.innerHTML="切换到已上架商品";
            code.setAttribute("value","1");
            btn.setAttribute("class","btn btn-danger")
        }else if(btn.innerHTML==="切换到已上架商品"){
            btn.innerHTML="切换到已下架商品";
            code.setAttribute("value","0");
            btn.setAttribute("class","btn btn-info")
        }
    })

</script>
</body>

</html>