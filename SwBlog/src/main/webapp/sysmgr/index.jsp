
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<spring:url value="/" var="home"></spring:url>

<html>
<head>
    <title>站点管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

	<style type="text/css">
		table.imagetable {
			font-family: verdana,arial,sans-serif;
			font-size:11px;
			width:800;
			color:#333333;
			border-width: 1px;
			border-color: #999999;
			border-collapse: collapse;
		}
		table.imagetable th {
			background:#b5cfd2 url('cell-blue.jpg');
			border-width: 1px;
			padding: 8px;
			border-style: solid;
			border-color: #999999;
		}
		table.imagetable td {
			background:#dcddc0 url('cell-grey.jpg');
			border-width: 1px;
			padding: 8px;
			border-style: solid;
			border-color: #999999;
		}
	</style>

</head>

<div id="content-main">
	<div class="dataList">

	      <aside id="search-2" class="widget widget_search">
			<form role="search" method="get" id="searchform" class="searchform" action="${home}sys/mgr">
				<div>
					<label class="screen-reader-text" for="s">Search for:</label>
					<input type="text" value="" name="searthstr" id="searchid">
					<input type="submit" id="searchsubmit" value="搜索">
				</div>
			</form>
		  </aside>

	      <a href="${home}sys/add" class="possdetail" ><font color='blue'>添加文章</font></a>
	      <hr>
		  <table class="imagetable" width=900>
		     <tbody>
		         <tr>
		            <th>ID</td>
                    <th>类型</th>
                    <th style="padding-left: 13px;">标题</th>
                    <th>发布日期</th>
                    <th>发布人</th>
                    <th>级别</th>
                    <th>是否置顶</th>
                    <th>阅读数</th>
                    <th>状态</th>
                    <th>操作</th>
		          </tr>
		          <tr> </tr>
		          <c:forEach var="data" items="${articleList}" varStatus="stauts">
                   <tr>
				       <td align="left">${data.id}</td>
				       <td align="left">${data.typename}</td>
				       <td align="left" style="padding-left: 13px;word-wrap:break-word;" width=200>${data.title}</td>
				       <td align="left">${data.create_time}</td>
				       <td align="left">${data.create_user}</td>
				       <td align="left">${data.level}</td>
				       <td align="left">${data.istop}</td>
				       <td align="left">${data.read_count}</td>
				       <td align="left">${data.status}</td>

				       <td>
				          <a href="${home}sys/edit?articleid=${data.id}" class="possdetail" >在线编辑</a>
				          <a href="${home}sys/delete?articleid=${data.id}" class="possdetail" >删除</a>
				       </td>

				   </tr>
				  </c:forEach>


		</table>
		<div class="pagination">
				    <span class="step-links">
				        <c:choose>
				           <c:when test="${page.has_prepage == 1}">
				              <a href="${home}sys/mgr?start=0">首页</a>
				              <a href="${home}sys/mgr?start=${page.pre_start}">上一页</a>
				           </c:when>
				           <c:otherwise>
							  <span class='deactive'>首页</span>
				              <span class='deactive'>上一页</span>
				           </c:otherwise>
				        </c:choose>
				        <c:choose>
				           <c:when test="${page.has_nextpage == 1}">
				              <a href="${home}sys/mgr?start=${page.next_start}">下一页</a>
				              <a href="${home}sys/mgr?start=${page.last_start}">尾页</a>
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
        </div>

</div>


</body>
</html>