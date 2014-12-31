
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
	      <a href="${home}sys/add" class="possdetail" ><font color='blue'>添加文章</font></a>
	      <hr>
		  <table class="imagetable" >
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
				       <td align="left" style="padding-left: 13px;">${data.title}</td>
				       <td align="left">${data.create_time}</td>
				       <td align="left">${data.create_user}</td>
				       <td align="left">${data.level}</td>
				       <td align="left">${data.istop}</td>
				       <td align="left">${data.read_count}</td>
				       <td align="left">${data.status}</td>

				       <td><a href="${home}sys/edit?articleid=${data.id}" class="possdetail" >在线编辑</a></td>

				   </tr>
				  </c:forEach>


		</table>
        </div>

</div>


</body>
</html>