package com.app.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.app.pojos.Brands;
import com.app.pojos.Cart;
import com.app.pojos.CartItems;
import com.app.pojos.Category;
import com.app.pojos.Customer;
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
public class CustomerController {

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
	
	@RequestMapping("/")
	public String showIndexPage()
	{
		return "redirect:/Home";
	}
	
	@GetMapping("/login")
	public String showLoginPage(HttpSession session) {
		if (session.getAttribute("user") != null) {
			return "/Home";
		}
		return "/login";
	}

	@PostMapping("/login")
	public String processLoginPage(HttpSession session, @RequestParam String number,Customer customer) {
		customer = customerService.findCustomerByNumber(number);
		if (customer != null) {
			System.out.println(customer.getFirstName());
			session.setAttribute("userNum", customer);
			return "redirect:/password";
		}
		session.setAttribute("number", number);
		return "redirect:/signup";
	}

	@GetMapping("/signup")
	public String showSignUpPage(HttpSession session) {
		if (session.getAttribute("user") != null) {
			return "/Home";
		}
		return "/signup";
	}

	@PostMapping("/signup")
	public String processSignUpPage(@RequestParam String firstName, @RequestParam String lastName,
			@RequestParam String email, @RequestParam String password, @RequestParam String number,
			@RequestParam String address, @RequestParam String city, @RequestParam String state,
			@RequestParam String pin, @RequestParam String role, HttpSession session) {
		Customer customer = new Customer(firstName, lastName, email, password, number, role, address, city, state, pin);
		Cart cart = new Cart(customer);
		cartService.saveCart(cart);
		customer.setCart(cart);
		customerService.saveCustomer(customer);
		session.removeAttribute("number");
		return "redirect:/login";
	}

	@GetMapping("/password")
	public String showPasswordPage(HttpSession session) {
		if (session.getAttribute("user") != null) {
			return "redirect:/Home";
		}
		return "/password";
	}

	@PostMapping("/password")
	public String processPasswordPage(HttpSession session, @RequestParam String password, Model map,RedirectAttributes flashMap,Customer customer) {
		customer = (Customer) session.getAttribute("userNum");
		if (password.equals(customer.getPassword())) {
			if (customer.getRole().equals("ADMIN")) {
				session.setAttribute("admin", customer);
				session.removeAttribute("userNum");
				return "redirect:/AdminDashboard";
			}
			session.setAttribute("user", customer);
			session.removeAttribute("userNum");
			return "redirect:/Home";
		}
		flashMap.addFlashAttribute("message", "Invalid Password,Try Again");
		return "redirect:/password";
	}

	@GetMapping("/Home")
	public String showHomePage(Model map) {
		Page<Product> pages = productService.getProductsForHomePage();
		Page<Category> categories = categoryService.getCategoriesForHomePage();
		map.addAttribute("dataCategory", categories.getContent());
		map.addAttribute("dataProduct", pages.getContent());
		return "/Home";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		if(session.getAttribute("user")!=null)
		{
		session.removeAttribute("user");
		return "redirect:/Home";
		}
		if(session.getAttribute("admin")!=null)
			session.removeAttribute("admin");
			return "redirect:/login";
	}

	@GetMapping("/UserCart")
	public String showUserCart(HttpSession session, Model map,Customer customer,Cart cart) {
		if (session.getAttribute("user") == null) {
			return "redirect:/login";
		}
		int TotalQuantity = 0;
		int TotalPrice = 0;
		customer = (Customer) session.getAttribute("user");
		cart = cartService.findCartByCustomer(customer);
		List<CartItems> list = cartItemsService.findCartItemsByCart(cart);
		for (CartItems i : list) {
			TotalQuantity += i.getQuantity();
			TotalPrice += i.getProduct().getPrice() * i.getQuantity();
		}
		session.setAttribute("cartItems", list);
		map.addAttribute("total_quantity", TotalQuantity);
		map.addAttribute("total_price", TotalPrice);
		return "/UserCart";
	}

	@GetMapping("/deleteCartItem")
	public String deleteCartItems(@RequestParam int id) {
		cartItemsService.deleteCartItemsService(id);
		return "redirect:/UserCart";
	}

