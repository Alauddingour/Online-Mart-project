package com.app.repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.app.pojos.Brands;
import com.app.pojos.Category;
import com.app.pojos.Product;

public interface ProductRepo extends JpaRepository<Product, Integer> {
	
	public Optional<Product> findByName(String name);
	
	@Query(value ="select p from Product p where p.brands=:b")
	List<Product> findByBrand(@Param("b")Brands id,Pageable pageable);
	
	@Query(value ="select p from Product p where p.category=:c")
	List<Product> findByCategory(@Param("c")Category id,Pageable pageable);
	
	@Query(value ="select p from Product p where p.category=:c")
	Page<Product> findByCategory2(@Param("c")Category id,Pageable pageable);
	
	@Query(value ="select p from Product p where p.brands=:b")
	Page<Product> findByBrand2(@Param("b")Brands id,Pageable pageable);
	
	@Query(value ="select count(*) from Product p where p.inStock=:b")
	long countByInStockIn(@Param("b") boolean isAvailable);
	
	@Modifying
	@Query(value ="delete from Product p where p.id=:i")
	public void deleteProduct(@Param("i") int id);
}
