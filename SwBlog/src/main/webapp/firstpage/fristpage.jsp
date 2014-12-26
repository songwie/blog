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
								<a title="" href="${home}articlelist/${data.id}" rel="bookmark">${data.title}</a>
							</h1>
							<div class="comments-link">
							    <a href="${home}articlelist/${data.id}" title="评论 ">
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
									<a class="read-more" href="${home}articlelist/${data.id}"> 阅读更多...</a>
								</span>
						</footer>

					</article>
			    </c:forEach>

				<!-- #post -->
				<!-- <div class="pagination">
				    <span class="step-links">
				        {% if page.has_previous %}
				            <a href="/blog/pages">首页</a>
				            <a href="/blog/pages{{ posts.previous_page_number }}">上一页</a>
				        {%else%}
				            <span class='deactive'>首页</span>
				            <span class='deactive'>上一页</span>
				        {% endif %}
				        {% for i in page.paginator.page_range_ext %}
				            {%if i = page.number %}
				                <span class='currentpage'>
				                <span href='/blog/pages{{i}}'>{{i}}</span>
				            {%else%}
				            <a class='paginator' href='/blog/pages{{i}}'>{{i}}</a>
				            {%endif%}
				        {% endfor%}
				        {% if page.has_next %}
				            <a href="/blog/pages{{ page.next_page_number }}">下一页</a>
				            <a href="/blog/pages{{ page.paginator.num_pages }}">尾页</a>
				        {%else%}
				            <span class='deactive'>下一页</span>
				            <span class='deactive'>尾页</span>

				        {% endif %}
				         共{{ page.paginator.num_pages }}页.

				    </span>
				</div>
				 -->
				<!-- #page nav -->

			</div><!-- #content -->
		</div><!-- #primary -->

	</div><!-- #main .wrapper -->

</div><!-- #page -->
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?ac378b5e8650bd43088947c93c4888a2";
  var s = document.getElementsByTagName("script")[0];
  s.parentNode.insertBefore(hm, s);
})();
</script>

</body>
</html>