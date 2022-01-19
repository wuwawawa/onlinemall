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
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/user/css/style.css">
    <script src="${ctx}/resource/user/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/resource/user/js/jquery.luara.0.0.1.min.js"></script>


    <link rel="stylesheet" href="${ctx}/resource/css/jyc.css"/>
    <link rel="stylesheet" href="${ctx}/resource/css/iconfont.css"/>
    <script src="${ctx}/resource/js/jyc.js"></script>
    <link rel="stylesheet" href="${ctx}/resource/css/index.css">
    <link  rel="stylesheet" type="text/css" href="${ctx}/resource/layui/css/layui.css"/>
    <script type="text/javascript" src="${ctx}/resource/layui/layui.js"></script>
</head>
<body>
    <%@include file="/common/utop.jsp"%>
    <div class="main">
        <div class="home-hero-container wrap">
            <div class="home-carousel">
                <div class="layui-carousel" id="test1" lay-filter="test1">
                    <div carousel-item >
                        <div>
                            <img src="${ctx}/resource/images/home-carousel1.jpg" style="height: 460px;width: 100%;margin-left: 0;"/>
                        </div>
                        <div>
                            <img src="${ctx}/resource/images/home-carouse2.jpg" style="height: 460px;width: 100%;margin-left: 0;"/>
                        </div>
                        <div>
                            <img src="${ctx}/resource/images/home-carouse3.jpg" style="height: 460px;width: 100%;margin-left: 0;"/>
                        </div>
                        <div>
                            <img src="${ctx}/resource/images/home-carouse4.jpg" style="height: 460px;width: 100%;margin-left: 0;"/>
                        </div>
                        <div>
                            <img src="${ctx}/resource/images/home-carouse5.jpg" style="height: 460px;width: 100%;margin-left: 0;"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="home-category">
                <ul>
                    <c:forEach items="${lbs}" var="data" varStatus="1">
                        <li class="nav-hover">
                            <a href="#">${data.father.name}<i class="iconfont">&#xe602;</i></a>
                            <div class="category-children">
                                <ul class="children-list">
                                    <c:forEach items="${data.childrens}" var="child" varStatus="ll">
                                        <li>
                                            <a href="${ctx}/item/shoplist?categoryIdTwo=${child.id}">
                                                <span>${child.name}</span>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <div>
    </div>

    <div class="width100 hidden_yh">
        <div class="width1200 center_yh hidden_yh">
            <a href="#" class="block_yh left_yh">
                <img src="${ctx}/resource/images/logo.png" alt="" style="height: 70px">
            </a>
            <div class="right_yh" style="height:28px;width:316px;border:2px solid #e0e0e0;margin-top:-40px; text-align: center">
                <form action="${ctx}/item/shoplist" method="post">
                    <input type="text" placeholder="商品查询" class="search" name="condition" value="${condition}">
                    <input type="submit" class="btnSearh" style="color: #b0b0b0; background:red;" value="搜 索">
                </form>
            </div>
        </div>
    </div>

<div class="width1200 center_yh hidden_yh">
    <div class="width100" style="height: 45px;line-height: 45px;border-bottom: 2px solid #dd4545; margin-top: 20px;">
        <font class="left_yh font20">折扣大促销</font>
    </div>
    <div class="width100 hidden_yh" style="height: 480px;">
        <div class="normalPic">
            <c:forEach items="${zks}" var="data" varStatus="l">
                <a href="${ctx}/item/view?id=${data.id}">
                    <h3 class="yihang c_33 font14 font100" style="padding-left: 10px;padding-right: 10px;">${data.name}</h3>
                    <p class="red font14" style="padding-left: 10px;">${data.price}</p>
                    <img src="${data.url1}" width="105" height="118" alt="" style="margin:0 auto">
                </a>
            </c:forEach>
        </div>
    </div>
</div>

<!--热门商品-->
<div class="width1200 center_yh hidden_yh">
    <div class="width100" style="height: 45px;line-height: 45px;border-bottom: 2px solid #dd4545; margin-top: 20px;">
        <font class="left_yh font20">热门商品</font>
    </div>
    <div class="width100 hidden_yh" style="height: 480px;">
        <div class="normalPic">
            <c:forEach items="${rxs}" var="data" varStatus="l">
                <a href="${ctx}/item/view?id=${data.id}">
                    <h3 class="yihang c_33 font14 font100" style="padding-left: 10px;padding-right: 10px;">${data.name}</h3>
                    <p class="red font14" style="padding-left: 10px;">${data.price}</p>
                    <img src="${data.url1}" width="105" height="118" alt="" style="margin:0 auto">
                </a>
            </c:forEach>
        </div>
    </div>
</div>
    <%@include file="/common/ufooter.jsp"%>

</body>

<script>
    layui.use('carousel', function(){
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1'
            ,height: '460px'
            ,width: '100%' //设置容器宽度
            ,arrow: 'always' //始终显示箭头
            //,anim: 'updown' //切换动画方式
        });
    });
    layui.use('element', function(){
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
        //监听导航点击
        element.on('nav(demo)', function(elem){
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
</html>

