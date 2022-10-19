package com.app.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.app.pojos.Brands;
import com.app.pojos.Category;
import com.app.pojos.Product;
import com.app.repo.BrandRepo;
import com.app.repo.CategoryRepo;
import com.app.repo.ProductRepo;

@Service
@Transactional
public class ProductService {
	@Autowired 
	ProductRepo productRepo;
	
	@Autowired
	BrandRepo brandRepo;
	
	@Autowired
	CategoryRepo categoryRepo;
	
	public List<Product> showAllProduct()
	{
		return productRepo.findAll();
	}
	
	public Page<Product> getProductsPage(int pageNum)
	{
		int pageSize = 8;
	    Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
		return productRepo.findAll(pageable);
	}
	
	public Page<Product> getAllProductsPage(int pageNum)
	{
		int pageSize =8;
	    Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
		return productRepo.findAll(pageable);
	}
	
	public Page<Product> getProductsForHomePage()
	{
		int pageSize = 5;
		int pageNum=1;
	    Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
		return productRepo.findAll(pageable);
	}
	
	public void saveProduct(Product product,String category,String brand)
	{
		product.setBrands(brandRepo.findByName(brand).orElseThrow(()->new RuntimeException("dd")));
		product.setCategory(categoryRepo.findByName(category).orElseThrow(()->new RuntimeException("dd")));
		productRepo.save(product);
	}
	
	public Product findProductByName(String name)
	{
		
			if(productRepo.findByName(name).isPresent())
			{
				return productRepo.findByName(name).get();
			}
			else
				return null;
	}
	
	public Product findProductByID(int id)
	{
		if(productRepo.findById(id).isPresent())
		{
			return productRepo.findById(id).get();
		}
		else
			return null;
	}
	
	public List<Product> findProductByBrand(Brands b)
	{
		int pageSize = 5;
		int pageNum=1;
	    Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
	    return productRepo.findByBrand(b,pageable);
	
	}
	
	public List<Product> findProductByCategories(Category c)
	{
		int pageSize = 5;
		int pageNum=1;
	    Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
			return productRepo.findByCategory(c,pageable);
	}
	
	public Page<Product> findProductByCategoriesForUserShowProduct(Category c,int pageNum)
	{
		int pageSize = 8;
	    Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
		return productRepo.findByCategory2(c, pageable);
	}
	
	public Page<Product> findProductByBrandForUserShowProduct(Brands b,int pageNum)
	{
		int pageSize = 8;
	    Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
		return productRepo.findByBrand2(b, pageable);
	}
	
	public void deleteProduct(int id)
	{
		productRepo.deleteProduct(id);
	}
	
	public long findAvailableProductsCount(boolean available)
	{
		return productRepo.countByInStockIn(available);
	}
	 
	public void saveProduct(Product product)
	{
		productRepo.save(product);
	}
}
