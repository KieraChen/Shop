package com.service;

import java.util.List;

import com.domain.Category;
import com.domain.CategorySecond;

public interface ICategoryService {
	//ǰ̨��ҳ׼�����õ�һ����Ŀ
	public List<Category> getCategory();

	//ǰ̨��ҳ׼�����õ�������Ŀ
	public List<CategorySecond> getCategorySecondBycId(int cId);

}
