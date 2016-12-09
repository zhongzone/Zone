package com.zone.controller;

import java.util.List;
import java.util.TreeSet;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zone.entity.Kind;
import com.zone.entity.Site;
import com.zone.service.KindService;
import com.zone.service.SiteService;

/**
 * @author zhong
 *
 */
@Controller
public class MainController
{	
	
	@Resource
	private KindService kindService;
	
	@Resource
	private SiteService siteService;
	
	@RequestMapping("/")
	public String index(HttpServletRequest request)
	{
		return this.mainFirst(request);
	}

	
	@RequestMapping("/main")
	public String mainFirst(HttpServletRequest request)
	{
		List<Kind> kinds  = kindService.findAll();
		for(int i=0;i<kinds.size();i++)
		{
			Kind kind = kinds.get(i);
			TreeSet<Site> set = new TreeSet<Site>();
			List<Site> sites = siteService.findSiteByKind(kind.getKindId());
			for(int j=0;j<sites.size();j++)
			{
				set.add(sites.get(j));
			}
			kind.setSites(set);
		}
		request.setAttribute("kinds", kinds);
		return "/main";
	}
}
