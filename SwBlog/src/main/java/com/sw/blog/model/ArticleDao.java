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
				   +" where 1=1"
	               +" order by t.istop desc,t.level asc,t.create_time desc ";
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

	public Object[] getReplyById(String replyid) {
		String sql = "select t.code,t.full_code  "
	               +" from tblog_ariticle_reply t "
				   +" where 1=1 "
	               +"  and t.id=:replyid ";

		Query query = entityManager.createNativeQuery(sql);
		query.setParameter("replyid", replyid);

		return (Object[]) query.getSingleResult();
	}

	public void saveRepy(String articleid, String replyid, String code,
			String fullCode, String comment, String author, String contact, String level) {
		String sql = "insert into tblog_ariticle_reply( "
				   +"   code,full_code,parent_id,article_id,reply_date,reply_author,   "
				   +"   reply_contact,reply_content,level  "
				   +" )  "
	               +" values("
	               +"   :code,:full_code,:parent_id,:article_id,now(),:reply_author,   "
				   +"   :reply_contact,:reply_content,:level  "
	               +" ) " ;

		Query query = entityManager.createNativeQuery(sql);
		query.setParameter("code", code);
		query.setParameter("full_code", fullCode);
		query.setParameter("parent_id", replyid);
		query.setParameter("article_id", articleid);
		query.setParameter("reply_author", author);
		query.setParameter("reply_contact", comment);
		query.setParameter("reply_content", comment);
		query.setParameter("level", level);

        query.executeUpdate();
	}

	public List getReplys(String articleid) {
		String sql = "  select t.id,b.reply_author resauth,t.level,t.article_id,t.reply_date, "
	                +"      t.reply_author,t.reply_contact,t.reply_content "
                    +"  from tblog_ariticle_reply t left join tblog_ariticle_reply b on t.parent_id=b.id  "
                    +"  where 1=1 "
	                +"     and t.article_id=:articleid "
	                +"  order by t.full_code ";

		Query query = entityManager.createNativeQuery(sql);
		query.setParameter("articleid", articleid);

		return query.getResultList();
	}

	public Object getMaxCodeByArticleId(String articleid) {
		String sql = "  select max(t.id) "
                +"  from tblog_ariticle_reply t "
                +"  where 1=1 "
                +"     and t.article_id=:articleid " ;

		Query query = entityManager.createNativeQuery(sql);
		query.setParameter("articleid", articleid);

		return query.getSingleResult();
	}


}
