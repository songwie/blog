package com.sw.blog.model;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.stereotype.Repository;

@Configurable
@Repository
public class ArticleDao {
	@javax.persistence.PersistenceContext
    transient EntityManager entityManager;

	public static final EntityManager entityManager() {
        EntityManager em = new ArticleDao().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }

	public List getArticleList(Integer start, Integer limit) {
		String sql = "select t.id,t.title,t.level,t.create_time,t.create_user,t.article_content,b.name  "
	               +" from tblog_article t inner join tblog_ariticle_type b on t.article_type_id=b.id "
				   +" where 1=1";
		Query query = entityManager.createNativeQuery(sql);

		query.setFirstResult(start);
		query.setMaxResults(limit);

		return query.getResultList();
	}

	public List<Object> getArticleTotal() {
		String sql = "select count(1) from tblog_article t where 1=1";
		Query query = entityManager.createNativeQuery(sql);

		return query.getResultList();
	}

	public List getArticleById(String id) {
		String sql = "select t.id,t.title,t.level,t.create_time,t.create_user,t.article_content,b.name  "
	               +" from tblog_article t inner join tblog_ariticle_type b on t.article_type_id=b.id "
				   +" where 1=1 "
	               +"  and t.id=:id ";

		Query query = entityManager.createNativeQuery(sql);
		query.setParameter("id", id);

		return query.getResultList();
	}


}
