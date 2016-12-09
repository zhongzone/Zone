package com.zone.serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zone.dao.IBaseDao;
import com.zone.entity.User;
import com.zone.service.UserService;

@Service
public class UserServiceImpl implements UserService
{

	@Resource
	private IBaseDao<User, Integer> baseDao;
	
	@Override
	public User findUser(String username)
	{
		User user = baseDao.getByHQL("from User where username=?", username);
		return user;
	}

	@Override
	public void save(User user)
	{
		baseDao.save(user);
	}
	
	@Override
	public User findByEmail(String email)
	{
		return baseDao.getByHQL("from User where email=?", email);
	}
}