	@GetMapping("/checkOut")
	public String showCheckOutPage(@RequestParam int check) {

		if (check == 1) {
			return "/checkOut";
		}
		return "redirect:/Home";
	}

	@PostMapping("/checkOut")
	public String showCheckOutPage(HttpSession session) {
		@SuppressWarnings("unchecked")
		List<CartItems> list = (List<CartItems>) session.getAttribute("cartItems");
		Order order = new Order(LocalDateTime.now(), Status.PLACED, (Customer)session.getAttribute("user"));
		orderService.saveOrder(order);
		for (CartItems c : list) {
			OrderItems orderItems = new OrderItems(c.getQuantity(), 20, c.getProduct().getPrice(), order, c.getProduct());
			orderItemsService.saveOrderItems(orderItems);
		}
		session.removeAttribute("cartItems");
		cartItemsService.deleteAllCartItems();
		return "redirect:/UserOrderDetails";

	}

	@GetMapping("/UserOrderDetails")
	public String showUserOrderDetailsPage(HttpSession session, Model map,Customer c1) {
		if (session.getAttribute("user") == null) {
			return "redirect:/login";
		}
		List<List<OrderItems>> setPlaced = new ArrayList<List<OrderItems>>();
		List<List<OrderItems>> setDelivered = new ArrayList<List<OrderItems>>();
		c1 = (Customer)session.getAttribute("user");
		if (c1 == null) {
			System.out.println("null");
		}
		List<Order> listPlaced = orderService.getOrderListByCustomerPl(c1,Status.DELIVERED);
		for (Order o : listPlaced) {
			setPlaced.add(orderItemsService.getOrderItemsListByOrder(o));
		}
		map.addAttribute("setPlaced", setPlaced);
		map.addAttribute("setDelivered", setDelivered);
		session.setAttribute("user", c1);

		return "/UserOrderDetails";
	}
	
	@GetMapping("/ProductPage")
	public String showProduct(Model map, @RequestParam int id,Product product) {
		
		product= productService.findProductByID(id);
		map.addAttribute("allProducts", productService.showAllProduct());
		map.addAttribute("product", productService.findProductByID(id));
		map.addAttribute("brands", productService.findProductByBrand(product.getBrands()));
		map.addAttribute("categories", productService.findProductByCategories(product.getCategory()));
		map.addAttribute("originalValue", productService.findProductByID(id).getPrice()*0.2+productService.findProductByID(id).getPrice());
		return "/ProductPage";
	}
	
	@GetMapping("/UserPreviousOrderDetails")
	public String showUserPreviousOrderDetailsPage(HttpSession session, Model map,Customer customer) {
		if (session.getAttribute("user") == null) {
			return "redirect:/login";
		}
		List<List<OrderItems>> setDelivered = new ArrayList<List<OrderItems>>();
		customer = (Customer) session.getAttribute("user");
		List<Order> listDelivered = orderService.getOrderListByCustomerDe(customer, Status.DELIVERED);

		for (Order o : listDelivered) {
			setDelivered.add(orderItemsService.getOrderItemsListByOrder(o));
		}
		map.addAttribute("setDelivered", setDelivered);
		return "/UserPreviousOrderDetails";
	}

	@GetMapping("/UserShowAllProducts")
	public String showUserShowAllProductPage(@RequestParam(defaultValue = "1") int pageNum, Model m) {
		Page<Product> pages = productService.getAllProductsPage(pageNum);
		m.addAttribute("currentPage", pageNum);
		m.addAttribute("number", pages.getNumber());
		m.addAttribute("totalPages", pages.getTotalPages());
		m.addAttribute("totalElements", pages.getTotalElements());
		m.addAttribute("size", pages.getSize());
		m.addAttribute("data", pages.getContent());
		m.addAttribute("categoryNames", categoryService.getCategotyNames());
		m.addAttribute("brandsName", brandService.getBrandNames());
		return "/UserShowAllProducts";
	}
	
