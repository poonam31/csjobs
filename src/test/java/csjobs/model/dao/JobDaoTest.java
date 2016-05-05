package csjobs.model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.Test;

@Test(groups = "JobDaoTest")
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class JobDaoTest extends AbstractTransactionalTestNGSpringContextTests {
	
	@Autowired
	JobDao jobDao;
	
	@Test
	public void getJobs()
	{
		assert jobDao.getJobs().size() == 8;
	}

}

