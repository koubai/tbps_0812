<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<script type="text/javascript">
	function turningPage(p) {
		var turnPage = parseInt(p);
		changePage(turnPage - 1);
	}
</script>
<ul class="pagination" style="margin-top: 0px;">
	<li><a href="javascript:void(0);" onclick="changePage(0);">&laquo;</a></li>
	<s:iterator id="skipList" value="page.skipList" status="st5">
		<s:if test="%{page.startIndex == page.skipList[#st5.index] - 1}">
			<li class="active"><a href="javascript:void(0);"><s:property/></a></li>
		</s:if>
		<s:else>
			<li><a href="javascript:void(0);" onclick="turningPage('<s:property/>');"><s:property/></a></li>
		</s:else>
	</s:iterator>
	<li>
		<a href="javascript:void(0);" onclick="changePage('${page.totalPage - 1}');">&raquo;</a>
	</li>
</ul>
<div class="gotoPage">
	<label class="info" for="">第${page.startIndex + 1}页/共${page.totalPage==0?1:page.totalPage}页&nbsp;&nbsp;&nbsp;&nbsp;共${page.totalCount}条记录</label>
	<label for="">跳转到</label>
	<input class="num" id="pagenum" maxlength="6" type="text">
	<label for="">页</label>
	<button type="button" class="btn btn-success" onclick="javascript:turnPage();">GO</button>
</div>