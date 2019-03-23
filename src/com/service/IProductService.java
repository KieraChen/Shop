package com.service;

import java.util.List;

import com.domain.Category;
import com.domain.CategorySecond;
import com.domain.Product;
import com.domain.ProductForSearch;
import com.util.PageBean;
import com.util.PageBeanForProduct;

public interface IProductService {
	
	//ǰ̨��ҳ׼�����õ�һ����Ŀ
	public List<Category> getCategory();
	
	//ǰ̨��ҳ׼�����õ�������Ŀ
	public List<CategorySecond> getCategorySecondBycId(int cId);
	
	//����һ����Ŀ����Ʒ
	public List<Product> getProductBycId(int cId);
	
/*	//����ҳ����ʾ��Ʒ����
	public PageBean<Product> findAllProductForPage(Integer pageNow);*/
	
	//����ҳ�뼰������ʾ��Ʒ����
	public PageBeanForProduct<Product> findProductForPage(Integer pageNow,ProductForSearch productForSearch);
	
	//������Ʒid����Ʒ
	public Product findProductBypId(Integer pId);

}
