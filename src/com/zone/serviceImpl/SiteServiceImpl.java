package com.zone.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zone.dao.IBaseDao;
import com.zone.entity.Article;
import com.zone.entity.Kind;
import com.zone.entity.Site;
import com.zone.service.SiteService;

@Service
public class SiteServiceImpl implements SiteService
{

	
	@Resource
	private IBaseDao<Site, Integer> baseDao;
	
	
	@Override
	public Site findSite(int siteId)
	{
		Site site = baseDao.get(Site.class, siteId);
		return site;
	}
	
	@Override
	public List<Site> findSiteByKind(int kindId)
	{
		List<Site> sites = baseDao.getListByHQL("from Site where kindId=?", kindId);
		return sites;
	}
}
