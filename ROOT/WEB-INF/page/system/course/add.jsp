<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.tomexam.com/taglib/tomtag" prefix="tomtag"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="${tm_base}" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title><tomtag:Message key="txt.sys.course.add" /></title>
	<link rel="shortcut icon" href="favicon.ico" />
	<link rel="stylesheet" type="text/css" href="skins/default/style.css" />
	<link rel="stylesheet" type="text/css" href="skins/default/other.css" />
	<script src="inc/js/jquery.js" type="text/javascript"></script>
	<script src="inc/js/baseutil.js" type="text/javascript"></script>
	<script src="inc/js/layer/layer.js" type="text/javascript"></script>
	
	<link rel="stylesheet" type="text/css" href="inc/js/uploadify/uploadify.css" />  
	<script type="text/javascript" src="inc/js/uploadify/jquery.uploadify.min.js"></script>

	<link rel="stylesheet" href="inc/js/jquery-validation-engine/css/validationEngine.jquery.css" />
	<script src="inc/js/jquery-validation-engine/js/jquery.validationEngine.js"></script>
	
	<tomtag:Util action="lang" data="zh_CN">
	<script src="inc/js/jquery-validation-engine/js/languages/jquery.validationEngine-zh_CN.js"></script>
	</tomtag:Util>

	<tomtag:Util action="lang" data="en">
	<script src="inc/js/jquery-validation-engine/js/languages/jquery.validationEngine-en.js"></script>
	</tomtag:Util>

	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
	
	<script type="text/javascript">

		var editor_content = null;
		var var_lesson_id = 0;

		$(document).ready(function() {
			editor_content = CKEDITOR.replace('c_introduce'); 
			jQuery('#form_course_add').validationEngine();
			tm_addLesson();

			tm_uploadify('btn_photo', '<tomtag:Message key="txt.other.operations.browse" />', '${tm_base}', function(data){
				if(data.code == "y"){
					$(".tm_img_preview").show();
					$("#c_logo").val(data.name);
					$(".tm_img_preview img").attr("src", '${tm_base}' + data.name);
				}
			});
		});


		//上传组件
		function tm_upload_courseware(lesson_id){
			var _btn = "btn_courseware_"+lesson_id; 
			$("#"+_btn).uploadify({  
				'buttonText' : '<tomtag:Message key="txt.other.operations.upload" />',  
				'height' : 20,  
				'swf' :  '${tm_base}inc/js/uploadify/uploadify.swf',  
				'uploader' : '${tm_base}common/upload_courseware.do',  
				'cancelImg' : '${tm_base}inc/js/uploadify/uploadify-cancel.png', 
				'width' : 80,  
				'auto':true,  
				'fileTypeExts' : '*.mp3; *.mp4; *.flv; *.wmv; *.pdf; *.swf',
				'fileObjName'   : 'file',  
				'fileSizeLimit' : '10MB',
				'queueSizeLimit' : 1,
				'onUploadSuccess' : function(file, data, response) {  
					var retdata = eval("("+data+")");
					if(retdata.code == "y"){
						$("#c_lesson_filepath_"+lesson_id).val(retdata.name);
					}

				}  
			}); 
		}

		function tm_addLesson(){
			var_lesson_id = var_lesson_id + 1;
			$("#tm_lesson_template").find("input[name='c_lesson_id']").attr("value", var_lesson_id);
			//为了绑定上传事件，所以要设置ID
			$("#tm_lesson_template").find("input[name='btn_courseware']").attr("id", "btn_courseware_"+var_lesson_id);
			$("#tm_lesson_template").find("input[name='c_lesson_filepath']").attr("id", "c_lesson_filepath_"+var_lesson_id);
			
			var tm_lesson = $("#tm_lesson_template").html();
			$("#tm_lessons").append(tm_lesson);

			tm_upload_courseware(var_lesson_id);
		}

		function tm_removeLesson(obj){
			$(obj).parent().parent().parent().remove();
		}

	</script>

	<style>
		.tm_table_lesson{border-collapse:collapse; margin-bottom:20px}
		.tm_table_lesson tr th{ font-weight:normal; text-align:right; font-size:12px; border:solid 1px #eee; background:#f5f5f5; line-height:20px; padding:5px; }
		.tm_table_lesson tr td{ border:solid 1px #eee; padding:5px;}
		.uploadify{margin:10px 0;}
	</style>

  </head>
  
<body>

	<div class="tm_main">
    	
		<div class="tm_container">
			<ul class="tm_breadcrumb">
				<li><a href="common/welcome.thtml"><tomtag:Message key="txt.other.navhome" /></a> <span class="divider">&gt;</span></li>
				<li class="active"><tomtag:Message key="txt.sys.course.add" /></li>
			</ul>
		</div>
        
        <div class="tm_container">
        	<div class="tm_navtitle">
				<h1><tomtag:Message key="txt.sys.course.add" /></h1>
                <span><tomtag:Message key="txt.sys.course.addtip" /></span>
            </div>
			<div class="tm_navbuttons">
				<a href="system/course/add.thtml" class="on"><tomtag:Message key="txt.sys.course.add" /></a>
				<a href="system/course/list.thtml"><tomtag:Message key="txt.sys.course.list" /></a>
			</div>
        </div>
        
        <br/>
        <div class="tm_container">
			<form action="system/course/save.do" method="post" id="form_course_add">
        	<table width="100%" cellpadding="5" border="0" class="tm_table_form">
				<caption><tomtag:Message key="txt.sys.course.fields.basic" /></caption>
            	<tbody>
					<colgroup>
						<col width="15%"></col>
						<col width="35%"></col>
						<col width="15%"></col>
						<col width="35%"></col>
					</colgroup>
                    <tr>
                        <th><tomtag:Message key="txt.sys.course.fields.name" /> : </th>
                        <td colspan="3"><input type="text" name="c_name" class="validate[required] tm_txt" size="50" maxlength="50" style="width:500px" /></td>
                    </tr>
                    <tr>
                        <th><tomtag:Message key="txt.sys.course.fields.logo" /> : </th>
                        <td colspan="3">
							<div class="tm_img_preview" style="display:none"><img src="" style="cursor:pointer" onclick="tm_showPic(this.src)" /><a href="javascript:;" onclick="tm_removePhoto('c_logo')"></a></div>
							<input type="button" id="btn_photo" />
							<input type="hidden" name="c_logo" id="c_logo" />
						</td>
                    </tr>
                    <tr>
                        <th><tomtag:Message key="txt.sys.course.fields.category" /> : </th>
                        <td>
							<select class="validate[required] tm_select" name="c_caid" style="min-width:200px">
								<option value=""><tomtag:Message key="txt.other.operations.choose" /></option>
								<c:forEach var="category" items="${categories}">
								<option value="${category.ca_id}">${category.ca_name}</option>
								</c:forEach>
							</select>
						</td>
						<th><tomtag:Message key="txt.sys.course.fields.teacher" /> : </th>
                        <td>
							<select class="validate[required] tm_select" name="c_tid" style="min-width:200px">
								<option value=""><tomtag:Message key="txt.other.operations.choose" /></option>
								<c:forEach var="teacher" items="${teachers}">
								<option value="${teacher.t_id}">${teacher.t_name}</option>
								</c:forEach>
                            </select>
						</td>
                    </tr>
					<tr>
                        <th><tomtag:Message key="txt.sys.course.fields.score" /> : </th>
                        <td><input type="text" name="c_score" class="validate[required,custom[integer],min[1]] tm_txt tm_width200" size="50" /></td>
						<th><tomtag:Message key="txt.sys.course.fields.stars" /> : </th>
                        <td>
							<select class="validate[required] tm_select" name="c_stars" style="min-width:200px">
								<option value="1">★</option>
								<option value="2">★★</option>
								<option value="3">★★★</option>
								<option value="4">★★★★</option>
								<option value="5" selected>★★★★★</option>
                            </select>
						</td>
                    </tr>
					<tr>
                        <th><tomtag:Message key="txt.sys.course.fields.type" /> : </th>
                        <td>
							<select class="validate[required] tm_select" name="c_type" style="min-width:200px">
								<option value="1"><tomtag:Message key="txt.sys.course.fields.type.must" /></option>
								<option value="0"><tomtag:Message key="txt.sys.course.fields.type.elective" /></option>
                            </select>
						</td>
						<th><tomtag:Message key="txt.sys.course.fields.status" /> : </th>
                        <td>
							<select class="tm_select" name="c_status" style="min-width:200px">
                                <option value="1"><tomtag:Message key="txt.other.status.open" /></option>
                                <option value="0"><tomtag:Message key="txt.other.status.close" /></option>
                            </select>
						</td>
                    </tr>
					<tr>
                        <th><tomtag:Message key="txt.sys.course.fields.introduce" /> : </th>
                        <td colspan="3">
							<textarea name="c_introduce" rows="5" cols="80" style="width:500px" class="tm_txtx"></textarea>
						</td>
                    </tr>
                </tbody>
            </table>

			<p>&nbsp;</p>

			<table width="100%" cellpadding="5" border="0" class="tm_table_form">
				<caption>
					<tomtag:Message key="txt.sys.course.lesson" />
				</caption>
            	<tbody>
                    <tr>
                        <td>
							<div id="tm_lessons"></div>

							<div style="text-align:center; margin:20px 0; width:800px; clear:both">
								<button class="tm_btn tm_btn_primary" type="button" onclick="javascript:tm_addLesson();"><tomtag:Message key="txt.sys.course.lesson.add" /></button>
							</div>

						</td>
                    </tr>
				</tbody>
				<input type="hidden" name="c_chapter_ids" value="1" />
				<input type="hidden" name="c_chapter_names" value="ChapterName1" />
				<input type="hidden" name="c_chapter_remarks" value="ChapterRemark1" />
				
			</table>

			<table width="100%" cellpadding="5" border="0" class="tm_table_form">
                <tfoot>
                	<tr>
                    	<th width="15%"></th>
                        <td>
                        	<button class="tm_btn tm_btn_primary" type="submit"><tomtag:Message key="txt.other.operations.submit" /></button>
							<button class="tm_btn" type="button" onclick="javascript:history.go(-1);"><tomtag:Message key="txt.other.operations.cancel" /></button>
                        </td>
                    </tr>
                </tfoot>
			</table>

			<input type="hidden" name="c_poster" value="${sessionScope.SEN_USERNAME}" />
			<input type="hidden" name="c_modifier" value="${sessionScope.SEN_USERNAME}" />

			</form>
        </div>
        
        
    </div>

	<div style="display:none" id="tm_lesson_template">
		<table width="900" cellpadding="0" border="0" class="tm_table_lesson">
			<tr>
				<th><tomtag:Message key="txt.sys.course.lesson.fields.name" /> : </th>
				<td><input type="text" name="c_lesson_name" class="validate[required] tm_txt" size="50" maxlength="50" style="width:255px" /></td>
				<th><tomtag:Message key="txt.sys.course.lesson.fields.remark" /> : </th>
				<td><input type="text" name="c_lesson_remark" class="validate[required] tm_txt" size="50" maxlength="50" style="width:255px" /></td>
				<td rowspan="3" width="50" align="center"><a href="javascript:void(0);" onclick="javascript:tm_removeLesson(this)"><img src="skins/images/icos/delete.png" align="absmiddle" /></a></td>
			</tr>
			<tr>
				<th><tomtag:Message key="txt.sys.course.lesson.fields.filetype" /> : </th>
				<td>
					<select class="tm_select" style="width:270px" name="c_lesson_filetype">
						<option value="av"><tomtag:Message key="txt.sys.course.lesson.fields.filetype.av" />（MP3/MP4/FLV/WMV）</option>
						<option value="swf">SWF</option>
						<option value="pdf">PDF</option>
					</select>
				</td>
				<th><tomtag:Message key="txt.sys.course.lesson.fields.length" /> : </th>
				<td><input type="text" name="c_lesson_minutes" class="validate[required,custom[integer],min[1]] tm_txt" size="4" maxlength="4" style="width:100px" /> <tomtag:Message key="txt.other.units.minute" /></td>
			</tr>
			<tr>
				<th><tomtag:Message key="txt.sys.course.lesson.fields.filepath" /> : </th>
				<td colspan="3">
					<input type="text" name="c_lesson_filepath" id="c_lesson_filepath_1" class="validate[required] tm_txt" size="50" maxlength="100" style="width:680px" />
					<input type="hidden" name="c_lesson_id" />
					<input type="button" name="btn_courseware" id="btn_courseware_1" />
				</td>
			</tr>
		</table>
	</div>

</body>
</html>
