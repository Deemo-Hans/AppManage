/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2020-02-09 11:35:13 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Calendar;
import java.text.SimpleDateFormat;
import java.util.Date;

public final class UpdateAppVer_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <title>修改APP版本信息</title>\r\n");
      out.write("    <title>条件查询</title>\r\n");
      out.write("    <!--jquery导入-->\r\n");
      out.write("    <script type=\"text/javascript\" src=\"../statics/js/jquery-3.4.1.min.js\"></script>\r\n");
      out.write("    <!--jquery导入 结束-->\r\n");
      out.write("    <!--layui引入-->\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../statics/layui/css/layui.css\">\r\n");
      out.write("    <script src=\"../statics/layui/layui.js\"></script>\r\n");
      out.write("    <!--layui引入 结束-->\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<h1>APP历史版本信息</h1>\r\n");
      out.write("<hr/>\r\n");
      out.write("<form id=\"form2\">\r\n");
      out.write("    <input type=\"hidden\" name=\"appid\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${appid1}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\">\r\n");
      out.write("    <input type=\"hidden\" name=\"page\" id=\"page\" value=\"1\">\r\n");
      out.write("    <input type=\"hidden\" name=\"pageSize\" id=\"pageSize\" value=\"3\">\r\n");
      out.write("</form>\r\n");
      out.write("<div style=\"padding-bottom: 30px\">\r\n");
      out.write("    <div>\r\n");
      out.write("        <table name=\"appVerInfo\" id=\"appHistoryInfo\" class=\"layui-table\" ></table>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div id=\"pagei\" style=\"text-align: center\">\r\n");
      out.write("        <button type=\"button\" class=\"layui-btn\" onclick=\"firstPage()\">首页</button>\r\n");
      out.write("        <button type=\"button\" class=\"layui-btn\" onclick=\"prePage()\">上一页</button>\r\n");
      out.write("        <span id=\"pagen\"></span>\r\n");
      out.write("        <button type=\"button\" class=\"layui-btn\" onclick=\"nextPage()\">下一页</button>\r\n");
      out.write("        <button type=\"button\" class=\"layui-btn\" onclick=\"lastPage()\">尾页</button>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("<h1>修改当前版本信息</h1>\r\n");
      out.write("<hr/>\r\n");
      out.write("<form>\r\n");
      out.write("    修改APP的应用版本<select name=\"select1\" id=\"select1\" onchange=\"versionBind()\"></select>\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
      out.write("<form class=\"layui-form\" action=\"/UpdateVer\" method=\"post\">\r\n");
      out.write("    <div class=\"layui-form-item\">\r\n");
      out.write("        <label class=\"layui-form-label\">版本号*</label>\r\n");
      out.write("        <div class=\"layui-input-inline\">\r\n");
      out.write("            <input type=\"text\" name=\"versionno\" required  lay-verify=\"required\" autocomplete=\"off\" class=\"layui-input\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${oneVersion.versionno}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\">\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"layui-form-item\">\r\n");
      out.write("        <label class=\"layui-form-label\">版本大小*</label>\r\n");
      out.write("        <div class=\"layui-input-inline\">\r\n");
      out.write("            <input type=\"text\" name=\"versionsize\" required  lay-verify=\"required\"  autocomplete=\"off\" class=\"layui-input\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${oneVersion.versionsize}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\">\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"layui-form-item\">\r\n");
      out.write("        <label class=\"layui-form-label\">发布状态*</label>\r\n");
      out.write("        <div class=\"layui-input-inline\">\r\n");
      out.write("            <input type=\"text\" name=\"\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${oneVersion.v_publishstatus}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\" style=\"border: 0px none\" readonly=\"readonly\">\r\n");
      out.write("            <input type=\"hidden\" name=\"publishstatus\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${oneVersion.publishstatus}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\">\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"layui-form-item\">\r\n");
      out.write("        <label class=\"layui-form-label\">版本介绍*</label>\r\n");
      out.write("        <div class=\"layui-input-inline\">\r\n");
      out.write("            <textarea name=\"versioninfo\" required lay-verify=\"required\"  class=\"layui-textarea\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${oneVersion.versioninfo}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</textarea>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"layui-form-item\" id=\"fileUp\">\r\n");
      out.write("        <label class=\"layui-form-label\">apk文件*</label>\r\n");
      out.write("        <div class=\"layui-input-inline\">\r\n");
      out.write("            <button type=\"button\" class=\"layui-btn\" id=\"upLoad\">\r\n");
      out.write("                <i class=\"layui-icon\">&#xe67c;</i>上传文件\r\n");
      out.write("            </button>\r\n");
      out.write("            <input type='text' value=\"\" name='apkfilename' id='apkfilename' style=\"border: 0px\">\r\n");
      out.write("            <input type='hidden' value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${oneVersion.downloadlink}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\" name='downloadlink' id='downloadlink'>\r\n");
      out.write("            <input type='hidden' value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${oneVersion.downloadlink}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\" name='old' id='old'>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <input type=\"hidden\" name=\"id\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${oneVersion.id}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\">\r\n");
      out.write("\r\n");
      out.write("    <div>\r\n");
      out.write("        <button class=\"layui-btn\" lay-submit >修改</button>\r\n");
      out.write("        <a href=\"/user/SelectInfo.jsp\" class=\"layui-btn\">返回</a>\r\n");
      out.write("    </div>\r\n");
      out.write("</form>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("<!--框架模板及监听-->\r\n");
      out.write("<script>\r\n");
      out.write("    //框架模板及监听\r\n");
      out.write("    layui.use('form', function(){\r\n");
      out.write("        var form = layui.form;\r\n");
      out.write("        //监听提交\r\n");
      out.write("        form.on('submit(formDemo)', function(data){\r\n");
      out.write("            layer.msg(JSON.stringify(data.field));\r\n");
      out.write("            return false;\r\n");
      out.write("        });\r\n");
      out.write("    });\r\n");
      out.write("    //文件上传模块\r\n");
      out.write("    layui.use('upload', function(){\r\n");
      out.write("        var upload = layui.upload;\r\n");
      out.write("        //执行实例\r\n");
      out.write("        var uploadInst = upload.render({\r\n");
      out.write("            elem: '#upLoad' //绑定元素\r\n");
      out.write("            ,url: '/upLoadAPK' //上传接口\r\n");
      out.write("            ,accept:'file'\r\n");
      out.write("            ,done: function(res){\r\n");
      out.write("                <!--下载地址-->\r\n");
      out.write("                $(\"#downloadlink\").val(res.data.src);\r\n");
      out.write("                <!--APK名称-->\r\n");
      out.write("                $(\"#apkfilename\").val(res.data.fileName);\r\n");
      out.write("            }\r\n");
      out.write("            ,error: function(){\r\n");
      out.write("                alert(\"上传失败\")  //请求异常回调\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("    });\r\n");
      out.write("</script>\r\n");
      out.write("<!--框架模板及监听 結束-->\r\n");
      out.write("<!--js部分-->\r\n");
      out.write("<script>\r\n");
      out.write("    $(function () {\r\n");
      out.write("        selectHistoryVer()\r\n");
      out.write("    })\r\n");
      out.write("    //查询APP历史版本信息\r\n");
      out.write("    function selectHistoryVer()\r\n");
      out.write("    {\r\n");
      out.write("        var form=$(\"#form2\").serialize();\r\n");
      out.write("        $.post(\"/selectHistoryVer\",form,function(data){\r\n");
      out.write("            $(\"#appHistoryInfo\").html(null);\r\n");
      out.write("            $(\"#appHistoryInfo\").html(\"<tr><td>软件名称</td><td>版本号</td><td>版本大小</td><td>发布状态</td><td>APK文件下载</td><td>最新更新时间</td></tr>\");\r\n");
      out.write("            for (var i=0;i<data.list.length;i++)\r\n");
      out.write("            {\r\n");
      out.write("                var date=new Date(data.list[i].creationdate);\r\n");
      out.write("                var year=date.getFullYear();//年\r\n");
      out.write("                var month=date.getMonth();//月\r\n");
      out.write("                var day=date.getDate();//日\r\n");
      out.write("                var table=\"<tr><td>\"+data.list[i].v_softwareName+\"</td>\" +\r\n");
      out.write("                    \"<td>\"+data.list[i].versionno+\"</td>\"+\r\n");
      out.write("                    \"<td>\"+data.list[i].versionsize+\"M</td>\" +\r\n");
      out.write("                    \"<td>\"+data.list[i].v_publishstatus+\"</td>\" +\r\n");
      out.write("                    \"<td><a>\"+data.list[i].apkfilename+\"<a></td>\" +\r\n");
      out.write("                    \"<td>\"+year+\"年\"+month+\"月\"+day+\"日</td></tr>\"\r\n");
      out.write("                $(\"#appHistoryInfo\").append(table) ;\r\n");
      out.write("                $(\"#pagen\").html(\"第\"+data.pageNum+\"页/共\"+data.pages+\"页\")\r\n");
      out.write("            }\r\n");
      out.write("            //app版本绑定\r\n");
      out.write("            for(var i=0;i<data.list.length;i++)\r\n");
      out.write("            {\r\n");
      out.write("                var option=\"<option value=\"+data.list[i].id+\">\"+data.list[i].versionno+\"</option>\"\r\n");
      out.write("                $(\"#select1\").append(option);\r\n");
      out.write("                layui.form.render(\"select\");//菜单渲染 把内容加载进去\r\n");
      out.write("            }\r\n");
      out.write("        },\"json\");\r\n");
      out.write("    }\r\n");
      out.write("    //获取pageinfo\r\n");
      out.write("    function getPageInfo()\r\n");
      out.write("    {\r\n");
      out.write("        var getPageInfo=new Object();\r\n");
      out.write("        var form=$(\"#form2\").serialize();\r\n");
      out.write("        $.ajaxSettings.async = false;//同步ajax请求\r\n");
      out.write("        $.post(\"/selectHistoryVer\",form,function(data){\r\n");
      out.write("            getPageInfo=data;\r\n");
      out.write("        },\"json\");\r\n");
      out.write("        $.ajaxSettings.async = true;//恢复异步ajax请求\r\n");
      out.write("        return getPageInfo;\r\n");
      out.write("    }\r\n");
      out.write("    //首页\r\n");
      out.write("    function firstPage() {\r\n");
      out.write("        var getPageInfo1=getPageInfo();\r\n");
      out.write("        $(\"#page\").val(getPageInfo1.firstPage);\r\n");
      out.write("        selectHistoryVer();\r\n");
      out.write("    }\r\n");
      out.write("    //尾页\r\n");
      out.write("    function lastPage() {\r\n");
      out.write("        var getPageInfo1=getPageInfo();\r\n");
      out.write("        $(\"#page\").val(getPageInfo1.lastPage);\r\n");
      out.write("        selectHistoryVer();\r\n");
      out.write("    }\r\n");
      out.write("    //上一页\r\n");
      out.write("    function prePage() {\r\n");
      out.write("        var getPageInfo1=getPageInfo();\r\n");
      out.write("        $(\"#page\").val(getPageInfo1.prePage==0?1:getPageInfo1.prePage);\r\n");
      out.write("        selectHistoryVer();\r\n");
      out.write("    }\r\n");
      out.write("    //下一页\r\n");
      out.write("    function  nextPage() {\r\n");
      out.write("        var getPageInfo1=getPageInfo();\r\n");
      out.write("        $(\"#page\").val(getPageInfo1.nextPage==0?1:getPageInfo1.nextPage);\r\n");
      out.write("        selectHistoryVer();\r\n");
      out.write("    }\r\n");
      out.write("    //绑定版本\r\n");
      out.write("    function versionBind()\r\n");
      out.write("    {\r\n");
      out.write("       var num= $(\"#select1\").val();\r\n");
      out.write("        alert(num);\r\n");
      out.write("        $.post(\"/versionBind\",\"id=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${appid1}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("&select1=\"+num,function(data){\r\n");
      out.write("            alert(\"修改完毕\")\r\n");
      out.write("        })\r\n");
      out.write("    }\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}