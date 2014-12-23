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
           <a href="/" class="te-site-logo" role="logo">songwie</a>
           <ul class="nav nav-pills" id="te-site-nav" role="navigation">
               <li class="active"><a href="http://www.songwie.com/#">顶部</a></li>
               <li><a href="http://www.songwie.com/search">搜索</a></li>
           </ul>
       </div>
	</header>
	<!-- #masthead -->

    <div id="main" class="wrapper">
		<div id="primary" class="site-content">
		    <div id="content" role="main">

                <c:forEach var="data" items="${articleList}" varStatus="stauts">
			        <article id="post-${data.id}" class="post-1 post type-post status-publish format-standard hentry category-uncategorized">
						<header class="entry-header">
							<h1 class="entry-title">
								<a title="" href="${home}article/${data.id}" rel="bookmark">${data.title}</a>
							</h1>
							<div class="comments-link">
							    <a href="${home}article/${data.id}" title="评论 ">
								   <i class="fa fa-comment-o  "></i><span class="leave-reply">发表回复</span>
								</a>
							</div>
						</header>

						<div class="entry-content">
							<p></p>
							<p>${data.content}</p>
						    <p></p>
						</div>

						<footer class="entry-meta">
						发布在${data.articleTypeName}
						 <a href="#" title="" rel="bookmark">
								<time class="entry-date" datetime="2014/12/06 21:07:33">${data.articleDate}</time></a>
								<span class="by-author"> by
									<span class="author vcard">
										<a class="url fn n" href="http://www.songwie.com/blog/author/1" title="" rel="author">${data.createUser}</a>
									</span>
								</span>
								<span class="read-more">
									<a class="read-more" href="${home}article/${data.id}"> 阅读更多...</a>
								</span>
						</footer>

					</article>
			    </c:forEach>

				<!-- #post -->
				<div class="pagination">
					<span class="step-links">
							<span class="deactive">首页</span>
							<span class="deactive">上一页</span>
							<span class="currentpage">
									<span href="/blog/pages">1</span>
									<a href="/blog/pages">下一页</a>
									<a href="/blog/pages">尾页</a>
								 共1页.
							</span>
					</span>
				</div>
				<!-- #page nav -->
			</div><!-- #content -->
		</div><!-- #primary -->

	</div><!-- #main .wrapper -->

</div><!-- #page -->

</body>
</html>