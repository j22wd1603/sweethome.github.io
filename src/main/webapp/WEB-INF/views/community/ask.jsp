<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<head>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
    
	<script type="text/javascript">
	$(document).ready(function() {
		$("#btnSearch").on("click", function() {
			document.bbsForm.commuIdk.value = "";
			document.bbsForm.sortType.value = $("#_sortType").val();
			document.bbsForm.searchType.value = $("#_searchType").val();
			document.bbsForm.searchValue.value = $("#_searchValue").val();
			document.bbsForm.curPage.value = "1";
			document.bbsForm.action = "/community/ask";
			document.bbsForm.submit();
		});
		
		$("#btnWrite").on("click", function() {
			document.bbsForm.commuIdk.value = "";
			document.bbsForm.commuTab.value = "3";
			document.bbsForm.action = "/community/writeForm";
			document.bbsForm.submit();
		});
		
	});
	
	function fn_list(curPage)
	{
		document.bbsForm.commuIdk.value = "";
		document.bbsForm.curPage.value = curPage;
		document.bbsForm.action = "/community/ask";
		document.bbsForm.submit();
	}
	
	function fn_view(commuIdk)
	{
		var userId = "${cookieUserId}";

		
		if(userId == "")
		{			
			alert("로그인이 필요합니다.");
			
			return;
		}

		document.bbsForm.commuIdk.value = commuIdk;
		document.bbsForm.action = "/community/view";
		document.bbsForm.submit();		

	}		

	</script>
	
		      
</head>

<body>
   <%@ include file="/WEB-INF/views/include/navigation.jsp" %>
   
    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <h1 class="display-1 text-white animated slideInDown"><a class="text-white" href="/community/blog">Community</a></h1>
			<button type="button" id="btnWrite" class="btn btn-secondary mb-3" style="background-color:#B78D65; border:none; border-radius:1px;">글쓰기</button>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb text-uppercase mb-0">
                    <li class="breadcrumb-item"><a class="text-white" href="/community/myroom">마이룸</a></li>
                    <li class="breadcrumb-item text-primary active" aria-current="community/ask" style="color:#9E0E0B; font-weight:bold;">질문게시판</li>
                    <li class="breadcrumb-item"><a class="text-white" href="/community/free">자유게시판</a></li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
    

<!-- Team Start -->

<div class="container-xxl py-5">
  <div class="container">
    <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
      <h1 class="display-5 mb-4"><a href="/community/myroom" style="color:black">가장 많이 본 질문 글</a></h1>
    </div>
    <div class="row g-0 team-items">
      <c:forEach var="commuBoard" items="${listByMonthlyViews}" varStatus="status">
      
      	<c:if test="${commuBoard.commuStatus eq 'Y'}">	
	        <c:if test="${commuBoard.fileCheck eq 'Y'}">
	          <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">  
	            <div class="team-item position-relative">  
					<a href="javascript:void(0)" onclick="fn_view(${commuBoard.commuIdk})">
		              <div class="position-relative">
    					<img  class="img-fluid" style="object-fit: cover; height:407.98px; width:408px;" src="/resources/images/community/${commuBoard.commuIdk}.${commuBoard.fileExt}">
		              </div>
		              <div class="bg-light text-center p-4">
		                <h3 class="mt-2">${commuBoard.commuTitle}</h3>
		                <h3 class="mt-2">${commuBoard.regDate}</h3>
		                <h3 class="mt-2">${commuBoard.userId}</h3>
		                <span class="text-primary">조회수: ${commuBoard.commuViews}</span>
		                <span class="text-primary">좋아요수: ${commuBoard.commuLikes}</span>
		              </div>
	              	</a>
	            </div>
	          </div>
	        </c:if>
	        <c:if test="${commuBoard.fileCheck ne 'Y'}">
	          <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">  
	            <div class="team-item position-relative">  
					<a href="javascript:void(0)" onclick="fn_view(${commuBoard.commuIdk})">
		              <div class="position-relative">
			                <img class="img-fluid" src="/resources/images/community/default.jpg">
		              </div>
		              <div class="bg-light text-center p-4">
		                <h3 class="mt-2">${commuBoard.commuTitle}</h3>
		                <h3 class="mt-2">${commuBoard.regDate}</h3>
		                <h3 class="mt-2">${commuBoard.userId}</h3>
		                <span class="text-primary">조회수: ${commuBoard.commuViews}</span>
		                <span class="text-primary">좋아요수: ${commuBoard.commuLikes}</span>
		              </div>
	              	</a>
	            </div>
	          </div>
	        </c:if>	
        </c:if>
        
      	<c:if test="${commuBoard.commuStatus eq 'N'}">	
	          <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">  
	            <div class="team-item position-relative">  
					<a href="javascript:void(0)" onclick="fn_view(${commuBoard.commuIdk})">
		              <div class="position-relative">
			                <img class="img-fluid" src="/resources/images/community/delete.jpg">
		              </div>
		              <div class="bg-light text-center p-4">
		                <h3 class="mt-2">운영정책에 의해 삭제된 게시물입니다.</h3>
		              </div>
	              	</a>
	            </div>
	          </div>
        </c:if>        
      </c:forEach>
    </div>
  </div>
</div>


