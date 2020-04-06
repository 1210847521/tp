package com.ck.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ck.dao.PlayPicture;
import com.ck.po.Picture;
import com.ck.po.Play;
import com.ck.service.PlayPictureService;

@Service
public class PlayPictureServiceImpl implements PlayPictureService {
    @Autowired
    private PlayPicture pictureDao;
	@Override
	public List<Play> serchByType(Integer flag) {
		// TODO Auto-generated method stub
		return pictureDao.serchByType(flag);
	}
	@Override
	public Picture serchPicById(Integer id) {
		// TODO Auto-generated method stub
		return pictureDao.serchPicById(id);
	}
	@Override
	public Integer upZpicById(Integer id,String p) {
		// TODO Auto-generated method stub
		return pictureDao.upZpicById(id,p);
	}
	@Override
	public Integer upXpicById(Integer id,String p) {
		// TODO Auto-generated method stub
		return pictureDao.upXpicById(id,p);
	}
	@Override
	public Integer upSpicById(Integer id,String p) {
		// TODO Auto-generated method stub
		return pictureDao.upSpicById(id,p);
	}
	@Override
	public List<Play> serchAllPlc() {
		// TODO Auto-generated method stub
		return pictureDao.serchAllPlc();
	}
	@Override
	public Integer upPlcById(Play play) {
		// TODO Auto-generated method stub
		return pictureDao.upPlcById(play);
	}
	@Override
	public Integer upPlcSrc(Play play) {
		// TODO Auto-generated method stub
		return pictureDao.upPlcSrc(play);
	}

}
