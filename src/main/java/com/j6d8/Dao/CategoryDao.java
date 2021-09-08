package com.j6d8.Dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.j6d8.Entity.Category;

public interface CategoryDao extends JpaRepository<Category, String> {

}
