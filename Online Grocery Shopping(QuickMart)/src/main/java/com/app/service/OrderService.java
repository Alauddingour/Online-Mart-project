package com.app.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.app.pojos.Customer;
import com.app.pojos.Order;
import com.app.pojos.Status;
import com.app.repo.OrderRepo;

@Service
@Transactional
public class OrderService {

	@Autowired
	OrderRepo orderRepo;
	
	public void saveOrder(Order order)
	{
		orderRepo.save(order);
	}
	
	public List<Order> getOrderListByCustomerPl(Customer c,Status status)
	{
		return orderRepo.findByCustomerPlaced(c,status);
	}
	
	public List<Order> getOrderListByCustomerDe(Customer c,Status status)
	{
		return orderRepo.findByCustomerDelivered(c, status);
	}
	
	public void deleteOrderByStatusAndOrderId(Status status,int id)
	{
		orderRepo.deleteByStatusAndId(status,id);
	}
	
	public void deleteOrderByOrderId(int id)
	{
		orderRepo.deleteById(id);
	}
	
	public List<Order> getListOfOrdersByStatus(Status status)
	{
		return orderRepo.listOfOrder(status);
	}
	
	public Page<Order> getListOfOrdersByStatusPages(Status status,int pageNum)
	{
		int pageSize = 12;
	    Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
		return orderRepo.listOfOrderPages(status,pageable);
	}
	
	public Page<Order> getListOfOrdersByStatusPagesNotDelivered(Status status,int pageNum)
	{
		int pageSize = 12;
	    Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
		return orderRepo.listOfOrderPagesNotDelivered(status,pageable);
	}
	
	public List<Order> getListOfOrdersByStatusNotDelivered(Status status)
	{
		return orderRepo.listOfOrderNotDelivered(status);
	}
	
	public Order findOrderById(int id)
	{
		if(orderRepo.findById(id).isPresent())
		{
			return orderRepo.findById(id).get();
		}
		else
			return null;
	}
}
