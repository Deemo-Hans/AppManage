package com.appmanage.mapper;

import com.appmanage.entity.AppInfo;
import com.appmanage.entity.AppInfoExample;
import com.appmanage.entity.SelectAPPInfo;

import java.util.List;

public interface AppInfoMapper {
    int deleteByPrimaryKey(Long id);

    int insert(AppInfo record);

    int insertSelective(AppInfo record);

    List<AppInfo> selectByExample(AppInfoExample example);

    AppInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(AppInfo record);

    int updateByPrimaryKey(AppInfo record);

    List<AppInfo> selectManageMain(SelectAPPInfo sai);

    AppInfo selectOne(Long id);
}