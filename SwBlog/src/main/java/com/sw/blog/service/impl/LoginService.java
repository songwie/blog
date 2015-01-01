package com.sw.blog.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.Element;
import org.omg.CORBA.StringHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sw.blog.base.BlogException;
import com.sw.blog.base.constant.Constant;
import com.sw.blog.base.util.PageUtil;
import com.sw.blog.model.ArticleDao;
import com.sw.blog.model.SysDao;


@Service("loginService")
@Scope("prototype")
@Transactional
public class LoginService {

	@Autowired
	SysDao dao;

	@Autowired
	ArticleDao articleDao;

	//登录
	public Map<String, String> LoginAuthen(String username,String pwd){
		Map<String, String> map = new HashMap<String, String>();

		List data = dao.getUser(username);
		if(data!=null&&data.size()!=0){
			Object[] datas = (Object[]) data.get(0);
            String password = datas[2]==null?"":datas[2].toString();
			if(password.equals(pwd)){
				map.put(Constant.OPER_USER_ID,username);
			}else {
				throw new BlogException("密码错误！");
			}
		}else {
			throw new BlogException("用户不存在！");
		}

		return map;
	}

	public List<Map<String, Object>> getArticles(String start,String limit,StringHolder total, PageUtil pageUtil) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		if(start==null||start.equals("")||start.equals("null")){
			start = "0";
		}
		if(limit==null||limit.equals("")||limit.equals("null")){
			limit = "3";
		}

		List data = articleDao.getArticleListByMgr(Integer.valueOf(start),Integer.valueOf(limit));
		List<Object> totalList = articleDao.getArticleTotalByMgr();

		for(int i=0;i<data.size();i++){
			Map<String,Object> map = new HashMap<String, Object>();
			Object[] objects = (Object[]) data.get(i);
			map.put("id", objects[0]==null?"":objects[0]);
			map.put("title", objects[1]==null?"":objects[1]);
			map.put("level", objects[2]==null?"":objects[2]);
			map.put("create_time", objects[3]==null?"":objects[3]);
			map.put("create_user", objects[4]==null?"":objects[4]);
			map.put("article_type_id", objects[5]==null?"":objects[5]);
			map.put("istop", objects[6]==null?"":objects[6]);
			map.put("status", objects[7]==null?"":objects[7]);
			map.put("read_count", objects[8]==null?"":objects[8]);
			map.put("typename", objects[9]==null?"":objects[9]);

			list.add(map);
		}

		total.value = totalList.get(0).toString();
		pageUtil.parsePage(start, limit, Integer.valueOf(total.value));

		return list;
	}

	public List<Map<String, Object>> getArticle(String articleid) {

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List data = articleDao.getArticleByMgr(articleid);

		for(int i=0;i<data.size();i++){
			Map<String,Object> map = new HashMap<String, Object>();
			Object[] objects = (Object[]) data.get(i);
			map.put("id", objects[0]==null?"":objects[0]);
			map.put("title", objects[1]==null?"":objects[1]);
			map.put("level", objects[2]==null?"":objects[2]);
			map.put("create_time", objects[3]==null?"":objects[3]);
			map.put("create_user", objects[4]==null?"":objects[4]);
			map.put("article_type_id", objects[5]==null?"":objects[5]);
			map.put("istop", objects[6]==null?"":objects[6]);
			map.put("status", objects[7]==null?"":objects[7]);
			map.put("read_count", objects[8]==null?"":objects[8]);
			map.put("typename", objects[9]==null?"":objects[9]);
			map.put("content", objects[10]==null?"":objects[10]);

			list.add(map);
		}

		return list;
	}

	public void saveEdit(String articleid, String title, String level,
			String istop, String status, String content, String createUser , String typeid ) {

		List data = articleDao.getArticleByMgr(articleid);
		Map<String, Object> article = new HashMap<String, Object>();
        List<Map<String, Object>> list = this.getArticle(articleid);
        if(list.size()!=0){
        	article = list.get(0);
        }

        article.put("title", title);
    	article.put("level", level);
    	article.put("istop", istop);
    	article.put("status", status);
    	article.put("content", content);
    	article.put("create_user", createUser);
    	article.put("create_time", Calendar.getInstance());
    	article.put("article_type_id", typeid);

    	if(list.size()!=0){
        	article = list.get(0);
            articleDao.updateArticle(article);
        }else {
            articleDao.saveArticle(article);
		}
	}




}
