package com.dao;

import java.util.List;

import com.domain.Category;
import com.domain.CategorySecond;

public interface CategoryMapper {
	//�õ�һ����Ŀ
	public List<Category> getCategory();
	//�õ�������Ŀ
	public List<CategorySecond> getCategorySecondBycId(int cId);

}
