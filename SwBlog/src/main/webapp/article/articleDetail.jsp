<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<spring:url value="/" var="home"></spring:url>

<body>
     <div id="main" class="wrapper">
		<div id="primary" class="site-content">
		    <div id="content" role="main">
			     <c:forEach var="data" items="${articleList}" varStatus="stauts">
			        <article id="post-detail-${data.id}" class="post-1 post type-post status-publish format-standard hentry category-uncategorized">
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
						</footer>

					</article>
			    </c:forEach>

				<nav id="nav-single" class="nav-single">
				    <h3 class="assistive-text">Post navigation</h3>
				    <span class="nav-previous">
				            上一篇 <a href="${home}articlelist/${data.id}"></a>
				    </span>

				    <span class="nav-next">
				                下一篇 <a href="${home}articlelist/${data.id}"></a>
				    </span>
				</nav>

				<div id="comments" class="comments-area">
				    <!-- .commentlist -->
					<ol class="commentlist">
						<div class="comments-list">
				          <li>
				             <div class="single">
								<img class="round_img avatar" alt="" src="${home}resources/img/reply.png">
					            <div class="comment-item" id="comment-122" style="padding:0 0 0 5px;">
							        <div class="info">
										<a class="uname" href="#" rel="external nofollow">流星泪</a>
									    <span class="timestamp">
											<a href="http://evilbinary.org/blog/?p=41#comment-122">
												<time datetime="2014/12/09 09:24:13">2014/12/09 09:24:13</time>
											</a>
										</span>
									    <span class="reply">
										   <a class="comment-reply-link" href="article/reply/${id}"
										       onclick='return addComment.moveForm("comment-122", "122", "respond", "41")'>回复</a>
						 			    </span>
							 		</div>
					 		       <div class="body">
					 			      ${replyMsg}
					 		       </div>
					           </div>
				             </div> <!--#single##-->
				          </li><!-- #comment-## -->
				          <ol class="children">
					            <li>
					               <div class="single">
									  <img class="round_img " alt="" src="${home}resources/img/reply.png" height="32" width="32">
						              <div class="comment-item" id="comment-123" style="padding:0 0 0 5px;">
							            <div class="info">
										    <a class="uname" href="http://evilbinary.org/" rel="external nofollow">evilbinary</a>
											<span class="timestamp">
												<a href="http://evilbinary.org/blog/?p=41#comment-123">
													<time datetime="2014/12/09 09:43:06">2014/12/09 09:43:06</time>
												</a>
											</span>
											<span class="reply">
												<a class="comment-reply-link" href="http://evilbinary.org/blog/?p=41&amp;replytocom=123#respond" onclick='return addComment.moveForm("comment-123", "123", "respond", "41")'>回复</a>
								 			</span>
								 		</div>
								 		<div class="body">
								 			自己找一下官方的驱动，可能可以。
								 		</div>
									</div>
					              </div> <!--#single##-->
					            </li><!-- #comment-## -->
				          </ol>
					</ol>
					<!-- .commentlist -->
					<div id="respond" class="comment-respond">
						<h3 id="reply-title" class="comment-reply-title">
							<small>
							<a rel="nofollow" id="cancel-comment-reply-link" href="http://evilbinary.org/blog/?p=41#respond" style="display:none;">取消回复</a>
							</small>
						</h3>
						<form action="/blog/comment" method="post" id="commentform" class="comment-form">
							<input name="csrfmiddlewaretoken" value="4xQUN0gP2zfaWc8VGiI0rmExiGfYrMBh" type="hidden">
							<p class="comment-form-comment">
								<label for="comment">评论</label>
								<textarea id="comment" name="comment" cols="45" rows="8" aria-required="true"></textarea>
								<span class="required"></span>
							</p>
							<div>
								<p class="comment-form-author">
									<label for="author">昵称 <span class="required">*</span></label>
									 <input id="author" name="author" size="30" aria-required="true" type="text">
									 <span class="required"></span>
								</p>
								<p class="comment-form-email">
									<label for="email">邮箱
										<span class="required">*</span>
									</label>

									<input id="email" name="email" size="30" aria-required="true" type="text">
									<span class="required"></span>
								</p>
								<p class="comment-form-url"><label for="url">网站</label>
								 <input id="url" name="url" size="30" type="text">
								 <span class="required"></span>
								</p>
							</div>
						<p class="form-submit">
							<input name="submit" id="submit" value="发表回复" type="submit">
							<span class="required"></span>
							<input name="comment_post_ID" value="41" id="comment_post_ID" type="hidden">
							<input name="comment_parent" id="comment_parent" value="0" type="hidden">
						</p>
							<input id="_wp_unfiltered_html_comment_disabled" name="_wp_unfiltered_html_comment" value="ec2af034c7" type="hidden">
							<script>(function(){if(window===window.parent){document.getElementById('_wp_unfiltered_html_comment_disabled').name='_wp_unfiltered_html_comment';}})();
							</script>
						</form>
				    </div><!-- #respond -->
				</div>

				<!-- #page nav -->
			</div><!-- #content -->
		</div><!-- #primary -->

	</div><!-- #main .wrapper -->


</body>