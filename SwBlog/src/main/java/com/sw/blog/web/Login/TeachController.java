package com.sw.blog.web.Login;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sw.blog.service.impl.ArticleService;

@RequestMapping("/")
@Controller("teachController")
@Scope("prototype")
public class TeachController {

	@Autowired
	ArticleService articleService;


	@RequestMapping("/teach")
    public String comment(Model model, HttpServletRequest request) throws Exception{
		String start = request.getParameter("start");
        String limit = request.getParameter("limit");
        String bymonth = request.getParameter("bymonth");
        String type = request.getParameter("type");

		//文章发表
        List<Map<String, Object>>  allArticleList = articleService.getAllArticleList(start,limit,bymonth,type);
        model.addAttribute("allArticleList", allArticleList);

		return "teach_view" ;
    }

}
