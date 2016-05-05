package csjobs.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class LogoutController {

	@RequestMapping(value = "/logout.html", method=RequestMethod.GET)       
	public String logout(HttpSession httpSession)
	{
		if (httpSession.getAttribute("userName") != null
				&& httpSession.getAttribute("password") != null) 
		{
			httpSession.removeAttribute("userName");
			httpSession.removeAttribute("password");
			httpSession.invalidate();
			
			return "redirect:home.html";
		}
		
		return "redirect:home.html";
	}

}
