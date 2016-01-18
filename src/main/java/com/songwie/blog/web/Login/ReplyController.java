package com.songwie.blog.web.Login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.google.code.kaptcha.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.songwie.blog.service.impl.ArticleService;

@RequestMapping("/reply")
@Controller("replyController")
@Scope("prototype")
public class ReplyController {

	@Autowired
	ArticleService articleService;


	@RequestMapping("/comment")
    public String comment(Model model, HttpServletRequest request,HttpSession session) throws Exception{

		String comment = request.getParameter("comment");
		String author = request.getParameter("author");
		String contact = request.getParameter("contact");
		String articleid = request.getParameter("comment_post_ID");
		String replyid = request.getParameter("comment_parent");
		String code = request.getParameter("reply_code");

		String sessioncode = (String)session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
        System.err.println(sessioncode);
		if(!code.equals(sessioncode)){
			model.addAttribute("error", "验证码错误");
			return "forward:/articlelist/"+articleid ;
		}

		articleService.saveRepy(articleid,replyid,comment,author,contact);

		return "redirect:/articlelist/"+articleid ;
    }

}
