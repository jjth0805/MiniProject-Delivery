package com.smart.delivery.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TrackingController {
	@RequestMapping(value = "deliveryInfo/deliveryCheck", method = RequestMethod.GET)
	public String deliveryCheck() {
		return "deliveryInfo/deliveryCheck";
	}
}
