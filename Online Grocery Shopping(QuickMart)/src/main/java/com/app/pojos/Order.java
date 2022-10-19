package com.app.pojos;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "order_proj")
public class Order {
	@Id
	@Column(name = "order_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private LocalDateTime Order_date;
	private LocalDateTime delivered_date;
	@Enumerated(EnumType.STRING)
	private Status status;
	@ManyToOne
	@JoinColumn(name = "customer_id", nullable = false) 
	private Customer customer;
	@OneToMany(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<OrderItems> orderItems=new ArrayList<>();
	public Order(LocalDateTime order_date, Status status, Customer customer) {
		super();
		Order_date = order_date;
		this.status = status;
		this.customer = customer;
	}
	public Order(int id, LocalDateTime order_date, LocalDateTime delivered_date, Status status, Customer customer,
			List<OrderItems> orderItems) {
		super();
		this.id = id;
		Order_date = order_date;
		this.delivered_date = delivered_date;
		this.status = status;
		this.customer = customer;
		this.orderItems = orderItems;
	}
	public Order() {
		super();
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public LocalDateTime getOrder_date() {
		return Order_date;
	}
	public void setOrder_date(LocalDateTime order_date) {
		Order_date = order_date;
	}
	public LocalDateTime getDelivered_date() {
		return delivered_date;
	}
	public void setDelivered_date(LocalDateTime delivered_date) {
		this.delivered_date = delivered_date;
	}
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public List<OrderItems> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(List<OrderItems> orderItems) {
		this.orderItems = orderItems;
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", Order_date=" + Order_date + ", delivered_date=" + delivered_date + ", status="
				+ status + ", customer=" + customer + ", orderItems=" + orderItems + "]";
	}
	
	
}
