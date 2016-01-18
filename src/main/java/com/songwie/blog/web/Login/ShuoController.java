package com.songwie.blog.web.Login;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.songwie.blog.base.util.PageUtil;
import com.songwie.blog.service.impl.ArticleService;

@RequestMapping("/")
@Controller("shuoController")
@Scope("prototype")
public class ShuoController {

	@Autowired
	ArticleService articleService;


	@RequestMapping("/shuo")
    public String shuo(Model model, HttpServletRequest request) throws Exception{
		String start = request.getParameter("start");
        String limit = request.getParameter("limit");

		//文章发表
        PageUtil pageUtil = new PageUtil();
        List<Map<String, Object>>  shuoList = articleService.getShuoList(start,limit,pageUtil);
        model.addAttribute("shuoList", shuoList);
        model.addAttribute("page", pageUtil.getPage());

		return "shuo_view" ;
    }

	@RequestMapping("/aboutme")
    public String aboutme(Model model, HttpServletRequest request) throws Exception{
        List<Map<String, Object>>  shuoList = articleService.getAboutme();
        model.addAttribute("aboutList", shuoList);

        Map<String, Object> map = shuoList.get(0);
        String articleid = map.get("id").toString();
        //查询文章评论
        List<Map<String, Object>>  replys = articleService.getReplys(articleid);
        model.addAttribute("replyList", replys);
        model.addAttribute("articleid", articleid);

		return "aboutme_view" ;
    }

}
