package com.app.repo;

import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.app.pojos.Customer;
import com.app.pojos.Order;
import com.app.pojos.Status;

public interface OrderRepo extends JpaRepository<Order, Integer> {

	public Optional<Order> findById(int id);
	
	@Query(value = "select o from Order o where o.customer=:c AND o.status NOT IN :s")
	List<Order> findByCustomerPlaced(@Param("c")Customer customer,@Param("s") Status status);
	
	@Query(value = "select o from Order o where o.customer=:c AND o.status=:s")
	List<Order> findByCustomerDelivered(@Param("c")Customer customer,@Param("s") Status status);

	/*
	 * @Modifying
	 * 
	 * @Query(value = "delete from Order o where o.status=:s AND ")
	 */
	void deleteByStatusAndId(Status status,int id);
	
	
	@Query(value = "select o from Order o where o.status=:s")
	List<Order> listOfOrder(@Param("s") Status status);
	
	@Query(value = "select o from Order o where o.status=:s")
	Page<Order> listOfOrderPages(@Param("s") Status status,Pageable pageable);
	
	@Query(value = "select o from Order o where o.status NOT IN :s")
	Page<Order> listOfOrderPagesNotDelivered(@Param("s") Status status,Pageable pageable);
	
	@Query(value = "select o from Order o where o.status NOT IN :s")
	List<Order> listOfOrderNotDelivered(@Param("s") Status status);
}
