package com.zone.service;

import java.util.List;

import com.zone.entity.Article;
import com.zone.entity.Reply;

public interface ReplyService
{
	public void save(Reply reply);
	
	public List<Reply> getReplies(int articleId);
}
