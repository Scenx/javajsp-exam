<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.tomexam.com/taglib/tomtag" prefix="tomtag"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="${tm_base}" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title><tomtag:Message key="txt.user.selfhistory" /></title>
	<link rel="shortcut icon" href="favicon.ico" />
	<link rel="stylesheet" type="text/css" href="skins/default/style.css" />
    
	<script src="inc/js/jquery.js" type="text/javascript"></script>
	<script src="inc/js/baseutil.js" type="text/javascript"></script>
	<script src="inc/js/layer/layer.js" type="text/javascript"></script>

	<style>
		.div-key-container{margin:5px 25px; border:dotted 0px #ddd; padding:0px;}
		.div-key-container span{font-weight:bold; clear:both}

		.div-key-container fieldset{border:solid 1px #ddd; margin-top:5px}
		.div-key-container fieldset legend{font-weight:bold}
		.div-key-container fieldset p{display:inline}

		.tm_question_tools{list-style:none; padding:0; margin:0; }
		.tm_question_tools li{list-style:none; padding:0; margin:0; width:40px; float:left; background:#eee; text-align:center; height:35px}
		.tm_question_tools li img{margin-top:8px;}
		.tm_question_tools li span{line-height:30px;}
		.tm_question_tools li span a{color:#00a; text-decoration:underline}
	</style>
    
	<script type="text/javascript">

		var tm_uid = "${sessionScope.SEN_USERID}";
		var tm_layerid = 0;

		$(document).ready(function() {
			tmUserPaper.initPaper();
			$(".tm_paper_section h1").click(function(){
				$(this).parent().children(".tm_paper_question").toggle();
			});
			tm_resetPosition();
		});

		function tm_resetPosition(){
			var nw = $(".tm_paper_head").width() + 45;
			$("#div_processor").css("left",nw + "px");
		}

		$(window).resize(function(){
			tm_resetPosition();
		});
		 
		$(window).scroll(function(){
			var tp = $(window).scrollTop();
			if(tp > 240){
				$("#div_processor").css("top", "20px");
			}else{
				var ntp = 240 - tp;
				$("#div_processor").css("top", ntp + "px");
			}
		});
	
		//创建弹出层
		function makeAddForm(qid, userkey){
			var tm_html_options = [];
			tm_html_options.push('<select class="tm_select" style="min-width:200px" name="c_tid">');
			<c:forEach var="category" items="${categories}">
			tm_html_options.push('	<option value="${category.t_id}">${category.t_name}</option>');
			</c:forEach>
			tm_html_options.push('<select>');

			var html = [];
			html.push('<div style="margin:10px">');
			html.push('	<table width="100%" cellpadding="5" border="0" class="tm_table_form">');
			html.push('	<tr>');
			html.push('		<th width="100"><tomtag:Message key="txt.user.collection.fields.typename" /></th>');
			html.push('		<td>'+tm_html_options+'</td>');
			html.push('	</tr>');
			html.push('	<tr>');
			html.push('		<th><tomtag:Message key="txt.user.collection.fields.remark" /></th>');
			html.push('		<td><input type="text" class="tm_txt" size="50" maxlength="50" name="c_remark" /></td>');
			html.push('	</tr>');
			html.push('	<tr>');
			html.push('		<th></th>');
			html.push('		<td><button class="tm_btn tm_btn_primary" type="button" onclick="tmUserPaper.doAddFav();"><tomtag:Message key="txt.other.operations.submit" /></button></td>');
			html.push('	</tr>');
			html.push('	</table>');
			html.push('</div>');
			html.push('<input type="hidden" name="c_qid" value="'+qid+'" />');
			html.push('<input type="hidden" name="c_userkey" value="'+userkey+'" />');
			return html.join("");
		}
		
		var tmUserPaper = {
			initPaper : function(){
				//追加导航按钮
				var html = [];
				$(".span-quick-nav").each(function(idx, itm){
					var question_id = $(this).data("qid");
					var nid = idx + 1;
					var thetop = $(this).offset().top;

					html.push('<a href="javascript:;" id="fast_'+question_id+'"');
					html.push(' onclick="javascript:tmUserPaper.moveToQuestion('+thetop+')" ');
					html.push('>' + nid + '</a>');
				});
				$("#div_processor_fastto").html(html.join(""));
			},

			moveToQuestion : function(thetop){
				$("html:not(:animated),body:not(:animated)").animate({ scrollTop: thetop}, 500);
			},

			addFavorite : function(qid, userkey){
				tm_layerid = layer.open({
					title: '<tomtag:Message key="txt.user.history.addfav_title" />',
					type: 1,
					area: ['500px', '250px'],
					shadeClose: true,
					content: makeAddForm(qid, userkey)
				});
			},
			
			doAddFav : function(){
				var c_remark = $("input[name='c_remark']").val();
				var c_tid = $("select[name='c_tid']").val();
				var c_qid = $("input[name='c_qid']").val();
				var c_userkey = $("input[name='c_userkey']").val();
				$.ajax({
					type: "POST",
					url: "${tm_base}user/collection/add.do",
					data: {"c_tid":c_tid, "c_uid":tm_uid, "c_qid":c_qid, "c_userkey":c_userkey, "c_remark":c_remark, "t":Math.random()},
					dataType: "json",
					success: function(ret){
						if(ret["code"] == "ok"){
							alert('<tomtag:Message key="message.other.op_ok" />');
						}else if(ret["code"] == "has"){
							alert('<tomtag:Message key="message.other.hasdata" />');
						}else{
							alert('<tomtag:Message key="message.other.op_failed" />');
						}
						layer.close(tm_layerid);
					},
					error:function(){
						alert('<tomtag:Message key="message.other.systembusy" />');
					}
				}); 
			}
		};
		
	</script>
  </head>
  
<body>

	<div class="tm_main">
    	
		<div class="tm_container">
			<ul class="tm_breadcrumb">
				<li><a href="common/welcome.thtml"><tomtag:Message key="txt.other.navhome" /></a> <span class="divider">&gt;</span></li>
				<li><a href="user/selftest/history.thtml"><tomtag:Message key="txt.user.selfhistory" /></a> <span class="divider">&gt;</span></li>
				<li class="active">${paper.name}</li>
			</ul>
		</div>
        
        <div class="tm_container">

			<table border="0" width="100%" cellpadding="0" style="min-width:860px;">
				<tr>
					<!-- left -->
					<td valign="top">
						<form method="post" id="form_paper_detail">
                    	<div class="tm_paper">
                            <div class="tm_paper_head">
                                <h1>${paper.name}</h1>
								<h2 style="background:#ddd; padding:5px 0; font-size:14px; font-weight:bold">
									<tomtag:Message key="txt.sys.paper.history.fields.paperinfo" />
								</h2>
                                <h2>
									<b><tomtag:Message key="txt.sys.paper.fields.duration" /></b> : 
									<span class="tm_label">${paper.duration}</span> <tomtag:Message key="txt.other.units.minute" />
									&nbsp;&nbsp;
									<b><tomtag:Message key="txt.sys.paper.fields.total" /></b> : 
									<span class="tm_label">${paper.totalscore}</span>
								</h2>

								<h2 style="background:#ddd; padding:5px 0; font-size:14px; font-weight:bold">
									<tomtag:Message key="txt.sys.paper.history.fields.userinfo" />
								</h2>
								<h2>
									<b><tomtag:Message key="txt.sys.paper.history.fields.timecost" /></b> : 
									<span class="tm_label">${detail.t_timecost}</span>
									<tomtag:Message key="txt.other.units.minute" /> 

									&nbsp;&nbsp;
									<b><tomtag:Message key="txt.sys.paper.history.fields.score" /></b> : <span id="tm_span_score" class="tm_label">${detail.t_userscore}</span>
								</h2>
                            </div>

                            <div class="tm_paper_body">
								
								<c:set value="0" var="varQuestionId"/>

                            	<c:forEach var="section" items="${paper.sections}">
                            	<div class="tm_paper_section">
                                	<h1>${section.name}</h1>
                                    <h2>${section.remark}</h2>
                                    
                                    <c:forEach var="question" items="${section.questions}">
									<c:set var="v_questionid" value="Q-${question.id}" />
									<c:set var="varQuestionId" value="${varQuestionId+1}"></c:set>
									<span class="span-quick-nav" data-qid="${question.id}"></span>

                                    <table border="0" cellpadding="0" cellspacing="0" class="tm_paper_question" style="table-layout:fixed;">
                                    	<thead>
                                        	<tr>
                                            	<th valign="top" class="tm_question_lineheight"><cite>${varQuestionId}</cite></th>
                                                <td class="tm_question_lineheight">
													<c:choose>
														<c:when test="${question.type == 4}">
															<tomtag:Util action="formatBlank" data="${question.content}" ext=" ________ "></tomtag:Util>
														</c:when>
														<c:otherwise>   
															${question.content}
														</c:otherwise> 
													</c:choose>
												</td>
												<td width="125" valign="top">
													<ul class="tm_question_tools">
														<li>
															<c:choose>
																<c:when test="${question.type == '5'}">
																	<img src='skins/images/help.png' width='20' />
																</c:when>
																<c:otherwise>
																	<c:choose>
																		<c:when test="${check[v_questionid] > 0}">
																			<img src='skins/images/success.png' width='20' />
																		</c:when>
																		<c:otherwise>   
																			<img src='skins/images/error.png' width='20' />
																		</c:otherwise> 
																	</c:choose>
																</c:otherwise> 
															</c:choose>
														</li>
														<li>
															<span><b>${check[v_questionid]}</b></span>
														</li>
														<li><span><a href="javascript:void(0);" 
														onclick="javascript:tmUserPaper.addFavorite('${question.id}', '${answer[v_questionid]}');"><tomtag:Message key="txt.user.history.addfav" /></a></span></li>
													</ul>
												</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<tr>
                                            	<td colspan="3">
													<c:choose>
														<c:when test="${question.type == '1'}">
															<ul>
															<c:forEach var="option" items="${question.options}">
																<li><label>${option.alisa} . ${option.text}</label></li>
															</c:forEach>
															</ul>
															<div class="div-key-container">
																<fieldset>
																	<legend><tomtag:Message key="txt.user.history.fields.standkey" /> :</legend>
																	<p>${question.key}</p>
																 </fieldset>
																 <fieldset>
																	<legend><tomtag:Message key="txt.sys.question.fields.resolve" /> :</legend>
																	<p>${question.ext}</p>
																 </fieldset>
															</div>
														</c:when>

														<c:when test="${question.type == '2'}">
															<ul>
															<c:forEach var="option" items="${question.options}">
																<li><label>${option.alisa} . ${option.text}</label></li>
															</c:forEach>
															</ul>
															<div class="div-key-container">
																<fieldset>
																	<legend><tomtag:Message key="txt.user.history.fields.standkey" /> :</legend>
																	<p>${question.key}</p>
																 </fieldset>
																 <fieldset>
																	<legend><tomtag:Message key="txt.sys.question.fields.resolve" /> :</legend>
																	<p>${question.ext}</p>
																 </fieldset>
															</div>
														</c:when>

														<c:when test="${question.type == '3'}">
															<div class="div-key-container">
																<fieldset>
																	<legend><tomtag:Message key="txt.user.history.fields.standkey" /> :</legend>
																	<p>${question.key}</p>
																 </fieldset>
																 <fieldset>
																	<legend><tomtag:Message key="txt.sys.question.fields.resolve" /> :</legend>
																	<p>${question.ext}</p>
																 </fieldset>
															</div>
														</c:when>

														<c:when test="${question.type == '4'}">
															<div class="div-key-container">
																<fieldset>
																	<legend><tomtag:Message key="txt.user.history.fields.standkey" /> :</legend>
																	<p>
																		<c:forEach var="blank" items="${question.blanks}">
																		${blank.value}
																		</c:forEach>
																	</p>
																 </fieldset>
																 <fieldset>
																	<legend><tomtag:Message key="txt.sys.question.fields.resolve" /> :</legend>
																	<p>${question.ext}</p>
																 </fieldset>
															</div>
														</c:when>

														<c:when test="${question.type == '5'}">
															<div class="div-key-container">
																<fieldset>
																	<legend><tomtag:Message key="txt.user.history.fields.standkey" /> :</legend>
																	<p>${question.key}</p>
																 </fieldset>
																 <fieldset>
																	<legend><tomtag:Message key="txt.sys.question.fields.resolve" /> :</legend>
																	<p>${question.ext}</p>
																 </fieldset>
															</div>
														</c:when>
													</c:choose>

													<div class="div-key-container tm_userkey">

														<fieldset>
															<legend><tomtag:Message key="txt.user.history.fields.userkey" /> :</legend>
															<p>
															<c:choose>
																<c:when test="${question.type == '2'}">
																	${fn:replace(answer[v_questionid], '`', '')}
																</c:when>
																<c:when test="${question.type == '4'}">
																	${fn:replace(answer[v_questionid], '`', ' ')}
																</c:when>
																<c:otherwise>
																	${answer[v_questionid]}
																</c:otherwise> 
															</c:choose>
															</p>
														</fieldset>

													</div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    </c:forEach>
                                    
                                </div>
                                </c:forEach>
                                
                            </div>
                            <!-- /tm_paper_body -->
                            
                            <div class="tm_adm_paper_foot">
								<button class="tm_btn tm_btn_primary" type="button" onclick="history.go(-1);"><tomtag:Message key="txt.other.operations.back" /></button>
                            </div>


                        </div>

						<input type="hidden" id="t_timecost" name="t_timecost" value="0" />
						<input type="hidden" id="t_duration" name="t_duration" value="${paper.duration}" />
						
						</form>

					</td><!-- /left -->

					<td width="10">&nbsp;</td>

					<!--  right-->
					<td width="220" valign="top">
						
					</td>
					<!--  /right-->
				</tr>
			</table>

        	
			
        </div>
        
        
    </div>


	<div id="div_processor">
		<div id="div_processor_timer" style="margin-top:5px;"></div>
		<div id="div_processor_fastto"></div>
		<div id="div_processor_ops">
			<button class="tm_btn tm_btn_primary" type="button" onclick="history.go(-1);"><tomtag:Message key="txt.other.operations.back" /></button>
		</div>
	</div>



</body>
</html>
