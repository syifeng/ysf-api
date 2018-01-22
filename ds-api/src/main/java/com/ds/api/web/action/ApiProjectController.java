package com.ds.api.web.action;

import com.ds.api.constants.ApiStandardConstants;
import com.ds.api.entity.model.ApiProject;
import com.ds.api.entity.vo.ApiProjectVo;
import com.ds.api.web.service.ApiProjectService;
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
public class ApiProjectController {
    @Resource
    private ApiProjectService apiProjectService;

    @ResponseBody
    @RequestMapping(value = ApiStandardConstants.API_INTERFACE_PROJECT_LIST, method = RequestMethod.GET)
    public ResponseEntity page(ApiProjectVo apiProjectVo,
                               Integer pageNum,
                               Integer pageSize){
        return apiProjectService.page(apiProjectVo, pageNum, pageSize);
    }

    @ResponseBody
    @RequestMapping(value = ApiStandardConstants.API_INTERFACE_PROJECT_DETAIL, method = RequestMethod.GET)
    public ResponseEntity detail(@PathVariable("uid") Long uid){
        return apiProjectService.detail(uid);
    }
    @ResponseBody
    @RequestMapping(value = ApiStandardConstants.API_INTERFACE_PROJECT_ADD, method = RequestMethod.POST)
    public ResponseEntity add(ApiProjectVo apiRequest){
        return apiProjectService.add(apiRequest);
    }
    @ResponseBody
    @RequestMapping(value = ApiStandardConstants.API_INTERFACE_PROJECT_EDIT, method = RequestMethod.POST)
    public ResponseEntity edit(ApiProject apiRequest){
        return apiProjectService.edit(apiRequest);
    }
    @ResponseBody
    @RequestMapping(value = ApiStandardConstants.API_INTERFACE_PROJECT_DEL, method = RequestMethod.POST)
    public ResponseEntity del(@PathVariable("uid") Long uid){
        return apiProjectService.del(uid);
    }
}
