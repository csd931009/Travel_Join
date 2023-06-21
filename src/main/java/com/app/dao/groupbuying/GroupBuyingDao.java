package com.app.dao.groupbuying;

import java.util.List;
import com.app.dto.groupbuying.GroupBuyingDto;

public interface GroupBuyingDao {

	int insertBoard(GroupBuyingDto buyingDto);
	
	List<GroupBuyingDto> selectBoard();
	
	List<GroupBuyingDto> choiceVeiwBoard(int no);
}
