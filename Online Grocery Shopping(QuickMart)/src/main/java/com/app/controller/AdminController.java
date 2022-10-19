package com.app.controller;

import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.app.pojos.Brands;
import com.app.pojos.CartItems;
import com.app.pojos.Category;
import com.app.pojos.Order;
import com.app.pojos.OrderItems;
import com.app.pojos.Product;
import com.app.pojos.Status;
import com.app.service.BrandService;
import com.app.service.CartItemsService;
import com.app.service.CartService;
import com.app.service.CategoryService;
import com.app.service.CustomerService;
import com.app.service.OrderItemsService;
import com.app.service.OrderService;
import com.app.service.ProductService;

@Controller
public class AdminController {

	@Autowired
	BrandService brandService;
	
	@Autowired
	CartItemsService cartItemsService;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	CustomerService customerService;
	
	@Autowired
	OrderItemsService orderItemsService;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	ProductService productService ;

	@GetMapping("/addProduct")
	public String showAddPage(HttpSession session) {
		if(session.getAttribute("admin")==null)
		{
			return "redirect:/Home";
		}
		session.setAttribute("category", categoryService.showAllCategory());
		session.setAttribute("brand", brandService.showAllBrands());
		return "/addProduct";
	}

	@PostMapping("/addProduct")
	public String processAddPage(HttpSession session, @RequestParam String name, @RequestParam String description,
			@RequestParam String price, @RequestParam String image, @RequestParam String brand,
			@RequestParam String category, RedirectAttributes flash,Model map,LocalDateTime now) {
		try {
			if(productService.findProductByName(name)!=null)
			{
				flash.addFlashAttribute("message", "Product with same name already exists");
				return "redirect:/addProduct";
			}
			now = LocalDateTime.now();
			Product p = new Product(name, description, Double.parseDouble(price), image, true, now, now);
			productService.saveProduct(p, category, brand);
			flash.addFlashAttribute("message", "Product Added");
			session.removeAttribute("name");
			session.removeAttribute("description");
			session.removeAttribute("price");
			return "redirect:/addProduct";

		} catch (Exception e) {
			flash.addFlashAttribute("message", "Product Not Added");
			e.printStackTrace();
			return "redirect:/addProduct";
		}
	}

	@GetMapping("/addBrand")
	public String showAddBrandPage(Model map, @RequestParam String name, @RequestParam String description,
			@RequestParam double price,HttpSession session) {
		if(session.getAttribute("admin")==null)
		{
			return "redirect:/Home";
		}
		session.setAttribute("name", name);
		session.setAttribute("description", description);
		session.setAttribute("price", price);
		return "/addBrand";
	}

	@PostMapping("/addBrand")
	public String processAddBrandPage(@RequestParam String name, RedirectAttributes flashmap,HttpSession session) {
		
		if(brandService.findBrandByName(name)!=null)
		{
			flashmap.addFlashAttribute("message", "Brand with same name already exists");
			return "redirect:/addBrand";
		}
		Brands b = new Brands(name);
		brandService.saveBrand(b);
		flashmap.addFlashAttribute("message", "Brand added");
		return "redirect:/addProduct";
	}

	@PostMapping("/addnewBrand")
	public String processAddNewBrandPage(@RequestParam String name, RedirectAttributes flashmap,HttpSession session) {
		if(brandService.findBrandByName(name)!=null)
		{
			flashmap.addFlashAttribute("message", "Brand with same name already exists");
			return "redirect:/addnewBrand";
		}
		Brands b = new Brands(name);
		brandService.saveBrand(b);
		flashmap.addFlashAttribute("message", "Brand added");
		return "redirect:/showBrandPages";
	}

	@GetMapping("/addnewBrand")
	public String showAddBrandPage() {
		return "/addBrand";
	}

	@GetMapping("/addnewCategory")
	public String showAddCategoryPage() {
		return "/addCategory";
	}

	@GetMapping("/addCategory")
	public String showAddCategoryPage(Model map, @RequestParam String name, @RequestParam String description,
			@RequestParam double price,HttpSession session) {
		if(session.getAttribute("admin")==null)
		{
			return "redirect:/Home";
		}
		session.setAttribute("name", name);
		session.setAttribute("description", description);
		session.setAttribute("price", price);
		return "/addCategory";
	}

