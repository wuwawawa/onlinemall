<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>我要评论</title>
    <link rel="stylesheet" href="${ctx}/resource/css/pintuer.css">
    <link rel="stylesheet" href="${ctx}/resource/css/admin.css">
    <script src="${ctx}/resource/js/jquery.js"></script>
    <script src="${ctx}/resource/js/pintuer.js"></script>
    <script type="text/javascript" src="${ctx}/resource/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${ctx}/resource/ueditor/ueditor.all.min.js"></script>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
    <script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="${ctx}/resource/user/js/jquery-1.8.3.min.js"></script>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
        html,body{
            height: 100%;
        }
        .myclass{
            height: 100%;
            width: 100%;
            background-size: 100%;
        }
    </style>
</head>
<body>
<%@include file="/common/utop.jsp"%>
<div class="panel admin-panel myclass" >
    <div class="body-content">

        <div  id="return" class="field" style="margin-left: 140px;margin-bottom: 10px">
            <button id="reBack" class="button bg-main icon-check-square-o">返回</button>
        </div>
        <form action="${ctx}/community/exAddReview" method="post" class="form-x" enctype="multipart/form-data" >
            <input type="hidden" name="postId" value="${postId}"/>
            <div class="form-group">
                <div class="label"><label>内容：</label></div>
                <div class="field">
                    <script type="text/plain" id="remark_txt_1" name="content" style="width: 100%;height: 300px;"></script>
                    <script type="text/javascript">
                        var editor = UE.getEditor('remark_txt_1');
                        UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
                        UE.Editor.prototype.getActionUrl = function (action) {
                            if(action == 'uploadimage' || action == 'uploadscrawl' || action == 'uploadvideo'){
                                return '${ctx}/ueditor/saveFile';
                            }else{
                                return this._bkGetActionUrl.call(this,action);
                            }
                        }
                    </script>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group" style="text-align: center">
                <div class="label"></div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit" onclick="x()">提交</button>
                </div>
            </div>

        </form>
    </div>
</div>
<script type="text/javascript">
    let btn = document.getElementById("reBack");
    btn.addEventListener("click",function () {
        window.history.back();
    });
    function x() {
        alert("评论成功!")
    }


</script>

</body>
</html>