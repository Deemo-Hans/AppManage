package com.appmanage.service.user;

import com.appmanage.entity.AppInfo;
import com.appmanage.entity.AppVersion;
import com.appmanage.entity.DevUser;
import com.github.pagehelper.PageInfo;

/**
 * @author ：赵成龙
 * @date ：Created in 2020/1/10 11:00
 * @description：//管理员账号密码验证
 * @version: $
 */
public interface DevUserService {
    public DevUser selectLogin(DevUser du);//验证是否存在该用户
    public Integer delApp(Long id); //删除app
    public Integer delAppVer(Long appid);//删除版本信息
    public AppInfo selectOne(Long id);//查单条
    public PageInfo<AppVersion> selectHistoryVer(Long appid,Integer page,Integer pageSize) ;   //app历史版本查询
    public AppVersion selectUpdateVer (Long appid);//修改APP版本信息查单条
    public Integer updateVer (AppVersion av);//修改APP信息
    public Integer addVer(AppVersion av);//添加APP信息
    public Integer versionBind(Long select1,Long id);//绑定版本信息
}
