<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<spring:url value="/" var="home"></spring:url>
<div id="secondary" class="widget-area" role="complementary">
		<aside id="search-2" class="widget widget_search">
			<form role="search" method="get" id="searchform" class="searchform" action="${home}search">
				<div>
					<label class="screen-reader-text" for="s">Search for:</label>
					<input type="text" value="" name="search" id="searchid">
					<input type="submit" id="searchsubmit" value="搜索">
				</div>
			</form>
		</aside>

		<aside id="recent-posts-2" class="widget widget_recent_entries">
			<h3 class="widget-title">最新发布</h3>
				<ul>
				    <c:forEach var="data" items="${newArticleList}" varStatus="stauts">
					    <li>
							<i class="fa fa-star-o"></i>
							<a href="${home}articlelist/${data.id}">${data.title}</a>
						</li>
				    </c:forEach>

				</ul>
		</aside>

		<aside id="recent-comments-2" class="widget widget_recent_comments">
			<h3 class="widget-title">最新评论</h3>
			<ul id="recentcomments">
			    <c:forEach var="data" items="${newReplyList}" varStatus="stauts">
			         <li class="recentcomments">
						<i class="fa fa-comment-o"></i>
						<span class="comment-author-link">
							<a href="${home}articlelist/${data.articleid}" rel="external nofollow" class="url">${data.reply_author}</a>
						</span> on
						<a href="${home}articlelist/${data.articleid}">${data.article}</a>
					</li>
			    </c:forEach>
			</ul>
		</aside>
		<aside id="archives-2" class="widget widget_archive">
			<h3 class="widget-title">全部归档</h3>
			<ul>
				<c:forEach var="data" items="${newTimeList}" varStatus="stauts">
					<li>
						<i class="fa fa-clock-o"></i>
						<a href="${home}teachs?bymonth=${data.time}">${data.time} 共${data.count}篇</a>
					</li>
				</c:forEach>
			</ul>
		</aside>

		<aside id="categories-2" class="widget widget_categories"><h3 class="widget-title">分类列表</h3>
			<ul>
				<c:forEach var="data" items="${articleTypeList}" varStatus="stauts">
					<li class="cat-item cat-item-1">
						<i class="fa fa-folder-o"></i>
						<a href="${home}teachs?type=${data.id}">${data.type}</a>
					</li>
                </c:forEach>
			</ul>
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
					<a href="${home}feeds/rss2">订阅 <abbr title="Really Simple Syndication">RSS</abbr></a>
				</li>
				<li>
					<i class="fa fa-rss  "></i>
					 <a href="${home}feeds/reply">评论 <abbr title="Really Simple Syndication">Reply</abbr></a>
				</li>
			</ul>
		</aside>

		<aside id="linkcat-5" class="widget widget_links">
 		<h3 class="widget-title">友情链接</h3>
		<ul class="xoxo blogroll">
			<c:forEach var="data" items="${friendLinks}" varStatus="stauts">
				<li>
					<i class="fa fa-smile-o"></i><a href="${data.link}" title="${data.name}"> ${data.name}</a>
				</li>
			</c:forEach>
		</ul>
	</aside>

</div>