	@PostMapping("/addCategory")
	public String processAddCategoryPage(@RequestParam String name, RedirectAttributes flashmap,
			@RequestParam String image, @RequestParam String description) {
		if(categoryService.findCategoryByName(name)!=null)
		{
			flashmap.addFlashAttribute("message", "Category with same name already exists");
			return "redirect:/addProduct";
		}
		Category c = new Category(name, description, image);
		categoryService.saveCategory(c);
		flashmap.addFlashAttribute("message", "Category added");
		return "redirect:/addProduct";
	}

	@PostMapping("/addnewCategory")
	public String processAddNewCategoryPage(@RequestParam String name, RedirectAttributes flashmap,
			@RequestParam String image, @RequestParam String description) {
		if(categoryService.findCategoryByName(name)!=null)
		{
			flashmap.addFlashAttribute("message", "Category with same name already exists");
			return "redirect:/addnewCategory";
		}
		Category c = new Category(name, description, image);
		categoryService.saveCategory(c);
		flashmap.addFlashAttribute("message", "Category added");
		return "redirect:/showCategoryPages";
	}

	@GetMapping("/showProductsPages")
	public String showAllProductsPageWithPageble(Model m, @RequestParam(defaultValue = "1") Integer pageNum,HttpSession session) {
		if(session.getAttribute("admin")==null)
		{
			return "redirect:/Home";
		}
		Page<Product> pages = productService.getProductsPage(pageNum);
		m.addAttribute("allProducts", productService.showAllProduct());
		m.addAttribute("currentPage", pageNum);
		m.addAttribute("number", pages.getNumber());
		m.addAttribute("totalPages", pages.getTotalPages());
		m.addAttribute("totalElements", pages.getTotalElements());
		m.addAttribute("size", pages.getSize());
		m.addAttribute("data", pages.getContent());
		return "/showProductsPages";
	}

	@GetMapping("/editProduct")
	public String editProduct(Model map, @RequestParam int id,HttpSession session) {
		if(session.getAttribute("admin")==null)
		{
			return "redirect:/Home";
		}
		Product p = productService.findProductByID(id);
		session.setAttribute("category", categoryService.showAllCategory());
		session.setAttribute("brand", brandService.showAllBrands());
		session.setAttribute("product", p);
		return "/editProduct";
	}
	
	@GetMapping("/editCategory")
	public String editCategory(Model map, @RequestParam int id,HttpSession session) {
		if(session.getAttribute("admin")==null)
		{
			return "redirect:/Home";
		}
		Category c = categoryService.findCategoryByID(id);
		session.setAttribute("category", c);
		return "/editCategory";
	}
	
	@GetMapping("/editBrand")
	public String editBrand(Model map, @RequestParam int id,HttpSession session,Brands b) {
		if(session.getAttribute("admin")==null)
		{
			return "redirect:/Home";
		}
		b = brandService.findBrandByID(id);
		session.setAttribute("brand", b);
		return "/editBrand";
	}
	
	@PostMapping("/editBrand")
	public String processEditBrand(@RequestParam String name, RedirectAttributes flashmap,HttpSession session,Brands b)
	{
			if(brandService.findBrandByName(name)!=null)
			{
				flashmap.addFlashAttribute("message", "Brand with same name already exists");
				return "redirect:/editBrand";
			}
			b=(Brands)session.getAttribute("brand");
			b.setName(name);
			brandService.saveBrand(b);
			session.removeAttribute("brand");
			flashmap.addFlashAttribute("message", "Brand Updated");
			return "redirect:/showBrandPages";
	}
	
	@PostMapping("/editCategory")
	public String processEditCategory(@RequestParam String name, RedirectAttributes flashmap,
			@RequestParam String image, @RequestParam String description,HttpSession session) {
		if(categoryService.findCategoryByName(name)!=null)
		{
			flashmap.addFlashAttribute("message", "Category with same name already exists");
			return "redirect:/editCategory";
		}
		Category c = (Category)session.getAttribute("category");
		c.setName(name);
		c.setDescription(description);
		c.setImage(image);
		categoryService.saveCategory(c);
		session.removeAttribute("category");
		flashmap.addFlashAttribute("message", "Category Updated");
		return "redirect:/showCategoryPages";
	}
	

