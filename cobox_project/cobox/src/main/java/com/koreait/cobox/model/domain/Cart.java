package com.koreait.cobox.model.domain;

import lombok.Data;

@Data
public class Cart extends Snack{
	private int cart_id;
	private int quantity;
	private int member_id;
}
