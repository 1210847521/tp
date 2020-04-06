package com.ck.dao;

import java.util.List;

import com.ck.po.User;
import com.ck.po.page;

public interface UserDao {
	public User login(User user); // 用户登录

	public List<User> select(User user); // 查询用户(模糊)

	public User selectById(Integer id); // 查询用户通过id

	public Integer insert(User user); // 新增用户

	public Integer update(User user); // 修改用户

	public Integer delete(Integer id); // 删除用户

	public void updateToSuccess(User userQuery); //登录成功后修改信息

	public void updateToFalse(User userQuery);

	public void updateToNewLock(User userQuery);

	public List<User> serchUserAll(page page);

	public int getCountAll();

	public List<User> serchByFabu(page page);

	public Integer getcountFabu();

}
