package com.app.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.app.pojos.Brands;
import com.app.repo.BrandRepo;

@Service
@Transactional
public class BrandService {
	
	@Autowired
	BrandRepo brandRepo;
	
	public List<Brands> showAllBrands()
	{
		return brandRepo.findAll();
	}
	
	public Brands findBrandByName(String name)
	{
		
			if(brandRepo.findByName(name).isPresent())
			{
				return brandRepo.findByName(name).get();
			}
			else
				return null;
	}
	
	public void saveBrand(Brands brand)
	{
		brandRepo.save(brand);
	}
	
	public Brands findBrandByID(int id)
	{
		if(brandRepo.findById(id).isPresent())
		{
			return brandRepo.findById(id).get();
		}
		else
			return null;
	}
	
	public List<Brands> getBrandNames()
	{
		int pageSize = 6;
		int pageNum=1;
	    Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
		return brandRepo.findBrandsNames(pageable);
	}
	
	public Page<Brands> getAllBrandNames(int pageNum)
	{
		int pageSize = 12;
	    Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
		return brandRepo.findAll(pageable);
	}
	
	public void deleteBrand(Brands brands)
	{
		brandRepo.delete(brands);
	}
}
