<%--
  Created by IntelliJ IDEA.
  User: 50692
  Date: 2020/1/7
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <!--layui引入-->
    <link rel="stylesheet" href="../statics/layui/css/layui.css">
    <script src="../statics/layui/layui.js"></script>
    <!--layui引入 结束-->
</head>
<body>
<!--head-->
<div class="layui-bg-cyan layui-row">
 <div class="layui-col-xs12 layui-col-md12 layui-col-lg-offset4" style="height:40px;"><span style="font-size: 20px;">欢迎使用APP管理系统(管理员)</span> </div>
</div>
<!--head end-->
<%--    表单部分--%>
<div class="layui-row">
    <div class="layui-col-xs12 layui-col-md12 layui-col-lg-offset4" style="padding-top: 20px;">
        <form class="layui-form" action="/backendUserCheck" method="post" onsubmit="return checkSub()">
            <div class="layui-form-item">
                <label class="layui-form-label"><i class="layui-icon layui-icon-username" style="font-size: 20px; color: black;"></i></label>
                <div class="layui-input-inline">
                    <input type="text" required  lay-verify="required" placeholder="用户名" autocomplete="off" class="layui-input" name="usercode" id="usercode" onblur="checkUname()">
                </div><span id="uspan"></span>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><i class="layui-icon layui-icon-password" style="font-size: 20px; color: black;"></i></label>
                <div class="layui-input-inline">
                    <input type="password"  required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" name="userpassword" id="userpassword" onblur="checkPwd()">
                </div><span id="pspan"></span>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">登录</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
<!--foot-->
<div class="layui-bg-cyan layui-row">
    <div class="layui-col-xs12 layui-col-md12" style="height:20px;font-size: 12px;text-align: right">@2020 版权所有 </div>
</div>
<!--foot end-->
</body>
</html>
<script>
    //用户名
    function checkUname(){
        //获取用户获得用户名信息
        var uname=document.getElementById("username").value;
        //创建校验规则,用户名4-16位
        var reg=/^[a-zA-Z0-9_-]{4,16}$/
        //获取span对象
        var unameSpan=document.getElementById("uspan");
        //开始交验
        if(unameSpan==""||unameSpan==null){
            //输入校验结果
            unameSpan.innerHTML="*用户名不能为空,用户名4-16位";
            unameSpan.style.color="red";
            return false;
        }else if(reg.test(uname)){
            //输入校验结果
            unameSpan.innerHTML="*用户名通过";
            unameSpan.style.color="green";
            return true;
        }else{
            //输入校验结果
            unameSpan.innerHTML="*用户名格式不符,用户名4-16位"
            unameSpan.style.color="red";
            return false;
        }

    }
    //验证密码
    function checkPwd() {
        //获取用户获得用户名信息
        var upwd = document.getElementById("password").value;
        //创建校验规则,密码要求6-16位，首位为字母
        var reg = /^\w{6,16}$/;
        //获取span对象
        var span = document.getElementById("pspan");
        //开始交验
        if (span == "" || span == null) {
            //输入校验结果
            span.innerHTML = "*密码不能为空,密码要求6-16位";
            span.style.color = "red";
            return false;
        } else if (reg.test(upwd)) {
            //输入校验结果
            span.innerHTML = "*密码通过";
            span.style.color = "green";
            return true;
        } else {
            //输入校验结果
            span.innerHTML = "*密码格式不符,密码要求6-16位"
            span.style.color = "red";
            return false;
        }
    }
    //提交判断
    function checkSub(){
        checkUname();
        checkPwd();
        return checkUname()&&checkPwd();
    }
</script>
