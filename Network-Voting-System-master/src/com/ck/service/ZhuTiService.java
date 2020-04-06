package com.ck.service;

import java.util.List;

import com.ck.po.ZhuTi;
import com.github.pagehelper.PageInfo;

public interface ZhuTiService {
	public Integer add(ZhuTi zhuTi); // 新增

	public Integer delete(ZhuTi zhuTi); // 删除通过id

	public Integer change(ZhuTi zhuTi); // 修改

	public PageInfo<ZhuTi> check(ZhuTi zhuTi, Integer page, Integer rows); // 查询(模糊)
	
	public List<ZhuTi> listAll(); // 查询全部

}
