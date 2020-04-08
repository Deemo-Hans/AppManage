package com.appmanage.controller.manage;

import com.appmanage.entity.*;
import com.appmanage.service.manage.BackendUserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author ：赵成龙
 * @date ：Created in 2020/1/10 11:17
 * @description：
 * @version: $
 */
@Controller
public class BackendUserController {
    @Autowired
    private BackendUserService backendUserService;

    @RequestMapping("/backendUserCheck")//管理员登录查询
    public String backendUserCheck(BackendUser b)
    {
        int temp=backendUserService.selectLogin(b);
        if(temp==1)
        {
            //session.setAttribute("username",b.getUsername());
            return "manage/MainMenu";
        }else
        {
            return "manage/ManageLogin";
        }
    }
    @RequestMapping("/selectManageMain")//条件查询
    @ResponseBody
    public PageInfo selectManageMain(SelectAPPInfo sai, HttpSession session)
    {
        DevUser selectAPPInfo=(DevUser) session.getAttribute("userSession");
        sai.setDevId(selectAPPInfo.getId());
        PageInfo<AppInfo> pageInfo=backendUserService.selectManageMain(sai);
        return pageInfo;
    }
    //下拉框
    @RequestMapping("/selectLink")//下拉框联动
    @ResponseBody
    public List<AppCategory> selectLink(Long parentId)
    {
        return backendUserService.selectLink(parentId);
    }
    @RequestMapping("/selectFlatform")//所属平台
    @ResponseBody
    public List<DataDictionary> selectFlatform()//所属平台
    {
        return backendUserService.selectFlatform();
    }
    @RequestMapping("/selectStatus")//查询审核状态
    @ResponseBody
    public List<DataDictionary> selectStatus()
    {
        return backendUserService.selectStatus();
    }
    //下拉框 结束
    @RequestMapping("/updateStatus")//更新审核状态
    @ResponseBody
    public String updateStatus(AppInfo appInfo)
    {
       backendUserService.updateStatus(appInfo);
       return "/manage/SelectInfo";
    }
}
