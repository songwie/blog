package com.sw.blog.model;
import java.math.BigInteger;
import java.util.List;
import java.util.Map;

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
		String sql = "select t.id,t.title,t.level,t.create_time,t.create_user,t.article_content,b.name,t.read_count  "
	               +" from tblog_article t inner join tblog_ariticle_type b on t.article_type_id=b.id "
				   +" where 1=1"
	                +" and t.status=1 "
	               +" order by t.istop desc,t.level asc,t.create_time desc ";
		Query query = entityManager.createNativeQuery(sql);

		query.setFirstResult(start);
		query.setMaxResults(limit);

		return query.getResultList();
	}

	public List getArticleListByMgr(Integer start, Integer limit, String search) {
		String sql = "select t.id,t.title,t.level,t.create_time,t.create_user,t.article_type_id,t.istop,t.status,t.read_count,b.name  "
	               +" from tblog_article t inner join tblog_ariticle_type b on t.article_type_id=b.id "
				   +" where 1=1" ;

		if(search!=null&&!search.equals("")&&!search.equals("null")){
	        sql+=" and ( t.title like concat('%',:search,'%') or t.article_content like concat('%',:search,'%') ) ";
		}

		sql+=" order by t.title,t.create_time desc ";

		Query query = entityManager.createNativeQuery(sql);

		if(search!=null&&!search.equals("")&&!search.equals("null")){
			query.setParameter("search", search);
		}

		query.setFirstResult(start);
		query.setMaxResults(limit);

		return query.getResultList();
	}
	public List getArticleByMgr(String articleid) {
		String sql = "select t.id,t.title,t.level,t.create_time,t.create_user,t.article_type_id,t.istop,t.status,t.read_count,b.name,t.article_content  "
	               +" from tblog_article t inner join tblog_ariticle_type b on t.article_type_id=b.id "
				   +" where 1=1"
	               +"   and t.id=:articleid "
	               +" order by t.istop desc,t.level asc,t.create_time desc ";
		Query query = entityManager.createNativeQuery(sql);
        query.setParameter("articleid", articleid);

		return query.getResultList();
	}
	public List getNewArticles(Integer limit) {
		String sql = "select t.id,t.title  "
	               +" from tblog_article t   "
				   +" where 1=1"
	               +" order by t.create_time desc ";
		Query query = entityManager.createNativeQuery(sql);

		query.setFirstResult(0);
		query.setMaxResults(limit);

		return query.getResultList();
	}

	public List<Object> getArticleTotal() {
		String sql = "select count(1) from tblog_article t where 1=1";
		Query query = entityManager.createNativeQuery(sql);

		return query.getResultList();
	}
	public List<Object> getArticleTotalByMgr(String search) {
		String sql = "select count(1) from tblog_article t where 1=1 ";

		if(search!=null&&!search.equals("")&&!search.equals("null")){
	        sql+=" and ( t.title like concat('%',:search,'%') or t.article_content like concat('%',:search,'%') ) ";
		}

		Query query = entityManager.createNativeQuery(sql);

		if(search!=null&&!search.equals("")&&!search.equals("null")){
			query.setParameter("search", search);
		}

		return query.getResultList();
	}

	public List getArticleById(String id) {
		String sql = "select t.id,t.title,t.level,t.create_time,t.create_user,t.article_content,b.name  "
	               +" from tblog_article t inner join tblog_ariticle_type b on t.article_type_id=b.id "
				   +" where 1=1 "
	                +" and t.status=1 "
	               +"  and t.id=:id ";

		Query query = entityManager.createNativeQuery(sql);
		query.setParameter("id", id);

		return query.getResultList();
	}
	public void freshCount(String id) {
		String sql = "update tblog_article t set t.read_count=t.read_count+1 "
				   +" where 1=1 "
	               +"  and t.id=:id ";

		Query query = entityManager.createNativeQuery(sql);
		query.setParameter("id", id);

		query.executeUpdate();
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

	public List getNewReplyList(Integer limit) {
		String sql = "  select t.id,t.reply_author,t.article_id,b.title "
                    +"  from tblog_ariticle_reply t left join tblog_article b on t.article_id=b.id  "
                    +"  where 1=1 "
 	                +"    and b.status=1 "
	                +"  order by t.reply_date desc ";

		Query query = entityManager.createNativeQuery(sql);
		query.setFirstResult(0);
		query.setMaxResults(limit);

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

	public List getNewTimeList(Integer limit) {
		String sql = " select DATE_FORMAT(t.create_time, '%Y-%m'),count(1) "
				    +" from tblog_article t "
		            +"  where t.status=1 "
	                +" group by  DATE_FORMAT(t.create_time, '%Y-%m')   ";

		Query query = entityManager.createNativeQuery(sql);
		query.setFirstResult(0);
		query.setMaxResults(limit);

		return query.getResultList();
	}

	public List getArticleTypeList() {
		String sql = " select id,name "
			    +" from tblog_ariticle_type t " ;

		Query query = entityManager.createNativeQuery(sql);

		return query.getResultList();
	}

	public List getFriendLinks() {
		String sql = " select id,name,url "
			    +" from tblog_links t " ;

		Query query = entityManager.createNativeQuery(sql);

		return query.getResultList();
	}

	public List getAllArticleList(Integer start, Integer limit, String bymonth, String type, String search) {
		String sql = "select t.id,t.title,t.level,t.create_time,t.create_user,b.name,t.read_count  "
	               +" from tblog_article t inner join tblog_ariticle_type b on t.article_type_id=b.id "
				   +" where 1=1 "
	               +"  and t.status=1 "
	               +"  and b.code='teach'";
		if(bymonth!=null&&!bymonth.equals("")&&!bymonth.equals("null")){
	        sql+=" and DATE_FORMAT(t.create_time, '%Y-%m')=:bymonth ";
		}
        if(type!=null&&!type.equals("")&&!type.equals("null")){
	        sql+=" and b.id=:typeid ";
		}
        if(search!=null&&!search.equals("")&&!search.equals("null")){
	        sql+=" and ( t.title like concat('%',:search,'%') or t.article_content like concat('%',:search,'%') ) ";
		}

        sql+=" order by t.title,t.create_time desc ";

		Query query = entityManager.createNativeQuery(sql);

		if(bymonth!=null&&!bymonth.equals("")&&!bymonth.equals("null")){
			query.setParameter("bymonth", bymonth);
		}
		if(type!=null&&!type.equals("")&&!type.equals("null")){
			query.setParameter("typeid", type);
		}
		if(search!=null&&!search.equals("")&&!search.equals("null")){
			query.setParameter("search", search);
		}

		query.setFirstResult(start);
		query.setMaxResults(limit);

		return query.getResultList();
	}

	public BigInteger getAllArticleTotal(String bymonth, String type, String search) {
		String sql = "select count(1)  "
	               +" from tblog_article t inner join tblog_ariticle_type b on t.article_type_id=b.id "
				   +" where 1=1 "
	               +"  and t.status=1 "
	               +"  and b.code='teach'";
		if(bymonth!=null&&!bymonth.equals("")&&!bymonth.equals("null")){
	        sql+=" and DATE_FORMAT(t.create_time, '%Y-%m')=:bymonth ";
		}
        if(type!=null&&!type.equals("")&&!type.equals("null")){
	        sql+=" and b.id=:typeid ";
		}
        if(search!=null&&!search.equals("")&&!search.equals("null")){
	        sql+=" and ( t.title like concat('%',:search,'%') or t.article_content like concat('%',:search,'%') ) ";
		}

        sql+=" order by b.id,t.create_time desc ";

		Query query = entityManager.createNativeQuery(sql);

		if(bymonth!=null&&!bymonth.equals("")&&!bymonth.equals("null")){
			query.setParameter("bymonth", bymonth);
		}
		if(type!=null&&!type.equals("")&&!type.equals("null")){
			query.setParameter("typeid", type);
		}
		if(search!=null&&!search.equals("")&&!search.equals("null")){
			query.setParameter("search", search);
		}

		return (BigInteger) query.getSingleResult();
	}

	public List getShuoList(Integer start, Integer limit ) {
		String sql = "select t.id,t.title,t.level,t.create_time,t.create_user,b.name  "
	               +" from tblog_article t inner join tblog_ariticle_type b on t.article_type_id=b.id "
				   +" where 1=1 "
	               +"  and t.status=1 "
	               +"  and b.code='shuo'";

        sql+=" order by b.id,t.create_time desc ";

		Query query = entityManager.createNativeQuery(sql);

		query.setFirstResult(start);
		query.setMaxResults(limit);

		return query.getResultList();
	}

	public BigInteger getShuoTotal() {
		String sql = "select count(1)  "
	               +" from tblog_article t inner join tblog_ariticle_type b on t.article_type_id=b.id "
				   +" where 1=1 "
	               +"  and t.status=1 "
	               +"  and b.code='shuo'";

        sql+=" order by b.id,t.create_time desc ";

		Query query = entityManager.createNativeQuery(sql);


		return (BigInteger) query.getSingleResult();
	}

	public List getAboutme(  ) {
		String sql = "select t.id,t.title,t.level,t.create_time,t.create_user,b.name,t.article_content  "
	               +" from tblog_article t inner join tblog_ariticle_type b on t.article_type_id=b.id "
				   +" where 1=1 "
	               +"  and t.status=1 "
	               +"  and b.code='aboutme'";

        sql+=" order by b.id,t.create_time desc ";

		Query query = entityManager.createNativeQuery(sql);

		return query.getResultList();
	}

	public void saveArticle(Map<String, Object> article) {
		String sql = "insert into tblog_article(title,level,create_time,create_user,article_type_id,article_content,istop,status) "
	               +" value(:title,:level,now(),:create_user,:article_type_id,:article_content,:istop,:status)";


		Query query = entityManager.createNativeQuery(sql);

		query.setParameter("title", article.get("title"));
		query.setParameter("level", article.get("level"));
		query.setParameter("create_user", article.get("create_user"));
		query.setParameter("article_type_id", article.get("article_type_id"));
		query.setParameter("article_content", article.get("content"));
		query.setParameter("istop", article.get("istop"));
		query.setParameter("status", article.get("status"));

		query.executeUpdate();

	}

	public void updateArticle(Map<String, Object> article) {
		String sql = "update tblog_article "
				   +" set title=:title,level=:level,create_user=:create_user,"
				   +"     article_type_id=:article_type_id,article_content=:article_content,istop=:istop,status=:status   "
	               +" where id=:articleid";


		Query query = entityManager.createNativeQuery(sql);

		query.setParameter("articleid", article.get("id"));
		query.setParameter("title", article.get("title"));
		query.setParameter("level", article.get("level"));
		query.setParameter("create_user", article.get("create_user"));
		query.setParameter("article_type_id", article.get("article_type_id"));
		query.setParameter("article_content", article.get("content"));
		query.setParameter("istop", article.get("istop"));
		query.setParameter("status", article.get("status"));

		query.executeUpdate();

	}

	public void delete(String articleid) {
		String sql = "delete from  tblog_article    "
	               +" where id=:articleid";

		Query query = entityManager.createNativeQuery(sql);
		query.setParameter("articleid", articleid);

		query.executeUpdate();
	}

}
