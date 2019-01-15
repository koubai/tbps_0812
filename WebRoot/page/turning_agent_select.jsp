<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<script type="text/javascript">
	function turningAjaxPageAgent(p) {
		var turnPage = parseInt(p);
		querySelectAgentPageAjax(turnPage - 1);
	}
	
	function goAjaxPageAgent() {
		var ajaxpagenum = $("#ajaxpagenumAgent").val();
		var ajaxTotalPage = $("#ajaxTotalPageAgent").val();
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
			turningAjaxPageAgent(ajaxpagenum);
		} else {
			alert("页码不能为空！");
			return;
		}
	}
	
	//最后一页
	function turningLastPageAgent() {
		var ajaxTotalPage = $("#ajaxTotalPageAgent").val();
		turningAjaxPageAgent(ajaxTotalPage);
	}
</script>
<ul class="pagination" id="ajaxskiplistAgent" style="margin-top: 0px;">
	<li>
		<a href="javascript:void(0);" onclick="turningAjaxPageAgent(1);">&laquo;</a>
	</li>
	<li>
		<a href="javascript:void(0);" onclick="turningLastPageAgent();">&raquo;</a>
	</li>
</ul>
<div class="gotoPage">
	<input id="ajaxTotalCountAgent" type="hidden">
	<input id="ajaxTotalPageAgent" type="hidden">
	<label class="info" id="ajaxPageInfoAgent">第${page_select.startIndex + 1}页/共${page_select.totalPage==0?1:page_select.totalPage}页&nbsp;&nbsp;&nbsp;&nbsp;共${page_select.totalCount}条记录</label>
	<label for="">跳转到</label>
	<input class="num" id="ajaxpagenumAgent" maxlength="6" type="text">
	<label for="">页</label>
	<button type="button" class="btn btn-success" onclick="goAjaxPageAgent();">GO</button>
</div>