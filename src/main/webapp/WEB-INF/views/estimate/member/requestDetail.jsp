<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%> 
<!doctype html> 
<html lang="ko"> 
  <head>
    <title>내일의 집</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/channel/channel.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/estimate/estimate.css">
  <script src="${pageContext.request.contextPath}/js/estimate/estimate.js"></script>

  </head>
  
  <body>

  <div class="empty-space"></div>
  <div class="container-flude submenu_borderbottom">
	<div class="wrap-submenu">
		<div class="mypage-nav">
			<nav class="navbar justify-content-center navbar-expand-lg submenu_nav">
				<ul class="navbar-nav mypage">
					<li class="nav-item">
						<a href="" class="nav-link" target="_self">회원정보수정</a>
					</li>
					<li class="nav-item">
						<a href="/myEstimateList/${user.memberNo }" class="nav-link" target="_self">견적 요청 내역</a>
					</li>
					<li class="nav-item">
						<a href="" class="nav-link" target="_self">내 상담 내역</a>
					</li>
					<li class="nav-item">
						<a href="" class="nav-link" target="_self">내가 쓴 글</a>
					</li>
				</ul>
			</nav>
		</div>
	</div><!--end wrap-submenu-->

</div> 

<!-- ↑↑↑↑↑↑↑↑↑↑ 이 윗부분 터치ㄴㄴ ↑↑↑↑↑↑↑↑ -->
<!--☆★☆★☆ ↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 여기부터 수정가능 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ ★☆★☆★-->

<div class="estimateDetail-main-wrap">
	<div class="container pt-5">
		<div class="estimateDetail page-wrapper p-t-130 p-b-100"><!--start 견적상세-->
			<div class="estimate-detail-wrap wrapper wrapper--w680">
				<div class="card card-4">
				<div class="card-body">
				
<!------------------------- 도배 papering ---------------------------->
				<div class="estimate-part"> 
				    <div class="est-detail-title">도배견적문의</div>
				    <div class="est-detail-contents">
				      <ul class="estimate-item">
				      <c:forEach items="${estimate.estDetails}" var="item" >
							<li>${item.key} : ${item.value}</li>
					  </c:forEach>

				      </ul>
			      	</div>
			    </div>
<!------------------------- 장판 Linoleum ---------------------------->
			   <%--  <div class="estimate-part"> 
				    <div class="est-detail-title">장판견적문의</div>
				    <div class="est-detail-contents">
				      <ul class="estimate-item">
				      	<c:forEach items="${estimate.estDetails}" var="item" >
							<li>${item.key} : ${item.value}</li>
					  	</c:forEach>
				        	<li>${estimate.linoleum.linoleumThick}</li>
					        <li>${estimate.linoleum.linoleumArea}</li>
					        <li>${estimate.linoleum.linoleumNumberOfRooms}</li>
					        <li>${estimate.linoleum.linoleumVeranda}</li>
					        <li>${estimate.linoleum.linoleumCurrentFloor}</li>
					        <li>${estimate.linoleum.linoleumBurdon}</li>
				      </ul>
			      	</div>
			    </div>  
<!------------------------- 마루 floor ---------------------------->
			    <div class="estimate-part"> 
				    <div class="est-detail-title">마루견적문의</div>
				    <div class="est-detail-contents">
				      <ul class="estimate-item">
				        	<li>${estimate.floor.floorType}</li>
					        <li>${estimate.floor.floorArea}</li>
					        <li>${estimate.floor.floorNumberOfRooms}</li>
					        <li>${estimate.floor.floorVeranda}</li>
					        <li>${estimate.floor.floorCurrentFloor}</li>
					        <li>${estimate.floor.floorBurdon}</li>
				      </ul>
			      	</div>
			    </div>  

<!-------------------------  욕실 Bathroom ---------------------------->
			    <div class="estimate-part"> 
				    <div class="est-detail-title">욕실견적문의</div>
				    <div class="est-detail-contents">
				      <ul class="estimate-item">
				        	<li>${estimate.bathroom.bathroomNumberOfRooms}</li>
					        <li>${estimate.bathroom.bathroomType}</li>
					        <li>${estimate.bathroom.bathroomCeiling}</li>
					        <li>${estimate.bathroom.bathroomTile}</li>
				      </ul>
			      	</div>
			    </div>  

<!------------------------- 주방 Kitchen ---------------------------->
			    <div class="estimate-part"> 
				    <div class="est-detail-title">주방견적문의</div>
				    <div class="est-detail-contents">
				      <ul class="estimate-item">
				        	<li>${estimate.kitchen.kitchenType}</li>
					        <li>${estimate.kitchen.kitchenMaxWidth}</li>
					        <li>${estimate.kitchen.kitchenCountertop}</li>
					        <li>${estimate.kitchen.kitchenDoor}</li>
					        <li>${estimate.kitchen.kitchenTile}</li>
				      </ul>
			      	</div>
			    </div>  
<!------------------------- 타일  Tile ---------------------------->
			    <div class="estimate-part"> 
				    <div class="est-detail-title">타일견적문의</div>
				    <div class="est-detail-contents">
				      <ul class="estimate-item">
				        	<li>${estimate.tile.tileType}</li>
					        <li>${estimate.tile.tileArea}</li>
		
				      </ul>
			      	</div>
			    </div>  
			      			      			       --%>			      
			      
<!------------------------ 추가문의 ----------------------------------->
			      <div class="estimate-item-comment">
			        <div class="name">추가문의사항</div>
			          <div class="value">
			            <div class="input-group">
			              <textarea class="textarea est-comment" name="message" placeholder="${estimate.estDescription}">${estimate.estDescription}</textarea>
			            </div>
			          </div>
			      </div>
 <!---------------------- end 추가문의-------------------------------->
 
 
 				</div><!-- card body -->
 
			</div><!-- end card  -->
			
			
			
			
			    </div><!-- end estimate-detail-wrap  -->
			  </div><!-- end estimateDetail -->
    
		</div><!--end 견적상세-->

	</div>
	

</div><!--end main-wrap-->
<div class="empty-space"></div>
<!--☆★☆★☆ ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 여기까지 수정가능 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ ★☆★☆★-->
<!-- ↓↓↓↓↓↓↓↓↓ 이 밑부분 터치ㄴㄴ ↓↓↓↓↓↓↓↓↓-->

  </body>
</html>