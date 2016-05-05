package csjobs.web.controller;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import csjobs.model.Application;
import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.JobDao;
import csjobs.model.dao.UserDao;
import csjobs.security.SecurityUtils;

@Controller
public class adminAndReviewerController {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private JobDao jobDao;
	
	@RequestMapping(value = "/reviewerPage.html", method=RequestMethod.GET)       
	public String reviewer(ModelMap models)
	{
		String userName = SecurityUtils.getUser();
		User user = userDao.getUserByName(userName);
		
		List<Job> jobs = jobDao.getJobs();
		
		Iterator<Job> it = jobs.iterator(); 	

		while(it.hasNext())
		{
			Job job = it.next();
			
			if( !(job.getCommitteeMembers().contains(user)) )
			{	it.remove();
			System.out.println("job id" + job.getTitle());
			}
		}
		
		
		models.put("jobs", jobs);
		
		return "ReviewerPage";
	}
	

}
