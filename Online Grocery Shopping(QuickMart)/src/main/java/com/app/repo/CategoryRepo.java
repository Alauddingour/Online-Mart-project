package com.app.repo;

import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.app.pojos.Category;

public interface CategoryRepo extends JpaRepository<Category, Integer>{

	public Optional<Category> findByName(String name);
	
	@Query(value = "select c from Category c")
	public List<Category> findCategoryNames(Pageable pageable);
}
