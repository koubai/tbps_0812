<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/Calendar3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.5.1.js"></script>
<title>招标履历明细</title>
<script type="text/javascript">
</script>
</head>
<body style="background: url(''); overflow-x:hidden;overflow-y:auto;">
	<s:form id="mainform" name="mainform" method="POST">
		<div class="content" style="margin-top: 0px;">
			<div class="tittle">
				<div class="icons"></div>
				<div class="tittle_left">
				</div>
				<div class="tittle_center" style="width:150px;">
					招标履历明细
				</div>
				<div class="tittle_right">
				</div>
			</div>
		</div>
		<div class="searchbox update" style="height:0px;">
			<table id="expertTable" style="display: none;">
			</table>
			<table id="compTable" style="display: none;">
			</table>
			<table width="100%" border="0" cellpadding="5" cellspacing="0">
				<tr>
					<td class="red" align="center" colspan="8"><s:actionmessage /></td>
				</tr>
				<tr>
					<td align="right">
						<label class="pdf10">招标编号</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="detailBidHisDto.BID_NO" id="BID_NO" disabled="true" cssStyle="width:135px;" maxlength="13" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td align="right">
						<label class="pdf10">分类</label>
					</td>
					<td>
						<s:if test='detailBidHisDto.PROJECT_TYPE == "1"'>
							<input id="radioProjectType" disabled="disabled" name="projectType" checked="checked" type="radio" value="1"/><label>招标</label>
							<input name="projectType" disabled="disabled" type="radio" value="2"/><label>比选</label>
							<input name="projectType" disabled="disabled" type="radio" value="3"/><label>招标办</label>
						</s:if>
						<s:elseif test='detailBidHisDto.PROJECT_TYPE == "2"'>
							<input id="radioProjectType" disabled="disabled" name="projectType" type="radio" value="1"/><label>招标</label>
							<input name="projectType" disabled="disabled" type="radio" checked="checked" value="2"/><label>比选</label>
							<input name="projectType" disabled="disabled" type="radio" value="3"/><label>招标办</label>
						</s:elseif>
						<s:elseif test='detailBidHisDto.PROJECT_TYPE == "3"'>
							<input id="radioProjectType" disabled="disabled" name="projectType" type="radio" value="1"/><label>招标</label>
							<input name="projectType" disabled="disabled" type="radio" value="2"/><label>比选</label>
							<input name="projectType" disabled="disabled" type="radio" checked="checked" value="3"/><label>招标办</label>
						</s:elseif>
						<s:else>
							<input id="radioProjectType" disabled="disabled" name="projectType" type="radio" value="1"/><label>招标</label>
							<input name="projectType" disabled="disabled" type="radio" value="2"/><label>比选</label>
							<input name="projectType" disabled="disabled" type="radio" value="3"/><label>招标办</label>
						</s:else>
					</td>
					<td align="right">
						<label class="pdf10">担当者</label>
					</td>
					<td colspan="3">
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="detailBidHisDto.PROJECT_MANAGER" id="PROJECT_MANAGER" disabled="true" cssStyle="width:135px;" maxlength="24" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="pdf10"><font color="red">*</font>项目名称</label>
					</td>
					<td colspan="7">
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="detailBidHisDto.PROJECT_NAME" id="PROJECT_NAME" disabled="true" cssStyle="width:880px;" maxlength="80" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="pdf10">上网公告日</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" disabled="disabled" id="onlineDate" value="<s:date format="yyyy-MM-dd" name="detailBidHisDto.ONLINE_DATE"/>" maxlength="10" />
							<a id="onlineDateBtn" class="date" href="javascript:;"></a>
						</div>
						<div class="box1_right"></div>
					</td>
					<td align="right">
						<label class="pdf10">发标日期</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" disabled="disabled" id="tenderStartDate" value="<s:date format="yyyy-MM-dd" name="detailBidHisDto.TENDER_START_DATE"/>" maxlength="10" />
							<a id="tenderStartDateBtn" class="date" href="javascript:;"></a>
						</div>
						<div class="box1_right"></div>
					</td>
					<td align="right">
						<label class="pdf10">报名截止日</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" disabled="disabled" id="submitDate" value="<s:date format="yyyy-MM-dd" name="detailBidHisDto.SUBMIT_DATE"/>" maxlength="10" />
							<a id="submitDateBtn" class="date" href="javascript:;"></a>
						</div>
						<div class="box1_right"></div>
					</td>
					<td align="right">
						<label class="pdf10">开标日期</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" disabled="disabled" id="tenderOpenDate" value="<s:date format="yyyy-MM-dd" name="detailBidHisDto.TENDER_OPEN_DATE"/>" maxlength="10" />
							<a id="tenderOpenDateBtn" class="date" href="javascript:;"></a>
						</div>
						<div class="box1_right"></div>
					</td>
				</tr>
			</table>
		</div>
		<div class="companys">
			<table width="100%" border="0">
				<tr>
					<td width="33%">
						<table class="company_tab" width="100%" border="0">
							<tr>
								<td colspan="4" align="center" class="tittle"><strong>委托公司信息</strong></td>
							</tr>
							<tr>
								<td align="right">代码</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<input type="text" id="agentNo" disabled="disabled" maxlength="4" style="width:75px;" value="<s:property value="detailBidHisDto.AGENT_NO" />" />
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">名称</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<input type="text" id="agentCoName" disabled="disabled" maxlength="40" style="width:250px;" value="<s:property value="detailBidHisDto.AGENT_CO_NAME" />" />
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">联系人</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="detailBidHisDto.AGENT_CO_MANAGER" disabled="true" id="AGENT_CO_MANAGER" cssStyle="width:250px;" maxlength="24" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">电话</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="detailBidHisDto.AGENT_CO_MANAGER_TEL" disabled="true" id="AGENT_CO_MANAGER_TEL" cssStyle="width:250px;" maxlength="20" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">地址</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="detailBidHisDto.AGENT_CO_POST_ADDRESS" disabled="true" id="AGENT_CO_POST_ADDRESS" cssStyle="width:250px;" maxlength="40" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">邮箱</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="detailBidHisDto.AGENT_CO_MAIL" id="AGENT_CO_MAIL" disabled="true" cssStyle="width:250px;" maxlength="30" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
						</table>
					</td>
					<td width="33%">
						<table class="company_tab" width="100%" border="0">
							<tr>
								<td colspan="4" align="center" class="tittle"><strong>专业公司信息</strong></td>
							</tr>
							<tr>
								<td align="right">代码</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<input type="text" id="profNo" disabled="disabled" maxlength="4" style="width:75px;" value="<s:property value="detailBidHisDto.PROF_NO" />" />
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">名称</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<input type="text" id="profCoName" disabled="disabled" style="width:250px;" maxlength="40" value="<s:property value="detailBidHisDto.PROF_CO_NAME" />" />
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">授权人</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="detailBidHisDto.PROF_CO_MANAGER" id="PROF_CO_MANAGER" disabled="true" cssStyle="width:250px;" maxlength="24" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">电话</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="detailBidHisDto.PROF_CO_MANAGER_TEL" id="PROF_CO_MANAGER_TEL" disabled="true" cssStyle="width:250px;" maxlength="30" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">地址</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="detailBidHisDto.PROF_CO_POST_ADDRESS" id="PROF_CO_POST_ADDRESS" disabled="true" cssStyle="width:250px;" maxlength="40" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">邮箱</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="detailBidHisDto.PROF_CO_MAIL" id="PROF_CO_MAIL" disabled="true" cssStyle="width:250px;" maxlength="30" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
						</table>
					</td>
					<td width="33%">
						<table class="company_tab" width="100%" border="0">
							<tr>
								<td colspan="4" align="center" class="tittle"><strong>工程概况</strong></td>
							</tr>
							<tr>
								<td align="right">批文</td>
								<td>
									<textarea id="tmpPROJ_APPROVAL" disabled="disabled" rows="3" cols="" style="width:255px;"><s:property value="detailBidHisDto.PROJ_APPROVAL" /></textarea>
								</td>
							</tr>
							<tr>
								<td align="right">计划价格</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="detailBidHisDto.PROJ_PLAN_PRICE" disabled="true" id="PROJ_PLAN_PRICE" cssStyle="width:250px;" maxlength="8" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">限价</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="detailBidHisDto.PROJ_ASTRICT_PRICE" disabled="true" id="PROJ_ASTRICT_PRICE" cssStyle="width:250px;" maxlength="8" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr style="height: 83px;">
								<td align="right">　</td>
								<td>　</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		<div class="ok">
			<h3>项目过程确认信息</h3>
			<table class="ok_tab" width="100%" border="0">
				<tr>
					<td align="right" width="90">公告</td>
					<td>
						<ul>
							<s:if test='detailBidHisDto.TENDER_ONLINE != null && detailBidHisDto.TENDER_ONLINE != ""'>
								<li><a href="javascript:;" id="ad_TENDER_ONLINE" class="select" title="<s:property value="detailBidHisDto.TENDER_ONLINE"/>">上网公告</a></li>
							</s:if>
							<s:else>
								<li><a href="javascript:;" id="ad_TENDER_ONLINE" title="">上网公告</a></li>
							</s:else>
							<s:if test='detailBidHisDto.TENDER_DOWNLOAD != null && detailBidHisDto.TENDER_DOWNLOAD != ""'>
								<li><a href="javascript:;" id="ad_TENDER_DOWNLOAD" class="select" title="<s:property value="detailBidHisDto.TENDER_DOWNLOAD"/>">网页下载</a></li>
							</s:if>
							<s:else>
								<li><a href="javascript:;" id="ad_TENDER_DOWNLOAD" title="">网页下载</a></li>
							</s:else>
							<s:if test='detailBidHisDto.APPLY_FORM_EDIT != null && detailBidHisDto.APPLY_FORM_EDIT != ""'>
								<li><a href="javascript:;" id="ad_APPLY_FORM_EDIT" class="select" title="<s:property value="detailBidHisDto.APPLY_FORM_EDIT"/>">报名表式（编制）</a></li>
							</s:if>
							<s:else>
								<li><a href="javascript:;" id="ad_APPLY_FORM_EDIT" title="">报名表式（编制）</a></li>
							</s:else>
							<s:if test='detailBidHisDto.APPLY_FORM_VERIFY != null && detailBidHisDto.APPLY_FORM_VERIFY != ""'>
								<li><a href="javascript:;" id="ad_APPLY_FORM_VERIFY" class="select" title="<s:property value="detailBidHisDto.APPLY_FORM_VERIFY"/>">报名表式（审核）</a></li>
							</s:if>
							<s:else>
								<li><a href="javascript:;" id="ad_APPLY_FORM_VERIFY" title="">报名表式（审核）</a></li>
							</s:else>
							<s:if test='detailBidHisDto.APPLY_FORM_MERGE != null && detailBidHisDto.APPLY_FORM_MERGE != ""'>
								<li><a href="javascript:;" id="ad_APPLY_FORM_MERGE" class="select" title="<s:property value="detailBidHisDto.APPLY_FORM_MERGE"/>">报名表式（汇总）</a></li>
							</s:if>
							<s:else>
								<li><a href="javascript:;" id="ad_APPLY_FORM_MERGE" title="">报名表式（汇总）</a></li>
							</s:else>
						</ul>
					</td>
				</tr>
				<tr>
					<td align="right" valign="top" style="padding-top:10px;">专家</td>
					<td>
						<ul>
							<s:if test='detailBidHisDto.EXPERT_NAME_OFFERED != null && detailBidHisDto.EXPERT_NAME_OFFERED != ""'>
								<li><a href="javascript:;" id="ad_EXPERT_NAME_OFFERED" class="select" title="<s:property value="detailBidHisDto.EXPERT_NAME_OFFERED"/>">名单提供</a></li>
							</s:if>
							<s:else>
								<li><a href="javascript:;" id="ad_EXPERT_NAME_OFFERED" title="">名单提供</a></li>
							</s:else>
							<s:if test='detailBidHisDto.EXPERT_INFORMED != null && detailBidHisDto.EXPERT_INFORMED != ""'>
								<li><a href="javascript:;" id="ad_EXPERT_INFORMED" class="select" title="<s:property value="detailBidHisDto.EXPERT_INFORMED"/>">通知与否</a></li>
							</s:if>
							<s:else>
								<li><a href="javascript:;" id="ad_EXPERT_INFORMED" title="">通知与否</a></li>
							</s:else>
							<s:if test='detailBidHisDto.EXPERT_NAME_CONFIRMED != null && detailBidHisDto.EXPERT_NAME_CONFIRMED != ""'>
								<li><a href="javascript:;" id="ad_EXPERT_NAME_CONFIRMED" class="select" title="<s:property value="detailBidHisDto.EXPERT_NAME_CONFIRMED"/>">通知确认</a></li>
							</s:if>
							<s:else>
								<li><a href="javascript:;" id="ad_EXPERT_NAME_CONFIRMED" title="">通知确认</a></li>
							</s:else>
							<li><a href="javascript:;" class="select"></a></li>
							<li><a href="javascript:;" class="select"></a></li>
						</ul>
						<ul>
							<s:if test='detailBidHisDto.CLARIFY_DOC != null && detailBidHisDto.CLARIFY_DOC != ""'>
								<li><a href="javascript:;" id="ad_CLARIFY_DOC" class="select" title="<s:property value="detailBidHisDto.CLARIFY_DOC"/>">澄清文件</a></li>
							</s:if>
							<s:else>
								<li><a href="javascript:;" id="ad_CLARIFY_DOC" title="">澄清文件</a></li>
							</s:else>
							<s:if test='detailBidHisDto.SUPPORT_DOC != null && detailBidHisDto.SUPPORT_DOC != ""'>
								<li><a href="javascript:;" id="ad_SUPPORT_DOC" class="select" title="<s:property value="detailBidHisDto.SUPPORT_DOC"/>">补遗文件</a></li>
							</s:if>
							<s:else>
								<li><a href="javascript:;" id="ad_SUPPORT_DOC" title="">补遗文件</a></li>
							</s:else>
							<s:if test='detailBidHisDto.SUPPORT_DOC_SENT != null && detailBidHisDto.SUPPORT_DOC_SENT != ""'>
								<li><a href="javascript:;" id="ad_SUPPORT_DOC_SENT" class="select" title="<s:property value="detailBidHisDto.SUPPORT_DOC_SENT"/>">补遗文件确认</a></li>
							</s:if>
							<s:else>
								<li><a href="javascript:;" id="ad_SUPPORT_DOC_SENT" title="">补遗文件确认</a></li>
							</s:else>
							<s:if test='detailBidHisDto.BIDDER_REPLY != null && detailBidHisDto.BIDDER_REPLY != ""'>
								<li><a href="javascript:;" id="ad_BIDDER_REPLY" class="select" title="<s:property value="detailBidHisDto.BIDDER_REPLY"/>">投标人回复</a></li>
							</s:if>
							<s:else>
								<li><a href="javascript:;" id="ad_BIDDER_REPLY" title="">投标人回复</a></li>
							</s:else>
							<li><a href="javascript:;" class="select"></a></li>
						</ul>
					</td>
				</tr>
				<tr>
					<td align="right">中标</td>
					<td>
						<ul>
							<s:if test='detailBidHisDto.OPEN_RESULT != null && detailBidHisDto.OPEN_RESULT != ""'>
								<li><a href="javascript:;" id="ad_OPEN_RESULT" class="select" title="<s:property value="detailBidHisDto.OPEN_RESULT"/>">公示</a></li>
							</s:if>
							<s:else>
								<li><a href="javascript:;" id="ad_OPEN_RESULT" title="">公示</a></li>
							</s:else>
							<s:if test='detailBidHisDto.OPEN_VERIFY != null && detailBidHisDto.OPEN_VERIFY != ""'>
								<li><a href="javascript:;" id="ad_OPEN_VERIFY" class="select" title="<s:property value="detailBidHisDto.OPEN_VERIFY"/>">公示审核</a></li>
							</s:if>
							<s:else>
								<li><a href="javascript:;" id="ad_OPEN_VERIFY" title="">公示审核</a></li>
							</s:else>
							<s:if test='detailBidHisDto.INFORM_SENT != null && detailBidHisDto.INFORM_SENT != ""'>
								<li><a href="javascript:;" id="ad_INFORM_SENT" class="select" title="<s:property value="detailBidHisDto.INFORM_SENT"/>">通知书发出</a></li>
							</s:if>
							<s:else>
								<li><a href="javascript:;" id="ad_INFORM_SENT" title="">通知书发出</a></li>
							</s:else>
							<s:if test='detailBidHisDto.INFORM_CONTRACT != null && detailBidHisDto.INFORM_CONTRACT != ""'>
								<li><a href="javascript:;" id="ad_INFORM_CONTRACT" class="select" title="<s:property value="detailBidHisDto.INFORM_CONTRACT"/>">合同告知书</a></li>
							</s:if>
							<s:else>
								<li><a href="javascript:;" id="ad_INFORM_CONTRACT" title="">合同告知书</a></li>
							</s:else>
							<li><a href="javascript:;" class="select"></a></li>
						</ul>
					</td>
				</tr>
				<tr>
					<td align="right">合同</td>
					<td>
						<ul>
							<s:if test='detailBidHisDto.ATTACH_POST_A != null && detailBidHisDto.ATTACH_POST_A != ""'>
								<li><a href="javascript:;" id="ad_ATTACH_POST_A" class="select" title="<s:property value="detailBidHisDto.ATTACH_POST_A"/>">附件邮甲方</a></li>
							</s:if>
							<s:else>
								<li><a href="javascript:;" id="ad_ATTACH_POST_A" title="">附件邮甲方</a></li>
							</s:else>
							<s:if test='detailBidHisDto.CONTRACT_VERIFY != null && detailBidHisDto.CONTRACT_VERIFY != ""'>
								<li><a href="javascript:;" id="ad_CONTRACT_VERIFY" class="select" title="<s:property value="detailBidHisDto.CONTRACT_VERIFY"/>">合同审核</a></li>
							</s:if>
							<s:else>
								<li><a href="javascript:;" id="ad_CONTRACT_VERIFY" title="">合同审核</a></li>
							</s:else>
							<s:if test='detailBidHisDto.COMMENT_POST != null && detailBidHisDto.COMMENT_POST != ""'>
								<li><a href="javascript:;" id="ad_COMMENT_POST" class="select" title="<s:property value="detailBidHisDto.COMMENT_POST"/>">意见稿发出</a></li>
							</s:if>
							<s:else>
								<li><a href="javascript:;" id="ad_COMMENT_POST" title="">意见稿发出</a></li>
							</s:else>
							<li><a href="javascript:;" class="select"></a></li>
							<li><a href="javascript:;" class="select"></a></li>
						</ul>
					</td>
				</tr>
				<tr>
					<td align="right">评标报告</td>
					<td>
						<ul>
							<s:if test='detailBidHisDto.BID_REOPRT_EDIT != null && detailBidHisDto.BID_REOPRT_EDIT != ""'>
								<li><a href="javascript:;" id="ad_BID_REOPRT_EDIT" class="select" title="<s:property value="detailBidHisDto.BID_REOPRT_EDIT"/>">报告编制</a></li>
							</s:if>
							<s:else>
								<li><a href="javascript:;" id="ad_BID_REOPRT_EDIT" title="">报告编制</a></li>
							</s:else>
							<s:if test='detailBidHisDto.BID_REPORT_VERIFY != null && detailBidHisDto.BID_REPORT_VERIFY != ""'>
								<li><a href="javascript:;" id="ad_BID_REPORT_VERIFY" class="select" title="<s:property value="detailBidHisDto.BID_REPORT_VERIFY"/>">报告审核</a></li>
							</s:if>
							<s:else>
								<li><a href="javascript:;" id="ad_BID_REPORT_VERIFY" title="">报告审核</a></li>
							</s:else>
							<s:if test='detailBidHisDto.BID_REPORT_SENT != null && detailBidHisDto.BID_REPORT_SENT != ""'>
								<li><a href="javascript:;" id="ad_BID_REPORT_SENT" class="select" title="<s:property value="detailBidHisDto.BID_REPORT_SENT"/>">报告发出</a></li>
							</s:if>
							<s:else>
								<li><a href="javascript:;" id="ad_BID_REPORT_SENT" title="">报告发出</a></li>
							</s:else>
							<li><a href="javascript:;" class="select"></a></li>
							<li><a href="javascript:;" class="select"></a></li>
						</ul>
					</td>
				</tr>
				<tr>
					<td align="right">备注</td>
					<td>
						<textarea id="tMemo1" rows="3" cols="" disabled="disabled" style="width:825px;"><s:property value="detailBidHisDto.MEMO1" /></textarea>
					</td>
				</tr>
			</table>
		</div>
		<div class="info">
			<table width="100%" border="0">
				<tr>
					<td>
						<div class="tab_content" style="height: 44px;">
							<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
								<tr>
									<td colspan="11" align="center" class="tittle"><strong>投标公司信息</strong></td>
								</tr>
							</table>
						</div>
						<div class="tab_content" style="height: 175px;">
							<table id="bidCompTable" class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
								<tr style="background:#eee; border-top:black solid 1px;">
									<td style="width: 0px; display: none"></td>
									<td width="40"></td>
									<td>招标编号</td>
									<td>序号</td>
									<td>公司名称</td>
									<td>联系电话</td>
									<td>保证金</td>
									<td>支付形式</td>
									<td>投标价</td>
									<td>评审价</td>
									<td>中标与否</td>
									<td>中标价</td>
									<td>标书费</td>
									<td>到账日期</td>
									<td>发票号码</td>
									<td>备注</td>
								</tr>
								<tbody id="bidCompData">
									<s:iterator id="listBidComp" value="listBidComp" status="st1">
										<s:if test="#st1.odd==true">
											<tr class="tr_bg">
										</s:if>
										<s:else>
											<tr>
										</s:else>
											<td style="width: 0px; display: none;">
												<input type="hidden" value="<s:property value="BID_NO"/>" />
												<input type="hidden" value="<s:property value="#st1.index + 1"/>" />
												<input type="hidden" value="<s:property value="BID_CO_NAME"/>" />
												<input type="hidden" value="<s:property value="BID_CO_TEL"/>" />
												<input type="hidden" value="<s:property value="BID_BOND"/>" />
												<input type="hidden" value="<s:property value="BID_PAYMENT_TYPE"/>" />
												<input type="hidden" value="<s:property value="BID_PRICE"/>" />
												<input type="hidden" value="<s:property value="BID_CHECK_PRICE"/>" />
												<input type="hidden" value="<s:property value="BID_RESULT"/>" />
												<input type="hidden" value="<s:property value="BID_WIN_PRICE"/>" />
												<input type="hidden" value="<s:property value="BID_APPLY_PRICE"/>" />
												<input type="hidden" value="<s:date name="BID_VALUE_DATE" format="yyyy-MM-dd" />" />
												<input type="hidden" value="<s:property value="BID_RECEIPT_NO"/>" />
												<input type="hidden" value="<s:property value="MEMO1"/>" />
												<input type="hidden" value="<s:property value="BID_CO_MANAGER"/>" />
												<input type="hidden" value="<s:property value="BID_CO_ADD"/>" />
												<input type="hidden" value="<s:property value="BID_CO_PS"/>" />
												<input type="hidden" value="<s:property value="BID_CO_NO"/>" />
											</td>
											<td><input name="bidCompRadio" disabled="disabled" type="radio" value="<s:property value="BID_NO"/>_<s:property value="BID_CO_SEQ"/>"/></td>
											<td><s:property value="BID_NO"/></td>
											<td><s:property value="#st1.index + 1"/></td>
											<td><s:property value="BID_CO_NAME"/></td>
											<td><s:property value="BID_CO_TEL"/></td>
											<td><s:property value="BID_BOND"/></td>
											<td>
												<s:if test='BID_PAYMENT_TYPE == "1"'>
													现金
												</s:if>
												<s:elseif test='BID_PAYMENT_TYPE == "2"'>
													支票
												</s:elseif>
												<s:elseif test='BID_PAYMENT_TYPE == "3"'>
													转账
												</s:elseif>
												<s:elseif test='BID_PAYMENT_TYPE == "4"'>
													汇票
												</s:elseif>
												<s:elseif test='BID_PAYMENT_TYPE == "5"'>
													保函
												</s:elseif>
											</td>
											<td><s:property value="BID_PRICE"/></td>
											<td><s:property value="BID_CHECK_PRICE"/></td>
											<td>
												<s:if test='BID_RESULT == "Y"'>
													是
												</s:if>
												<s:else>
													否
												</s:else>
											</td>
											<td>
												<s:if test='BID_RESULT == "Y"'>
													<s:property value="BID_WIN_PRICE"/>
												</s:if>
												<s:else>
													-
												</s:else>
											</td>
											<td><s:property value="BID_APPLY_PRICE"/></td>
											<td><s:date name="BID_VALUE_DATE" format="yyyy/MM/dd" /></td>
											<td><s:property value="BID_RECEIPT_NO"/></td>
											<td><s:property value="MEMO1"/></td>
										</tr>
									</s:iterator>
								</tbody>
							</table>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="tab_content" style="height: 44px;">
							<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
								<tr>
									<td colspan="11" align="center" class="tittle"><strong>评审专家信息</strong></td>
								</tr>
							</table>
						</div>
						<div class="tab_content" style="height: 175px;">
							<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
								<tr style="background:#eee; border-top:black solid 1px;">
									<td style="width: 0px; display: none;">
									</td>
									<td></td>
									<td>序号</td>
									<td>姓名</td>
									<td>就职公司</td>
									<td>专业</td>
									<td>职称</td>
									<td>联系电话</td>
									<td>备注</td>
								</tr>
								<tbody id="bidExportData">
									<s:iterator id="listExpertLib" value="listExpertLib" status="st1">
										<s:if test="#st1.odd==true">
											<tr class="tr_bg">
										</s:if>
										<s:else>
											<tr>
										</s:else>
											<td style="width: 0px; display: none;">
												<input type="hidden" value="<s:property value="EXPERT_NAME"/>"/>
												<input type="hidden" value="<s:property value="EXPERT_COMP"/>"/>
												<input type="hidden" value="<s:property value="EXPERT_MAJOR_NAME"/>"/>
												<input type="hidden" value="<s:property value="EXPERT_QULI"/>"/>
												<input type="hidden" value="<s:property value="EXPERT_TEL1"/>"/>
												<input type="hidden" value="<s:property value="MEMO1"/>"/>
												<input type="hidden" value="<s:property value="EXPERT_MAJOR"/>"/>
											</td>
											<td><input name="bidExpertRadio" disabled="disabled" value="<s:property value="EXPERT_SEQ"/>" type="radio"/></td>
											<td><s:property value="#st1.index + 1" /></td>
											<td><s:property value="EXPERT_NAME"/></td>
											<td><s:property value="EXPERT_COMP"/></td>
											<td><s:property value="EXPERT_MAJOR_NAME"/></td>
											<td><s:property value="EXPERT_QULI"/></td>
											<td><s:property value="EXPERT_TEL1"/></td>
											<td><s:property value="MEMO1"/></td>
										</tr>
									</s:iterator>
								</tbody>
							</table>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="trade">
			<table class="trade_tab" width="100%" border="0">
				<tr>
					<td align="right" width="10%"><strong>发票1</strong></td>
					<td align="right" width="10%">开票日期</td>
					<td class="date_input" width="20%">
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" id="receipt1Date" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="detailBidHisDto.RECEIPT1_DATE"/>" />
							<a id="receipt1DateBtn" class="date" href="javascript:;"></a>
						</div>
						<div class="box1_right"></div>
					</td>
					<td align="right" width="10%">开票人</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="detailBidHisDto.RECEIPT1_STAFF" disabled="true" id="RECEIPT1_STAFF" maxlength="24" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td align="right" width="10%">代理费</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="detailBidHisDto.RECEIPT1_AGENT_COMMISSION" disabled="true" id="RECEIPT1_AGENT_COMMISSION" maxlength="12" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td align="right">发票号码</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="detailBidHisDto.RECEIPT1_NO" id="RECEIPT1_NO" disabled="true" maxlength="8" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td align="right">接受人</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="detailBidHisDto.RECEIPT1_RECEIVER" id="RECEIPT1_RECEIVER" disabled="true" maxlength="24" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td align="right">到账日期</td>
					<td class="date_input">
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" id="receipt1ValueDate" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="detailBidHisDto.RECEIPT1_VALUE_DATE"/>" />
							<a id="receipt1ValueDateBtn" class="date" href="javascript:;"></a>
						</div>
						<div class="box1_right"></div>
					</td>
					<td align="right">评标费</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="detailBidHisDto.BID_COMMISION" id="BID_COMMISION" disabled="true" maxlength="12" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>
			<table class="trade_tab mgt10" width="100%" border="0">
				<tr>
					<td width="10%" align="right"><strong>发票2</strong></td>
					<td width="10%" align="right">签收单编号</td>
					<td width="20%">
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="detailBidHisDto.RECEIPT2_NO" id="RECEIPT2_NO" disabled="true" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td class="date_input" width="10%" align="right">签收时间</td>
					<td width="20%">
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" id="receipt2Date" disabled="disabled" maxlength="10" value="<s:date format="yyyy-MM-dd" name="detailBidHisDto.RECEIPT2_DATE"/>" />
							<a id="receipt2DateBtn" class="date" href="javascript:;"></a>
						</div>
						<div class="box1_right"></div>
					</td>
					<td width="10%" align="right">&nbsp;</td>
					<td width="20%">&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td align="right">快递编号</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="detailBidHisDto.RECEIPT2_POST_NO" id="RECEIPT2_POST_NO" disabled="true" maxlength="12" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td align="right">快递时间</td>
					<td class="date_input">
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" id="receipt2ExpressDate" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="detailBidHisDto.RECEIPT2_EXPRESS_DATE"/>" />
							<a id="receipt2ExpressDateBtn" class="date" href="javascript:;"></a>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>
		<div style="height:225px;"></div>
	</div>
</s:form>
</body>
</html>
