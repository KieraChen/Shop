package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.ProductMapper;
import com.domain.Category;
import com.domain.CategorySecond;
import com.domain.Product;
import com.domain.ProductForSearch;
import com.util.PageBean;
import com.util.PageBeanForProduct;

@Service
public class ProductServiceImpl implements IProductService{
	private static final Integer pageSize = 12;
	@Resource
	private ICategoryService categoryService;
	@Resource
	private ProductMapper productMapper;

	@Override
	public List<Category> getCategory() {
		List<Category> category = categoryService.getCategory();
		return category;
	}

	@Override
	public List<CategorySecond> getCategorySecondBycId(int cId) {
		List<CategorySecond> categorySecond = categoryService.getCategorySecondBycId(cId);
		return categorySecond;
	}

	@Override
	public List<Product> getProductBycId(int cId) {
		List<Product> productBycId = productMapper.getProductBycId(cId);
		return productBycId;
	}

	/*@Override
	public PageBean<Product> findAllProductForPage(Integer pageNow) {
		PageBean<Product> pageBean = new PageBean<Product>();
		pageBean.setPageNow(pageNow);
		pageBean.setPageSize(pageSize);
		Integer rowCount = productMapper.findProductCount();
		pageBean.setRowCount(rowCount);
		int pageCount = 0;
		if(rowCount % pageSize == 0){
			pageCount = rowCount / pageSize;
		}else{
			pageCount = rowCount / pageSize + 1;
		}
		pageBean.setPageCount(pageCount);
		int startLimit = (pageNow-1)*pageSize;
		pageBean.setStartLimit(startLimit);
		List<Product> products = productMapper.findProductByPageNowAndSize(pageBean);
		pageBean.setList(products);
		
		return pageBean;
	}*/
	
	@Override
	public PageBeanForProduct<Product> findProductForPage(Integer pageNow,ProductForSearch productForSearch) {
		PageBeanForProduct<Product> pageBeanForProduct = new PageBeanForProduct<Product>();
		pageBeanForProduct.setPageNow(pageNow);
		pageBeanForProduct.setPageSize(pageSize);
		Integer rowCount = productMapper.findProductCountByPfs(productForSearch);
		pageBeanForProduct.setRowCount(rowCount);
		int pageCount = 0;
		if(rowCount % pageSize == 0){
			pageCount = rowCount / pageSize;
		}else{
			pageCount = rowCount / pageSize + 1;
		}
		pageBeanForProduct.setPageCount(pageCount);
		int startLimit = (pageNow-1)*pageSize;
		pageBeanForProduct.setStartLimit(startLimit);
		
		pageBeanForProduct.setProductForSearch(productForSearch);
		
		List<Product> products = productMapper.findProductByPfs(pageBeanForProduct);
		pageBeanForProduct.setList(products);
		

		return pageBeanForProduct;	
	}

	@Override
	public Product findProductBypId(Integer pId) {
		Product product = productMapper.findProductBypId(pId);
		return product;
	}

}
