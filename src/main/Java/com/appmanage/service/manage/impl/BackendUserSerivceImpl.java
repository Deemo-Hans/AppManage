package com.appmanage.service.manage.impl;

import com.appmanage.entity.*;
import com.appmanage.mapper.AppCategoryMapper;
import com.appmanage.mapper.AppInfoMapper;
import com.appmanage.mapper.BackendUserMapper;
import com.appmanage.mapper.DataDictionaryMapper;
import com.appmanage.service.manage.BackendUserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author ：赵成龙
 * @date ：Created in 2020/1/10 11:03
 * @description：
 * @version: $
 */
@Service
public class BackendUserSerivceImpl implements BackendUserService {
    @Autowired
    //dao层自动装配
    private BackendUserMapper backendUserMapper;
    @Autowired
    private AppInfoMapper appInfoMapper;
    @Autowired
    private AppCategoryMapper appCategoryMapper;
    @Autowired
    private DataDictionaryMapper dataDictionaryMapper;
    //dao层 结束
    //校验用户名密码
    @Override
    public Integer selectLogin(BackendUser backendUser) {
        BackendUserExample backendUserExample=new BackendUserExample();
        BackendUserExample.Criteria bc=backendUserExample.createCriteria();
        if(backendUser.getUsercode()!=null&&backendUser.getUserpassword()!=null) {
            bc.andUsercodeEqualTo(backendUser.getUsercode());//用户名等于
            bc.andUserpasswordEqualTo(backendUser.getUserpassword());//密码等于
            List list=backendUserMapper.selectByExample(backendUserExample);//返回集合
            return list.size();
        }
        else
        {
            return -1;
        }
    }
    //条件查询
    @Override
    public PageInfo<AppInfo> selectManageMain(SelectAPPInfo sai) {
        PageHelper.startPage(sai.getPage(),sai.getPageSize());
        List<AppInfo> list=appInfoMapper.selectManageMain(sai);
        PageInfo<AppInfo> pi=new PageInfo(list);
        return pi;
    }
    //下拉框联动
    @Override
    public List<AppCategory> selectLink(Long parentId) {
        AppCategoryExample ae=new AppCategoryExample();
        AppCategoryExample.Criteria criteria=ae.createCriteria();
        if(parentId==null)
        {
            criteria.andParentidIsNull();
        }
        else {
            criteria.andParentidEqualTo(parentId);
        }
        return appCategoryMapper.selectByExample(ae);
    }

    @Override
    //查平台
    public List<DataDictionary> selectFlatform() {
        DataDictionaryExample ae=new DataDictionaryExample();
        DataDictionaryExample.Criteria criteria=ae.createCriteria();
        criteria.andTypecodeEqualTo("APP_FLATFORM");
        return dataDictionaryMapper.selectByExample(ae);

    }

    @Override
    //查状态
    public List<DataDictionary> selectStatus() {
        DataDictionaryExample ae=new DataDictionaryExample();
        DataDictionaryExample.Criteria criteria=ae.createCriteria();
        criteria.andTypecodeEqualTo("APP_STATUS");
        return dataDictionaryMapper.selectByExample(ae);
    }
    //审核状态修改
    public Integer  updateStatus(AppInfo appInfo)
    {
        return appInfoMapper.updateByPrimaryKeySelective(appInfo);
    }

}
