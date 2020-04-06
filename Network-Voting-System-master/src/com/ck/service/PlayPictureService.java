package com.ck.service;

import java.util.List;

import com.ck.po.Picture;
import com.ck.po.Play;


public interface PlayPictureService {
	
	public List<Play> serchByType(Integer flag);

	public Picture serchPicById(Integer id);
	
	
    public Integer upZpicById(Integer id, String p);
	
	public Integer upXpicById(Integer id,String p);
	
	public Integer upSpicById(Integer id,String p);

	public List<Play> serchAllPlc();

	public Integer upPlcById(Play play);

	public Integer upPlcSrc(Play play);

}
