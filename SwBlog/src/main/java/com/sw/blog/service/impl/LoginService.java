package com.sw.blog.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sw.blog.base.BlogException;
import com.sw.blog.base.constant.Constant;
import com.sw.blog.model.OperUser;
import com.sw.blog.service.ILoginService;


@Service("loginService")
@Scope("prototype")
@Transactional
public class LoginService implements ILoginService{

	//登录
	//默认商户或机构号为登录用户名
	public Map<String, String> LoginAuthen(String username,String pwd,HttpServletRequest request){
		Map<String, String> map = new HashMap<String, String>();

		OperUser operUser = null;

		operUser = OperUser.getOperUserByUserNameAndPassoword(username, pwd);
		if(operUser==null){
			operUser = OperUser.getOperUserByTelphone(String.valueOf(username));
			if(operUser==null){
				throw new BlogException("登录用户或手机不存在！");
			}
		}
		String type = operUser.getOperType();
		String password = operUser.getOperPassword();
		if(password.equals(pwd)){
			map.put(Constant.OPER_USER_ID,String.valueOf(operUser.getOperNo()));
			map.put(Constant.OPER_USER_NAME, operUser.getOperUserName());
			map.put(Constant.OPER_USER_REAL_NAME, operUser.getOperRealName());
		}else {
			throw new BlogException("密码错误！");
		}


		return map;
	}

	//首页
	@Override
	public Map<String, String> fristPage(String type, String merchanId,String userId) {
        Map<String, String> map = new HashMap<String, String>();

		return map;
	}




}
