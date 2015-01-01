<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<spring:url value="/" var="home"></spring:url>

<html>
<head>


</head>
<body class="home blog logged-in admin-bar custom-font-enabled single-author customize-support">
	<header role="banner" id="te-site-header">
       <div class="container">
           <a href="${home}" class="te-site-logo" role="logo">songwie</a>
           <ul class="nav nav-pills" id="te-site-nav" role="navigation">
               <li class="active"><a href="${home}#">顶部</a></li>
               <li><a href="#">搜索</a></li>
           </ul>
       </div>
	</header>
	<!-- #masthead -->

    <div id="main" class="wrapper">
		<div id="primary" class="site-content">
		    <div id="content" role="main">
                <c:forEach var="data" items="${shuoList}" varStatus="stauts">
			        <article id="post-${data.id}" class="post-1 post type-post status-publish format-standard hentry category-uncategorized">
						<header class="entry-header">
							<h1 class="entry-title">
								<a title="" href="${home}articlelist/${data.id}" rel="bookmark">${data.title}</a>
							</h1>
						</header>
						<footer class="entry-meta">
						发布在${data.articleTypeName}
						 <a href="#" title="" rel="bookmark">
								<time class="entry-date" datetime="2014/12/06 21:07:33">${data.articleDate}</time></a>
								<span class="by-author"> by
									<span class="author vcard">
										<a class="url fn n" href="#" title="" rel="author">${data.createUser}</a>
									</span>
								</span>
								<span class="read-more">
									<a class="read-more" href="${home}articlelist/${data.id}"> 阅读更多...</a>
								</span>
						</footer>

					</article>
			    </c:forEach>

				<!-- #post -->
				<div class="pagination">
				    <span class="step-links">
				        <c:choose>
				           <c:when test="${page.has_prepage == 1}">
				              <a href="${home}shuo?start=0">首页</a>
				              <a href="${home}shuo?start=${page.pre_start}">上一页</a>
				           </c:when>
				           <c:otherwise>
							  <span class='deactive'>首页</span>
				              <span class='deactive'>上一页</span>
				           </c:otherwise>
				        </c:choose>
				        <c:choose>
				           <c:when test="${page.has_nextpage == 1}">
				              <a href="${home}shuo?start=${page.next_start}">下一页</a>
				              <a href="${home}shuo?start=${page.last_start}">尾页</a>
				           </c:when>
				           <c:otherwise>
							  <span class='deactive'>下一页</span>
				              <span class='deactive'>尾页</span>
				           </c:otherwise>
				        </c:choose>
				                    当前第${page.curr_page}页, 共${page.pagetotal}页 , ${ page.total }条.
				    </span>
				</div>
				<!-- #page nav -->


			</div><!-- #content -->
		</div><!-- #primary -->

	</div><!-- #main .wrapper -->

</div><!-- #page -->

</body>
</html>