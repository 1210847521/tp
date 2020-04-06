package com.ck.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ck.dao.ZhuTiDao;
import com.ck.po.ZhuTi;
import com.ck.service.ZhuTiService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class ZhuTiServiceImpl implements ZhuTiService {
	@Autowired
	private ZhuTiDao zhuTiDao;

	public Integer add(ZhuTi zhuTi) {
		try {
			return zhuTiDao.insert(zhuTi);
		} catch (Exception e) {
			return 0;
		}
	}

	public Integer delete(ZhuTi zhuTi) {
		try {
			return zhuTiDao.delete(zhuTi.getId());
		} catch (Exception e) {
			return 0;
		}
	}

	public Integer change(ZhuTi zhuTi) {
		try {
			return zhuTiDao.update(zhuTi);
		} catch (Exception e) {
			return 0;
		}
	}

	public ZhuTi checkById(Integer id) {
		try {
			return zhuTiDao.selectById(id);
		} catch (Exception e) {
			return null;
		}
	}

	public PageInfo<ZhuTi> check(ZhuTi zhuTi, Integer page, Integer rows) {
		try {
			PageHelper.startPage(page, rows);
			List<ZhuTi> list = zhuTiDao.select(zhuTi);
			PageInfo<ZhuTi> pageInfo = new PageInfo<ZhuTi>(list);
			return pageInfo;
		} catch (Exception e) {
			return null;
		}
	}
	
	public List<ZhuTi> listAll() {
		try {
			List<ZhuTi> list = zhuTiDao.listAll();
			return list;
		} catch (Exception e) {
			return null;
		}
	}

}
