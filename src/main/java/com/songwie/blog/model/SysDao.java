package com.songwie.blog.model;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.stereotype.Repository;

@Configurable
@Repository
public class SysDao {
	@javax.persistence.PersistenceContext
    transient EntityManager entityManager;

	public static final EntityManager entityManager() {
        EntityManager em = new SysDao().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }

	public List getUser(String username ) {
		String sql = "select id,username,password "
	               +" from tblog_user t "
				   +" where 1=1"
	               +"  and t.username=:username "
	               +"   ";
		Query query = entityManager.createNativeQuery(sql);

		query.setParameter("username", username);

		return query.getResultList();
	}

}
