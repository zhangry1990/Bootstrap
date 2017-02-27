package com.zhangry.bootstrap.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by zhangry on 2017/2/27.
 */
@Controller
public class SigninController {
    @RequestMapping("/signin")
    public String signInPage() {
        return "signin";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login() {
        return "/login/login";
    }

    @RequestMapping("/signout")
    public String signOutPage() {
        return "signout";
    }
}
