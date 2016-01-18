<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<spring:url value="/" var="home"></spring:url>
<div id="secondary" class="widget-area" role="complementary">
		<aside id="search-2" class="widget widget_search">
			<form role="search" method="get" id="searchform" class="searchform" action="${home}teachs">
				<div>
					<label class="screen-reader-text" for="s">Search for:</label>
					<input type="text" value="" name="searthstr" id="searchid">
					<input type="submit" id="searchsubmit" value="搜索">
				</div>
			</form>
		</aside>
</div>