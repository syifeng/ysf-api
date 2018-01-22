package com.ds.api.interceptor;

import com.ds.api.web.service.ApiRequestService;
import com.ds.api.web.service.ApiResponseFieldService;
import com.ds.api.web.service.ApiResponseService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by WD_Huangming on 2017/1/10.
 */
public class ApiInterceptor implements HandlerInterceptor {
    private static final Log logger = LogFactory.getLog(ApiInterceptor.class);
    @Resource
    private ApiRequestService apiRequestService;
    @Resource
    private ApiResponseFieldService apiResponseFieldService;
    @Resource
    private ApiResponseService apiResponseService;
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        return true;
    }
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        /*if(!("true").equals(ProConstants.SIMS_API_RECORD)){
            return;
        }
        if(apiRequestService==null){
            apiRequestService = (ApiRequestService) ProConstants.ctx.getBean("apiRequestService");
        }
        if(apiResponseFieldService==null){
            apiResponseFieldService = (ApiResponseFieldService) ProConstants.ctx.getBean("apiResponseFieldService");
        }
        if(apiResponseService==null){
            apiResponseService = (ApiResponseService) ProConstants.ctx.getBean("apiResponseService");
        }*/
        //获取当前请求
        String uri = request.getRequestURI();
        //如果当前请求非更新请求，判断当前请求是否已存储
        /*if(apiRequestService.recorded(uri)){
            return;
        }else {
            ApiRequest apiRequest = new ApiRequest();
            if(RequestMethod.GET.equals(request.getMethod().toUpperCase())){
                apiRequest.setRequestMethod(1);
            }else if(RequestMethod.POST.equals(request.getMethod().toUpperCase())){
                apiRequest.setRequestMethod(2);
            }else if(RequestMethod.PUT.equals(request.getMethod().toUpperCase())){
                apiRequest.setRequestMethod(3);
            }else{
                apiRequest.setRequestMethod(0);
            }
            apiRequest.setRequestUri(uri);
            apiRequest.setApisProjectId(1l);
            apiRequestService.record(apiRequest, request.getParameterMap(), o);
        }*/
    }
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object o, Exception e) throws Exception {

    }
}
