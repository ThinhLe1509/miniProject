package com.j6d8.Dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.j6d8.Entity.OrderDetail;

public interface OrderDetailDao extends JpaRepository<OrderDetail, Long> {

}
