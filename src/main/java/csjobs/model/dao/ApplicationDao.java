package csjobs.model.dao;

import java.util.List;

import csjobs.model.Application;
import csjobs.model.Job;
import csjobs.model.User;


public interface ApplicationDao {
	
	Application getApplication(Long id);
	
	List<Application> getApplications();
	
	Application saveApplication(Application application);
	
	Application getApplication(User applicant, Job job);

}
