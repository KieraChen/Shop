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
	
	//�б�ҳ����
	@RequestMapping("List")
	public String listForPage(Model model,Integer pageNow,ProductForSearch pfs){
		if(pageNow == null){
			pageNow = 1;
		}
		PageBeanForProduct<Product> pageBeanForProduct = productService.findProductForPage(pageNow, pfs);
		model.addAttribute("pfp", pageBeanForProduct);
		/*PageBean<Product> pageBean = productService.findAllProductForPage(pageNow);
		model.addAttribute("pageBean", pageBean);*/
		
		//���һ����Ŀ
		List<Category> category = productService.getCategory();
		//���һ����Ŀ
		model.addAttribute("category",category);
		//����һ����Ŀ�������Ŀ
		List<List<CategorySecond>> list = new ArrayList<List<CategorySecond>>();
	    for(Category cg : category){
	    	List<CategorySecond> cs = productService.getCategorySecondBycId(cg.getcId());
	    	list.add(cs);	 	
	    }
	    //��Ӷ�����Ŀ
	    model.addAttribute("cs", list);
	    
	    
	    
		return "Search";
	}
	
	//׼�����ݣ���ǰ̨��ҳ
	@RequestMapping("Index")
	public String home(Model model){
		//���һ����Ŀ
		List<Category> category = productService.getCategory();
		//���һ����Ŀ
		model.addAttribute("category",category);
		//����һ����Ŀ�������Ŀ,����Ʒ
		List<List<CategorySecond>> list = new ArrayList<List<CategorySecond>>();
		List<List<Product>> list1 = new ArrayList<List<Product>>();
	    for(Category cg : category){
	    	List<CategorySecond> cs = productService.getCategorySecondBycId(cg.getcId());
	    	list.add(cs);
	    	List<Product> productBycId = productService.getProductBycId(cg.getcId());
	    	list1.add(productBycId);  	
	    }
	    //��Ӷ�����Ŀ
	    model.addAttribute("cs", list);
	    model.addAttribute("product", list1);
	    
		return "Index";
	}
	
	//׼�����ݣ�����Ʒ����ҳ
	@RequestMapping("Detail")
	public String detail(Model model,Integer pid,ProductForSearch pfs){
		//���һ����Ŀ
		List<Category> category = productService.getCategory();
		
		//����һ����Ŀ�������Ŀ
		List<List<CategorySecond>> list = new ArrayList<List<CategorySecond>>();
	    for(Category cg : category){
	    	List<CategorySecond> cs = productService.getCategorySecondBycId(cg.getcId());
	    	list.add(cs);	 	
	    }
	    //��Ӷ�����Ŀ
	    model.addAttribute("cs", list);
	    //����id����Ʒ�����
	    Product product = productService.findProductBypId(pid);
	    model.addAttribute("product", product);
	    
	    //Ϊ����ϲ��׼������ 
		PageBeanForProduct<Product> pageBeanForProduct = productService.findProductForPage(1, pfs);
		model.addAttribute("pfp", pageBeanForProduct);
		
		return "Detail";
		}
	
	//���ʹ��ﳵ
	@RequestMapping("ShopCart")
	public String ShopCart(){
		return "ShopCart";
	}
	
	//��ӹ�������ﳵ
	@RequestMapping("addShopCart")
	public String addShopCart(HttpServletRequest request,CartItem cartItem){
		System.out.println(cartItem.toString());
		System.out.println("===================");
		cart.addCartItem(cartItem);
		HttpSession session = request.getSession();
		session.setAttribute("cart", cart);
		return "ShopCart";
	}
	
	//��չ��ﳵ
	@RequestMapping("clearShopCart")
	public String clearShopCart(){
		cart.clearCart();
		return "ShopCart";
	}
	
	//�Ƴ����ﳵ�е�ĳ��������
	@RequestMapping("removeShopCart")
	public String removeShopCart(HttpServletRequest request,CartItem cartItem){
		Integer pid = cartItem.getProduct().getpId();
		cart.removeCartItem(pid);
		return "ShopCart";
	}
	
	//�޸Ĺ��ﳵ�й���������
	@RequestMapping("editShopCart")
	public String editShopCart(HttpServletRequest request,CartItem cartItem){
		Integer count = cartItem.getCount();
		Integer pid = cartItem.getProduct().getpId();
		cart.editCartItem(pid, count);
		return "ShopCart";
	}

}
