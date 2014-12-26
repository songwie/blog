package com.sw.blog.web.Login;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.omg.CORBA.StringHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sw.blog.service.impl.ArticleService;

@RequestMapping("/")
@Controller("firstPageController")
@Scope("prototype")
public class FirstPageController {

	@Autowired
	ArticleService articleService;

	@RequestMapping("/")
    public String firstpage(Model model, HttpServletRequest request){
        System.out.println("************firstpage_view*************************");

        String start = request.getParameter("start");
        String limit = request.getParameter("limit");

        //查询文章列表
        StringHolder totalHolder = new StringHolder();
        List<Map<String, Object>>  articles = articleService.getArticles(start,limit,totalHolder);

        model.addAttribute("articleList", articles);
        model.addAttribute("articleTotal", totalHolder.value);

    	return "firstpage_view";
    }

	@RequestMapping("/articlelist/{id}")
    public String articleDetails(Model model, HttpServletRequest request,@PathVariable ("id")String id){
        System.out.println("************articleDetails*************************");

        //查询文章
        Map<String, Object> article = articleService.getArticle(id);
        List list = new ArrayList();
        list.add(article);

        model.addAttribute("articleList", list);
        model.addAttribute("articleid", id);

        //查询文章评论
        List<Map<String, Object>>  replys = articleService.getReplys(id);
        model.addAttribute("replyList", replys);

    	return "article_view";
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
