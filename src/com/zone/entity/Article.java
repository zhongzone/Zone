package com.zone.entity;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Article entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "article", catalog = "zone")
public class Article implements java.io.Serializable
{

	// Fields

	private Integer articleId;
	private User user;
	private Site site;
	private String title;
	private String content;
	private Set<Reply> replies = new HashSet<Reply>(0);

	// Constructors

	/** default constructor */
	public Article()
	{
	}

	/** minimal constructor */
	public Article(User user, Site site, String title, String content)
	{
		this.user = user;
		this.site = site;
		this.title = title;
		this.content = content;
	}

	/** full constructor */
	public Article(User user, Site site, String title, String content,
			Set<Reply> replies)
	{
		this.user = user;
		this.site = site;
		this.title = title;
		this.content = content;
		this.replies = replies;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "articleId", unique = true, nullable = false)
	public Integer getArticleId()
	{
		return this.articleId;
	}

	public void setArticleId(Integer articleId)
	{
		this.articleId = articleId;
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
	@JoinColumn(name = "siteId", nullable = false)
	public Site getSite()
	{
		return this.site;
	}

	public void setSite(Site site)
	{
		this.site = site;
	}

	@Column(name = "title", nullable = false, length = 100)
	public String getTitle()
	{
		return this.title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	@Column(name = "content", nullable = false, length = 2000)
	public String getContent()
	{
		return this.content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "article")
	public Set<Reply> getReplies()
	{
		return this.replies;
	}

	public void setReplies(Set<Reply> replies)
	{
		this.replies = replies;
	}

}