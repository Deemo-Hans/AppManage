package com.appmanage.service.user.impl;

import com.appmanage.entity.AppInfo;
import com.appmanage.entity.AppVersion;
import com.appmanage.entity.DevUser;
import com.appmanage.entity.DevUserExample;
import com.appmanage.mapper.AppInfoMapper;
import com.appmanage.mapper.AppVersionMapper;
import com.appmanage.mapper.DevUserMapper;
import com.appmanage.service.manage.BackendUserService;
import com.appmanage.service.user.DevUserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author ：赵成龙
 * @date ：Created in 2020/1/10 11:03
 * @description：
 * @version: $
 */
@Service
public class DevSerivceImpl implements DevUserService {
    //dao层调用
    @Autowired
    private DevUserMapper devUserMapper;
    @Autowired
    private AppInfoMapper appInfoMapper;
    @Autowired
    private BackendUserService backendUserService;
    @Autowired
    private AppVersionMapper appVersionMapper;

    //dao层调用 结束
    //校验用户名密码
    @Override
    public DevUser selectLogin(DevUser devUser) {
        DevUserExample devUserExample = new DevUserExample();
        DevUserExample.Criteria bc = devUserExample.createCriteria();
        if (devUser.getDevcode() != null && devUser.getDevpassword() != null) {
            bc.andDevcodeEqualTo(devUser.getDevcode());//用户名等于
            bc.andDevpasswordEqualTo(devUser.getDevpassword());//密码等于
            List<DevUser> list= devUserMapper.selectByExample(devUserExample);//返回集合
            if(list.size()!=0) {
                return list.get(0);
            }
            else
            {
                return null;
            }
        } else {
            return null;
        }
    }

    //删除app
    @Transactional
    public Integer delApp(Long id) {
        appVersionMapper.delAppVer(id);
        appInfoMapper.deleteByPrimaryKey(id);
        return 1;
    }

    //删除版本信息
    @Transactional(propagation = Propagation.NOT_SUPPORTED)//挂起事务
    public Integer delAppVer(Long appid) {
        System.out.println(appid);
        return -1;
    }

    //查单条
    @Override
    public AppInfo selectOne(Long id) {
        return appInfoMapper.selectOne(id);
    }

    //app历史版本查询
    public PageInfo<AppVersion> selectHistoryVer(Long appid, Integer page, Integer pageSize) {
        PageHelper.startPage(page, pageSize);
        List<AppVersion> list = appVersionMapper.selectHistoryVer(appid);
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    //修改app版本信息
    //查询单条版本信息
    public AppVersion selectUpdateVer(Long appid) {
        return appVersionMapper.selectUpdateVer(appid);
    }

    //修改单条版本
    public Integer updateVer(AppVersion av) {
        return appVersionMapper.updateByPrimaryKeySelective(av);
    }
    //新增APP版本信息
    public Integer addVer(AppVersion av) {
        return appVersionMapper.insertSelective(av);
    }
    //在修改中绑定app版本
    public Integer versionBind(Long select1,Long id)
    {
        AppInfo a=new AppInfo();
        a.setId(id);
        a.setVersionid(select1);
        return appInfoMapper.updateByPrimaryKeySelective(a);
    }
}