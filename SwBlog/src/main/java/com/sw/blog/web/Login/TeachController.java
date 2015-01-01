package com.sw.blog.web.Login;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sw.blog.base.util.PageUtil;
import com.sw.blog.service.impl.ArticleService;

@RequestMapping("/")
@Controller("teachController")
@Scope("prototype")
public class TeachController {

	@Autowired
	ArticleService articleService;


	@RequestMapping("/teachs")
    public String teachs(Model model, HttpServletRequest request) throws Exception{
		String start = request.getParameter("start");
        String limit = request.getParameter("limit");
        String bymonth = request.getParameter("bymonth");
        String type = request.getParameter("type");
        String search = request.getParameter("searthstr");

		//文章发表
        PageUtil pageUtil = new PageUtil();
        List<Map<String, Object>>  allArticleList = articleService.getAllArticleList(start,limit,bymonth,type,search,pageUtil);
        model.addAttribute("allArticleList", allArticleList);
        model.addAttribute("page", pageUtil.getPage());

		return "teach_view" ;
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


}
