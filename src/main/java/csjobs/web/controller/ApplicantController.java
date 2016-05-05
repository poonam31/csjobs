package csjobs.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import csjobs.model.Application;
import csjobs.model.Degree;
import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.ApplicationDao;
import csjobs.model.dao.FileDao;
import csjobs.model.dao.JobDao;
import csjobs.model.dao.UserDao;
import csjobs.security.SecurityUtils;

@Controller
public class ApplicantController {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private JobDao jobDao;
	
	@Autowired
	private FileDao fileDao;
	
	@Autowired
	private ApplicationDao applicationDao;
	
	@Autowired
	private ServletContext context;

	private File getFileDirectory() {
		String path = context.getRealPath("WEB-INF/files");

		return new File(path);
	}
	
	public List<Job> getOpenJobs(List<Job> jobs)
	{
		Date currentDate = new Date();
		
		Iterator<Job> it = jobs.iterator(); 
		
		while(it.hasNext())
		{
			Job job = it.next();
			
			if(job.getPublishDate() == null)
				it.remove();
			
			else if(currentDate.compareTo(job.getPublishDate()) >= 0 && (job.getCloseDate() == null || currentDate.compareTo(job.getCloseDate()) < 0))
			{}
			else  //if(currentDate.compareTo(job.getPublishDate()) < 0)
				it.remove();
				
		}
		
		return jobs;		
	}
	
	@RequestMapping(value = "/listApplicantJobs.html", method=RequestMethod.GET)       
	public String listJobs(HttpSession httpSession, ModelMap models)
	{
		//String userName = (String) httpSession.getAttribute("userName");
		//User user = userDao.getUserByName(userName);
		
		String userName = SecurityUtils.getUser();
		User user = userDao.getUserByName(userName);
		//User user =(User) httpSession.getAttribute("authenticatedUser");
		
		List<Application> applications = user.getApplications();
		
		List<Job> jobs = jobDao.getJobs();
		
		jobs = getOpenJobs(jobs); // removing the jobs which are not open
		
		Iterator<Job> it = jobs.iterator(); 	

		while(it.hasNext())
		{
			Job job = it.next();
			
			for(Application a : applications)
			{
				if(job.getId() == a.getJob().getId())
					it.remove();
			}
			
		}
		
		models.put("user", user);
		models.put("applications", applications);
		models.put("jobs", jobs);
		
		return "ApplicantListJobs";
	}
	
	
	@RequestMapping(value = "/viewApplication.html", method=RequestMethod.GET)       
	public String viewApplication(@RequestParam Long appid, ModelMap models)
	{
		
		Application application = applicationDao.getApplication(appid);
		
		models.put("application", application);
		return "ViewApplication";
	}
	
	
	@RequestMapping(value = "/applyForJob.html", method=RequestMethod.GET)       
	public String applyForJob(@RequestParam Long jobid, @RequestParam Long appid, ModelMap models)
	{
		Application application = new Application();
		
		application.setJob(jobDao.getJob(jobid));
		application.setApplicant(userDao.getUser(appid));
		
		models.put("application", application);
		
		return "ApplyForJob";
	}
	
	@RequestMapping(value = "/applyForJob.html", method=RequestMethod.POST)       
	public String applyForJob(@RequestParam MultipartFile cvFile, @RequestParam MultipartFile rStmtFile,
			@RequestParam MultipartFile tStmtFile, @RequestParam Long jobid, @RequestParam Long appid, 
			@RequestParam String[] degree, @RequestParam String[] school, @RequestParam Integer[] year,
			@ModelAttribute Application application, ModelMap models) throws IllegalStateException, IOException
	{
		// uploaded CV
		if(!cvFile.isEmpty())
		{
			csjobs.model.File cv = new csjobs.model.File();
			cv.setName(cvFile.getOriginalFilename());
			cv.setType(cvFile.getContentType());
			cv.setSize(cvFile.getSize());
			cv.setDate(new Date());
			cv.setOwner(userDao.getUser(appid));
			
			// saving file to DB
			cv.setData(cvFile.getBytes());
			
			// setting the cv to application
			application.setCv(cv);
		}
		
		// uploaded Research Stmt
		if(!rStmtFile.isEmpty())
		{
			csjobs.model.File rs = new csjobs.model.File();
			rs.setName(rStmtFile.getOriginalFilename());
			rs.setType(rStmtFile.getContentType());
			rs.setSize(rStmtFile.getSize());
			rs.setDate(new Date());
			rs.setOwner(userDao.getUser(appid));
			
			// saving file to DB
			rs.setData(rStmtFile.getBytes());
			
			// setting the rs to application
			application.setResearchStatement(rs);
		}
			
		// uploaded Teaching Stmt
		if(!tStmtFile.isEmpty())
		{
			csjobs.model.File ts = new csjobs.model.File();
			ts.setName(tStmtFile.getOriginalFilename());
			ts.setType(tStmtFile.getContentType());
			ts.setSize(tStmtFile.getSize());
			ts.setDate(new Date());
			ts.setOwner(userDao.getUser(appid));
			
			// saving file to DB
			ts.setData(tStmtFile.getBytes());
			
			// setting the ts to application
			application.setTeachingStatement(ts);
		}
					
		
		List<Degree> degrees = new ArrayList<Degree>();
		
		for(int i=0; i<degree.length; i++)
		{	
			Degree d = new Degree();
			d.setName(degree[i]);
			d.setSchool(school[i]);
			d.setYear(year[i]);
			
			degrees.add(d);
		}
		
		application.setDegrees(degrees);
		application.setJob(jobDao.getJob(jobid));
		application.setApplicant(userDao.getUser(appid));
		application.setSubmitDate(new Date());
		
		application = applicationDao.saveApplication(application);
		
		return "redirect:listApplicantJobs.html?userid="+application.getApplicant().getId(); // redirect to applicantlistjobs page
	}
	
	@RequestMapping(value = "/download.html")
	public String download( @RequestParam long id, HttpServletResponse response) throws IOException
	{
			csjobs.model.File file = fileDao.getFile(id);
			
			response.setContentType(file.getType());
		
		 	response.setHeader("Content-Disposition", "attachment; filename=\""+ file.getName() +"\"");
		    response.setContentLength(file.getData().length);

		    FileCopyUtils.copy(file.getData(), response.getOutputStream());
		    
		    return null;
		
	}
	
	@RequestMapping(value = "/editApplication.html")
	public String editApplication(@RequestParam Long appid, ModelMap models)
	{
		Application application = applicationDao.getApplication(appid);
		
		models.put("application", application);
		return "editApplication";
	}


}
