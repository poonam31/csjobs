package csjobs.model.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import csjobs.model.File;
import csjobs.model.dao.FileDao;

@Repository
public class FileDaoImpl implements FileDao{
	
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public File getFile(Long id) {
		
		return entityManager.find(File.class, id);
		
	}

}
