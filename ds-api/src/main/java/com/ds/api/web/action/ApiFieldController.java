package com.ds.api.web.action;

import com.ds.api.constants.ApiStandardConstants;
import com.ds.api.entity.model.ApiResponseField;
import com.ds.api.entity.vo.ApiResponseFieldVo;
import com.ds.api.web.service.ApiResponseFieldService;
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
public class ApiFieldController {
    @Resource
    private ApiResponseFieldService apiResponseFieldService;

    @ResponseBody
    @RequestMapping(value = ApiStandardConstants.API_INTERFACE_FIELD_LIST, method = RequestMethod.GET)
    public ResponseEntity page(ApiResponseFieldVo apiResponseFieldVo,
                               Integer pageNum,
                               Integer pageSize){
        return apiResponseFieldService.page(apiResponseFieldVo, pageNum, pageSize);
    }

    @ResponseBody
    @RequestMapping(value = ApiStandardConstants.API_INTERFACE_FIELD_DETAIL, method = RequestMethod.GET)
    public ResponseEntity detail(@PathVariable("uid") Long uid){
        return apiResponseFieldService.detail(uid);
    }
    @ResponseBody
    @RequestMapping(value = ApiStandardConstants.API_INTERFACE_FIELD_ADD, method = RequestMethod.POST)
    public ResponseEntity add(ApiResponseFieldVo apiRequest){
        return apiResponseFieldService.add(apiRequest);
    }
    @ResponseBody
    @RequestMapping(value = ApiStandardConstants.API_INTERFACE_FIELD_EDIT, method = RequestMethod.POST)
    public ResponseEntity edit(ApiResponseField apiRequest){
        return apiResponseFieldService.edit(apiRequest);
    }
    @ResponseBody
    @RequestMapping(value = ApiStandardConstants.API_INTERFACE_FIELD_DEL, method = RequestMethod.POST)
    public ResponseEntity del(@PathVariable("uid") Long uid){
        return apiResponseFieldService.del(uid);
    }
}
