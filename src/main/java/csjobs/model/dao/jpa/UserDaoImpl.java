package csjobs.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import csjobs.model.User;
import csjobs.model.dao.UserDao;

@Repository
public class UserDaoImpl implements UserDao {
	
	@PersistenceContext
	private EntityManager entityManager;

	@Override // @PostAuthorize ("hasRole('ROLE_ADMIN') or principal.username == returnObject.username")
	public User getUser(Long userid) {
		return entityManager.find(User.class, userid);
	}

	@Override
	public List<User> getUsers() {
		return entityManager.createQuery("from User", User.class).getResultList();
	}

	@Override
	@Transactional //@PreAuthorize ("hasRole('ROLE_ADMIN') or principal.username == #user.username")
	public User saveUser(User user) {
		
		return entityManager.merge(user);
	}

	@Override
	public User getUserByName(String userName) {
		
		if( !( userName.contains("@localhost.localdomain") || userName.contains("@") ) )
			userName = userName + "@localhost.localdomain";
		
		//System.out.println(userName);
		
		String query = "from User where email = :userName";
		
		return  entityManager.createQuery( query, User.class ).setParameter( "userName", userName.toLowerCase() ).getSingleResult();		 
	
	}
	
	
}
