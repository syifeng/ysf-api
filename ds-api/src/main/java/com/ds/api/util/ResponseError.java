package com.ds.api.util;

import com.fasterxml.jackson.annotation.JsonProperty;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

/**
 * 返回错误信息 Created by huangwentao on 2017/3/28.
 */
public class ResponseError {

	public static ResponseEntity<?> create(String msg) {
		ResponseResult error = new ResponseResult();
		error.setCode(400);
		error.setMessage(msg);
		return ResponseEntity.status(HttpStatus.OK).body(error);
	}

	/**
	 * 返回错误对象
	 * 
	 * @param code
	 * @param msg
	 * @return
	 */
	public static ResponseEntity<?> create(int code, String msg) {
		ResponseResult error = new ResponseResult();
		error.setCode(code);
		error.setMessage(msg);
		return ResponseEntity.status(HttpStatus.OK).body(error);
	}

	public static class ResponseResult {

		@JsonProperty("message")
		private String message;

		@JsonProperty("code")
		private int code;

		public String getMessage() {
			return message;
		}

		public void setMessage(String message) {
			this.message = message;
		}

		public int getCode() {
			return code;
		}

		public void setCode(int code) {
			this.code = code;
		}

	}


}
