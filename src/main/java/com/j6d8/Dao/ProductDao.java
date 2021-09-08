package com.j6d8.Dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.j6d8.Entity.Product;


public interface ProductDao extends JpaRepository<Product, Integer> {
	
	
	@Query("SELECT p FROM Product p WHERE p.category.id=?1")
	List<Product> findByCategoryId(String cid);

	@Query("SELECT p FROM Product p WHERE p.name LIKE ?1")
	List<Product> findByname(String string);

}
