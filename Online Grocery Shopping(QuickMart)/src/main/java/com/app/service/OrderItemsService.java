package com.app.service;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.app.pojos.Order;
import com.app.pojos.OrderItems;
import com.app.pojos.Product;
import com.app.pojos.Status;
import com.app.repo.OrderItemsRepo;

@Service
@Transactional
public class OrderItemsService {
	
	@Autowired
	OrderItemsRepo orderItemsRepo;

	public List<OrderItems> showAllOrderItems()
	{
		return orderItemsRepo.findAll();
	}
	
	public void saveOrderItems(OrderItems orderItems)
	{
		orderItemsRepo.save(orderItems);
	}
	
	public List<OrderItems> getOrderItemsListByOrder(Order o)
	{
		return orderItemsRepo.findByOrder1(o);
	}
	
	public long findPlacedOrderCount(Status status)
	{
		return orderItemsRepo.getPlacedOrderCount(status);
	}
	public void deleteOrderItemsByProduct(Product product,List<Order> list)   
	{
		orderItemsRepo.deleteOrderItems(product,list);
	}

	public List<Order> findOrderByProduct(Product product)
	{
		return orderItemsRepo.getListOfOrdersByProduct(product);
	}
}
