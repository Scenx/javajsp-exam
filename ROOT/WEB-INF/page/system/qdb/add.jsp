<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.tomexam.com/taglib/tomtag" prefix="tomtag"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="${tm_base}" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title><tomtag:Message key="txt.sys.qdb.add" /></title>
	<link rel="shortcut icon" href="favicon.ico" />
	<link rel="stylesheet" type="text/css" href="skins/default/style.css" />
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
	
	<script type="text/javascript">
		$(document).ready(function() {
			
			jQuery('#form_qdb_add').validationEngine();

			tm_uploadify('btn_photo','<tomtag:Message key="txt.other.operations.browse" />', '${tm_base}', function(data){
				if(data.code == "y"){
					$(".tm_img_preview").show();
					$("#d_logo").val(data.name);
					$(".tm_img_preview img").attr("src", '${tm_base}' + data.name);
				}
			});
			
		});
	</script>

  </head>
  
<body>

	<div class="tm_main">
    	
		<div class="tm_container">
			<ul class="tm_breadcrumb">
				<li><a href="common/welcome.thtml"><tomtag:Message key="txt.other.navhome" /></a> <span class="divider">&gt;</span></li>
				<li class="active"><tomtag:Message key="txt.sys.qdb.add" /></li>
			</ul>
		</div>
        
        <div class="tm_container">
        	<div class="tm_navtitle">
				<h1><tomtag:Message key="txt.sys.qdb.add" /></h1>
                <span><tomtag:Message key="txt.sys.qdb.addtip" /></span>
            </div>
			<div class="tm_navbuttons">
				<a href="system/qdb/add.thtml" class="on"><tomtag:Message key="txt.sys.qdb.add" /></a>
				<a href="system/qdb/list.thtml"><tomtag:Message key="txt.sys.qdb.list" /></a>
			</div>
        </div>
        
        <br/>
        <div class="tm_container">
			<form action="system/qdb/save.do" method="post" id="form_qdb_add">
        	<table width="100%" cellpadding="5" border="0" class="tm_table_form">
            	<tbody>
                    <tr>
                        <th width="120"><tomtag:Message key="txt.sys.qdb.fields.name" /> : </th>
                        <td>
							<input type="text" name="d_name" class="validate[required] tm_txt" size="50" maxlength="30" /> 
							<span class="tm_required">*</span> 
							<span class="tm_tip"><tomtag:Message key="txt.sys.qdb.fields.name.tip" /></span> 
						</td>
                    </tr>
					<tr>
                        <th><tomtag:Message key="txt.sys.qdb.fields.logo" /> : </th>
                        <td>
							<div class="tm_img_preview" style="display:none"><img src="" style="cursor:pointer" onclick="tm_showPic(this.src)" /><a href="javascript:;" onclick="tm_removePhoto('d_logo')"></a></div>
							<input type="button" id="btn_photo" />
							<input type="hidden" name="d_logo" id="d_logo" />
						</td>
                    </tr>
					<tr>
                        <th><tomtag:Message key="txt.sys.qdb.fields.status" /> : </th>
                        <td>
							<select class="tm_select" name="d_status" style="width:150px">
                                <option value="1"><tomtag:Message key="txt.other.status.open" /></option>
                                <option value="0"><tomtag:Message key="txt.other.status.close" /></option>
                            </select>
							<span class="tm_tip"><tomtag:Message key="txt.sys.qdb.fields.status.tip" /></span> 
						</td>
                    </tr>
					<tr>
                        <th><tomtag:Message key="txt.sys.qdb.fields.remark" /> : </th>
                        <td><input type="text" name="d_remark" class="tm_txt" size="50" maxlength="50" /></td>
                    </tr>
                </tbody>
                
                <tfoot>
                	<tr>
                    	<th></th>
                        <td>
                        	<button class="tm_btn tm_btn_primary" type="submit"><tomtag:Message key="txt.other.operations.submit" /></button>
							<button class="tm_btn" type="button" onclick="javascript:history.go(-1);"><tomtag:Message key="txt.other.operations.cancel" /></button>
                        </td>
                    </tr>
                </tfoot>
            </table>

			<input type="hidden" name="d_poster" value="${sessionScope.SEN_USERNAME}" />
			<input type="hidden" name="d_modifyor" value="${sessionScope.SEN_USERNAME}" />
			</form>
        </div>
        
        
    </div>

</body>
</html>
