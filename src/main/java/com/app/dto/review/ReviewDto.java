package com.app.dto.review;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor @NoArgsConstructor
@Data
public class ReviewDto {
	
	int reviewId;		//글번호
	String userId;		//작성자
	String planId;		//여행
	String title;		//제목
	String content;		//내용
	float stars;		//별점
	int views;			//조회
	int likeCount;		//추천
	String createDate;	//작성일
	String updateDate;	//수정일
	String deleteAt;	//삭제여부
	String deleteDate;	//삭제일
	int commentCount;	//댓글수
	
}