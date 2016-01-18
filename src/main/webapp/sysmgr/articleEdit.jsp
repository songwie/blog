
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<spring:url value="/" var="home"></spring:url>
<jsp:include page="/common/common.jsp"></jsp:include>

<html>
<head>
    <title>站点管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">

    <input type="hidden" value="${home}" id="home" />

	<link rel="stylesheet" href="${home}resources/kindEdit/themes/default/default.css" />
	<link rel="stylesheet" href="${home}resources/kindEdit/plugins/code/prettify.css" />
	<script charset="utf-8" src="${home}resources/kindEdit/kindeditor.js"></script>
	<script charset="utf-8" src="${home}resources/kindEdit/lang/zh_CN.js"></script>
	<script charset="utf-8" src="${home}resources/kindEdit/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var home = $("#home").val();
			var editor1 = K.create('textarea[name="content1"]', {
				cssPath : home+ 'resources/kindEdit/plugins/code/prettify.css',
				uploadJson : home+ 'sys/upload',
				fileManagerJson : home+ 'sysmgr/file_manager_json.jsp',
				allowFileManager : false,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['formid'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['formid'].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>

</head>

<html>
<body>

<div id="content-main">
   <form name="formid" method="post" action="${home}sys/saveEdit">
        <input type="submit" name="button" value="提交" /> (提交快捷键: Ctrl + Enter)
        <input type="hidden" name="articleid" value="${id}" />
        <hr>
        <label>标题</label>
        <input type="text" name="title" value="${title}" />
        <label>级别</label>
        <input type="text" name="level" value="${level}" />
        <label>是否置顶</label>
        <input type="text" name="istop" value="${istop}" />
        <br>
        <label>是否启用</label>
        <input type="text" name="status" value="${status}" />
        <label>创建用户</label>
        <input type="text" name="createUser" value="${create_user}" />
        <label>类型</label>
        <input type="text" name="typeid" value="${article_type_id}" />


        <br>
		<textarea name="content1" cols="200" rows="60" style="width:950px;height:800px;visibility:hidden;">
           ${content}
        </textarea>
		<br />
	</form>
</div>


</body>
</html>