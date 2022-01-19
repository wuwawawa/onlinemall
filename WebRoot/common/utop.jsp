<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<link  rel="stylesheet" type="text/css" href="${ctx}/resource/layui/css/layui.css"/>
<script type="text/javascript" src="${ctx}/resource/layui/layui.js"/>
<script type="text/javascript">
        layui.use('element', function(){
                var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
                //监听导航点击
                element.on('nav(demo)', function(elem){
                        //console.log(elem)
                        layer.msg(elem.text());
                });
        });
</script>

<c:if test="${type==1}">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <div class="layui-logo">小米导航</div>
            <ul class="layui-nav  layui-layout-left">
                <li class="layui-nav-item layui-this"><a href="${ctx}/login/uIndex">首页</a></li>
                <li class="layui-nav-item"><a href="${ctx}/message/add">留言</a></li>
                <li class="layui-nav-item"><a href="${ctx}/community/toPostIndex?code=0">社区</a></li>
                <li class="layui-nav-item"><a href="${ctx}/community/estimate">评价</a></li>
            </ul>
            <ul class="layui-nav layui-layout-right">
                <c:if test="${userId!=null}">
                    <li class="layui-nav-item"><a href="#">欢迎您：${username}</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/login/uTui">退出</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/car/findBySql">我的购物车</a></li>
                </c:if>
                <c:if test="${userId==null}">
                    <li class="layui-nav-item"><a href="${ctx}/login/sLogin">商家登录</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/login/uLogin">用户登录</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/login/res">注册</a></li>
                </c:if>
                <li class="layui-nav-item"><a href="${ctx}/user/view">个人中心</a></li>
            </ul>
        </div>
    </div>
</c:if>
<c:if test="${type==2}">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <div class="layui-logo">小米导航</div>
            <ul class="layui-nav  layui-layout-left">
                <li class="layui-nav-item"><a href="${ctx}/login/uIndex">首页</a></li>
                <li class="layui-nav-item"><a href="${ctx}/message/add">留言</a></li>
                <li class="layui-nav-item layui-this"><a href="${ctx}/community/toPostIndex?code=0">社区</a></li>
                <li class="layui-nav-item"><a href="${ctx}/community/estimate">评价</a></li>
            </ul>
            <ul class="layui-nav layui-layout-right">
                <c:if test="${userId!=null}">
                    <li class="layui-nav-item"><a href="#">欢迎您：${username}</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/login/uTui">退出</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/car/findBySql">我的购物车</a></li>
                </c:if>
                <c:if test="${userId==null}">
                    <li class="layui-nav-item"><a href="${ctx}/login/sLogin">商家登录</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/login/uLogin">用户登录</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/login/res">注册</a></li>
                </c:if>
                <li class="layui-nav-item"><a href="${ctx}/user/view">个人中心</a></li>
            </ul>
        </div>
    </div>

</c:if>
<c:if test="${type==3}">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <div class="layui-logo">小米导航</div>
            <ul class="layui-nav  layui-layout-left">
                <li class="layui-nav-item"><a href="${ctx}/login/uIndex">首页</a></li>
                <li class="layui-nav-item  layui-this"><a href="${ctx}/message/add">留言</a></li>
                <li class="layui-nav-item"><a href="${ctx}/community/toPostIndex?code=0">社区</a></li>
                <li class="layui-nav-item"><a href="${ctx}/community/estimate">评价</a></li>
            </ul>
            <ul class="layui-nav layui-layout-right">
                <c:if test="${userId!=null}">
                    <li class="layui-nav-item"><a href="#">欢迎您：${username}</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/login/uTui">退出</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/car/findBySql">我的购物车</a></li>
                </c:if>
                <c:if test="${userId==null}">
                    <li class="layui-nav-item"><a href="${ctx}/login/sLogin">商家登录</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/login/uLogin">用户登录</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/login/res">注册</a></li>
                </c:if>
                <li class="layui-nav-item"><a href="${ctx}/user/view">个人中心</a></li>
            </ul>
        </div>
    </div>
</c:if>
<c:if test="${type==4}">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <div class="layui-logo">小米导航</div>
            <ul class="layui-nav  layui-layout-left">
                <li class="layui-nav-item"><a href="${ctx}/login/uIndex">首页</a></li>
                <li class="layui-nav-item"><a href="${ctx}/message/add">留言</a></li>
                <li class="layui-nav-item"><a href="${ctx}/community/toPostIndex?code=0">社区</a></li>
                <li class="layui-nav-item layui-this"><a href="${ctx}/community/estimate">评价</a></li>
            </ul>
            <ul class="layui-nav layui-layout-right">
                <c:if test="${userId!=null}">
                    <li class="layui-nav-item"><a href="#">欢迎您：${username}</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/login/uTui">退出</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/car/findBySql">我的购物车</a></li>
                </c:if>
                <c:if test="${userId==null}">
                    <li class="layui-nav-item"><a href="${ctx}/login/sLogin">商家登录</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/login/uLogin">用户登录</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/login/res">注册</a></li>
                </c:if>
                <li class="layui-nav-item"><a href="${ctx}/user/view">个人中心</a></li>
            </ul>
        </div>
    </div>
