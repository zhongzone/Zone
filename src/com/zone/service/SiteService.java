package com.zone.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.zone.entity.Article;
import com.zone.entity.Site;

public interface SiteService
{
	public Site findSite(int siteId);
	
	/**
	 * 通过类别查询站点
	 * @param kindId
	 * @return 站点列表
	 */
	public List<Site> findSiteByKind(int kindId);
}
