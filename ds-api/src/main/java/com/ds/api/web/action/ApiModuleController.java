package com.ds.api.web.action;

import com.ds.api.constants.ApiStandardConstants;
import com.ds.api.entity.model.ApiModule;
import com.ds.api.entity.vo.ApiModuleVo;
import com.ds.api.web.service.ApiModuleService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
public class ApiModuleController {
    @Resource
    private ApiModuleService apiModuleService;

    @ResponseBody
    @RequestMapping(value = ApiStandardConstants.API_INTERFACE_MODULE_LIST, method = RequestMethod.GET)
    public ResponseEntity page(ApiModuleVo apiModuleVo,
                               Integer pageNum,
                               Integer pageSize){
        return apiModuleService.page(apiModuleVo, pageNum, pageSize);
    }

    @ResponseBody
    @RequestMapping(value = ApiStandardConstants.API_INTERFACE_MODULE_DETAIL, method = RequestMethod.GET)
    public ResponseEntity detail(@PathVariable("uid") Long uid){
        return apiModuleService.detail(uid);
    }
    @ResponseBody
    @RequestMapping(value = ApiStandardConstants.API_INTERFACE_MODULE_ADD, method = RequestMethod.POST)
    public ResponseEntity add(ApiModuleVo apiRequest){
        return apiModuleService.add(apiRequest);
    }
    @ResponseBody
    @RequestMapping(value = ApiStandardConstants.API_INTERFACE_MODULE_EDIT, method = RequestMethod.POST)
    public ResponseEntity edit(ApiModule apiRequest){
        return apiModuleService.edit(apiRequest);
    }
    @ResponseBody
    @RequestMapping(value = ApiStandardConstants.API_INTERFACE_MODULE_DEL, method = RequestMethod.POST)
    public ResponseEntity del(@PathVariable("uid") Long uid){
        return apiModuleService.del(uid);
    }
}
