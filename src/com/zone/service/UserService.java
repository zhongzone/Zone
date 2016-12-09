package com.zone.service;

import com.zone.entity.User;

public interface UserService
{
	public User findUser(String username);

	void save(User user);

	public User findByEmail(String email);
}