</c:if>
<c:if test="${type==5}">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <div class="layui-logo">小米导航</div>
            <ul class="layui-nav  layui-layout-left">
                <li class="layui-nav-item"><a href="${ctx}/login/uIndex">首页</a></li>
                <li class="layui-nav-item"><a href="${ctx}/message/add">留言</a></li>
                <li class="layui-nav-item"><a href="${ctx}/community/toPostIndex?code=0">社区</a></li>
                <li class="layui-nav-item"><a href="${ctx}/community/estimate">评价</a></li>
            </ul>
            <ul class="layui-nav layui-layout-right">
                <c:if test="${userId!=null}">
                    <li class="layui-nav-item"><a href="#">欢迎您：${username}</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/login/uTui">退出</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/car/findBySql">我的购物车</a></li>
                </c:if>
                <c:if test="${userId==null}">
                    <li class="layui-nav-item  layui-this"><a href="${ctx}/login/sLogin">商家登录</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/login/uLogin">用户登录</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/login/res">注册</a></li>
                </c:if>
                <li class="layui-nav-item"><a href="${ctx}/user/view">个人中心</a></li>
            </ul>
        </div>
    </div>
</c:if>
<c:if test="${type==6}">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <div class="layui-logo">小米导航</div>
            <ul class="layui-nav  layui-layout-left">
                <li class="layui-nav-item"><a href="${ctx}/login/uIndex">首页</a></li>
                <li class="layui-nav-item"><a href="${ctx}/message/add">留言</a></li>
                <li class="layui-nav-item"><a href="${ctx}/community/toPostIndex?code=0">社区</a></li>
                <li class="layui-nav-item"><a href="${ctx}/community/estimate">评价</a></li>
            </ul>
            <ul class="layui-nav layui-layout-right">
                <c:if test="${userId!=null}">
                    <li class="layui-nav-item"><a href="#">欢迎您：${username}</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/login/uTui">退出</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/car/findBySql">我的购物车</a></li>
                </c:if>
                <c:if test="${userId==null}">
                    <li class="layui-nav-item"><a href="${ctx}/login/sLogin">商家登录</a></li>
                    <li class="layui-nav-item layui-this"><a href="${ctx}/login/uLogin">用户登录</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/login/res">注册</a></li>
                </c:if>
                <li class="layui-nav-item"><a href="${ctx}/user/view">个人中心</a></li>
            </ul>
        </div>
    </div>
</c:if>
<c:if test="${type==7}">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <div class="layui-logo">小米导航</div>
            <ul class="layui-nav  layui-layout-left">
                <li class="layui-nav-item"><a href="${ctx}/login/uIndex">首页</a></li>
                <li class="layui-nav-item"><a href="${ctx}/message/add">留言</a></li>
                <li class="layui-nav-item"><a href="${ctx}/community/toPostIndex?code=0">社区</a></li>
                <li class="layui-nav-item"><a href="${ctx}/community/estimate">评价</a></li>
            </ul>
            <ul class="layui-nav layui-layout-right">
                <c:if test="${userId!=null}">
                    <li class="layui-nav-item"><a href="#">欢迎您：${username}</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/login/uTui">退出</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/car/findBySql">我的购物车</a></li>
                </c:if>
                <c:if test="${userId==null}">
                    <li class="layui-nav-item"><a href="${ctx}/login/sLogin">商家登录</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/login/uLogin">用户登录</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/login/res">注册</a></li>
                </c:if>
                <li class="layui-nav-item layui-this"><a href="${ctx}/user/view">个人中心</a></li>
            </ul>
        </div>
    </div>
</c:if>
<c:if test="${type==8}">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <div class="layui-logo">小米导航</div>
            <ul class="layui-nav  layui-layout-left">
                <li class="layui-nav-item"><a href="${ctx}/login/uIndex">首页</a></li>
                <li class="layui-nav-item"><a href="${ctx}/message/add">留言</a></li>
                <li class="layui-nav-item"><a href="${ctx}/community/toPostIndex?code=0">社区</a></li>
                <li class="layui-nav-item"><a href="${ctx}/community/estimate">评价</a></li>
            </ul>
            <ul class="layui-nav layui-layout-right">
                <c:if test="${userId!=null}">
                    <li class="layui-nav-item"><a href="#">欢迎您：${username}</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/login/uTui">退出</a></li>
                    <li class="layui-nav-item layui-this"><a href="${ctx}/car/findBySql">我的购物车</a></li>
                </c:if>
                <c:if test="${userId==null}">
                    <li class="layui-nav-item"><a href="${ctx}/login/sLogin">商家登录</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/login/uLogin">用户登录</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/login/res">注册</a></li>
                </c:if>
                <li class="layui-nav-item"><a href="${ctx}/user/view">个人中心</a></li>
            </ul>
        </div>
    </div>
</c:if>
<c:if test="${type==9}">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <div class="layui-logo">小米导航</div>
            <ul class="layui-nav  layui-layout-left">
                <li class="layui-nav-item"><a href="${ctx}/login/uIndex">首页</a></li>
                <li class="layui-nav-item"><a href="${ctx}/message/add">留言</a></li>
                <li class="layui-nav-item"><a href="${ctx}/community/toPostIndex?code=0">社区</a></li>
                <li class="layui-nav-item"><a href="${ctx}/community/estimate">评价</a></li>
            </ul>
            <ul class="layui-nav layui-layout-right">
                <c:if test="${userId!=null}">
                    <li class="layui-nav-item"><a href="#">欢迎您：${username}</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/login/uTui">退出</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/car/findBySql">我的购物车</a></li>
                </c:if>
                <c:if test="${userId==null}">
                    <li class="layui-nav-item"><a href="${ctx}/login/sLogin">商家登录</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/login/uLogin">用户登录</a></li>
                    <li class="layui-nav-item"><a href="${ctx}/login/res">注册</a></li>
                </c:if>
                <li class="layui-nav-item"><a href="${ctx}/user/view">个人中心</a></li>
            </ul>
        </div>
    </div>
</c:if>