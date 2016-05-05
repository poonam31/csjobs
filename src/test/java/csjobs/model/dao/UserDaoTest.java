package csjobs.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.Test;

import csjobs.model.Application;
import csjobs.model.Job;
import csjobs.model.User;

@Test
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class UserDaoTest extends AbstractTransactionalTestNGSpringContextTests {
	@Autowired
	ApplicationDao applicationDao;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	JobDao jobDao;
	
	@Test
	public void checkApplication()
	{
		User user= userDao.getUser((long) 6);
		Job job = jobDao.getJob((long) 1);
		
		if(user==null || job==null)
			assert false;
		else
			{
				Application app = applicationDao.getApplication(user, job);
				
				if(app!=null)
					assert true;
			}
		
	}
	
	@Test
	public void checkNoOfCommittiees()
	{
		User reviewer =  userDao.getUserByName("reviewer3@localhost.localdomain");
		
		// for each job chek if user is present in list of comiitee and yes then add in count
		
		List<Job> jobs =  jobDao.getJobs();
		
		int count = 0;
		for(Job job : jobs)
		{
			if ( job.getCommitteeMembers().contains(reviewer) )
				{ count ++;
				 //System.out.println("count ====" + count);
				}	
		}
		
		assert count == 6;
		
	}

}
