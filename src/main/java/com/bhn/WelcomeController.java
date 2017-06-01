package com.bhn;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@CrossOrigin
public class WelcomeController {



	@RequestMapping("/")
	public String getAuthorizeService() {
		return "AuthorizeService";
	}
		
	@RequestMapping("/DeliverActivationCode")
	public String getDeliverActivationCode() {
		return "DeliverActivationCode";
	}
	
	@RequestMapping("/NotifyServiceActivated")
	public String getNotifyServiceActivated() {
		return "NotifyServiceActivated";
	}
	
	@CrossOrigin
	@RequestMapping(value="/test", method=RequestMethod.POST, consumes = { "application/*"})
	public @ResponseBody String testMethod(@RequestBody String  payload ){
		System.out.println("I am in test method with content" + payload);
		return payload;
	}

}