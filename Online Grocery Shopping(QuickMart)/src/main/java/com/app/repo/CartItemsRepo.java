package com.app.repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.app.pojos.Cart;
import com.app.pojos.CartItems;
import com.app.pojos.Product;

public interface CartItemsRepo extends JpaRepository<CartItems,Integer>{
	
	@Query(value = "select c from CartItems c where c.cart=:cart")
	List<CartItems> findByCartID(@Param("cart")Cart cart);
	
	@Query(value = "select c from CartItems c where c.product=:p")
	List<CartItems> findByProductId(@Param("p")Product product);
	
	Optional<CartItems> findByProduct(Product product);
}
