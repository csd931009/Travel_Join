package com.app.service.groupbuying;

import java.util.List;

import com.app.dto.groupbuying.GroupBuyingDto;

public interface GroupBuyingService {

	int insertBoard(GroupBuyingDto groupBuyingDto);
	
	List<GroupBuyingDto> selectBoard();
	
	List<GroupBuyingDto> choiceVeiwBoard(int no);
}
