package com.app.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.pojos.Cart;
import com.app.pojos.CartItems;
import com.app.pojos.Product;
import com.app.repo.CartItemsRepo;

@Service
@Transactional
public class CartItemsService {

	@Autowired
	CartItemsRepo cartItemsRepo;

	public List<CartItems> findCartItemsByCart(Cart cart)
	{
		return cartItemsRepo.findByCartID(cart);
	}

	public void deleteCartItemsService(int id)
	{
		cartItemsRepo.deleteById(id);
	}
	
	public void deleteAllCartItems()
	{
		cartItemsRepo.deleteAll();
	}
	
	public void deleteCartItemsById(int id)
	{
		cartItemsRepo.deleteById(id);
	}
	
	public CartItems findCartItemsByProduct(Product p)
	{
		if(cartItemsRepo.findByProduct(p).isPresent())
		{
			return cartItemsRepo.findByProduct(p).get();
		}
		else
			return null;
	}
	
	public void saveCartItems(CartItems cartItems)
	{
		cartItemsRepo.save(cartItems);
	}
	
	public CartItems findCartItemsById(int id)
	{
		if(cartItemsRepo.findById(id).isPresent())
		{
			return cartItemsRepo.findById(id).get();
		}
		else
			return null;
	}
	public List<CartItems> findCartItemsByProductId(Product product)
	{
		return cartItemsRepo.findByProductId(product);
	}
	
	public void deleteCartItems(CartItems cartItems)
	{
		cartItemsRepo.delete(cartItems);
	}
}
