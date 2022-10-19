package com.app.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.pojos.Customer;
import com.app.repo.CustomerRepo;

@Service
@Transactional
public class CustomerService {

	@Autowired
	CustomerRepo customerRepo;
	
	public Customer findCustomerByNumber(String number)
	{
		if(customerRepo.findByNumber(number).isPresent())
		{
			return customerRepo.findByNumber(number).get();
		}
		else
			return null;
	}
	
	public Customer findCustomerByID(int id)
	{
		if(customerRepo.findById(id).isPresent())
		{
			return customerRepo.findById(id).get();
		}
		else
			return null;
	}
	
	public void saveCustomer(Customer c)
	{
		customerRepo.save(c);
	}
	
	public long findTotalCustomerCount()
	{
		return customerRepo.count();
	}
	
}
