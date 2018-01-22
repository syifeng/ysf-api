package com.ds.api.interceptor;


import com.alibaba.fastjson.JSONObject;
import com.ds.api.constants.ProConstants;
import com.ds.api.entity.vo.ApiRequestVo;
import com.ds.api.web.service.ApiRequestService;
import com.ds.api.web.service.ApiResponseFieldService;
import com.ds.api.web.service.ApiResponseService;
import org.apache.log4j.Logger;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;


/**
 * 返回值输出过滤器，这里用来加密返回值
 *
 * @author kokJuis
 * @Title: ResponseFilter
 * @Description:
 * @date 上午9:52:42
 */
public class ResponseFilter implements Filter {
    private Logger logger = Logger.getLogger(ResponseFilter.class);
    @Resource
    private ApiRequestService apiRequestService;
    @Resource
    private ApiResponseFieldService apiResponseFieldService;
    @Resource
    private ApiResponseService apiResponseService;

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse response, FilterChain filterChain)
            throws IOException, ServletException {
        ResponseWrapper wrapperResponse = new ResponseWrapper((HttpServletResponse) response);//转换成代理类
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        // 这里只拦截返回，直接让请求过去，如果在请求前有处理，可以在这里处理
        filterChain.doFilter(request, wrapperResponse);
        if (!("true").equals(ProConstants.SIMS_API_RECORD)) {
            return;
        }
        if (apiRequestService == null) {
            apiRequestService = (ApiRequestService) ProConstants.ctx.getBean("apiRequestService");
        }
        if (apiResponseFieldService == null) {
            apiResponseFieldService = (ApiResponseFieldService) ProConstants.ctx.getBean("apiResponseFieldService");
        }
        if (apiResponseService == null) {
            apiResponseService = (ApiResponseService) ProConstants.ctx.getBean("apiResponseService");
        }
        //获取当前请求
        String uri = request.getRequestURI();

        byte[] content = wrapperResponse.getContent();//获取返回值
        if (content.length > 0) {
            ServletOutputStream out = response.getOutputStream();
            out.write(content);
            out.flush();
            String str = new String(content, "UTF-8");
            logger.info("返回值:" + str);
            try {
                //......根据需要处理返回值
                //如果当前请求非更新请求，判断当前请求是否已存储
                ApiRequestVo apiRequest;
                JSONObject resultJson;
                //如果当前返回结果正确，且成功返回
                if (StringUtils.isEmpty(str)) {
                    return;
                }
                if(uri.indexOf("/detail/")>0){
                    uri = uri.substring(0, uri.indexOf("/detail/")+8)+"{uid}";
                } else if(str.indexOf("/del/")>0){
                    uri = uri.substring(0, uri.indexOf("/del/")+5)+"{uid}";
                }

                apiRequest = apiRequestService.selectByUri(uri);
                resultJson = JSONObject.parseObject(str);
                if (resultJson == null || resultJson.getInteger("code") != 1) {
                    return;
                }
                if (apiRequest==null) {
                    apiRequest = new ApiRequestVo();
                    apiRequest.setRequestUri(uri);
                    apiRequest.setCreateTime(new Date());
                    apiRequest.setRequestMethod(request.getMethod());
                    apiRequestService.insert(apiRequest, request.getParameterMap(), resultJson);
                }else{
                    apiRequest.setRequestMethod(request.getMethod());
                    apiRequest.setModifyTime(new Date());
                    apiRequestService.update(apiRequest, request.getParameterMap(), resultJson);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }finally {
                if(out!=null){
                    out.close();
                }
            }

        }


    }

    @Override
    public void init(FilterConfig arg0)
            throws ServletException {

    }

    @Override
    public void destroy() {

    }


}
