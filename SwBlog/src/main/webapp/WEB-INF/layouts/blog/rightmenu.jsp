<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<spring:url value="/" var="home"></spring:url>
<div id="secondary" class="widget-area" role="complementary">
		<aside id="search-2" class="widget widget_search">
			<form role="search" method="get" id="searchform" class="searchform" action="http://www.songwie.com/blog/search/">
				<div>
					<label class="screen-reader-text" for="s">Search for:</label>
					<input type="text" value="" name="s" id="s">
					<input type="submit" id="searchsubmit" value="搜索">
				</div>
			</form>
		</aside>
		<aside id="meta-2" class="widget widget_meta"><h3 class="widget-title">功能</h3>
			<ul>
				<li>
					<i class="fa fa-paper-plane "></i>
					<a href="${home}loginMgr">站点管理</a></li>
				<!--<li><a href="http://localhost/php/wordpress/wp-login.php?action=logout&amp;_wpnonce=9cf5819c50">注销</a>
				</li>-->
				<li>
					<i class="fa fa-rss-square  "></i>
					<a href="http://www.songwie.com/blog/feeds/rss2">订阅 <abbr title="Really Simple Syndication">RSS</abbr></a>
				</li>
				<li>
					<i class="fa fa-rss  "></i>
					 <a href="http://www.songwie.com/blog/feeds/comments-rss2">评论 <abbr title="Really Simple Syndication">RSS</abbr></a>
				</li>
				<!--<li><a href="#" title="Powered by evilbinary, state-of-the-art semantic personal publishing platform.">evilbinary.org</a>
				</li>-->
			</ul>
		</aside>
		<aside id="recent-posts-2" class="widget widget_recent_entries">
			<h3 class="widget-title">最新发布</h3>
				<ul>
					<li>
						<i class="fa fa-star-o"></i>
						<a href="http://www.songwie.com/blog/?p=41">mac osx llvm-gcc编译得一个问题</a>
					</li>

					<li>
						<i class="fa fa-star-o"></i>
						<a href="http://www.songwie.com/blog/?p=22">结巴分词的词性标注</a>
					</li>

				</ul>
		</aside>

		<aside id="recent-comments-2" class="widget widget_recent_comments">
			<h3 class="widget-title">最新评论</h3>
			<ul id="recentcomments">
					<li class="recentcomments">
						<i class="fa fa-comment-o"></i>
						<span class="comment-author-link">
							<a href="" rel="external nofollow" class="url">mu_mu</a>
						</span> on
						<a href="http://www.songwie.com/blog/?p=19#comment-112">消除递归溢出的办法</a>
					</li>

					<li class="recentcomments">
						<i class="fa fa-comment-o"></i>
						<span class="comment-author-link">
							<a href="./resources/从零开始.html" rel="external nofollow" class="url">BSD依依鸭</a>
						</span> on
						<a href="http://www.songwie.com/blog/?p=17#comment-61">mac终端ls颜色修改</a>
					</li>

			</ul>
		</aside>
		<aside id="archives-2" class="widget widget_archive">
			<h3 class="widget-title">全部归档</h3>
			<ul>

				<li>
					<i class="fa fa-clock-o"></i>
					<a href="http://www.songwie.com/blog/archive/2014/12">2014年 12月 1篇</a>
				</li>

				<li>
					<i class="fa fa-clock-o"></i>
					<a href="http://www.songwie.com/blog/archive/2014/11">2014年 11月 2篇</a>
				</li>

			</ul>
		</aside>

		<aside id="categories-2" class="widget widget_categories"><h3 class="widget-title">分类列表</h3>
			<ul>

				<li class="cat-item cat-item-1">
					<i class="fa fa-folder-o"></i>
					<a href="http://www.songwie.com/blog/cat/2">C/C++</a>
				</li>

				<li class="cat-item cat-item-1">
					<i class="fa fa-folder-o"></i>
					<a href="http://www.songwie.com/blog/cat/6">Django</a>
				</li>

				<li class="cat-item cat-item-1">
					<i class="fa fa-folder-o"></i>
					<a href="http://www.songwie.com/blog/cat/8">myblog博客</a>
				</li>

			</ul>
		</aside>

		<aside id="linkcat-5" class="widget widget_links">
 		<h3 class="widget-title">友情链接</h3>
		<ul class="xoxo blogroll">
			<li>
				<i class="fa fa-smile-o"></i><a href="http://www.songwie.com/blog/archives" title="所有归档"> 所有归档</a>
			</li>

			<li>
				<i class="fa fa-smile-o"></i><a href="http://laolaibao.com" title="老来宝"> 老来宝</a>
			</li>

		</ul>
	</aside>

</div>