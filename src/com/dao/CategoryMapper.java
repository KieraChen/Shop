package com.dao;

import java.util.List;

import com.domain.Category;
import com.domain.CategorySecond;

public interface CategoryMapper {
	//得到一级类目
	public List<Category> getCategory();
	//得到二级类目
	public List<CategorySecond> getCategorySecondBycId(int cId);

}
