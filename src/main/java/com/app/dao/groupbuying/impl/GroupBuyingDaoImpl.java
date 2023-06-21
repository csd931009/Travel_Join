package com.app.dao.groupbuying.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.groupbuying.GroupBuyingDao;
import com.app.dto.groupbuying.GroupBuyingDto;

@Repository
public class GroupBuyingDaoImpl implements GroupBuyingDao{

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertBoard(GroupBuyingDto groupBuyingDto) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.insert("GroupBuying_mapper.insert_GroupBuying", groupBuyingDto);
		
		return result;
	}

	@Override
	public List<GroupBuyingDto> selectBoard() {
		// TODO Auto-generated method stub
		List<GroupBuyingDto> list =
				sqlSessionTemplate.selectList("GroupBuying_mapper.select_GroupBuying");
		return list;
	}

	@Override
	public List<GroupBuyingDto> choiceVeiwBoard(int no) {
		// TODO Auto-generated method stub
		
		List<GroupBuyingDto> list =
				sqlSessionTemplate.selectList("GroupBuying_mapper.select_GroupBuying_choice",no);
		return list;
	}

	

	


}
