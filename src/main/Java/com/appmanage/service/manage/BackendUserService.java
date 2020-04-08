package com.appmanage.service.manage;

import com.appmanage.entity.*;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @author ：赵成龙
 * @date ：Created in 2020/1/10 11:00
 * @description：//管理员账号密码验证
 * @version: $
 */
public interface BackendUserService {
    public Integer selectLogin(BackendUser backendUser);//验证是否存在该用户
    public PageInfo<AppInfo> selectManageMain(SelectAPPInfo sai);//条件查询信息
    public List<AppCategory> selectLink(Long parentId);//下拉框联动
    public List<DataDictionary> selectFlatform();//所属平台
    public List<DataDictionary> selectStatus();//审核状态
    public Integer  updateStatus(AppInfo appInfo);//审核状态修改

}
