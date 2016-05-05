package csjobs.model.dao;

import java.util.List;

import csjobs.model.User;

public interface UserDao {
	
	User getUser(Long userid);

	List<User> getUsers();
	
	User saveUser(User user);
	
	User getUserByName(String userName);

}
