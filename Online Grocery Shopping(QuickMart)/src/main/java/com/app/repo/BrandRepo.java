package com.app.repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.app.pojos.Brands;


public interface BrandRepo extends JpaRepository<Brands, Integer>{
	public Optional<Brands> findByName(String name);
	
	@Query(value = "select b from Brands b")
	public List<Brands> findBrandsNames(Pageable pageable);

}