	@PostMapping("/editProduct")
	public String processEditProductPage(HttpSession session, @RequestParam String name, @RequestParam String description,
			@RequestParam double price, @RequestParam String image, @RequestParam String brand,
			@RequestParam String category, RedirectAttributes flash,Model map,LocalDateTime now ) {
		try {
			Product p=(Product)session.getAttribute("product");
			if(productService.findProductByName(name)!=null)
			{
				flash.addFlashAttribute("message", "Product with same name already exists");
				return "redirect:/editProduct";
			}
			now = LocalDateTime.now();
			p.setName(name);
			p.setDescription(description);
			p.setPrice(price);
			p.setImage(image);
			p.setLast_modified(now);
			productService.saveProduct(p, category, brand);
			flash.addFlashAttribute("message", "Product Updated");
			session.removeAttribute("category");
			session.removeAttribute("brand");
			session.removeAttribute("product");
			return "redirect:/showProductsPages";

		} catch (Exception e) {
			flash.addFlashAttribute("message", "Product Not Updated");
			e.printStackTrace();
			return "redirect:/editProduct";
		}
	}
	
	
	@GetMapping("/deleteCategory")
	public String showDeleteCategoryPage(@RequestParam int id,RedirectAttributes flashMap,HttpSession session,Category c)
	{
		try
		{
			if(session.getAttribute("admin")==null)
			{
				return "redirect:/Home";
			}
			c=categoryService.findCategoryByID(id);
			List<Product> list=productService.findProductByCategories(c);

			for (Product p : list) {
				List<CartItems> list1=cartItemsService.findCartItemsByProductId(p);
				if(!list1.isEmpty())
				{
					for (CartItems cartItems : list1) {
						cartItemsService.deleteCartItems(cartItems);
					}
				}
				List<Order> ordersList=orderItemsService.findOrderByProduct(p);
				orderItemsService.deleteOrderItemsByProduct(p,orderService.getListOfOrdersByStatus(Status.DELIVERED));
				if(ordersList!=null)
				{
					for (Order item : ordersList) {
						orderService.deleteOrderByStatusAndOrderId(Status.DELIVERED,item.getId());
					}
				}
				
				productService.deleteProduct(p.getId());
			}
			categoryService.deleteCategory(c);
			flashMap.addFlashAttribute("message", "Category deleted");
			return "redirect:/showCategoryPages";
		}
		catch(Exception e)
		{
			flashMap.addFlashAttribute("message", "Can't delete category");
			return "redirect:/showCategoryPages";
		}
	}
	
	@GetMapping("/deleteBrand")
	public String showDeleteBrandPage(@RequestParam int id,RedirectAttributes flashMap,HttpSession session,Brands b)
	{
		try
		{
			if(session.getAttribute("admin")==null)
			{
				return "redirect:/Home";
			}
			b=brandService.findBrandByID(id);
			List<Product> list=productService.findProductByBrand(b);
			for (Product p : list) {
				List<CartItems> list1=cartItemsService.findCartItemsByProductId(p);
				if(!list.isEmpty())
				{
					for (CartItems c : list1) {
						cartItemsService.deleteCartItems(c);
					}
				}
				List<Order> ordersList=orderItemsService.findOrderByProduct(p);
				orderItemsService.deleteOrderItemsByProduct(p,orderService.getListOfOrdersByStatus(Status.DELIVERED));
				if(ordersList!=null)
				{
					for (Order item : ordersList) {
						orderService.deleteOrderByStatusAndOrderId(Status.DELIVERED,item.getId());
					}
				}
				
				productService.deleteProduct(p.getId());
			}
			brandService.deleteBrand(b);
			flashMap.addFlashAttribute("message", "Brand deleted");
			return "redirect:/showBrandPages";
		}
		catch(Exception e)
		{
			flashMap.addFlashAttribute("message", "Can't delete brand");
			return "redirect:/showBrandPages";
		}
	}
	
