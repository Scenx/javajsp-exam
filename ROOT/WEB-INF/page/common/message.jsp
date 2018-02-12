<%@ page language="java" pageEncoding="utf-8"  %>
<%@ taglib uri="http://www.tomexam.com/taglib/tomtag" prefix="tomtag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="${tm_base}" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>系统消息 - System Message</title>
	<link rel="stylesheet" type="text/css" href="skins/default/style.css" />
</head>
<body>

<table border="0" cellpadding="0" cellspacing="0" class="tm_message">
	<thead>
		<tr>
			<th colspan="2"><tomtag:Message key="message.other.sysmessage" /></th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td width="70" style="text-align:center">
				<c:choose>
					<c:when test="${message.success}">
						<img src="skins/images/success.png" />
					</c:when>
					<c:otherwise>
						<img src="skins/images/error.png" />
					</c:otherwise>
				</c:choose>
			</td>
			<td>
				<div style="padding:0 20px 20px 0; line-height:20px">${message.message }</div>
				<div>
					<c:forEach var="link" items="${message.urls }">
						<a href="${link.url }" <c:if test="${link.top}">target="_top"</c:if>>${link.title }</a> &nbsp;
					</c:forEach>
				</div>
			</td>
		</tr>
	</tbody>
</table>

</body>
</html>