	@PostMapping("/UserShowAllProducts")
	public String processShowAllProductAddToCart(@RequestParam int quantity, @RequestParam int userId,
			@RequestParam int productId,Customer customer,Product product,Cart cart) {
		
		customer=customerService.findCustomerByID(userId);
		product=productService.findProductByID(productId);
		cart=cartService.findCartByCustomer(customer);
		CartItems cartItemsByProduct=cartItemsService.findCartItemsByProduct(product);
		if(cartItemsByProduct!=null)
		{
			cartItemsByProduct.setQuantity(cartItemsByProduct.getQuantity()+quantity);
			cartItemsService.saveCartItems(cartItemsByProduct);
			return "redirect:/UserCart";
		}
		CartItems cartItems=new CartItems(quantity, cart, product);
		cartItemsService.saveCartItems(cartItems);
		return "redirect:/UserCart";
	}
	
	@GetMapping("/UserShowProductByCategory")
	public String showUserShowAllProductPage(@RequestParam(defaultValue = "1") int pageNum, Model m,@RequestParam int id,Category category) {
		category=categoryService.findCategoryByID(id);
		Page<Product> pages = productService.findProductByCategoriesForUserShowProduct(category, pageNum);
		m.addAttribute("currentPage", pageNum);
		m.addAttribute("number", pages.getNumber());
		m.addAttribute("totalPages", pages.getTotalPages());
		m.addAttribute("totalElements", pages.getTotalElements());
		m.addAttribute("size", pages.getSize());
		m.addAttribute("data", pages.getContent());
		m.addAttribute("categoryNames", categoryService.getCategotyNames());
		m.addAttribute("brandsName", brandService.getBrandNames());
		m.addAttribute("category",category);
		return "/UserShowProductByCategory";
	}
	
	@PostMapping("/UserShowProductByCategory")
	public String processUserShowProductByCategoryAddToCart(@RequestParam int quantity, @RequestParam int userId,
			@RequestParam int productId,Customer customer,Product product,Cart cart) {
		
		customer=customerService.findCustomerByID(userId);
		product=productService.findProductByID(productId);
		cart=cartService.findCartByCustomer(customer);
		CartItems cartItemsByProduct=cartItemsService.findCartItemsByProduct(product);
		if(cartItemsByProduct!=null)
		{
			cartItemsByProduct.setQuantity(cartItemsByProduct.getQuantity()+quantity);
			cartItemsService.saveCartItems(cartItemsByProduct);
			return "redirect:/UserCart";
		}
		CartItems cartItems=new CartItems(quantity, cart, product);
		cartItemsService.saveCartItems(cartItems);
		return "redirect:/UserCart";
	}
	
	@GetMapping("/UserShowProductByBrand")
	public String showUserUserShowProductByBrand(@RequestParam(defaultValue = "1") int pageNum, Model m,@RequestParam int id,Brands brand) {
		brand=brandService.findBrandByID(id);
		Page<Product> pages = productService.findProductByBrandForUserShowProduct(brand, pageNum);
		m.addAttribute("currentPage", pageNum);
		m.addAttribute("number", pages.getNumber());
		m.addAttribute("totalPages", pages.getTotalPages());
		m.addAttribute("totalElements", pages.getTotalElements());
		m.addAttribute("size", pages.getSize());
		m.addAttribute("data", pages.getContent());
		m.addAttribute("categoryNames", categoryService.getCategotyNames());
		m.addAttribute("brandsName", brandService.getBrandNames());
		m.addAttribute("brandID",brand);
		return "/UserShowProductByBrand";
	}
	
	@PostMapping("/UserShowProductByBrand")
	public String processUserShowProductByBrandAddToCart(@RequestParam int quantity, @RequestParam int userId,
			@RequestParam int productId,Customer customer,Product product,Cart cart) {
		
		customer=customerService.findCustomerByID(userId);
		product=productService.findProductByID(productId);
		cart=cartService.findCartByCustomer(customer);
		CartItems cartItemsByProduct=cartItemsService.findCartItemsByProduct(product);
		if(cartItemsByProduct!=null)
		{
			cartItemsByProduct.setQuantity(cartItemsByProduct.getQuantity()+quantity);
			cartItemsService.saveCartItems(cartItemsByProduct);
			return "redirect:/UserCart";
		}
		CartItems cartItems=new CartItems(quantity, cart, product);
		cartItemsService.saveCartItems(cartItems);
		return "redirect:/UserCart";
	}
	
