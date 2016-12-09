package com.zone.controller;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zone.entity.Article;
import com.zone.entity.Reply;
import com.zone.entity.User;
import com.zone.service.ArticleService;
import com.zone.service.ReplyService;
import com.zone.service.UserService;

@Controller
public class ReplyController
{
	
	@Resource
	private ReplyService replyService;
	
	@Resource
	private ArticleService articleService;
	
	@Resource
	private UserService userService;
	
	@RequestMapping("/reply")
	public ModelAndView reply(HttpServletRequest request)
	{
		String refer = request.getHeader("referer");
		if(request.getSession().getAttribute("username") == null)
		{
			HashMap<String, Object> model = new HashMap<String, Object>();
			model.put("refer", refer);
			model.put("message", "请登录");
			return new ModelAndView("login2",model);
		}
		
		int articleId = Integer.valueOf(request.getParameter("articleId"));
		Article article = articleService.find(articleId);
		User user = userService.findUser((String)(request.getSession().getAttribute("username")));
		Reply reply = new Reply();
		reply.setArticle(article);
		reply.setUser(user);
		reply.setContent(request.getParameter("content"));
		replyService.save(reply);
		return new ModelAndView("redirect:article?id="+articleId);
	}
}
