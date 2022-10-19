package com.app.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.app.pojos.Category;
import com.app.repo.CategoryRepo;

@Service
@Transactional
public class CategoryService {

	@Autowired
	CategoryRepo categoryRepo;
	
	public Page<Category> getCategoriesForHomePage()
	{
		int pageSize = 5;
		int pageNum=1;
	    Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
		return categoryRepo.findAll(pageable);
	}
	
	public List<Category> showAllCategory()
	{
		return categoryRepo.findAll();
	}
	
	public Category findCategoryByName(String name)
	{
		
			if(categoryRepo.findByName(name).isPresent())
			{
				return categoryRepo.findByName(name).get();
			}
			else
				return null;
		
	}
	
	public Category findCategoryByID(int id)
	{
		if(categoryRepo.findById(id).isPresent())
		{
			return categoryRepo.findById(id).get();
		}
		else
			return null;
	}
	
	public Page<Category> findCategoriesForSeeAllCategories(int pageNum)
	{
		int pageSize = 8;
	    Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
	    return categoryRepo.findAll(pageable);
	
	}
	
	public void saveCategory(Category category)
	{
		categoryRepo.save(category);
	}
	
	public List<Category> getCategotyNames()
	{
		int pageSize = 6;
		int pageNum=1;
	    Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
		return categoryRepo.findCategoryNames(pageable);
	}
	
	public void deleteCategory(Category category)
	{
		categoryRepo.delete(category);
	}
}
