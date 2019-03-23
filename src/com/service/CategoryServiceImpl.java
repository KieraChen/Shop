package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.CategoryMapper;
import com.domain.Category;
import com.domain.CategorySecond;

@Service
public class CategoryServiceImpl implements ICategoryService{
	@Resource
	private CategoryMapper categoryMapper;

	@Override
	public List<Category> getCategory() {
		List<Category> category = categoryMapper.getCategory();
		return category;
	}

	@Override
	public List<CategorySecond> getCategorySecondBycId(int cId) {
		List<CategorySecond> categorySecond = categoryMapper.getCategorySecondBycId(cId);
		return categorySecond;
	}

}
