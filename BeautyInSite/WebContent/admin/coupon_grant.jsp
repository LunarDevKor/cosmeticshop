<%@page import="com.cosmetic.member.point.vo.PointVO"%>
<%@page import="java.util.List"%>
<%@page import="com.cosmetic.member.account.vo.AccountVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../admin/layout/header.jsp"/>

<%
   List<AccountVO> list = (List<AccountVO>)request.getAttribute("list");
	String msg = request.getSession().getAttribute("msg") == null ? "" : (String)request.getSession().getAttribute("msg");
%>
	

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="wrapper">
	
<div id="snb">
	<div class="snb_header ico_config">
		<h2><i class="ionicons ion-ios-people fs40"></i>회원관리</h2>
	</div>
		<dl>
		<dt class="m10 menu_toggle">회원관리</dt>		<dd class="m10"><a href="manageList.do">회원 정보관리</a></dd>		<dd class="m10"><a href="gradeList.do">회원 등급관리</a></dd>		<dd class="m20"><a href="pointManage.do">포인트 관리</a></dd> <dd class="m20  active"><a href="couponManage.do">쿠폰 관리</a></dd>		</dl>
	</div>
	<div id="content">
		<div class="breadcrumb">
			<span>HOME</span> <i class="ionicons ion-ios-arrow-right"></i> 회원관리 <i class="ionicons ion-ios-arrow-right"></i> 포인트 일괄지급&차감		</div>
	
<div class="s_wrap">
	<h1>쿠폰 관리</h1>
	
<form name="fpointselectform" id="fpointselectform" action="couponManage.do" method="post" autocomplete="off">

<h2>회원정보</h2>	
<div class="tbl_frm01">
	<table>
	<colgroup>
		<col class="w140">
		<col>
	</colgroup>
	<tbody>
	<tr>
		<th scope="row">회원 통계</th>
	
		<td>전체회원 :<%=list.size() %>명 
	</tr>
	<tr>
		<th scope="row">레벨</th>
		<td>
			<label for="mb_level_from" class="sound_only">최소레벨</label>
			<select id="grdNoSt" name="grdNoSt">
<option value='1' selected>[1] 들판</option>
<option value='2'>[2] 은하수</option>
<option value='3'>[3] 별빛</option>
<option value='4'>[4] 하늘</option>
<option value='5'>[5] 우주</option>
</select>
 에서
			<label for="mb_level_to" class="sound_only">최대레벨</label>
			<select id="grdNoEnd" name="grdNoEnd">
<option value='5'>[5] 우주</option>
<option value='4'>[4] 은하수</option>
<option value='3'>[3] 별빛</option>
<option value='2'>[2] 하늘</option>
<option value='1' selected>[1] 들판</option>
</select>
 까지
		</td>
	</tr>
	</tbody>
	</table>
</div>

<h2>쿠폰 지급/할인율 설정</h2>
<div class="tbl_frm01">
	<table>
	<colgroup>
		<col class="w140">
		<col>
	</colgroup>
	<tbody>
	<tr>
		<th scope="row"><label for="po_content">쿠폰 이름</label></th>
		<td>
			<input type="text" name="couponCon" id="couponCon" required class="required frm_input" size="60">
			<span class="frm_info fc_125">예) 1월 들판등급 등급쿠폰.</span>		</td>
	</tr>
	<tr>
		<th scope="row"><label for="po_point">할인율</label></th>
		<td>
			<input type="text" name="couponDis" id="couponDis" value="" class="required frm_input" size="10">
			
		</td>
		</tr>
		<tr>
		
		<th scope="row"><label for="po_point">쿠폰 유효기간</label></th>
		<td>
			<input type="text" name="couponPeriod" id="couponPeriod" value="" class="required frm_input" size="10">
			
		</td>
		
	</tr>
		</tbody>
	</table>
</div>

<div class="btn_confirm">
	<input type="submit" value="확인" class="btn_large" accesskey="s">
</div>



</form>
<script src="js/toast.js"></script>
<%
	request.getSession(false).removeAttribute("msg");
	if(msg.equals("SUCCESS")){
%>
<script>
Toast.fire({
	icon: 'success',
	title: '쿠폰 지급에 성공했습니다'
})	
</script>
<%
	}
%>
<script>
$(function() {
    $("input[name=mb_id1]").live("click",function() {
        switch($(this).val()) {
            case "1":
				$("#mb_id1_from").attr("disabled",true);
				$("#mb_id1_from").css("background-color","#eee");
				$("#mb_id1_to").attr("disabled",true);
				$("#mb_id1_to").css("background-color","#eee");
                break;
			case '0':
				$("#mb_id1_from").attr("disabled",false);
				$("#mb_id1_from").css("background-color","#fff");
				$("#mb_id1_to").attr("disabled",false);
				$("#mb_id1_to").css("background-color","#fff");
				break;
        }
    });

	$("#mb_id1_all").trigger( "click" );
});
</script>
</div>

</div>
</div>
<jsp:include page="../admin/layout/footer.jsp"/>