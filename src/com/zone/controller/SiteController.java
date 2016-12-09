package com.zone.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zone.entity.Article;
import com.zone.entity.Site;
import com.zone.service.ArticleService;
import com.zone.service.SiteService;

@Controller
public class SiteController
{
	
	@Resource
	private SiteService siteService;
	
	@Resource
	private ArticleService articleService;
	
	@RequestMapping("/site")
	public String site(HttpServletRequest request)
	{
		int id = Integer.valueOf(request.getParameter("siteId"));
		Site site = siteService.findSite(id);
		List<Article> articles = articleService.findArticles(id);
		request.setAttribute("articles",articles);
		request.setAttribute("site", site);
		return "/site";
	}
}
