package com.zhangry.bootstrap.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by zhangry on 2017/2/22.
 */
@Controller
@RequestMapping(value = "login")
public class LoginController {

    @RequestMapping(value = "/getUserList", method = RequestMethod.POST)
    public JsonView getUserList() {
        String str = "{data : {\"id\" : \"123456789\", \"name\" : \"Tom\", \"sex\" : \"nan\", \"age\" : \"20\", \"address\" : \"China\"}}";
        return new JsonView(str.toString());
    }
}
