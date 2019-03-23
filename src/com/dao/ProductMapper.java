package com.dao;

import java.util.List;

import com.domain.Product;
import com.domain.ProductForSearch;
import com.util.PageBean;
import com.util.PageBeanForProduct;

public interface ProductMapper {
	//根据一级类目查商品
	public List<Product> getProductBycId(int cId);
	
	/*//查询商品总数
	public Integer findProductCount();
	
	//根据页码及每页显示数，返回当前页记录
	public List<Product> findProductByPageNowAndSize(PageBean<Product> pageBean);*/
	
	//根据条件pfs查询商品总数
	public Integer findProductCountByPfs(ProductForSearch productForSerach);
	
	//根据页码及每页显示数及条件，返回当前页记录
	public List<Product> findProductByPfs(PageBeanForProduct<Product> pageBeanForProduct);
	
	//根据商品id查商品
	public Product findProductBypId(Integer pId);

}
