package csjobs.web.controller;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.WebApplicationContext;

import csjobs.model.Application;
import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.ApplicationDao;
import csjobs.model.dao.JobDao;
import csjobs.model.dao.UserDao;
import csjobs.web.editor.UserPropertyEditor;

@Controller
@SessionAttributes("job")
public class AdminController {
	
	@Autowired
    private JobDao jobDao;
	
	@Autowired
    private UserDao userDao;
	
	@Autowired
    private ApplicationDao applicationDao;
	
	@Autowired
    private WebApplicationContext context;
	
	 @InitBinder
	 public void initBinder( WebDataBinder binder )
	 {
	      binder.registerCustomEditor( User.class,
	    		  (UserPropertyEditor) context.getBean( "userPropertyEditor" ) );
	 }
	 
	 @InitBinder
	    public void initBinder1( WebDataBinder binder )
	    {
	        binder.registerCustomEditor( Date.class, new CustomDateEditor(
	            new SimpleDateFormat( "MM/dd/yyyy" ), true ) );
	    }

	
//	private List<Job> reverseList(List<Job> list) {
//	    for(int i = 0, j = list.size() - 1; i < j; i++) {
//	        list.add(i, list.remove(j));
//	    }
//	    return list;
//	}
	
	private List<User> getReviewers()
	{
		// get all users and remove users who are not reviewers
		List<User> reviewers = userDao.getUsers();
				
		Iterator<User> it = reviewers.iterator(); 
					
		while(it.hasNext())
		{
			User user = it.next();
					
			if(!user.isReviewer())
				it.remove();	
		}	
		
		return reviewers;
	}

	@RequestMapping(value = "/adminPage.html")       
	public String admin(ModelMap models)
	{
		List<Job> jobs = jobDao.getJobs();
		//jobs = reverseList(jobs); // To reverse the list, 'reverseList' function which is implemented above can also be used 
		
		Collections.reverse(jobs);
		
		models.put("jobs", jobs);
		
		return "AdminPage";
	}
	
	@RequestMapping(value = "viewJobPosition.html")
	public String viewJobPosition(@RequestParam long jobId, ModelMap models)
	{
		Job job = jobDao.getJob(jobId);
		
		models.put("job", job);
		
		return "ViewJobPosition";
	}
	
	@RequestMapping(value = "edit.html", method=RequestMethod.GET)
	public String edit(@RequestParam long jobId, ModelMap models)
	{
		models.put("job", jobDao.getJob(jobId));
		models.put("reviewers", getReviewers());
		
		return "edit";
	}
	
	@RequestMapping(value = "edit.html", method=RequestMethod.POST)
	public String edit(@ModelAttribute Job job, SessionStatus sessionStatus)
	{
		//check if committee chair is in committee members, if not then add that user
		if( ! ( job.getCommitteeMembers().contains(job.getCommitteeChair())) )
			job.getCommitteeMembers().add(job.getCommitteeChair());
		
		jobDao.saveJob(job);
		sessionStatus.setComplete();
		
		return "redirect:adminPage.html";
	}
	
	@RequestMapping(value = "createJobPosition.html", method=RequestMethod.GET)
	public String  createJobPosition(HttpSession session, ModelMap models)
	{
		models.put("job", new Job());
		models.put("reviewers", getReviewers());
		
		return  "CreateJobPosition";
	}
	
	@RequestMapping(value = "createJobPosition.html", method=RequestMethod.POST)
	public String  createJobPosition(@ModelAttribute Job job, SessionStatus sessionStatus ) 
	{			
		//check if committee chair is in committee members, if not then add that user
		if( ! ( job.getCommitteeMembers().contains(job.getCommitteeChair())) )
			job.getCommitteeMembers().add(job.getCommitteeChair());
		
		job =  jobDao.saveJob(job);
		sessionStatus.setComplete();
				
		return "redirect:adminPage.html";
				
	}
	
	@RequestMapping(value = "ViewAllApplicants.html", method=RequestMethod.GET)
	public String  viewAllApplications(@RequestParam long jobId,  ModelMap models) 
	{
//		System.out.println("hiiiiiiiiiii");
//		Job job = jobDao.getJob(jobId);
//		System.out.println("hii len =="+job.getApplications().size());
//		
//		models.put("job", job);
//		models.put("applications", job.getApplications());
		
		List<Application> apps = applicationDao.getApplications();
		
		Iterator<Application> it = apps.iterator(); 
		
		while(it.hasNext())
		{
				Application a = it.next();
								
				if( !(jobId == a.getId()) )
					it.remove();	
		}
		
		
		
		models.put("applications", apps);	
		return "ViewAllApplicants";
	}
	
}

			
