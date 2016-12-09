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
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Kind entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "kind", catalog = "zone")
public class Kind implements java.io.Serializable
{

	// Fields

	private Integer kindId;
	private String name;
	private Set<Site> sites = new HashSet<Site>(0);

	// Constructors

	/** default constructor */
	public Kind()
	{
	}

	/** full constructor */
	public Kind(String name, Set<Site> sites)
	{
		this.name = name;
		this.sites = sites;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "kindId", unique = true, nullable = false)
	public Integer getKindId()
	{
		return this.kindId;
	}

	public void setKindId(Integer kindId)
	{
		this.kindId = kindId;
	}

	@Column(name = "name", length = 50)
	public String getName()
	{
		return this.name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "kind")
	public Set<Site> getSites()
	{
		return this.sites;
	}

	public void setSites(Set<Site> sites)
	{
		this.sites = sites;
	}

}