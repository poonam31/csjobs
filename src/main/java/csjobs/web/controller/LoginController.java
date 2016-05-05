package csjobs.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import csjobs.model.User;
import csjobs.model.dao.UserDao;
import csjobs.security.SecurityUtils;


@Controller
public class LoginController {
	
	@Autowired
	private UserDao userDao;

	@RequestMapping(value = "/login.html", method=RequestMethod.GET)       
	public String login(@RequestParam(required=false) String Reg, ModelMap models)
	{
		if(Reg.equals("yes"))
			models.put("msg", "You are registered Successfully!");
		
		return "Login";
	}
	

	@RequestMapping(value = "/loginSecurity.html", method=RequestMethod.GET)       
	public String login( HttpSession httpSession, ModelMap models)
	{		
		String em=SecurityUtils.getUser();
    	User currentUser= userDao.getUserByName(em);
    	
       /* if( user == null || !user.getPassword().equals( password ) )
            return "redirect:/login.html";*/

     //   logger.info( currentUser.getEmail() + " logged in." );

        httpSession.setAttribute( "authenticatedUser", currentUser );
        if( currentUser.isAdmin() )
            return "redirect:/adminPage.html";
        else if( currentUser.isReviewer() )
            return "redirect:/reviewerPage.html";
        else
        	System.out.println("Hii");
            return "redirect:/listApplicantJobs.html";
		
		///////////////////////////////////////////////////////////////////////////
            
            //@RequestParam String username, @RequestParam String password,
		/*//validate fields
		if( username == null || username.equals("") || password == null || password.equals(""))
		{
			models.put("err", "Username and/or Password is empty.");
			return "Login";
		}
		
		//chek if username and pwd are in db ..if yes then get the user
		boolean flag=false;
				
		username = username.toLowerCase();
				
		if( !( username.contains("@localhost.localdomain") || username.contains("@") ) )
			username = username + "@localhost.localdomain";
				
		List<User> users = userDao.getUsers();
		for(User u: users)
		{
			if(username.equals(u.getEmail()) && password.equals(u.getPassword()))
					flag=true;
		}
		
		///////////////////////////////////
				User user = new User();
				if(flag==true)
					user = userDao.getUserByName(username);
				else
				{
					models.put("err", "Username and/or Password is invalid.");
					return "Login";
				}
				
				if(user!=null && user.getPassword().equals(password))
				{
					httpSession.setAttribute("userName", user.getEmail());
					httpSession.setAttribute("password", user.getPassword());
				}
				
				
				//boolean isAdmin = false, isReviewer=false, isApplicant=false;
				
				//chek if he is admin or reviewer or applicant
				if(user.isAdmin())
				{	//isAdmin = true; 
					return "redirect:adminPage.html";
				}
				
				if(user.isReviewer())
				{	//isAdmin=true;
					return "redirect:reviewerPage.html?userid="+user.getId();
				}
				
				if(!user.isAdmin() && !user.isReviewer())
				{
					//isApplicant= true;
					return "redirect:listApplicantJobs.html";
				}
				
				//models.put("isAdmin", isAdmin);
				//models.put("isReviewer", isReviewer);
				//models.put("isApplicant", isApplicant);
				
				return "redirect:index.html";*/
	}
}
