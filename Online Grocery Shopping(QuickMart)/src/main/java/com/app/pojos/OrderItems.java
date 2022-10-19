package com.app.pojos;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderItems {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private long quantity;
	private double discount;
	private double price;
	@ManyToOne
	@JoinColumn(name = "order_id", nullable = false) 
	private Order order;
	@ManyToOne
	@JoinColumn(name = "product_id", nullable = false) 
	private Product product;
	public OrderItems(long quantity, double discount, double price, Order order, Product product) {
		super();
		this.quantity = quantity;
		this.discount = discount;
		this.price = price;
		this.order = order;
		this.product = product;
	}
	public OrderItems(int id, long quantity, double discount, double price, Order order, Product product) {
		super();
		this.id = id;
		this.quantity = quantity;
		this.discount = discount;
		this.price = price;
		this.order = order;
		this.product = product;
	}
	public OrderItems() {
		super();
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
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	@Override
	public String toString() {
		return "OrderItems [id=" + id + ", quantity=" + quantity + ", discount=" + discount + ", price=" + price
				+ ", order=" + order + ", product=" + product + "]";
	}
	
	
}
