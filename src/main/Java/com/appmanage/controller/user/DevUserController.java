package com.appmanage.controller.user;

import com.appmanage.entity.AppVersion;
import com.appmanage.entity.DevUser;
import com.appmanage.service.user.DevUserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author ：赵成龙
 * @date ：Created in 2020/1/10 11:17
 * @description：
 * @version: $
 */
@Controller
public class DevUserController {
    @Autowired
    private DevUserService devUserService;

    //开发者登录查询
    @RequestMapping("/devUserCheck")
    public String backendUserCheck(DevUser du, HttpSession session) {
        if(devUserService.selectLogin(du)!=null){
            session.setAttribute("userSession",devUserService.selectLogin(du));
            return "user/MainMenu";
        } else {
            return "user/UserLogin";
        }
    }

    //删除app及版本信息
    @RequestMapping("/delApp")
    @ResponseBody
    public void delApp(Long id) {
        devUserService.delApp(id);//删除app与版本
    }

    //查单条
    @RequestMapping("/selectOne")
    public String selectOne(Model m, Long id) {
        m.addAttribute("selectOne", devUserService.selectOne(id));
        return "/user/AppInfo";
    }

    //查询历史版本
    @RequestMapping("/selectHistoryVer")
    @ResponseBody
    public PageInfo selectHistoryVer(Long appid, Integer page, Integer pageSize) {
        return devUserService.selectHistoryVer(appid, page, pageSize);
    }

    //修改APP版本信息查单条
    @RequestMapping("/selectUpdateVer")
    public String selectUpdateVer(Long appid, Integer page, Integer pageSize, Model m) {
        m.addAttribute("oneVersion", devUserService.selectUpdateVer(appid));
        m.addAttribute("page", page);
        m.addAttribute("pageSize", pageSize);
        m.addAttribute("appid1",appid);
        return "/user/UpdateAppVer";
    }

    //修改APP版本信息
    @RequestMapping("/UpdateVer")
    public String updateVer(AppVersion av,String old) {
        av.setModifydate(new Date(System.currentTimeMillis()));
        if(av.getDownloadlink().equals("")||av.getDownloadlink()==null)
        {
            av.setDownloadlink(old);
        }
        if(!av.getDownloadlink().equals(old)) {
            File file = new File(old);
            file.delete();
            System.out.println("删除完毕");
        }
        else
        {
            System.out.println("未执行");
        }
        int temp = devUserService.updateVer(av);
        if (temp > 0) {
            return "redirect:/user/SelectInfo.jsp";
        } else {
            return "redirect:/user/SelectInfo.jsp";
        }
    }

    //APK文件上传接口
    @RequestMapping("/upLoadAPK")
    @ResponseBody
    public Map<String, Object> upLoadVerFile(@RequestParam(value = "file", required = false) CommonsMultipartFile file, HttpServletRequest request) {
        try {
            //获取保存位置将相对路径转化为绝对路径
            String path = request.getSession().getServletContext().getRealPath("/upload/apk");
            //设置保存文件
            String uploadFileName = file.getOriginalFilename();
         /*   String expname = uploadFileName.substring(uploadFileName.lastIndexOf("."));
            //生成唯一文件名称
            String fileName = System.currentTimeMillis() + expname;*/
            String savePos = path + "/" + uploadFileName;
            File saveFile = new File(savePos);  //创建保存文件
            file.transferTo(saveFile);  //上传
            Map<String, Object> map = new HashMap<String, Object>();
            Map<String, Object> map1 = new HashMap<String, Object>();
            map1.put("src", "/"+savePos);
            map1.put("fileName", uploadFileName);
            map.put("data", map1);
            map.put("code", 0);
            map.put("msg", "");
            return map;  //返回页面
        } catch (Exception e) {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("data", "错误");
            map.put("code", 0);
            map.put("msg", "");
            return map;
        }
    }

    //图片文件上传接口
    @RequestMapping("/upLoadIMG")
    @ResponseBody
    public Map<String, Object> upLoadImg(@RequestParam(value = "file", required = false) CommonsMultipartFile file, HttpServletRequest request) {
        try {
            //获取保存位置将相对路径转化为绝对路径
            String path = request.getSession().getServletContext().getRealPath("/upload/apk");
            //设置保存文件
            String uploadFileName = file.getOriginalFilename();
            String expname = uploadFileName.substring(uploadFileName.lastIndexOf("."));
            //生成唯一文件名称
            String fileName = System.currentTimeMillis() + expname;
            String savePos = path + "/" + fileName;
            File saveFile = new File(savePos);  //创建保存文件
            file.transferTo(saveFile);  //上传
            Map<String, Object> map = new HashMap<String, Object>();
            Map<String, Object> map1 = new HashMap<String, Object>();
            map1.put("src", "upload/" + uploadFileName);
            map1.put("fileName", uploadFileName);
            map.put("data", map1);
            map.put("code", 0);
            map.put("msg", "");
            return map;  //返回页面
        } catch (Exception e) {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("data", "错误");
            map.put("code", 0);
            map.put("msg", "");
            return map;
        }
    }
    //添加app版本信息
    @RequestMapping("/addVer")
    public String addVer(AppVersion av)
    {
        av.setCreationdate(new Date(System.currentTimeMillis()));
        int temp=devUserService.addVer(av);
        if (temp > 0) {
            return "redirect:/user/SelectInfo.jsp";
        } else {
            return "redirect:/user/SelectInfo.jsp";
        }
    }
    //绑定版本信息
    @RequestMapping("/versionBind")
    @ResponseBody
    public String versionBind(Long select1,Long id)
    {
       int temp=devUserService.versionBind(select1,id);
        if (temp > 0) {
            return "redirect:/user/SelectInfo.jsp";
        } else {
            return "redirect:/user/SelectInfo.jsp";
        }
    }
}



