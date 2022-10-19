package com.app.pojos;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(uniqueConstraints = @UniqueConstraint(columnNames = {"product_id","cart_id"}))
public class CartItems {
	@Id
	@Column(name = "cartItems_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private long quantity;
	@ManyToOne
	@JoinColumn(name = "cart_id", nullable = false) 
	private Cart cart;
	@ManyToOne
	@JoinColumn(name = "product_id",nullable = false) 
	private Product product;
	
	
	public CartItems() {
		super();
	}


	public CartItems(int id, long quantity, Cart cart, Product product) {
		super();
		this.id = id;
		this.quantity = quantity;
		this.cart = cart;
		this.product = product;
	}


	public CartItems(long quantity, Cart cart, Product product) {
		super();
		this.quantity = quantity;
		this.cart = cart;
		this.product = product;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public long getQuantity() {
		return quantity;
	}


	public void setQuantity(long quantity) {
		this.quantity = quantity;
	}


	public Cart getCart() {
		return cart;
	}


	public void setCart(Cart cart) {
		this.cart = cart;
	}


	public Product getProduct() {
		return product;
	}


	public void setProduct(Product product) {
		this.product = product;
	}


	@Override
	public String toString() {
		return "CartItems [id=" + id + ", quantity=" + quantity + ", cart=" + cart + ", product=" + product + "]";
	}
	
}
