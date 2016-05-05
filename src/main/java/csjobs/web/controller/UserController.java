package csjobs.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import csjobs.model.User;
import csjobs.model.dao.UserDao;
import csjobs.web.validator.UserValidator;

@Controller //@SessionAttributes --- required if used session ... need for edit/update
public class UserController {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private UserValidator userValidator;
	
	public boolean isValidEmail(String email)
	{
		List<User> users = userDao.getUsers();
		
		for(User user : users)
		{
			if(email.toLowerCase().equals(user.getEmail().toLowerCase()))
				return false;
		}
		return true;
	}
	
	@RequestMapping(value = "/register.html", method=RequestMethod.GET)       
	public String userRegistration(ModelMap models)
	{
		models.put("user", new User());
		return "Register";
	}
	

	@RequestMapping(value = "/register.html", method=RequestMethod.POST)       
	public String userRegistration(@ModelAttribute User user, BindingResult result, ModelMap models)
	{
		userValidator.validate(user, result);
		if(result.hasErrors()) 
		{
			if( user.getEmail() != null  && !isValidEmail(user.getEmail()) )
				models.put("msg", "Email already exists.");
			
			return "Register";
		}
		else
		{
			if( user.getEmail() != null && !isValidEmail(user.getEmail()) )
			{ 
				models.put("msg", "Email already exists.");
				return "Register";
			}
			
		}
	
		//save user to db
		user = userDao.saveUser(user);
		
		//status.setComplete(); // this is required in edit/update
		
		return "redirect:login.html?Reg=yes";
	}
	

}
