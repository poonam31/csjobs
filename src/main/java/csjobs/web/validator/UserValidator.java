package csjobs.web.validator;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import csjobs.model.User;

@Component
public class UserValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		
		return User.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		User user = (User) target;
		
		//UserDao userDao = null;
		
		if(!StringUtils.hasText(user.getFirstName()))
			errors.rejectValue("firstName", "error.firstname.empty");
		
		if(!StringUtils.hasText(user.getLastName()))
			errors.rejectValue("lastName", "error.lastname.empty");
		
		if(!StringUtils.hasText(user.getEmail()))
			errors.rejectValue("email", "error.email.empty");
		
		
//		for(User u: userDao.getUsers())
//		{
//			if(user.getEmail().equals(u.getEmail()))
//				errors.rejectValue("email", "error.email.duplicate");
//		}
//		
//		
		if(!StringUtils.hasText(user.getPhone()))
			errors.rejectValue("phone", "error.phone.empty");
		
		if(!StringUtils.hasText(user.getAddress()))
			errors.rejectValue("address", "error.address.empty");
		
		if(!StringUtils.hasText(user.getPassword()))
			errors.rejectValue("password", "error.password.empty");
		
	}

}