	@GetMapping("/deleteProduct")
	public String showDeleteProductPage(@RequestParam int id,RedirectAttributes flashMap,HttpSession session,Product product)
	{
		try {
			if(session.getAttribute("admin")==null)
			{
				return "redirect:/Home";
			}
		product=productService.findProductByID(id);
		List<CartItems> list=cartItemsService.findCartItemsByProductId(product);
		if(!list.isEmpty())
		{
			for (CartItems c : list) {
				cartItemsService.deleteCartItems(c);
			}
		}
		List<Order> ordersList=orderItemsService.findOrderByProduct(product);
		orderItemsService.deleteOrderItemsByProduct(product,orderService.getListOfOrdersByStatus(Status.DELIVERED));
		if(ordersList!=null)
		{
			for (Order item : ordersList) {
				/* if(item.getStatus()==Status.DELIVERED) */
				orderService.deleteOrderByStatusAndOrderId(Status.DELIVERED,item.getId());
				/* orderService.deleteOrderByOrderId(item.getId()); */
			}
		}
		productService.deleteProduct(product.getId());
		flashMap.addFlashAttribute("message", "Product Deleted");
		return "redirect:/showProductsPages";}
		catch(Exception e)
		{
			e.printStackTrace();
			flashMap.addFlashAttribute("message", "Can't delete product currently in active orders");
			return "redirect:/showProductsPages";
		}
	}
	
	@GetMapping("/showCategoryPages")
	public String showCategoriesPage(Model m, @RequestParam(defaultValue = "1") Integer pageNum) {
		Page<Category> pages = categoryService.findCategoriesForSeeAllCategories(pageNum);
		m.addAttribute("allCategories", categoryService.showAllCategory());
		m.addAttribute("currentPage", pageNum);
		m.addAttribute("number", pages.getNumber());
		m.addAttribute("totalPages", pages.getTotalPages());
		m.addAttribute("totalElements", pages.getTotalElements());
		m.addAttribute("size", pages.getSize());
		m.addAttribute("data", pages.getContent());
		return "/showCategoryPages";
	}

	@GetMapping("/showBrandPages")
	public String showBrandPage(Model m, @RequestParam(defaultValue = "1") Integer pageNum) {
		Page<Brands> pages = brandService.getAllBrandNames(pageNum);
		m.addAttribute("allBrands", brandService.showAllBrands());
		m.addAttribute("currentPage", pageNum);
		m.addAttribute("number", pages.getNumber());
		m.addAttribute("totalPages", pages.getTotalPages());
		m.addAttribute("totalElements", pages.getTotalElements());
		m.addAttribute("size", pages.getSize());
		m.addAttribute("data", pages.getContent());
		return "/showBrandPages";
	}
	
	@GetMapping("/showOrders")
	public String showOrdersPage(Model map) {
		map.addAttribute("orders", orderItemsService.showAllOrderItems());
		return "/showOrders";
	}

	@GetMapping("/AdminDashboard")
	public String showAdminDashboard(HttpSession session,Model map)
	{
		if(session.getAttribute("admin")==null)
		{
			return "redirect:/Home";
		}
		map.addAttribute("totalUsers", customerService.findTotalCustomerCount());
		map.addAttribute("availableProducts", productService.findAvailableProductsCount(true));
		map.addAttribute("recentOrders", orderItemsService.findPlacedOrderCount(Status.PLACED));
		return "/AdminDashboard";
		
	}
	
	@GetMapping("/searchProduct")
	public String showSearchProductPage(@RequestParam int id,Model map,HttpSession session,Product p)
	{
		if(session.getAttribute("admin")==null)
		{
			return "redirect:/Home";
		}
		p=productService.findProductByID(id);
		map.addAttribute("searchProduct", p);
		return "/searchProduct";
	}
	
	@GetMapping("/searchOrder")
	public String showSearchOrderPage(@RequestParam int id,Model map,HttpSession session,Order o)
	{
		if(session.getAttribute("admin")==null)
		{
			return "redirect:/Home";
		}
		o=orderService.findOrderById(id);
		map.addAttribute("order", o);
		return "/searchOrder";
	}
	
	@GetMapping("/searchCategory")
	public String showSearchCategoryPage(@RequestParam int id,Model map,HttpSession session,Category category)
	{
		if(session.getAttribute("admin")==null)
		{
			return "redirect:/Home";
		}
		category=categoryService.findCategoryByID(id);
		map.addAttribute("searchCategory", category);
		return "/searchCategory";
	}
	
