package com.zone.serviceImpl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zone.dao.IBaseDao;
import com.zone.entity.Article;
import com.zone.entity.Kind;
import com.zone.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService
{

	@Resource
	private IBaseDao<Article, Integer> baseDao;
	
	@Override
	public Article find(int id)
	{
		Article article = baseDao.get(Article.class, id);
		return article;
	}

	@Override
	public List<Article> findArticles(int siteId)
	{
		List<Article> articles = baseDao.getListByHQL("from Article  where site.siteId=?",siteId);
		return articles;
	}
	
	@Override
	public int save(Article article)
	{
		 return baseDao.save(article);
	}

}
