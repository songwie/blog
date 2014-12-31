package com.sw.blog.web.Login;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.StringHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sw.blog.base.BlogException;
import com.sw.blog.base.constant.Constant;
import com.sw.blog.base.loginCheck.CheckLoginAnnotation;
import com.sw.blog.base.loginCheck.ISLOGIN;
import com.sw.blog.service.impl.ArticleService;
import com.sw.blog.service.impl.LoginService;

@RequestMapping("/sys")
@Controller("loginController")
@Scope("prototype")
public class LoginController {


	@Autowired
	@Qualifier("loginService")
	LoginService service;

	@RequestMapping("/loginMgr")
    public String loginInit(Model model, HttpServletRequest request){
    	return "login_view";
    }
	@RequestMapping("/login")
    public String login(Model model, HttpServletRequest request){
    	try{
    		String username = request.getParameter("username");
    		String password = request.getParameter("password");

    		Map<String, String> map = service.LoginAuthen(username, password);
    		HttpSession session = request.getSession();
    		session.setAttribute(Constant.OPER_USER_ID, map.get(Constant.OPER_USER_ID));

    	}catch(BlogException e){
    		model.addAttribute("error", e.getMessage());
    		return "login_view";
    	}

    	return "redirect:/sys/mgr";
    }

	@RequestMapping("/mgr")
	@CheckLoginAnnotation(isLogin = ISLOGIN.YES)
    public String mgr(Model model, HttpServletRequest request){
        String start = request.getParameter("start");
        String limit = request.getParameter("limit");

        //查询文章列表
        StringHolder totalHolder = new StringHolder();
        List<Map<String, Object>>  articles = service.getArticles(start,limit,totalHolder);
        model.addAttribute("articleList", articles);
        model.addAttribute("articleTotal", totalHolder.value);

    	return "sys_view";
    }

	@RequestMapping("/edit")
	@CheckLoginAnnotation(isLogin = ISLOGIN.YES)
    public String edit(Model model, HttpServletRequest request){
        String articleid = request.getParameter("articleid");

        //查询文章
        Map<String, Object> article = null;
        List<Map<String, Object>> list = service.getArticle(articleid);
        if(list.size()!=0){
        	article = list.get(0);
        }

        String content = (String) article.get("content");
        content = content.replaceAll("&", "&amp;");
        content = content.replaceAll("<", "&lt;");
        content = content.replaceAll(">", "&gt;");
        content = content.replaceAll("\"", "&quot;");

        article.put("content", content);
        model.addAllAttributes( article);

    	return "edit_view";
    }
	@RequestMapping("/add")
	@CheckLoginAnnotation(isLogin = ISLOGIN.YES)
    public String add(Model model, HttpServletRequest request){
    	return "edit_view";
    }

	@RequestMapping("/saveEdit")
	@CheckLoginAnnotation(isLogin = ISLOGIN.YES)
    public String saveEdit(Model model, HttpServletRequest request){
        String articleid = request.getParameter("articleid");
        String title = request.getParameter("title");
        String level = request.getParameter("level");
        String istop = request.getParameter("istop");
        String status = request.getParameter("status");
        String content = request.getParameter("content1");
        String createUser = request.getParameter("createUser");
        String typeid = request.getParameter("typeid");

        service.saveEdit(articleid,title,level,istop,status,content,createUser,typeid);

        return "redirect:/sys/mgr";
    }

	@RequestMapping("/loginOut")
    public String loginOut(Model model, HttpServletRequest request){
    	try{
    		 HttpSession session = request.getSession();
    		 session.invalidate();
    	}catch(Exception e){
    		model.addAttribute("error", e.getMessage());
    		return "redirect:/";
    	}

    	return "redirect:/";
    }


}
