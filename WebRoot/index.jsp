<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page pageEncoding="UTF-8"%>
<html>
	<head>
		<title>首页</title>
		<meta http-equiv="refresh" content="0;url=login/uIndex">
		<link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui-v2.5.6/css/layui.css" />
		<script src="https://www.layuicdn.com/layui-v2.5.6/layui.js"></script>
		<style type="text/css">
			*{
				margin: 0;
				padding: 0;
			}
			html,body{
				height: 100%;
			}
			#top {
					position: absolute;
					left: 50%;
					top: 50%;
					transform: translate(-50%, -50%);;

			}
			.myclass{
				background-image: url("${ctx}/resource/images/dlam.jpg");
				background-repeat: no-repeat;
				height: 100%;
				width: 100%;
				background-size: 100%;
				filter: alpha(opacity=50);
				-moz-opacity:0.5;
				-khtml-opacity: 0.5;
				opacity: 0.5;
				position:absolute;
			}
		</style>
	</head>
	<body>

		<div style="text-align: center" class="myclass">
			<div id="top" >
				<h2 style="color: green;text-align: center">正在前往首页请稍后....</h2>
				<i class="layui-icon layui-icon-loading" style="font-size: 90px; color: green; text-align: center"></i>
			</div>

		</div>


	</body>
</html>
