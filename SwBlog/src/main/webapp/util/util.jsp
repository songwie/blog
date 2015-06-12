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
		   <a href="${home}util/JsonTool.htm">json转码</a>
		   <a href="${home}util/URlDecode.htm">UrlDecode转码</a>
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