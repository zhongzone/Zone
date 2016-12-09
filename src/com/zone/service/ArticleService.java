package com.zone.service;

import java.util.List;

import com.zone.entity.Article;

public interface ArticleService
{
	
	/**
	 * 同过帖子的id查出该帖子 
	 * @param id
	 * @return 
	 */
	public Article find(int id);
	
	/**
	 * 查询出该站点下的所有帖子
	 * @param siteId 站点ID
	 * @return 帖子列表
	 */
	List<Article> findArticles(int siteId);

	/**
	 * 保存新文章
	 * @param article
	 * @return 
	 */
	int save(Article article);
}
