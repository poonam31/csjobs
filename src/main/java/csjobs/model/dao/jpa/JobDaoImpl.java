package csjobs.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import csjobs.model.Job;
import csjobs.model.dao.JobDao;

@Repository
public class JobDaoImpl implements JobDao {
	
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public Job getJob(Long jobid) {
		return entityManager.find(Job.class, jobid);
	}
	
	@Override
	public List<Job> getJobs() {
		return entityManager.createQuery("from Job", Job.class).getResultList();
	}
	
	@Override
	public Job getJobByTitle(String title) {
		String query = "from JobPosition where title = :title";
		return  entityManager.createQuery( query, Job.class ).setParameter("title", title).getSingleResult();
	}

	@Override
	@Transactional
	public Job saveJob(Job job) {
		
		return entityManager.merge( job );
	}


}
