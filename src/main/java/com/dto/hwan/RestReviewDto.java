package com.dto.hwan;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RestReviewDto {
	private int review_no;
	private int user_no;
	private int rest_no;
	private String review_content;
	private String review_time;
	private int review_star;
	private String review_auth;
	private String rest_name;
	
	
}
