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


</head>

<style type="text/css">
@media (min-width: 768px) {
.form-signin {
    max-width: 380px;
    margin: 0 auto 20px;
    background-color: #fff;
    border: 1px solid #e5e5e5;
    -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        border-radius: 5px;
    -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
        -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
        box-shadow: 0 1px 2px rgba(0,0,0,.05);
}
.form-signin-inner{
    padding: 9px 29px 29px;
}
.form-signin .form-signin-heading, .form-signin .checkbox, .form-signin h2 {
    margin-bottom: 30px;
}
.form-signin .form-actions{
    margin: 0;
}
#id_username, #id_password{
    display: block;
    font-size: 16px;
    height: 44px;
    width: 100%;
}
}
</style>


<div id="content-main">
<form class="form-signin" action="${home}loginput" method="post" id="login-form">
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
      <input type="submit" value="登录" id="submitid" class="btn btn-lg btn-primary btn-block">
      <label>${error}</label>
  </div>
  </div>
</form>


</div>


</body>
</html>