	@PostMapping("/Home")
	public String processHomeAddToCart(@RequestParam int quantity, @RequestParam int userId,
			@RequestParam int productId,Customer customer,Product product,Cart cart) {
		
		customer=customerService.findCustomerByID(userId);
		product=productService.findProductByID(productId);
		cart=cartService.findCartByCustomer(customer);
		CartItems cartItemsByProduct=cartItemsService.findCartItemsByProduct(product);
		if(cartItemsByProduct!=null)
		{
			cartItemsByProduct.setQuantity(cartItemsByProduct.getQuantity()+quantity);
			cartItemsService.saveCartItems(cartItemsByProduct);
			return "redirect:/Home";
		}
		CartItems cartItems=new CartItems(quantity, cart, product);
		cartItemsService.saveCartItems(cartItems);
		return "redirect:/Home";
	}
	
	@PostMapping("/ProductPage")
	public String ProductPage(@RequestParam int quantity, @RequestParam int userId,
			@RequestParam int productId,Customer customer,Product product,Cart cart) {
		
		customer=customerService.findCustomerByID(userId);
		product=productService.findProductByID(productId);
		cart=cartService.findCartByCustomer(customer);
		CartItems cartItemsByProduct=cartItemsService.findCartItemsByProduct(product);
		if(cartItemsByProduct!=null)
		{
			cartItemsByProduct.setQuantity(cartItemsByProduct.getQuantity()+quantity);
			cartItemsService.saveCartItems(cartItemsByProduct);
			return "redirect:/UserCart";
		}
		CartItems cartItems=new CartItems(quantity, cart, product);
		cartItemsService.saveCartItems(cartItems);
		return "redirect:/UserCart";
	}
	
	@GetMapping("/addQuantity")
	public String addQuantity(@RequestParam int id,HttpSession session,CartItems cartItems)
	{
		if (session.getAttribute("user") == null) {
			return "redirect:/login";
		}
		cartItems=cartItemsService.findCartItemsById(id);
		cartItems.setQuantity(cartItems.getQuantity()+1);
		cartItemsService.saveCartItems(cartItems);
		return "redirect:/UserCart";
	}
	
	@GetMapping("/removeQuantity")
	public String removeQuantity(@RequestParam int id,HttpSession session,CartItems cartItems)
	{
		if (session.getAttribute("user") == null) {
			return "redirect:/login";
		}
		cartItems=cartItemsService.findCartItemsById(id);
		if(cartItems.getQuantity()==1)
		{
			cartItemsService.deleteCartItemsById(id);
			return "redirect:/UserCart";
		}
		cartItems.setQuantity(cartItems.getQuantity()-1);
		cartItemsService.saveCartItems(cartItems);
		return "redirect:/UserCart";
	}
	
	@GetMapping("/UserSeeAllCategories")
	public String showAllCategoriesPage(Model m,@RequestParam(defaultValue = "1") int pageNum)
	{
		Page<Category> pages = categoryService.findCategoriesForSeeAllCategories(pageNum);
		m.addAttribute("currentPage", pageNum);
		m.addAttribute("number", pages.getNumber());
		m.addAttribute("totalPages", pages.getTotalPages());
		m.addAttribute("totalElements", pages.getTotalElements());
		m.addAttribute("size", pages.getSize());
		m.addAttribute("data", pages.getContent());
		return "/UserSeeAllCategories";
	}
	
	@GetMapping("/UserShowAllBrands")
	public String showUserAllBrandPage(Model m,@RequestParam(defaultValue = "1") int pageNum)
	{
		Page<Brands> pages = brandService.getAllBrandNames(pageNum);
		m.addAttribute("totalPages", pages.getTotalPages());
		m.addAttribute("totalElements", pages.getTotalElements());
		m.addAttribute("size", pages.getSize());
		m.addAttribute("brandNames", pages.getContent());
		return "/UserShowAllBrands";
	}

}
