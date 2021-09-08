package com.j6d8.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.j6d8.Dao.CategoryDao;
import com.j6d8.Entity.Category;
import com.j6d8.Service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	CategoryDao cdao;

	@Override
	public List<Category> findAll() {

		return cdao.findAll();
	}

}
