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
				<article id="post-41" class="post-41 post type-post status-publish format-standard hentry category-uncategorized">
					<header class="entry-header">

							<h1 class="entry-title">
								<a title="mac osx llvm-gcc编译得一个问题" href="http://www.songwie.com/blog/article/41" rel="bookmark">mac osx llvm-gcc编译得一个问题</a>
							</h1>

						<div class="comments-link">



									<a href="http://www.songwie.com/blog/?p=41#respond" title="评论 ">

									<i class="fa fa-comment-o  "></i><span class="leave-reply">发表回复</span>

							</a>
						</div>
					</header>

					<div class="entry-content">
						<p>


							  </p><p>mac下llvm-gcc编译一个程序，发现存在一种情况可以让程序莫名其妙得挂掉。其他源码文件在调用使用某其他源码文件中为add的函数，如果没有include 包含所调用函数的符号add，编译可以过，但是程序跑起来会挂了，在gcc编译器下，提示add符号找不到。=。=!!</p>

					<p></p>

					</div>

					<footer class="entry-meta">
					发布在

						未分类


					 <a href="http://www.songwie.com/blog/?p=41" title="2014/12/06 21:07:33" rel="bookmark">

							<time class="entry-date" datetime="2014/12/06 21:07:33">2014 十二月 06 星期六 21:07:33</time></a>
							<span class="by-author"> by
								<span class="author vcard">
									<a class="url fn n" href="http://www.songwie.com/blog/author/1" title="View all posts by 小邪恶" rel="author">小邪恶</a>
								</span>
							</span>

							<span class="read-more">
								<a class="read-more" href="http://www.songwie.com/blog/article/41"> 阅读更多...</a>
							</span>

					</footer>

				</article><!-- #post -->
				<div class="pagination">
					<span class="step-links">
							<span class="deactive">首页</span>
							<span class="deactive">上一页</span>
							<span class="currentpage">
									<span href="/blog/pages1">1</span>

									<a class="paginator" href="http://www.songwie.com/blog/pages2">2</a>
									<a class="paginator" href="http://www.songwie.com/blog/pages3">3</a>
									<a class="paginator" href="http://www.songwie.com/blog/pages4">4</a>
									<a class="paginator" href="http://www.songwie.com/blog/pages5">5</a>
									<a href="http://www.songwie.com/blog/pages2">下一页</a>
									<a href="http://www.songwie.com/blog/pages7">尾页</a>
								 共7页.
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