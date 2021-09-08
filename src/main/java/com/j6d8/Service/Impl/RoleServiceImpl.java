package com.j6d8.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.j6d8.Dao.RoleDao;
import com.j6d8.Entity.Role;
import com.j6d8.Service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	RoleDao dao;

	public List<Role> findAll() {
		return dao.findAll();
	}
}
