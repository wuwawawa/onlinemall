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

    <style type="text/css">
        a{
            text-decoration: none;
        }

    </style>

</head>
<body>
<div class="panel admin-panel">
    <form action="${ctx}/seller/findBySql" id="listform" method="post">
        <div class="padding border-bottom">
            <ul class="search" style="padding-left: 10px;">
                <li>
                    <input type="text" placeholder="商家名" name="sellerName" class="input"  value="${obj.sellerName}"
                           style="width: 250px;line-height: 17px;display: inline-block" />
                    <button class="btn btn-info" id="changeButton">切换到已删除商家</button>
                    <a href="javascript:void(0)" onclick="changeSearch()" class="button border-main icon-search">搜索</a>
                </li>

            </ul>
            <input type="hidden" name="code" value="0" id="code"/>
        </div>
    </form>
    <table class="table table-hover text-center">
        <tr>
            <th>商家编号</th>
            <th>商家名</th>
            <th>真实姓名</th>
            <th>身份证号</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${pagers.datas}" var="data" varStatus="l">
            <tr>
                <td>${data.id}</td>
               <td>${data.sellerName}</td>
                <td>${data.realName}</td>
                <td>${data.idNum}</td>
                <td>
                    <a class="button border-main" href="${ctx}/seller/findPersonInf?id=${data.id}&type=1"><span class="icon-edit">查看详细信息</span> </a>
                    <c:if test="${code==0}">
                        <a class="button border-red" href="${ctx}/seller/deleteSeller?id=${data.id}"><span class="icon-trash-o">删除商家</span> </a>
                    </c:if>
                    <c:if test="${code==1}">
                        <a class="button border-green" href="${ctx}/seller/unsealSeller?id=${data.id}"><span class="icon-trash-o">恢复商家</span> </a>
                    </c:if>

                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="8">
                <div class="pagelist">
                    <!--分页开始-->
                    <pg:pager url="${ctx}/seller/findBySql" maxIndexPages="5" items="${pagers.total}" maxPageItems="15" export="curPage=pageNumber">
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
                btn.innerHTML="切换到未删除商家";
                co.setAttribute("value","1");
                btn.setAttribute("class","btn btn-danger");
            }else if(${code==0}){
                btn.innerHTML="切换到已删除商家";
                co.setAttribute("value","0");
                btn.setAttribute("class","btn btn-info");
            }else{
                btn.innerHTML="切换到已删除商家";
                co.setAttribute("value","0");
                btn.setAttribute("class","btn btn-info");
            }

        };




        let btn = document.getElementById("changeButton");
        btn.addEventListener("click",function () {
            let code = document.getElementById("code");
            if(btn.innerHTML==="切换到已删除商家"){
                btn.innerHTML="切换到未删除商家";
                code.setAttribute("value","1");
                btn.setAttribute("class","btn btn-danger")
            }else if(btn.innerHTML==="切换到未删除商家"){
                btn.innerHTML="切换到已删除商家";
                code.setAttribute("value","0");
                btn.setAttribute("class","btn btn-info")
            }
        })








</script>
</body>

</html>