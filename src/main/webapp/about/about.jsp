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
		<div id="primary" class="site-contentall">
		    <div id="content" role="main">

                <c:forEach var="data" items="${aboutList}" varStatus="stauts">
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

					<div id="comments" class="comments-area">
				    <!-- .commentlist -->
				    <c:forEach var="data" items="${replyList}" varStatus="stauts">
				        <ol class="commentlist">
							<div class="comments-list">
		                        <c:choose>
		                        <c:when test="${data.level == 1}">
	                               <li>
						             <div class="single">
										<img class="round_img avatar" alt="" src="${home}resources/img/reply.png">
							            <div class="comment-item" id="comment-${data.id}" style="padding:0 0 0 5px;">
									        <div class="info">
												<a class="uname" href="article/reply/${id}#${data.id}" rel="external nofollow">${data.reply_author}</a>
											    <span class="timestamp">
													<c:choose>
			                                            <c:when test="${data.level != 1}">
                                                                                                                                                                  回复<a class="uname" href="article/reply/${id}#${data.id}" rel="external nofollow"> ${data.responAuthor}</a>
														</c:when>
			                                            <c:otherwise>
			                                            </c:otherwise>
		                                            </c:choose>
		                                            <a href="article/reply/${id}#${data.id}">
														<time datetime="2014/12/09 09:24:13">在${data.replydate}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   </time>
													</a>
												</span>
											    <span class="reply">
												   <a class="comment-reply-link" href="article/reply/${id}#${data.id}"
												     onclick='return addComment.moveForm("comment-${data.id}", "${data.id}", "respond", "${data.articleid}")'>
                                                   <i class="fa fa-comment-o  ">回复</i>
                                                   </a>
								 			    </span>
									 		</div>
							 		       <div class="body">
							 			      ${data.replyMsg}
							 		       </div>
							           </div>
						             </div> <!--#single##-->
						           </li><!-- #comment-## -->
		                        </c:when>
		                        <c:otherwise>
	                             	<ol class="children">
							            <li>
								             <div class="single">
												<img class="round_img avatar" alt="" src="${home}resources/img/reply.png">
									            <div class="comment-item" id="comment-${data.id}" style="padding:0 0 0 5px;">
											        <div class="info">
														<a class="uname" href="article/reply/${id}#${data.id}" rel="external nofollow">${data.reply_author}</a>
													    <span class="timestamp">
															<c:choose>
					                                            <c:when test="${data.level != 1}">
		                                                                                                                                                                 回复<a class="uname" href="article/reply/${id}#${data.id}" rel="external nofollow"> ${data.responAuthor}</a>
																</c:when>
					                                            <c:otherwise>
					                                            </c:otherwise>
				                                            </c:choose>
														</span>
														<a href="article/reply/${id}#${data.id}">
																<time datetime="yyyy/mm/dd hh:mi:ss">在${data.replydate}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</time>
														</a>
													    <span class="reply">
														   <a class="comment-reply-link" href="article/reply/${id}#${data.id}"
														       onclick='return addComment.moveForm("comment-${data.id}", "${data.id}", "respond", "${data.articleid}")'>
														       <i class="fa fa-comment-o  ">回复</i>
														   </a>
										 			    </span>
											 		</div>
									 		       <div class="body">
									 			      ${data.replyMsg}
									 		       </div>
									           </div>
								             </div> <!--#single##-->
								          </li><!-- #comment-## -->
						            </ol>
		                        </c:otherwise>
		                        </c:choose>
					      </div>
						</ol>
					</c:forEach>
					<!-- .commentlist -->

					<div id="respond" class="comment-respond">
						<h3 id="reply-title" class="comment-reply-title">
							<small>
							<a rel="nofollow" id="cancel-comment-reply-link" href="${home}/blog/?p=41#respond" style="display:none;">取消回复</a>
							</small>
						</h3>
						<form action="${home}reply/comment" method="post" id="commentform" class="comment-form">
							<p class="comment-form-comment">
								<label for="comment">评论*</label>
								<textarea id="reply_commentid" name="comment" cols="45" rows="8" aria-required="true"></textarea>
								<span class="required"></span>
							</p>
							<div>
								<p class="comment-form-author">
									<label for="author">昵称 <span class="required">*</span></label>
									<input id="reply_authorid" name="author" size="30" aria-required="true" type="text">
									<span class="required"></span>
								</p>
								<p class="comment-form-url"><label for="url">联系信息</label>
								 <input id="reply_contactid" name="contact" size="300" type="text">
								 <span class="required"></span>
								</p>
							</div>
						<p class="form-submit">
							<input name="submit" id="submit" value="发表回复" type="submit">
							<span class="required"></span>
							<input name="comment_post_ID" value="${articleid}" id="comment_post_ID" type="hidden">
							<input name="comment_parent" id="comment_parent" value="0" type="hidden">
						</p>
							<input id="_wp_unfiltered_html_comment_disabled" name="_wp_unfiltered_html_comment" value="ec2af034c7" type="hidden">
							<script>(function(){if(window===window.parent){document.getElementById('_wp_unfiltered_html_comment_disabled').name='_wp_unfiltered_html_comment';}})();
							</script>
						</form>
				    </div><!-- #respond -->
				</div>

			    </c:forEach>


			</div><!-- #content -->
		</div><!-- #primary -->

	</div><!-- #main .wrapper -->

</div><!-- #page -->

</body>
</html>