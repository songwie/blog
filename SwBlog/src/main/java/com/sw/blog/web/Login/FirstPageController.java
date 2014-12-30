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

        String start = request.getParameter("start");
        String limit = request.getParameter("limit");

        //查询文章列表
        StringHolder totalHolder = new StringHolder();
        List<Map<String, Object>>  articles = articleService.getArticles(start,limit,totalHolder);
        model.addAttribute("articleList", articles);
        model.addAttribute("articleTotal", totalHolder.value);

        //最新文章发表
        List<Map<String, Object>>  newArticles = articleService.getNewArticles();
        model.addAttribute("newArticleList", newArticles);

        //最新评论
        List<Map<String, Object>>  newReplyList = articleService.getNewReplyList();
        model.addAttribute("newReplyList", newReplyList);

        //全部归档
        List<Map<String, Object>>  newTimeList = articleService.getNewTimeList();
        model.addAttribute("newTimeList", newTimeList);

        //全部分类
        List<Map<String, Object>>  articleTypeList = articleService.getArticleTypeList();
        model.addAttribute("articleTypeList", articleTypeList);

        //有情链接
        List<Map<String, Object>>  friendLinks = articleService.getFriendLinks();
        model.addAttribute("friendLinks", friendLinks);

    	return "firstpage_view";
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
