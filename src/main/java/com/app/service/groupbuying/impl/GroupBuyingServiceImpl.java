package com.app.service.groupbuying.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.groupbuying.GroupBuyingDao;
import com.app.dto.groupbuying.GroupBuyingDto;
import com.app.service.groupbuying.GroupBuyingService;

@Service
public class GroupBuyingServiceImpl implements GroupBuyingService {

	@Autowired
	GroupBuyingDao groupBuyingDao;

	@Override
	public int insertBoard(GroupBuyingDto groupBuyingDto) {
		// TODO Auto-generated method stub
		groupBuyingDao.insertBoard(groupBuyingDto);
		return 0;
	}

	@Override
	public List<GroupBuyingDto> selectBoard() {
		// TODO Auto-generated method stub
		
		List<GroupBuyingDto> list = groupBuyingDao.selectBoard();
		
		return list;
	}

	@Override
	public List<GroupBuyingDto> choiceVeiwBoard(int no) {
		// TODO Auto-generated method stub
		
		List<GroupBuyingDto> list = groupBuyingDao.choiceVeiwBoard(no);
		
		return list;
	}

	

	
}
