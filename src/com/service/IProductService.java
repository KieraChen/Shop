package com.service;

import java.util.List;

import com.domain.Category;
import com.domain.CategorySecond;
import com.domain.Product;
import com.domain.ProductForSearch;
import com.util.PageBean;
import com.util.PageBeanForProduct;

public interface IProductService {
	
	//前台首页准备，得到一级类目
	public List<Category> getCategory();
	
	//前台首页准备，得到二级类目
	public List<CategorySecond> getCategorySecondBycId(int cId);
	
	//根据一级类目查商品
	public List<Product> getProductBycId(int cId);
	
/*	//根据页码显示商品数据
	public PageBean<Product> findAllProductForPage(Integer pageNow);*/
	
	//根据页码及条件显示商品数据
	public PageBeanForProduct<Product> findProductForPage(Integer pageNow,ProductForSearch productForSearch);
	
	//根据商品id查商品
	public Product findProductBypId(Integer pId);

}
