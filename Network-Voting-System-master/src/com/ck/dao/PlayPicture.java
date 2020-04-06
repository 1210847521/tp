package com.ck.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ck.po.Picture;
import com.ck.po.Play;


public interface PlayPicture {
	
	public List<Play> serchByType(@Param(value="flag")Integer flag);

	public Picture serchPicById(@Param(value="id")Integer id);
	
	public Integer upZpicById(@Param(value="id")Integer id, @Param(value="p")String p);
	
	public Integer upXpicById(@Param(value="id")Integer id,@Param(value="p")String p);
	
	public Integer upSpicById(@Param(value="id")Integer id,@Param(value="p")String p);

	public List<Play> serchAllPlc();

	public Integer upPlcById(Play play);

	public Integer upPlcSrc(Play play);

}
