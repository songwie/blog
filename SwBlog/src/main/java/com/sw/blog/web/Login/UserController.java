package com.sw.blog.web.Login;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/")
@Controller("userController")
@Scope("prototype")
public class UserController {

	@RequestMapping("/loginput")
    public String loginput(Model model, HttpServletRequest request) throws Exception{
        System.out.println("**************login_view***********************");

        if(true){
        	model.addAttribute("error", "用户名或密码错误！");
        	return "login_view";

        }else {
        	return "firstpage_view";
		}

    }

}
