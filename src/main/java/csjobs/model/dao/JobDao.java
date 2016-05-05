package csjobs.model.dao;

import java.util.List;

import csjobs.model.Job;


public interface JobDao {
	
	Job getJob(Long jobid);
	
	List<Job> getJobs();
	
	Job getJobByTitle(String title);
	
	Job saveJob( Job job );

}