<div class="container-xxl py-5">
  <div class="container">
  
   <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s">
	    <select name="_sortType" id="_sortType" class="custom-select" style="width:auto;">
			<option value="">조회 항목</option>
			<option value="1" <c:if test='${sortType eq "1"}'>selected</c:if>>최신순</option>
			<option value="2" <c:if test='${sortType eq "2"}'>selected</c:if>>과거순</option>
			<option value="3" <c:if test="${sortType eq '3'}">selected</c:if>>인기순</option>                 	
	    </select>
	             	
	    <select name="_searchType" id="_searchType" class="custom-select" style="width:auto;">
			<option value="">검색 항목</option>
			<option value="1" <c:if test='${searchType eq "1"}'>selected</c:if>>작성자</option>
			<option value="2" <c:if test='${searchType eq "2"}'>selected</c:if>>제목</option>
			<option value="3" <c:if test="${searchType eq '3'}">selected</c:if>>내용</option>
		</select>
			<input type="text" name="_searchValue" id="_searchValue" value="${searchValue}" class="form-control mx-1" maxlength="20" style="width:auto;ime-mode:active;" placeholder="조회값을 입력하세요." />
			<button type="button" id="btnSearch" class="btn btn-secondary mb-3 mx-1">조회</button>
	 </div>
	    
    <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
      <h1 class="display-5 mb-4"><a href="/community/ask" style="color:black">질문 게시판</a></h1>
    </div>
             
    
    
    <div class="row g-0 team-items">
		 <c:forEach var="commuBoard" items="${list}" varStatus="status">
		 
	      	<c:if test="${commuBoard.commuStatus eq 'Y'}">	
		        <c:if test="${commuBoard.fileCheck eq 'Y'}">
		          <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">  
		            <div class="team-item position-relative">  
		            
						<a href="javascript:void(0)" onclick="fn_view(${commuBoard.commuIdk})">
			              <div class="position-relative">
    						<img  class="img-fluid" style="object-fit: cover; height:407.98px; width:408px;" src="/resources/images/community/${commuBoard.commuIdk}.${commuBoard.fileExt}">
			              </div>
			              <div class="bg-light text-center p-4">
			                <h3 class="mt-2">${commuBoard.commuTitle}</h3>
			                <h3 class="mt-2">${commuBoard.regDate}</h3>
			                <h3 class="mt-2">${commuBoard.userId}</h3>
			                <span class="text-primary">조회수: ${commuBoard.commuViews}</span>
			                <span class="text-primary">좋아요수: ${commuBoard.commuLikes}</span>
			              </div>
		              	</a>
		            </div>
		          </div>
		        </c:if>		
		         
		        <c:if test="${commuBoard.fileCheck ne 'Y'}">
		          <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
		            <div class="team-item position-relative">
						<a href="javascript:void(0)" onclick="fn_view(${commuBoard.commuIdk})">
			              <div class="position-relative">
			                <img class="img-fluid" src="/resources/images/community/default.jpg">
			              </div>
			              <div class="bg-light text-center p-4">
			                <h3 class="mt-2">${commuBoard.commuTitle}</h3>
			                <h3 class="mt-2">${commuBoard.regDate}</h3>
			                <h3 class="mt-2">${commuBoard.userId}</h3>
			                <span class="text-primary">조회수: ${commuBoard.commuViews}</span>
			                <span class="text-primary">좋아요수: ${commuBoard.commuLikes}</span>
			              </div>
		              	</a>
		            </div>
		          </div>
		        </c:if>
	        </c:if>
	        
	      	<c:if test="${commuBoard.commuStatus eq 'N'}">	
		          <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">  
		            <div class="team-item position-relative">  
						<a href="javascript:void(0)" onclick="fn_view(${commuBoard.commuIdk})">
			              <div class="position-relative">
				                <img class="img-fluid" src="/resources/images/community/delete.jpg">
			              </div>
			              <div class="bg-light text-center p-4">
			                <h3 class="mt-2">운영정책에 의해 삭제된 게시물 입니다.</h3>
			              </div>
		              	</a>              	
		            </div>
		          </div>
	        </c:if>        	        

		</c:forEach>
    </div>
  </div>
</div>

	<nav>
		<ul class="pagination justify-content-center" style="padding-top: 5%;  padding-bottom:5%;">
			<c:if test="${paging.prevBlockPage gt 0}">
				<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${paging.prevBlockPage})"><i class="bi bi-arrow-left"></i></a></li>
			</c:if>
				<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
						<c:choose>
							<c:when test="${i ne curPage}">
								<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${i})">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item active"><a class="page-link" href="javascript:void(0)" style="cursor:default;">${i}</a></li>
							</c:otherwise>
						</c:choose>
				</c:forEach>
			<c:if test="${paging.nextBlockPage gt 0}">
				<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${paging.nextBlockPage})"><i class="bi bi-arrow-right"></i></a></li>
			</c:if>
		</ul>
	</nav>         

	<form name="bbsForm" id="bbsForm" method="post">
		<input type="hidden" name="commuIdk" value="" />
		<input type="hidden" name="commuTab" value="" />
		<input type="hidden" name="curPage" value="${curPage}"/>
		<input type="hidden" name="searchType" value="${searchType}" />
		<input type="hidden" name="searchValue" value="${searchValue}" />
		<input type="hidden" name="sortType" value="${sortType}" />
	</form>

    
</body>

</html>