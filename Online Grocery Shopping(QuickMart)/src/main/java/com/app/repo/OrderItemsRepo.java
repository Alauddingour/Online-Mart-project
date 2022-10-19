package com.app.repo;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.app.pojos.Brands;
import com.app.pojos.Category;
import com.app.pojos.Order;
import com.app.pojos.OrderItems;
import com.app.pojos.Product;
import com.app.pojos.Status;

public interface OrderItemsRepo extends JpaRepository<OrderItems,Integer > {

	@Query(value = "select o from OrderItems o where o.order=:or")
	List<OrderItems> findByOrder1(@Param("or") Order order);
	
	@Query(value = "select count(*) from OrderItems o where o.order.status IN :s")
	long getPlacedOrderCount(@Param("s") Status status);
	
	@Modifying
	@Query(value = "delete from OrderItems o where o.product=:p AND o.order IN :l")
	void deleteOrderItems(@Param("p") Product product,@Param("l") List<Order> list);
	
	@Query(value = "select o from OrderItems o where o.product.category=:c AND o.order.status IN :s")        //////////////
	List<OrderItems> findOrderItemsByCategoryAndStatus(@Param("c") Category category,@Param("s") Status status);
	
	@Query(value = "select o from OrderItems o where o.product.brands=:b AND o.order.status IN :s")      
	List<OrderItems> findOrderItemsByBrandsAndStatus(@Param("b") Brands brands,@Param("s") Status status);
	
	@Query(value = "select o from OrderItems o where o.product=:p AND o.order.status NOT IN :s")
	List<OrderItems> findOrderItemsNotInDelivered(@Param("p") Product product,@Param("s") Status status);
	
	@Query(value = "select o from OrderItems o where o.product=:p")
	List<OrderItems> listByProduct(@Param("p") Product product);
	
	@Query(value = "select o.order from OrderItems o where o.product=:p")
	List<Order> getListOfOrdersByProduct(@Param("p") Product product);
}

