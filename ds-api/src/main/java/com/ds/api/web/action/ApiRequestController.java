package com.ds.api.web.action;

import com.ds.api.constants.ApiStandardConstants;
import com.ds.api.entity.vo.ApiRequestVo;
import com.ds.api.web.service.ApiRequestService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by ds-yifeng on 2017/11/25.
 */
@Controller
public class ApiRequestController {
    @Resource
    private ApiRequestService apiRequestService;

    @ResponseBody
    @RequestMapping(value = ApiStandardConstants.API_INTERFACE_REQUEST_LIST, method = RequestMethod.GET)
    public ResponseEntity list(ApiRequestVo apiRequestVo,
                               Integer pageNum,
                               Integer pageSize){
        return apiRequestService.pageList(apiRequestVo, pageNum, pageSize);
    }

    @ResponseBody
    @RequestMapping(value = ApiStandardConstants.API_INTERFACE_REQUEST_DETAIL, method = RequestMethod.GET)
    public ResponseEntity detail(@PathVariable("uid") Long uid){
        return apiRequestService.detail(uid);
    }
    @ResponseBody
    @RequestMapping(value = ApiStandardConstants.API_INTERFACE_REQUEST_EDIT, method = RequestMethod.POST)
    public ResponseEntity edit(ApiRequestVo apiRequestVo){
        return apiRequestService.edit(apiRequestVo);
    }
    @ResponseBody
    @RequestMapping(value = ApiStandardConstants.API_INTERFACE_REQUEST_ADD, method = RequestMethod.POST)
    public ResponseEntity add(ApiRequestVo apiRequestVo){
        return apiRequestService.add(apiRequestVo);
    }
    @ResponseBody
    @RequestMapping(value = ApiStandardConstants.API_INTERFACE_REQUEST_DEL, method = RequestMethod.POST)
    public ResponseEntity del(Long uid){
        return apiRequestService.del(uid);
    }
}
