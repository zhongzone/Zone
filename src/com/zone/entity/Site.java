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
 * Site entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "site", catalog = "zone")
public class Site implements java.io.Serializable,Comparable<Site>
{

	// Fields
	private Integer siteId;
	private User user;
	private Kind kind;
	private String name;
	private Set<Article> articles = new HashSet<Article>(0);

	// Constructors
	/** default constructor */
	public Site()
	{
	}

	/** minimal constructor */
	public Site(Kind kind, String name)
	{
		this.kind = kind;
		this.name = name;
	}

	/** full constructor */
	public Site(User user, Kind kind, String name, Set<Article> articles)
	{
		this.user = user;
		this.kind = kind;
		this.name = name;
		this.articles = articles;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "siteId", unique = true, nullable = false)
	public Integer getSiteId()
	{
		return this.siteId;
	}

	public void setSiteId(Integer siteId)
	{
		this.siteId = siteId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "owner")
	public User getUser()
	{
		return this.user;
	}

	public void setUser(User user)
	{
		this.user = user;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "KindId", nullable = false)
	public Kind getKind()
	{
		return this.kind;
	}

	public void setKind(Kind kind)
	{
		this.kind = kind;
	}

	@Column(name = "name", nullable = false, length = 50)
	public String getName()
	{
		return this.name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "site")
	public Set<Article> getArticles()
	{
		return this.articles;
	}

	public void setArticles(Set<Article> articles)
	{
		this.articles = articles;
	}

	@Override
	public int compareTo(Site o)
	{
		return this.siteId - o.siteId;
	}

}