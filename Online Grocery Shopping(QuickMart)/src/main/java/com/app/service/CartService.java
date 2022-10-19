package com.app.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.pojos.Cart;
import com.app.pojos.Customer;
import com.app.repo.CartRepo;

@Service
@Transactional
public class CartService {

	@Autowired
	CartRepo cartRepo;
	
	public void saveCart(Cart c)
	{
		cartRepo.save(c);
	}
	
	public Cart findCartByCustomer(Customer c)
	{
		if(cartRepo.findByCustomer(c).isPresent())
		{
			return cartRepo.findByCustomer(c).get();
		}
		else
			return null;
	}
}
