package csjobs.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import csjobs.model.Application;
import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.ApplicationDao;


@Repository
public class ApplicationDaoImpl implements ApplicationDao {
	
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	@PostAuthorize ("hasRole('ROLE_ADMIN') or returnObject.applicant.email == principal.username or hasRole('ROLE_REVIEWER')")
	public Application getApplication(Long id) {
		//returnObject.job.isMember(principal)
		return entityManager.find(Application.class, id);
	}
	
	
	@Override
	@Transactional
	@PostAuthorize ("returnObject.applicant.email == principal.username or hasRole('ROLE_REVIEWER')")
	public Application saveApplication(Application application) {
		
		return entityManager.merge(application);
	}

	@Override
	@PostAuthorize ("hasRole('ROLE_ADMIN') or returnObject.applicant.email == principal.username or hasRole('ROLE_REVIEWER')")
	public Application getApplication(User applicant, Job job) {
		
		String query = "from Application where job = :job and applicant = :applicant";

        List<Application> results = entityManager
            .createQuery( query, Application.class )
            .setParameter( "job", job )
            .setParameter( "applicant", applicant )
            .getResultList();
        return results.size() == 0 ? null : results.get( 0 );
	}


	@Override
	public List<Application> getApplications() {
		return entityManager.createQuery("from Application", Application.class).getResultList();
	}

}

