package com.j6d8.Service.Impl;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.j6d8.Dao.OrderDao;
import com.j6d8.Dao.OrderDetailDao;
import com.j6d8.Entity.Order;
import com.j6d8.Entity.OrderDetail;
import com.j6d8.Service.OrderService;
import com.fasterxml.jackson.core.type.TypeReference;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	OrderDao dao;

	@Autowired
	OrderDetailDao ddao;

	@Override
	public Order create(JsonNode orderData) {
		ObjectMapper mapper = new ObjectMapper();

		Order order = mapper.convertValue(orderData, Order.class);
		dao.save(order);

		TypeReference<List<OrderDetail>> type = new TypeReference<List<OrderDetail>>() {
		};
		List<OrderDetail> details = mapper.convertValue(orderData.get("orderDetails"), type).stream()
				.peek(d -> d.setOrder(order)).collect(Collectors.toList());
		ddao.saveAll(details);

		return order;
	}

	@Override
	public Order findById(Long id) {

		return dao.findById(id).get();
	}

	@Override
	public List<Order> findByUsername(String username) {

		return dao.findByUsername(username);
	}

}
