package com.zone.serviceImpl;

import java.util.ArrayList;
import java.util.List;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zone.dao.IBaseDao;
import com.zone.entity.Kind;
import com.zone.service.KindService;

@Service
public class KindServiceImpl implements KindService
{
	
	@Resource
	private IBaseDao<Kind, Integer> baseDao;
	
	@Override
	public List<Kind> findAll()
	{
		List<Kind> list = baseDao.getListByHQL("from Kind");
		return list;
	}
	
}
