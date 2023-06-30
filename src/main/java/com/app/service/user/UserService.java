package com.app.service.user;

import java.util.List;

import com.app.dto.user.UserDto;

public interface UserService {

	int saveUser(UserDto userDto);

	List<UserDto> getUserList(UserDto userDto);
	
	boolean login(UserDto userDto);
	
	int updateUser(UserDto userDto);
	
	UserDto getUserInfo(String userId);

}