package csjobs.web.controller;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;







import org.springframework.web.bind.annotation.RequestParam;

import csjobs.model.Job;
import csjobs.model.dao.JobDao;

@Controller
public class HomeController {
	
	@Autowired 
	JobDao jobDao;
	
	@RequestMapping({"/index.html","/home.html" })       
	public String viewJobs(ModelMap models)
	{
		//get open jobs frm db and pass them to jsp open means published bt nt closed
		//  i.e. current date should be >= published date and < close date
		// null publish date means job is not published and null close date means job will open indefinitely
		
		List<Job> jobs = jobDao.getJobs();
		Date currentDate = new Date();
		
		Iterator<Job> it = jobs.iterator(); 
		
		while(it.hasNext())
		{
			Job job = it.next();
			
			if(job.getPublishDate() == null)
				it.remove();
			else if(currentDate.compareTo(job.getPublishDate()) >= 0 && (job.getCloseDate() == null || currentDate.compareTo(job.getCloseDate()) <= 0))
			{}
			else  //if(currentDate.compareTo(job.getPublishDate()) < 0)
				it.remove();
				
		}
		
		models.put("jobs", jobs);
		
		return "ViewJobs"; 
	}
	
	@RequestMapping("/jobDetails.html")
	public String viewJobDetails(@RequestParam Long jobid, ModelMap models)
	{
		models.put("job", jobDao.getJob(jobid));
		
		return "ViewJobDetails";
	}
	

}
