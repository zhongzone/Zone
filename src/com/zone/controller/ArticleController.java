package com.zone.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zone.entity.Article;
import com.zone.entity.Reply;
import com.zone.entity.Site;
import com.zone.entity.User;
import com.zone.service.ArticleService;
import com.zone.service.ReplyService;
import com.zone.service.SiteService;
import com.zone.service.UserService;

@Controller
public class ArticleController
{
	@Resource
	private ArticleService articleService;
	
	@Resource
	private UserService userService;
	
	@Resource
	private SiteService siteService;
	@Resource
	private ReplyService replyService;
	
	@RequestMapping("/article")
	public ModelAndView article(HttpServletRequest request)
	{
		int id = Integer.valueOf(request.getParameter("id"));
		Article article = articleService.find(id);
		List<Reply> replies = replyService.getReplies(article.getArticleId());
		ModelAndView	 mv = new ModelAndView("article");
		mv.addObject("article",article);
		mv.addObject("replies",replies);
		return mv;
	}
	
	
	@RequestMapping("/addArticle")
	public String addArticle(HttpServletRequest request)
	{
		int siteId = Integer.valueOf(request.getParameter("siteId"));  //获取站点Id，以备后用
		request.setAttribute("siteId", siteId);
		return "addArticle";
	}
	
	@RequestMapping("/submitArticle")
	public ModelAndView  submitArticle(HttpServletRequest request)
	{
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		System.out.println(title+"  "+request.getParameter("siteId"));
		
		int  siteId = Integer.valueOf(request.getParameter("siteId"));

		User user = userService.findUser((String) request.getSession().getAttribute("username"));
		
		Site site = siteService.findSite(siteId);
		
		
		Article article = new Article();
		article.setUser(user);
		article.setSite(site);
		article.setTitle(title);
		article.setContent(content);
		article.setArticleId(articleService.save(article));  //实体保存到数据库后后会返回自动生成的id

		return new ModelAndView("redirect:article?id="+article.getArticleId());
	}
}
