package com.util;

import com.domain.ProductForSearch;

public class PageBeanForProduct<T> extends PageBean<T> {
	private ProductForSearch productForSearch;

	public ProductForSearch getProductForSearch() {
		return productForSearch;
	}

	public void setProductForSearch(ProductForSearch productForSearch) {
		this.productForSearch = productForSearch;
	}
	

}
