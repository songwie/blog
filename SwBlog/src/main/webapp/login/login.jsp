<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<spring:url value="/" var="home"></spring:url>

<html>
<head>
    <title>站点管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="${home}resources/css/sys_login.css">

</head>

<div id="content-main">
<form class="form-signin" action="${home}sys/login" method="post" id="login-form">
  <div class="form-signin-inner">
  <h2>Login</h2>


  <div class="form-group">
    <label for="id_username" class="required">用户名</label>
    <p class="text-danger"></p>
    <input id="id_username" maxlength="254" name="username" type="text" autocapitalize="off">
  </div>
  <div class="form-group">
    <label for="id_password" class="required">密码</label>
    <p class="text-danger"></p>
    <input id="id_password" name="password" type="password">
  </div>


  <div class="form-actions clearfix">
      <hr>
      <input type="submit" value="登录" id="submitid" class="btn btn-lg btn-primary btn-block">
      <label>${error}</label>
  </div>
  </div>
</form>


</div>


</body>
</html>