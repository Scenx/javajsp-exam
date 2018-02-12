<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.tomexam.com/taglib/tomtag" prefix="tomtag"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="${tm_base}" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title><tomtag:Message key="txt.user.paper" /></title>
	<link rel="shortcut icon" href="favicon.ico" />
	<link rel="stylesheet" type="text/css" href="skins/default/style.css" />
	<script src="inc/js/jquery.js" type="text/javascript"></script>
	<script src="inc/js/baseutil.js" type="text/javascript"></script>
  </head>
  
<body>

	<div class="tm_main">
        
        <div class="tm_container">
			
			<jsp:useBean id="nowDate" class="java.util.Date" />
        	<table width="100%" cellpadding="10" border="0" class="tm_table_list">
            	<thead>
                	<tr>
                        <th><tomtag:Message key="txt.sys.paper.fields.name" /></th>
						<th><tomtag:Message key="txt.sys.paper.fields.status" /></th>
                        <th><tomtag:Message key="txt.sys.paper.fields.duration" /></th>
                    	<th><tomtag:Message key="txt.user.history.fields.timecost" /></th>
                    	<th><tomtag:Message key="txt.user.history.fields.examtime" /></th>
                        <th><tomtag:Message key="txt.user.history.fields.userscore" /></th>
                        <th><tomtag:Message key="txt.sys.paper.fields.total" /></th>
                    </tr>
                </thead>
                <tbody>
					<c:forEach var="paper" items="${page.dataList}">
					<c:set var="itimeleft" value="1" />
					<c:set var="interval" value="${nowDate.time - paper.e_starttime.time}" />
					<c:set var="itimeleft" value="${paper.p_duration - interval/1000/60}" />
                	<tr>
						<td>${paper.p_name}</td>
						<td>
							<c:choose>
								<c:when test="${paper.e_status == '0'}">
									<c:choose>
										<c:when test="${itimeleft<0}"><font color="red"><tomtag:Message key="txt.sys.paper.history.fields.timeout" /></font></c:when>
										<c:otherwise>
											<font color="gray"><tomtag:Message key="txt.sys.paper.history.fields.status.s0" /></font>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${paper.e_status == '1'}"><i><tomtag:Message key="txt.sys.paper.history.fields.status.s1" /><i></c:when>
								<c:when test="${paper.e_status == '2'}"><tomtag:Message key="txt.sys.paper.history.fields.status.s2" /></c:when>
								<c:otherwise><font color="red"><tomtag:Message key="txt.sys.paper.history.fields.status.sx1" /></font></c:otherwise>
							</c:choose>
						</td>
                    	<td>${paper.p_duration}</td>
						<td>${paper.e_timecost}</td>
						<td>
							${paper.e_starttime}<br/>${paper.e_endtime}
						</td>
						<td>
							<span class="tm_label"></span>
							<c:choose>
								<c:when test="${paper.e_score >= paper.p_pass_score}"><font color="green">${paper.e_score}</font></c:when>
								<c:otherwise><font color="red"><b>${paper.e_score}</b></font></c:otherwise>
							</c:choose>
						</td>
						<td>${paper.p_total_score}</td>
                    </tr>
					</c:forEach>
                </tbody>
                <tfoot>
                	<tr>
                    	<td colspan="9">
                        	${foot}
                        </td>
                    </tr>
                </tfoot>
            </table>

        </div>
        
        
    </div>

</body>
</html>
