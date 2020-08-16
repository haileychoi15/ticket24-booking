<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	String ctxPath = request.getContextPath();
	//		/finalproject4
%>


<style type="text/css">

	body{margin-top: 116px;}
	
	.noti-tit-tag01 {
		border: 1px solid orange;
		color: orange; 
		font-size: 10pt;
		padding: 5px 10px;
		margin: 0 15px 35px 0;
		text-align: right;
	}
	
	.noti-content {
		margin: 0px auto;
		padding: 0;
		width: 80%;
		word-wrap: break-word; 
	}
	
	.noti-vt-open {
		line-height: 1;
		margin: 30px 0 0 0;
		padding: 20px 0 0 0;
		font-style: normal;
		vertical-align: baseline;
		outline: none;
		background: #fbe5d5;
		border: 1px solid #999;
		margin-top: -1px;
		height: 58px;
		font-size: 17px;
		font-weight: 700;
		vertical-align: middle;
	}
	
	.noti-vt-open > span:nth-child(1) em {
		inline-block;
	    height: 22px;
	    line-height: 22px;
	    padding-left: 32px;
	    color: #ec7d2c;
		background: url('http://tkfile.yes24.com/imgNew/sub/ico-rp-tko1.png') no-repeat;
		background-size: auto 100%;
	}
	
	.noti-vt-open > span {
		margin: 0px 44px;
		padding: 14px 0 0 0;
		vertical-align: middle;
	}
	
	.noti-view-date, .noti-view-date > span { 
		text-align: right;
		height: 30px;
		line-height: 30px;
		margin-bottom: 30px;
	}

	.noti-content img {
		text-align: center;
	}

	table, th, td, input, textarea {border: solid gray 1px;}
	
	#table, #table2 {border-collapse: collapse;
	 		         width: 900px;
	 		        }
	#table th, #table td{padding: 5px;}
	#table th{width: 120px; background-color: #DDDDDD;}
	#table td{width: 750px;}
	
	.long {width: 470px;}
	.short {width: 120px;}
	
	.move {cursor: pointer;}
	.moveColor {color: #660029; font-weight: bold;}
	
	a {text-decoration: none !important;}
	
	#star_grade a{
        text-decoration: none;
        color: gray;
    }
    
    #star_grade a.on{
        color: red;
    }
    
    <%-- 
    .star-rating { width:205px; }
	.star-rating,.star-rating span { display:inline-block; height:39px; overflow:hidden; background:url(<%= ctxPath%>/resources/images/star.png)no-repeat; color: blue;}
	.star-rating span{ background-position:left bottom; line-height:0; vertical-align:top; }
     --%>
    .star-rating { width:103px; }
	.star-rating,.star-rating span { display:inline-block; height:19px; overflow:hidden; background:url(<%= ctxPath%>/resources/images/star_resize.png)no-repeat; color: blue;}
	.star-rating span{ background-position:left bottom; line-height:0; vertical-align:top; }
	
</style>

<div style="margin-top: 200px;">
	
	<h1 style="text-align: center; ">공지사항</h1>
	
	<hr style="border-top: solid 1px black; margin: 50px 0; text-align: center;">
	<div style="text-align: center; font-size: 20pt;"><span class="noti-tit-tag01">카테고리</span>${notivo.subject}</div>
	<hr style="border-top: solid 1px black; margin: 50px 0; text-align: center;">
	
	<div class="noti-content">
	
		<div class="noti-view-date">
			· <span>등록일 : ${notivo.regDate}</span>&nbsp;&nbsp;&nbsp; · <span>조회수 : ${notivo.readCount}</span>
			<br/>
			<c:if test="${notivo.orgFilename != null}">
					첨부파일 : 
					<i class='fas fa-paperclip'></i>
					<a href="<%= ctxPath%>/download.action?seq=${notivo.notice_id}" style="color: red;">${notivo.orgFilename}</a>
					(
					<c:if test="${notivo.fileSize >= 1048576}">
					<fmt:formatNumber value="${notivo.fileSize/(1024*1024)}" pattern=".00" /> mb
					</c:if>
					<c:if test="${notivo.fileSize >= 1024 && notivo.fileSize < 1048576}">
						<fmt:formatNumber value="${notivo.fileSize/1024}" pattern=".00" /> kb
					</c:if>
					<c:if test="${notivo.fileSize < 1024}">
						${notivo.fileSize} bytes
					</c:if>
					)
					<br/>
			</c:if>
		
		</div>
		
		<c:if test="${notivo.ticketopenday != ' '}">
			<div class="noti-vt-open">
			    <span><em>티켓오픈</em></span>
			    <span id="title1">${notivo.ticketopenday}</span>
		    </div>
		</c:if>
				
			
		<p style="word-break: break-all; padding: 40px;">${notivo.content}</p>
		
		<br/>
		
		<div style="padding: 0 40px;">
			<div style="margin-bottom: 1%;">&nbsp;<i class="fas fa-chevron-up"></i> 이전글&nbsp;:&nbsp;<span class="move" onclick="javascript:location.href='?seq=${notivo.previousseq}'">${notivo.previoussubject}</span></div>
			<div style="margin-bottom: 1%;">&nbsp;<i class="fas fa-chevron-down"></i> 다음글&nbsp;:&nbsp;<span class="move" onclick="javascript:location.href='?seq=${notivo.nextseq}'">${notivo.nextsubject}</span></div>
			<%-- 
			이전글보기 : <a href="?seq=${notivo.previousseq}">${notivo.previoussubject}</a>
			다음글보기 : <a href="?seq=${notivo.nextseq}">${notivo.nextsubject}</a>
			--%>
			<br/>
			
			<div style="text-align: center; margin-bottom: 50px;">
				<button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/noticeMain.action'">전체목록보기</button>
				<button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/noticeMain.action'">목록보기</button>
				<%-- 	
				<c:if test="${gobackURL != null}">
					<button type="button" onclick="javascript:location.href=''">목록보기</button>
				</c:if>
				<c:if test="${gobackURL == null}">
					<button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/noticeMain.action'">목록보기</button>
				</c:if> --%>
				
				<button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/noticeEdit.action?seq=${notivo.notice_id}'">수정</button>
				<button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/noticeDel.action?seq=${notivo.notice_id}'">삭제</button>
			</div>
			
		</div>
		
	</div>
	
	
</div>

	



