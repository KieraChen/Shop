package com.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.domain.Cart;
import com.domain.CartItem;
import com.domain.Category;
import com.domain.CategorySecond;
import com.domain.Product;
import com.domain.ProductForSearch;
import com.service.IProductService;
import com.util.PageBeanForProduct;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Resource
	private IProductService productService;
	
	Cart cart = new Cart();
	
	//列表页数据
	@RequestMapping("List")
	public String listForPage(Model model,Integer pageNow,ProductForSearch pfs){
		if(pageNow == null){
			pageNow = 1;
		}
		PageBeanForProduct<Product> pageBeanForProduct = productService.findProductForPage(pageNow, pfs);
		model.addAttribute("pfp", pageBeanForProduct);
		/*PageBean<Product> pageBean = productService.findAllProductForPage(pageNow);
		model.addAttribute("pageBean", pageBean);*/
		
		//获得一级类目
		List<Category> category = productService.getCategory();
		//添加一级类目
		model.addAttribute("category",category);
		//根据一级类目查二级类目
		List<List<CategorySecond>> list = new ArrayList<List<CategorySecond>>();
	    for(Category cg : category){
	    	List<CategorySecond> cs = productService.getCategorySecondBycId(cg.getcId());
	    	list.add(cs);	 	
	    }
	    //添加二级类目
	    model.addAttribute("cs", list);
	    
	    
	    
		return "Search";
	}
	
	//准备数据，进前台首页
	@RequestMapping("Index")
	public String home(Model model){
		//获得一级类目
		List<Category> category = productService.getCategory();
		//添加一级类目
		model.addAttribute("category",category);
		//根据一级类目查二级类目,查商品
		List<List<CategorySecond>> list = new ArrayList<List<CategorySecond>>();
		List<List<Product>> list1 = new ArrayList<List<Product>>();
	    for(Category cg : category){
	    	List<CategorySecond> cs = productService.getCategorySecondBycId(cg.getcId());
	    	list.add(cs);
	    	List<Product> productBycId = productService.getProductBycId(cg.getcId());
	    	list1.add(productBycId);  	
	    }
	    //添加二级类目
	    model.addAttribute("cs", list);
	    model.addAttribute("product", list1);
	    
		return "Index";
	}
	
	//准备数据，进商品详情页
	@RequestMapping("Detail")
	public String detail(Model model,Integer pid,ProductForSearch pfs){
		//获得一级类目
		List<Category> category = productService.getCategory();
		
		//根据一级类目查二级类目
		List<List<CategorySecond>> list = new ArrayList<List<CategorySecond>>();
	    for(Category cg : category){
	    	List<CategorySecond> cs = productService.getCategorySecondBycId(cg.getcId());
	    	list.add(cs);	 	
	    }
	    //添加二级类目
	    model.addAttribute("cs", list);
	    //根据id查商品并添加
	    Product product = productService.findProductBypId(pid);
	    model.addAttribute("product", product);
	    
	    //为猜你喜欢准备数据 
		PageBeanForProduct<Product> pageBeanForProduct = productService.findProductForPage(1, pfs);
		model.addAttribute("pfp", pageBeanForProduct);
		
		return "Detail";
		}
	
	//访问购物车
	@RequestMapping("ShopCart")
	public String ShopCart(){
		return "ShopCart";
	}
	
	//添加购物项到购物车
	@RequestMapping("addShopCart")
	public String addShopCart(HttpServletRequest request,CartItem cartItem){
		System.out.println(cartItem.toString());
		System.out.println("===================");
		cart.addCartItem(cartItem);
		HttpSession session = request.getSession();
		session.setAttribute("cart", cart);
		return "ShopCart";
	}
	
	//清空购物车
	@RequestMapping("clearShopCart")
	public String clearShopCart(){
		cart.clearCart();
		return "ShopCart";
	}
	
	//移除购物车中的某个购物项
	@RequestMapping("removeShopCart")
	public String removeShopCart(HttpServletRequest request,CartItem cartItem){
		Integer pid = cartItem.getProduct().getpId();
		cart.removeCartItem(pid);
		return "ShopCart";
	}
	
	//修改购物车中购物项数量
	@RequestMapping("editShopCart")
	public String editShopCart(HttpServletRequest request,CartItem cartItem){
		Integer count = cartItem.getCount();
		Integer pid = cartItem.getProduct().getpId();
		cart.editCartItem(pid, count);
		return "ShopCart";
	}

}
