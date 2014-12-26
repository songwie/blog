package com.sw.blog.web.Login;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sw.blog.service.impl.ArticleService;

@RequestMapping("/reply")
@Controller("replyController")
@Scope("prototype")
public class ReplyController {

	@Autowired
	ArticleService articleService;


	@RequestMapping("/comment")
    public String comment(Model model, HttpServletRequest request) throws Exception{

		String comment = request.getParameter("comment");
		String author = request.getParameter("author");
		String contact = request.getParameter("contact");
		String articleid = request.getParameter("comment_post_ID");
		String replyid = request.getParameter("comment_parent");


		articleService.saveRepy(articleid,replyid,comment,author,contact);

		return "redirect:/articlelist/"+articleid ;
    }

}
