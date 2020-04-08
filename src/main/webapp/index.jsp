<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>入口选择</title>
    <!--layui引入-->
    <link rel="stylesheet" href="../statics/layui/css/layui.css">
    <script src="../statics/layui/layui.js"></script>
    <!--layui引入 结束-->
</head>
<body>
<div class="layui-row" >
<div class="layui-col-xs12 layui-col-md12">
<table align="center" border="1px" style="margin-top: 20%">
    <tr class="layui-bg-black"><td colspan="2">
<div align="center">
    <h1>请选择登录入口</h1>
</div>
    </td>
    </tr>
    <tr align="center"><td> <button class="layui-btn layui-btn-lg layui-btn-normal"  onclick="location.href='manage/ManageLogin.jsp'"><i class="layui-icon layui-icon-chat" style="font-size: 25px; color: black;"></i>管理员入口</button></td>
    <td><button class="layui-btn layui-btn-lg layui-btn-normal"  onclick="location.href='user/UserLogin.jsp'"><i class="layui-icon layui-icon-user" style="font-size: 25px; color: black;"></i>开发者入口</button></td></tr>
</table>
</div>
</div>
</body>
</html>
