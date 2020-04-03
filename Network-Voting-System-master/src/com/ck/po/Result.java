package com.ck.po;


public class Result {
	/**
	 * 
	 */
	private boolean success = false;// 是否成功
	private String msg = "";// 提示信息
	private Object data = null;// 其他信息
	private String code = "0";

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

}
