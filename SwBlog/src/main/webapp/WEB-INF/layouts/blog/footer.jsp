<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<spring:url value="/" var="home"></spring:url>
<!DOCTYPE html>

<!--底部-start-->
<input type="hidden" value="${home}" id="home"/>

<footer id="colophon" role="contentinfo">
	 <div class="site-info">
		<a href="/" title="my blog">本博客使用java</a>
		<p>©Copyright 2014, songwie.com</p>
	 </div><!-- .site-info -->
 </footer>
