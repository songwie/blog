package com.sw.blog.web.Login;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/")
@Controller("firstPageController")
@Scope("prototype")
public class FirstPageController {

	@RequestMapping("/")
    public String firstpage(Model model, HttpServletRequest request){
        System.out.println("************firstpage_view*************************");
    	return "firstpage_view";
    }

	@RequestMapping("/aboutme")
    public String about(Model model, HttpServletRequest request){
        System.out.println("**************about***********************");
    	return "aboutsw_view";
    }
	@RequestMapping("/items")
    public String items(Model model, HttpServletRequest request){
        System.out.println("**************items***********************");
    	return "items_view";
    }
	@RequestMapping("/loginMgr")
    public String login(Model model, HttpServletRequest request){
        System.out.println("**************login_view***********************");
    	return "login_view";
    }


}
