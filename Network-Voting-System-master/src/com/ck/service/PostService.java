package com.ck.service;

import java.util.List;

import com.ck.po.Post;
import com.ck.po.page;
import com.github.pagehelper.PageInfo;

public interface PostService {
	public Integer add(Post post); // 新增

	public Integer delete(Post post); // 删除通过id

	public Integer change(Post post); // 修改

	public Post checkById(Integer id); // 查询发布通过id

	public PageInfo<Post> checkByUserId(Integer id, Integer page, Integer rows); // 查询通过用户id

	public PageInfo<Post> check(Post post, Integer page, Integer rows); // 查询(模糊)

	public Integer getCountAll();

	public List<Post> searchByPageAll(page page);

}
