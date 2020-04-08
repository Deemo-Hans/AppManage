package com.appmanage.mapper;

import com.appmanage.entity.AppVersion;
import com.appmanage.entity.AppVersionExample;

import java.util.List;

public interface AppVersionMapper {
    int deleteByPrimaryKey(Long id);

    int insert(AppVersion record);

    int insertSelective(AppVersion record);

    List<AppVersion> selectByExample(AppVersionExample example);

    AppVersion selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(AppVersion record);

    int updateByPrimaryKey(AppVersion record);
    //自定义部分
    public Integer delAppVer(Long appid);//删除版本信息
    public List<AppVersion> selectHistoryVer(Long appid);//历史版本查询
    public AppVersion selectUpdateVer(Long appid);//查询单条版本信息
}