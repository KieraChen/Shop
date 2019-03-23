package com.service;

import java.util.List;

import com.domain.Category;
import com.domain.CategorySecond;

public interface ICategoryService {
	//前台首页准备，得到一级类目
	public List<Category> getCategory();

	//前台首页准备，得到二级类目
	public List<CategorySecond> getCategorySecondBycId(int cId);

}
