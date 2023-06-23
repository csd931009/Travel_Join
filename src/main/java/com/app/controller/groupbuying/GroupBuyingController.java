package com.app.controller.groupbuying;

import java.util.List;
import java.util.Map;

import javax.websocket.server.PathParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.app.dto.groupbuying.GroupBuyingDto;
import com.app.service.groupbuying.GroupBuyingService;

@RestController
public class GroupBuyingController {

	@Autowired
	GroupBuyingService groupBuyingService;
	
	@GetMapping("/GB_MakeBoard")
	public String GB_MakeBoard() {
		return "GB_MakeBoard";
	}
	@PostMapping("/GB_MakeBoard")
	public String GB_MakeBoard_insert(GroupBuyingDto groupBuyingDto) {
		groupBuyingService.insertBoard(groupBuyingDto);
		return "index";
	}
	
	@GetMapping("/GB_BulletinBoard")
	public String GB_BulletinBoard(Model model) {
		
		List<GroupBuyingDto> list = groupBuyingService.selectBoard();
		model.addAttribute("list", list);
		
		return "GB_BulletinBoard";
	}
	
	@GetMapping("/GB_VeiwBoard")
	public String GB_VeiwBoard(Model model, @RequestParam(name="no") int no) {
		List<GroupBuyingDto> list =
				groupBuyingService.choiceVeiwBoard(no);
		model.addAttribute("list",list);
		
		return "GB_VeiwBoard";
	}
	
	@GetMapping("/GroupBuying/stamp")
	public String stamp
	
}
