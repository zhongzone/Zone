package com.zone.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Reply entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "reply", catalog = "zone")
public class Reply implements java.io.Serializable
{

	// Fields

	private Integer replyId;
	private User user;
	private Article article;
	private String content;

	// Constructors

	/** default constructor */
	public Reply()
	{
	}

	/** full constructor */
	public Reply(User user, Article article, String content)
	{
		this.user = user;
		this.article = article;
		this.content = content;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "replyId", unique = true, nullable = false)
	public Integer getReplyId()
	{
		return this.replyId;
	}

	public void setReplyId(Integer replyId)
	{
		this.replyId = replyId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId", nullable = false)
	public User getUser()
	{
		return this.user;
	}

	public void setUser(User user)
	{
		this.user = user;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "articleId", nullable = false)
	public Article getArticle()
	{
		return this.article;
	}

	public void setArticle(Article article)
	{
		this.article = article;
	}

	@Column(name = "content", nullable = false, length = 3000)
	public String getContent()
	{
		return this.content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

}