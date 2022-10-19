package com.app.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.pojos.Cart;
import com.app.pojos.Customer;

public interface CartRepo extends JpaRepository<Cart, Integer>{
	Optional<Cart> findByCustomer(Customer customer);
}