	@GetMapping("/searchBrand")
	public String showSearchBrandPage(@RequestParam int id,Model map,HttpSession session,Brands brand)
	{
		if(session.getAttribute("admin")==null)
		{
			return "redirect:/Home";
		}
		brand=brandService.findBrandByID(id);
		map.addAttribute("searchBrand", brand);
		return "/searchBrand";
	}
	
	
	@GetMapping("/changeAvailability")
	public String processChangeAvailability(@RequestParam int id,HttpSession session,Product p)
	{
		if(session.getAttribute("admin")==null)
		{
			return "redirect:/Home";
		}
		p=productService.findProductByID(id);
		p.setInStock(false);
		productService.saveProduct(p);
		return "redirect:/showProductsPages";
	}
	
	@GetMapping("/changeAvailabilityAvailable")
	public String processChangeAvailabilityAvailable(@RequestParam int id,HttpSession session,Product p)
	{
		if(session.getAttribute("admin")==null)
		{
			return "redirect:/Home";
		}
		p=productService.findProductByID(id);
		p.setInStock(true);
		productService.saveProduct(p);
		return "redirect:/showProductsPages";
	}
	
	@GetMapping("/PreviousOrders")
	public String showPreviousOrdersPage(Model map,@RequestParam(defaultValue = "1") int pageNum,HttpSession session)
	{
		if(session.getAttribute("admin")==null)
		{
			return "redirect:/Home";
		}
		Page<Order> pages=orderService.getListOfOrdersByStatusPages(Status.DELIVERED,pageNum);
		map.addAttribute("allDeliveredOrders", orderService.getListOfOrdersByStatus(Status.DELIVERED));
		map.addAttribute("currentPage", pageNum);
		map.addAttribute("number", pages.getNumber());
		map.addAttribute("totalPages", pages.getTotalPages());
		map.addAttribute("totalElements", pages.getTotalElements());
		map.addAttribute("size", pages.getSize());
		map.addAttribute("data", pages.getContent());
		return "/PreviousOrders";
	}
	
	@GetMapping("/PendingOrders")
	public String showPendingOrdersPage(Model map,@RequestParam(defaultValue = "1") int pageNum,HttpSession session)
	{
		if(session.getAttribute("admin")==null)
		{
			return "redirect:/Home";
		}
		Page<Order> pages=orderService.getListOfOrdersByStatusPagesNotDelivered(Status.DELIVERED,pageNum);
		map.addAttribute("allPendingOrders", orderService.getListOfOrdersByStatusNotDelivered(Status.DELIVERED));
		map.addAttribute("currentPage", pageNum);
		map.addAttribute("number", pages.getNumber());
		map.addAttribute("totalPages", pages.getTotalPages());
		map.addAttribute("totalElements", pages.getTotalElements());
		map.addAttribute("size", pages.getSize());
		map.addAttribute("data", pages.getContent());
		return "/PendingOrders";
	}
	
	@GetMapping("/adminOrderDetails")
	public String showAdminOrderDetailsPage(Model map,@RequestParam int id,HttpSession session,Order o)
	{
		if(session.getAttribute("admin")==null)
		{
			return "redirect:/Home";
		}
		int TotalQuantity=0;
		int TotalPrice=0;
		o=orderService.findOrderById(id);
		List<OrderItems> list= orderItemsService.getOrderItemsListByOrder(o);
		map.addAttribute("data",list);
		for (OrderItems orderItems : list) {
			TotalQuantity += orderItems.getQuantity();
			TotalPrice += orderItems.getProduct().getPrice() * orderItems.getQuantity();
		}
		map.addAttribute("total_quantity",TotalQuantity);
		map.addAttribute("total_price",TotalPrice);
		return "/adminOrderDetails";
	}
	
	@GetMapping("/changeOrderStatus")
	public String changeOrderStatus(@RequestParam int id,@RequestParam int id2,HttpSession session,Order order)
	{
		if(session.getAttribute("admin")==null)
		{
			return "redirect:/Home";
		}
		order=orderService.findOrderById(id);
		if(id2==1)
		{
			order.setStatus(Status.OUT_FOR_DELIVERY);
			orderService.saveOrder(order);
			return "redirect:/PendingOrders";
		}
		if(id2==2)
			order.setStatus(Status.DELIVERED);
		    order.setDelivered_date(LocalDateTime.now());
		    orderService.saveOrder(order);
		    return "redirect:/PendingOrders";
	}
	
}
