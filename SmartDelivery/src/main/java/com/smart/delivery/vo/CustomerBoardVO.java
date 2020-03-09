package com.smart.delivery.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustomerBoardVO {

	private int boardNum;
	private String userId;
	private String title;
	private String content;
	private String inputdate;
	private int hit;
}
