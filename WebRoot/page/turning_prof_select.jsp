<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<script type="text/javascript">
	function turningAjaxPageProf(p) {
		var turnPage = parseInt(p);
		querySelectProfPageAjax(turnPage - 1);
	}
	
	function goAjaxPageProf() {
		var ajaxpagenum = $("#ajaxpagenumProf").val();
		var ajaxTotalPage = $("#ajaxTotalPageProf").val();
		//判断是否输入页码
		if ('' != ajaxpagenum) {
			//判断页码是否是大于0的数字
			if(!iscInteger(ajaxpagenum)){
				alert("页码必须是大于0的整数！");
				return;
			}
			ajaxpagenum = parseInt(ajaxpagenum);
			if(ajaxpagenum < 1){
				alert("页码必须是大于0的整数！");
				return;
			}
			//判断页码大小是否正确
			if(ajaxpagenum > parseInt(ajaxTotalPage)){
				alert("页码不能超过最大页数！");
				return;
			}
			//换页
			turningAjaxPageProf(ajaxpagenum);
		} else {
			alert("页码不能为空！");
			return;
		}
	}
	
	//最后一页
	function turningLastPageProf() {
		var ajaxTotalPage = $("#ajaxTotalPageProf").val();
		turningAjaxPageProf(ajaxTotalPage);
	}
</script>
<ul class="pagination" id="ajaxskiplistProf" style="margin-top: 0px;">
	<li>
		<a href="javascript:void(0);" onclick="turningAjaxPageProf(1);">&laquo;</a>
	</li>
	<li>
		<a href="javascript:void(0);" onclick="turningLastPageProf();">&raquo;</a>
	</li>
</ul>
<div class="gotoPage">
	<input id="ajaxTotalCountProf" type="hidden">
	<input id="ajaxTotalPageProf" type="hidden">
	<label class="info" id="ajaxPageInfoProf">第${page_select.startIndex + 1}页/共${page_select.totalPage==0?1:page_select.totalPage}页&nbsp;&nbsp;&nbsp;&nbsp;共${page_select.totalCount}条记录</label>
	<label for="">跳转到</label>
	<input class="num" id="ajaxpagenumProf" maxlength="6" type="text">
	<label for="">页</label>
	<button type="button" class="btn btn-success" onclick="goAjaxPageProf();">GO</button>
</div>