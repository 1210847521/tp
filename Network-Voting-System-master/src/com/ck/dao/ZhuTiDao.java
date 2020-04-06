package com.ck.dao;

import java.util.List;

import com.ck.po.ZhuTi;

public interface ZhuTiDao {

	public List<ZhuTi> select(ZhuTi zhuTi); // 查询发布(模糊)

	public List<ZhuTi> selectByUserId(Integer id); // 查询发布通过用户id

	public ZhuTi selectById(Integer id); // 查询发布通过id

	public Integer insert(ZhuTi zhuTi); // 新增发布

	public Integer update(ZhuTi zhuTi); // 修改发布

	public Integer delete(Integer id); // 删除主题

	public List<ZhuTi> listAll();

}
