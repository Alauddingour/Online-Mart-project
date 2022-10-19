package com.app.pojos;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(name = "cart_proj")
public class Cart {
	@Id
	@Column(name = "cart_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "customer_id",unique = true)
    private Customer customer;
	@OneToMany(mappedBy = "cart", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<CartItems> cartItems=new ArrayList<>();
	
	
	
	public Cart() {
		super();
	}



	public Cart(int id, Customer customer, List<CartItems> cartItems) {
		super();
		this.id = id;
		this.customer = customer;
		this.cartItems = cartItems;
	}



	public Cart(Customer customer) {
		super();
		this.customer = customer;
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public Customer getCustomer() {
		return customer;
	}



	public void setCustomer(Customer customer) {
		this.customer = customer;
	}



	public List<CartItems> getCartItems() {
		return cartItems;
	}



	public void setCartItems(List<CartItems> cartItems) {
		this.cartItems = cartItems;
	}



	@Override
	public String toString() {
		return "Cart [id=" + id + ", customer=" + customer + ", cartItems=" + cartItems + "]";
	}
	
	
}
