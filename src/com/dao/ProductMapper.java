package com.dao;

import java.util.List;

import com.domain.Product;
import com.domain.ProductForSearch;
import com.util.PageBean;
import com.util.PageBeanForProduct;

public interface ProductMapper {
	//����һ����Ŀ����Ʒ
	public List<Product> getProductBycId(int cId);
	
	/*//��ѯ��Ʒ����
	public Integer findProductCount();
	
	//����ҳ�뼰ÿҳ��ʾ�������ص�ǰҳ��¼
	public List<Product> findProductByPageNowAndSize(PageBean<Product> pageBean);*/
	
	//��������pfs��ѯ��Ʒ����
	public Integer findProductCountByPfs(ProductForSearch productForSerach);
	
	//����ҳ�뼰ÿҳ��ʾ�������������ص�ǰҳ��¼
	public List<Product> findProductByPfs(PageBeanForProduct<Product> pageBeanForProduct);
	
	//������Ʒid����Ʒ
	public Product findProductBypId(Integer pId);

}
