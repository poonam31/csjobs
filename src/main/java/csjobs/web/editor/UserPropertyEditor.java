package csjobs.web.editor;

import java.beans.PropertyEditorSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import csjobs.model.User;
import csjobs.model.dao.UserDao;


@Component
@Scope("prototype")
public class UserPropertyEditor extends PropertyEditorSupport {
	
	@Autowired
	UserDao userDao;
	
	@Override
	public void setAsText( String text ) throws IllegalArgumentException
	{
		if( StringUtils.hasText( text ) )
			setValue( userDao.getUser( Long.valueOf( text ) ) );
	}
    
	@Override
	public String getAsText()
	{
		User user = (User) getValue();
	    	return user != null ? user.getId().toString() : "";
	}
}
