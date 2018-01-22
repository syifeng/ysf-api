package com.ds.api.util;

import com.fasterxml.jackson.annotation.JsonProperty;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.util.HashMap;
import java.util.Map;

/**
 * 返回结果工具类 Created by huangwentao on 2017/3/28.
 */
public class ResponseOk {

	public static ResponseEntity<?> create(Object result) {
		ResponseResult okResponse = new ResponseResult();
		okResponse.setCode(200);
		okResponse.setMessage("succeed");
		okResponse.setData(result);
		return ResponseEntity.status(HttpStatus.OK).body(okResponse);
	}

	public static ResponseEntity<?> create() {
		ResponseResult okResponse = new ResponseResult();
		okResponse.setCode(200);
		okResponse.setMessage("succeed");
		return ResponseEntity.status(HttpStatus.OK).body(okResponse);
	}

	public static ResponseEntity<?> create(String key, String result) {
		Map<String, Object> map = new HashMap();
		map.put(key, result);
		return create(map);
	}

	public static ResponseEntity<?> create(String key, Integer result) {
		Map<String, Object> map = new HashMap();
		map.put(key, result);
		return create(map);
	}

	public static ResponseEntity<?> create(String key, Long result) {
		Map<String, Object> map = new HashMap();
		map.put(key, result);
		return create(map);
	}

	public static ResponseEntity<?> createCacheTTL(Object result, long ttl) {
		ResponseResult okResponse = new ResponseResult();
		okResponse.setCode(200);
		okResponse.setMessage("succeed");
		okResponse.setData(result);
		return ResponseEntity.status(HttpStatus.OK).header("X-Cache-TTL", String.valueOf(ttl)).body(okResponse);
	}

    public static class ResponseResult {

		@JsonProperty("code")
		private int code;

		@JsonProperty("message")
		private String message;

		@JsonProperty("data")
		private Object data;

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

		public Object getData() {
			return data;
		}

		public void setData(Object data) {
			this.data = data;
		}

	}
	public static class ResponseResult2 {

		@JsonProperty("code")
		private String code;

		@JsonProperty("message")
		private String message;

		@JsonProperty("data")
		private Object data;

		public String getMessage() {
			return message;
		}

		public void setMessage(String message) {
			this.message = message;
		}

		public String getCode() {
			return code;
		}

		public void setCode(String code) {
			this.code = code;
		}

		public Object getData() {
			return data;
		}

		public void setData(Object data) {
			this.data = data;
		}

	}

}
