<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!doctype html>
<html lang="ko">
  <head>
    <title>내일의 집</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/estimate/estimate.css">
  <script src="${pageContext.request.contextPath}/js/estimate/estimate.js"></script>
  


  </head>
  
  <body>

<div class="empty-space"></div>
<!-- ↑↑↑↑↑↑↑↑↑↑ 이 윗부분 터치ㄴㄴ ↑↑↑↑↑↑↑↑ -->
<!--☆★☆★☆ ↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 여기부터 수정가능 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ ★☆★☆★-->
<section class="pt-6">
<form class="expert-calculate" action="/estimateResult">
<sec:authorize access="isAuthenticated()">
<input type='hidden' name='memberNo' value='${user.memberNo}'>
</sec:authorize>
<div class="expert-calculate__main-wrap container">
	<div class="expert-calculate__main row">
		<div class="col-12 col-md-1 offset-md-1 offset-lg-2"><!--start aside menu-->
			<div data-sticky-enabled="false" data-sticky-always="false" data-direction="top" data-offset="0" class="sticky-container">
				<div class="sticky-child expert-calculate__menu" style="position:relative">
					<nav class="expert-calculate__category-list-wrap">
						<ul id="category-list" class="expert-calculate__category-list">
							<li class="expert-calculate__category-list__item">
								<button type="button" class="btn btn-outline-mint active" value="#papering">도배</button>
							</li>
							<li class="expert-calculate__category-list__item">
								<button type="button" class="btn btn-outline-mint" value="#linoleum">장판</button>
							</li>
							<li class="expert-calculate__category-list__item">
								<button type="button" class="btn btn-outline-mint" value="#fl">마루</button>
							</li>
							<li class="expert-calculate__category-list__item">
								<button type="button" class="btn btn-outline-mint" value="#bathroom">욕실</button>
							</li>
							<li class="expert-calculate__category-list__item">
								<button type="button" class="btn btn-outline-mint" value="#kitchen">주방</button>
							</li>
							<li class="expert-calculate__category-list__item">
								<button type="button" class="btn btn-outline-mint" value="#tile">타일</button>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div><!--END aside-->
		<hr class="expert-calculate__divider col-auto"/> <!--구분선-->

		<!--start 견적폼-->
		<section class="expert-calculate__content col-12 col-md-7 col-lg-8">

<!---------------------------------------------도배---------------------------------------------------->
			<div class="estimate-wrap col-md-10" id="papering">
				<div class="expert-calculate__content__header">
					<h1 class="expert-calculate__content__header__title">도배 견적 요청</h1>
					<button class="expert-reset-button" type="reset"><svg class="reset-icon" viewBox="0 0 20 20" width="20" height="20" preserveAspectRatio="xMidYMid meet"><path fill="#757575" fill-rule="nonzero" d="M15.4 8.78a6.52 6.52 0 1 0-1.8 5.83.74.74 0 0 1 1.06 1.05 8 8 0 1 1 2.12-7.56l.87-2.12a.75.75 0 0 1 1.39.57l-1.9 4.57-4.57-1.9a.75.75 0 1 1 .58-1.38l2.26.94z"></path></svg>초기화</button>
				</div>
				
				<div class="expert-form-group"><!--벽지선택-->
						<div class="expert-form-group__title">
							<div class="expert-form-group__title__label">시공할 벽지를 선택해주세요</div>
							<div class="expert-form-group__title__right">
								<button class="expert-form-group-detail-popup__toggle" type="button">더 알아보기</button>
							</div>
						</div>
						<div class="estmate-form-group__content "><!--START 시공벽지선택-->
							<div class="estmate-form-group__row">
								<div class="btn-group d-flex btn-group-toggle btn-block" data-toggle="buttons">
									  <label class="btn btn-mint active  ">
									    <input type="radio" name="paperingType" id="laminating" autocomplete="off" value="0"> 합지
									  </label>
									  <label class="btn btn-mint ">
									    <input type="radio" name="paperingType" id="silk" autocomplete="off"  value="1"> 실크
									  </label>
									  <label class="btn btn-mint">
									    <input type="radio" name="paperingType" id="both" autocomplete="off" value="2"> 합지 + 실크
									  </label>
								</div>
						</div>
					</div><!--end 벽지선택-->
				</div><!--END group-->

				<div class="expert-form-group"><!--시공규모-->
						<div class="expert-form-group__title">
							<div class="expert-form-group__title__label">시공할 공간의 규모가 어떻게 되나요?</div>
					
						</div>
						<div class="estmate-form-group__content "><!--START 천장/베란다-->
							<div class="select-row">
								<div class="input-group select-input">
										<select class="form-control empty custom-select" name="paperingArea">
													<option selected="" value="" disabled="">면적</option>
													<option value="16">16m² (5평)</option>
													<option value="19">19m² (6평)</option>
													<option value="23">23m² (7평)</option>
													<option value="26">26m² (8평)</option>
													<option value="29">29m² (9평)</option>
													<option value="33">33m² (10평)</option>
													<option value="36">36m² (11평)</option>
													<option value="39">39m² (12평)</option>
													<option value="52">42m² (13평)</option>
													<option value="46">46m² (14평)</option>
													<option value="49">49m² (15평)</option>
													<option value="52">52m² (16평)</option>
													<option value="56">56m² (17평)</option>
													<option value="59">59m² (18평)</option>
													<option value="62">62m² (19평)</option>
													<option value="66">66m² (20평)</option>
													<option value="69">69m² (21평)</option>
													<option value="72">72m² (22평)</option>
													<option value="75">75m² (23평)</option>
													<option value="79">79m² (24평)</option>
													<option value="82">82m² (25평)</option>
													<option value="85">85m² (26평)</option>
													<option value="89">89m² (27평)</option>
													<option value="92">92m² (28평)</option>
													<option value="95">95m² (29평)</option>
													<option value="99">99m² (30평)</option>
													<option value="102">102m² (31평)</option>
													<option value="105">105m² (32평)</option>
													<option value="108">108m² (33평)</option>
													<option value="112">112m² (34평)</option>
													<option value="115">115m² (35평)</option>
													<option value="118">118m² (36평)</option>
													<option value="122">122m² (37평)</option>
													<option value="126">125m² (38평)</option>
													<option value="128">128m² (39평)</option>
													<option value="132">132m² (40평)</option>
													<option value="135">135m² (41평)</option>
													<option value="138">138m² (42평)</option>
													<option value="141">141m² (43평)</option>
													<option value="145">145m² (44평)</option>
													<option value="148">148m² (45평)</option>
													<option value="151">151m² (46평)</option>
													<option value="155">155m² (47평)</option>
													<option value="158">158m² (48평)</option>
													<option value="161">161m² (49평)</option>
													<option value="165">165m² (50평)</option>
													<option value="168">168m² (51평)</option>
													<option value="171">171m² (52평)</option>
													<option value="174">174m² (53평)</option>
													<option value="178">178m² (54평)</option>
													<option value="181">181m² (55평)</option>
										</select>
								
												<span class="select-input__icon">
													<svg class="icon" width="10" height="10" style="fill:currentColor" preserveAspectRatio="xMidYMid meet"><path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path></svg>
												</span></div>
								<div class="input-group select-input">
										<select class="form-control empty custom-select" name="paperingNumberOfRooms">
											<option selected="" value="" disabled="">방 개수</option>
											<option value="0">방 1개</option>
											<option value="1">방 2개</option>
											<option value="2">방 3개</option>
											<option value="3">방 4개</option>
											<option value="4">방 5개</option>
											<option value="5">방 6개</option>
											<option value="6">방 7개</option>
											<option value="7">방 8개</option>
											<option value="8">방 9개</option>
											<option value="9">방 10개</option>
										</select>
										<span class="select-input__icon">
												<svg class="icon" width="10" height="10" style="fill:currentColor" preserveAspectRatio="xMidYMid meet"><path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path></svg>
										</span>
								
								</div>

							</div><!--end select row-->

							<div class="row-single pt-3">
								<div class="estmate-form-group__row">
									<div class="btn-group d-flex btn-group-toggle btn-block" data-toggle="buttons">
										  <label class="btn btn-mint active  ">
										    <input type="radio" name="paperingCeiling" id="include" value="0" autocomplete="off" > 천장포함
										  </label>
										  <label class="btn btn-mint ">
										    <input type="radio" name="paperingCeiling" id="exclude"  value="1" autocomplete="off">천장미포함
										  </label>
									</div>
								</div>
							</div>
							<!----베란다---->
							<div class="row-single pt-3">
								<div class="estmate-form-group__row">
									<div class="btn-group d-flex btn-group-toggle btn-block" data-toggle="buttons">
											 <label class="btn btn-mint active  ">
											   <input type="radio" name="paperingVeranda" id="extension" value="0"  autocomplete="off" > 베란다 확장 됨
											 </label>
											 <label class="btn btn-mint ">
											    <input type="radio" name="paperingVeranda" id="unexpanded" value="1"  autocomplete="off"> 베란다 확장 안됨
											 </label>
									</div>
								</div>
							</div>
					</div><!--end 천장/베란다-->
				</div><!--END group-->

				<div class="expert-form-group"><!--시공상태-->
						<div class="expert-form-group__title">
							<div class="expert-form-group__title__label">시공할 곳의 현재 상태가 어떤가요?</div>
						
						</div>
						<div class="estmate-form-group__content "><!--START 짐있없-->
							<div class="estmate-form-group__row">
								<div class="btn-group d-flex btn-group-toggle btn-block" data-toggle="buttons">
									  <label class="btn btn-mint form active  ">
									    <input type="radio" name="paperingBurdon" id="exist"  value="0" autocomplete="off" > 짐 있음
									  </label>
									  <label class="btn btn-mint ">
									    <input type="radio" name="paperingBurdon" id="empty" value="1"  autocomplete="off"> 짐 없음(빈집)
									  </label>
								</div>
						</div>
					</div><!--end 짐있없-->
				</div><!--END group-->

			</div><!--end estimate wrap papering-->
			
<!--------------------------------------------장판------------------------------------------------------>
			<div class="estimate-wrap col-md-10 hide-contents" id="linoleum">
				<div class="expert-calculate__content__header">
					<h1 class="expert-calculate__content__header__title">장판 견적 요청</h1>
					<button class="expert-reset-button" type="reset"><svg class="reset-icon" viewBox="0 0 20 20" width="20" height="20" preserveAspectRatio="xMidYMid meet"><path fill="#757575" fill-rule="nonzero" d="M15.4 8.78a6.52 6.52 0 1 0-1.8 5.83.74.74 0 0 1 1.06 1.05 8 8 0 1 1 2.12-7.56l.87-2.12a.75.75 0 0 1 1.39.57l-1.9 4.57-4.57-1.9a.75.75 0 1 1 .58-1.38l2.26.94z"></path></svg>초기화</button>
				</div>
				
				<div class="expert-form-group"><!--장판두께선택-->
						<div class="expert-form-group__title">
							<div class="expert-form-group__title__label">시공할 장판두께를 선택해주세요</div>
						</div>
						<div class="estmate-form-group__content "><!--START 시공장판선택-->
							<div class="estmate-form-group__row">
								<div class="btn-group d-flex btn-group-toggle btn-block" data-toggle="buttons">
									  <label class="btn btn-mint active  ">
									    <input type="radio" name="linoleumThick" id="small" value="0" autocomplete="off" > 1.8mm
									  </label>
									  <label class="btn btn-mint ">
									    <input type="radio" name="linoleumThick" id="medium" value="1" autocomplete="off"> 2.0mm
									  </label>
									  <label class="btn btn-mint">
									    <input type="radio" name="linoleumThick" id="large" value="2" autocomplete="off"> 2.2mm
									  </label>
								</div>
						</div>
					</div><!--end 장판선택-->
				</div><!--END group-->

				<div class="expert-form-group"><!--시공규모-->
						<div class="expert-form-group__title">
							<div class="expert-form-group__title__label">시공할 공간의 규모가 어떻게 되나요?</div>
						</div>
						<div class="estmate-form-group__content "><!--START 시공규모-->
							<div class="select-row">
								<div class="input-group select-input">
										<select class="form-control empty custom-select" name="linoleumArea">
													<option selected="" value="" disabled="">면적</option>
													<option value="16">16m² (5평)</option>
													<option value="19">19m² (6평)</option>
													<option value="23">23m² (7평)</option>
													<option value="26">26m² (8평)</option>
													<option value="29">29m² (9평)</option>
													<option value="33">33m² (10평)</option>
													<option value="36">36m² (11평)</option>
													<option value="39">39m² (12평)</option>
													<option value="52">42m² (13평)</option>
													<option value="46">46m² (14평)</option>
													<option value="49">49m² (15평)</option>
													<option value="52">52m² (16평)</option>
													<option value="56">56m² (17평)</option>
													<option value="59">59m² (18평)</option>
													<option value="62">62m² (19평)</option>
													<option value="66">66m² (20평)</option>
													<option value="69">69m² (21평)</option>
													<option value="72">72m² (22평)</option>
													<option value="75">75m² (23평)</option>
													<option value="79">79m² (24평)</option>
													<option value="82">82m² (25평)</option>
													<option value="85">85m² (26평)</option>
													<option value="89">89m² (27평)</option>
													<option value="92">92m² (28평)</option>
													<option value="95">95m² (29평)</option>
													<option value="99">99m² (30평)</option>
													<option value="102">102m² (31평)</option>
													<option value="105">105m² (32평)</option>
													<option value="108">108m² (33평)</option>
													<option value="112">112m² (34평)</option>
													<option value="115">115m² (35평)</option>
													<option value="118">118m² (36평)</option>
													<option value="122">122m² (37평)</option>
													<option value="126">125m² (38평)</option>
													<option value="128">128m² (39평)</option>
													<option value="132">132m² (40평)</option>
													<option value="135">135m² (41평)</option>
													<option value="138">138m² (42평)</option>
													<option value="141">141m² (43평)</option>
													<option value="145">145m² (44평)</option>
													<option value="148">148m² (45평)</option>
													<option value="151">151m² (46평)</option>
													<option value="155">155m² (47평)</option>
													<option value="158">158m² (48평)</option>
													<option value="161">161m² (49평)</option>
													<option value="165">165m² (50평)</option>
													<option value="168">168m² (51평)</option>
													<option value="171">171m² (52평)</option>
													<option value="174">174m² (53평)</option>
													<option value="178">178m² (54평)</option>
													<option value="181">181m² (55평)</option>
										</select>
								
												<span class="select-input__icon">
													<svg class="icon" width="10" height="10" style="fill:currentColor" preserveAspectRatio="xMidYMid meet"><path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path></svg>
												</span></div>
								<div class="input-group select-input">
										<select class="form-control empty custom-select" name="linoleumNumberOfRooms">
											<option selected="" value="" disabled="">방 개수</option>
											<option value="0">방 1개</option>
											<option value="1">방 2개</option>
											<option value="2">방 3개</option>
											<option value="3">방 4개</option>
											<option value="4">방 5개</option>
											<option value="5">방 6개</option>
											<option value="6">방 7개</option>
											<option value="7">방 8개</option>
											<option value="8">방 9개</option>
											<option value="9">방 10개</option>
										</select>
										<span class="select-input__icon">
												<svg class="icon" width="10" height="10" style="fill:currentColor" preserveAspectRatio="xMidYMid meet"><path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path></svg>
										</span>
								
								</div>

							</div><!--end select row-->
							<!----베란다---->
							<div class="row-single pt-3">
								<div class="estmate-form-group__row">
									<div class="btn-group d-flex btn-group-toggle btn-block" data-toggle="buttons">
											 <label class="btn btn-mint active  ">
											   <input type="radio" name="linoleumVeranda" id="extension" value="0" autocomplete="off"> 베란다 확장 됨
											 </label>
											 <label class="btn btn-mint ">
											    <input type="radio" name="linoleumVeranda" id="unexpanded" value="1" autocomplete="off"> 베란다 확장 안됨
											 </label>
									</div>
								</div>
							</div>
					</div><!--end 천장/베란다-->
				</div><!--END group-->

				<div class="expert-form-group"><!--현재바닥-->
						<div class="expert-form-group__title">
							<div class="expert-form-group__title__label">현재 바닥은 어떤 걸로 되어 있나요?</div>
						
						</div>
						<div class="estmate-form-group__content "><!--START 현재바닥-->
							<div class="estmate-form-group__row">
								<div class="btn-group d-flex btn-group-toggle btn-block" data-toggle="buttons">
									  <label class="btn btn-mint form active  ">
									    <input type="radio" name="linoleumCurrentFloor" id="linoleum" value="0"autocomplete="off">장판
									  </label>
									  <label class="btn btn-mint form active  ">
									    <input type="radio" name="linoleumCurrentFloor" id="floor" value="1" autocomplete="off" >마루
									  </label>
									  <label class="btn btn-mint ">
									    <input type="radio" name="linoleumCurrentFloor" id="none" value="2" autocomplete="off">없음
									  </label>
								</div>
						</div>
					</div><!--end 현재바닥-->
				</div><!--END group-->

				<div class="expert-form-group"><!--시공상태-->
						<div class="expert-form-group__title">
							<div class="expert-form-group__title__label">시공할 곳의 현재 상태가 어떤가요?</div>
						
						</div>
						<div class="estmate-form-group__content "><!--START 짐있없-->
							<div class="estmate-form-group__row">
								<div class="btn-group d-flex btn-group-toggle btn-block" data-toggle="buttons">
									  <label class="btn btn-mint form active  ">
									    <input type="radio" name="linoleumBurdon" id="exist" value="0" autocomplete="off"> 짐 있음
									  </label>
									  <label class="btn btn-mint ">
									    <input type="radio" name="linoleumBurdon" id="empty" value="1" autocomplete="off"> 짐 없음(빈집)
									  </label>
								</div>
						</div>
					</div><!--end 짐있없-->
				</div><!--END group-->
			</div><!--------------END 장판------------------------>

<!--------------------------------------------마루------------------------------------------------------>
			<div class="estimate-wrap col-md-10 hide-contents" id="fl">
				<div class="expert-calculate__content__header">
					<h1 class="expert-calculate__content__header__title">마루 견적 요청</h1>
					<button class="expert-reset-button" type="reset"><svg class="reset-icon" viewBox="0 0 20 20" width="20" height="20" preserveAspectRatio="xMidYMid meet"><path fill="#757575" fill-rule="nonzero" d="M15.4 8.78a6.52 6.52 0 1 0-1.8 5.83.74.74 0 0 1 1.06 1.05 8 8 0 1 1 2.12-7.56l.87-2.12a.75.75 0 0 1 1.39.57l-1.9 4.57-4.57-1.9a.75.75 0 1 1 .58-1.38l2.26.94z"></path></svg>초기화</button>
				</div>
				
				<div class="expert-form-group"><!--마루종류선택-->
						<div class="expert-form-group__title">
							<div class="expert-form-group__title__label">시공할 마루종류를 선택해주세요</div>
						</div>
						<div class="estmate-form-group__content "><!--START 마루종류선택-->
							<div class="estmate-form-group__row">
								<div class="btn-group d-flex btn-group-toggle btn-block" data-toggle="buttons">
									  <label class="btn btn-mint active  ">
									    <input type="radio" name="floorType" id="0" value="0" autocomplete="off"> 강마루
									  </label>
									  <label class="btn btn-mint ">
									    <input type="radio" name="floorType" id="1" value="1" autocomplete="off"> 강화마루
									  </label>
									  <label class="btn btn-mint">
									    <input type="radio" name="floorType" id="2" value="2" autocomplete="off"> 원목마루
									  </label>
									  <label class="btn btn-mint">
									    <input type="radio" name="floorType" id="3" value="3" autocomplete="off"> 온돌마루
									  </label>
								</div>
						</div>
					</div><!--end 장판선택-->
				</div><!--END group-->

				<div class="expert-form-group"><!--시공규모-->
						<div class="expert-form-group__title">
							<div class="expert-form-group__title__label">시공할 공간의 규모가 어떻게 되나요?</div>
						</div>
						<div class="estmate-form-group__content "><!--START 시공규모-->
							<div class="select-row">
								<div class="input-group select-input">
										<select class="form-control empty custom-select" name="floorArea">
													<option selected="" value="" disabled="">면적</option>
													<option value="16">16m² (5평)</option>
													<option value="19">19m² (6평)</option>
													<option value="23">23m² (7평)</option>
													<option value="26">26m² (8평)</option>
													<option value="29">29m² (9평)</option>
													<option value="33">33m² (10평)</option>
													<option value="36">36m² (11평)</option>
													<option value="39">39m² (12평)</option>
													<option value="52">42m² (13평)</option>
													<option value="46">46m² (14평)</option>
													<option value="49">49m² (15평)</option>
													<option value="52">52m² (16평)</option>
													<option value="56">56m² (17평)</option>
													<option value="59">59m² (18평)</option>
													<option value="62">62m² (19평)</option>
													<option value="66">66m² (20평)</option>
													<option value="69">69m² (21평)</option>
													<option value="72">72m² (22평)</option>
													<option value="75">75m² (23평)</option>
													<option value="79">79m² (24평)</option>
													<option value="82">82m² (25평)</option>
													<option value="85">85m² (26평)</option>
													<option value="89">89m² (27평)</option>
													<option value="92">92m² (28평)</option>
													<option value="95">95m² (29평)</option>
													<option value="99">99m² (30평)</option>
													<option value="102">102m² (31평)</option>
													<option value="105">105m² (32평)</option>
													<option value="108">108m² (33평)</option>
													<option value="112">112m² (34평)</option>
													<option value="115">115m² (35평)</option>
													<option value="118">118m² (36평)</option>
													<option value="122">122m² (37평)</option>
													<option value="126">125m² (38평)</option>
													<option value="128">128m² (39평)</option>
													<option value="132">132m² (40평)</option>
													<option value="135">135m² (41평)</option>
													<option value="138">138m² (42평)</option>
													<option value="141">141m² (43평)</option>
													<option value="145">145m² (44평)</option>
													<option value="148">148m² (45평)</option>
													<option value="151">151m² (46평)</option>
													<option value="155">155m² (47평)</option>
													<option value="158">158m² (48평)</option>
													<option value="161">161m² (49평)</option>
													<option value="165">165m² (50평)</option>
													<option value="168">168m² (51평)</option>
													<option value="171">171m² (52평)</option>
													<option value="174">174m² (53평)</option>
													<option value="178">178m² (54평)</option>
													<option value="181">181m² (55평)</option>
										</select>
								
												<span class="select-input__icon">
													<svg class="icon" width="10" height="10" style="fill:currentColor" preserveAspectRatio="xMidYMid meet"><path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path></svg>
												</span></div>
								<div class="input-group select-input">
										<select class="form-control empty custom-select" name="floorNumberOfRooms">
											<option selected="" value="" disabled="">방 개수</option>
											<option value="0">방 1개</option>
											<option value="1">방 2개</option>
											<option value="2">방 3개</option>
											<option value="3">방 4개</option>
											<option value="4">방 5개</option>
											<option value="5">방 6개</option>
											<option value="6">방 7개</option>
											<option value="7">방 8개</option>
											<option value="8">방 9개</option>
											<option value="9">방 10개</option>
										</select>
										<span class="select-input__icon">
												<svg class="icon" width="10" height="10" style="fill:currentColor" preserveAspectRatio="xMidYMid meet"><path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path></svg>
										</span>
								
								</div>

							</div><!--end select row-->
							<!----베란다---->
							<div class="row-single pt-3">
								<div class="estmate-form-group__row">
									<div class="btn-group d-flex btn-group-toggle btn-block" data-toggle="buttons">
											 <label class="btn btn-mint active  ">
											   <input type="radio" name="floorVeranda" id="extension" value="0" autocomplete="off" > 베란다 확장 됨
											 </label>
											 <label class="btn btn-mint ">
											    <input type="radio" name="floorVeranda" id="unexpanded" value="1" autocomplete="off"> 베란다 확장 안됨
											 </label>
									</div>
								</div>
							</div>
					</div><!--end 시공규모-->
				</div><!--END group-->

				<div class="expert-form-group"><!--현재바닥-->
						<div class="expert-form-group__title">
							<div class="expert-form-group__title__label">현재 바닥은 어떤 걸로 되어 있나요?</div>
						
						</div>
						<div class="estmate-form-group__content "><!--START 현재바닥-->
							<div class="estmate-form-group__row">
								<div class="btn-group d-flex btn-group-toggle btn-block" data-toggle="buttons">
									  <label class="btn btn-mint form active  ">
									    <input type="radio" name="floorCurrentFloor" id="linoleum" value="0" autocomplete="off" >장판
									  </label>
									  <label class="btn btn-mint form active  ">
									    <input type="radio" name="floorCurrentFloor" id="floor" value="1" autocomplete="off" >마루
									  </label>
									  <label class="btn btn-mint ">
									    <input type="radio" name="floorCurrentFloor" id="none" value="2" autocomplete="off">없음
									  </label>
								</div>
						</div>
					</div><!--end 현재바닥-->
				</div><!--END group-->

				<div class="expert-form-group"><!--시공상태-->
						<div class="expert-form-group__title">
							<div class="expert-form-group__title__label">시공할 곳의 현재 상태가 어떤가요?</div>
						
						</div>
						<div class="estmate-form-group__content "><!--START 짐있없-->
							<div class="estmate-form-group__row">
								<div class="btn-group d-flex btn-group-toggle btn-block" data-toggle="buttons">
									  <label class="btn btn-mint form active  ">
									    <input type="radio" name="floorBurdon" id="exist" value="0" autocomplete="off" > 짐 있음
									  </label>
									  <label class="btn btn-mint ">
									    <input type="radio" name="floorBurdon" id="empty" value="1" autocomplete="off"> 짐 없음(빈집)
									  </label>
								</div>
						</div>
					</div><!--end 짐있없-->
				</div><!--END group-->


			</div><!--end 마루-->


<!--------------------------------------------욕실------------------------------------------------------>
			<div class="estimate-wrap col-md-10 hide-contents" id="bathroom">
				<div class="expert-calculate__content__header">
					<h1 class="expert-calculate__content__header__title">욕실 견적 요청</h1>
					<button class="expert-reset-button" type="reset"><svg class="reset-icon" viewBox="0 0 20 20" width="20" height="20" preserveAspectRatio="xMidYMid meet"><path fill="#757575" fill-rule="nonzero" d="M15.4 8.78a6.52 6.52 0 1 0-1.8 5.83.74.74 0 0 1 1.06 1.05 8 8 0 1 1 2.12-7.56l.87-2.12a.75.75 0 0 1 1.39.57l-1.9 4.57-4.57-1.9a.75.75 0 1 1 .58-1.38l2.26.94z"></path></svg>초기화</button>
				</div>
				<div class="expert-form-group"><!--시공규모-->
						<div class="expert-form-group__title">
							<div class="expert-form-group__title__label">시공할 욕실이 몇 개인가요?</div>
						</div>
						<div class="estmate-form-group__content "><!--START 시공규모-->
							<div class="select-row">
								<div class="input-group select-input">
										<select class="form-control empty custom-select" name="bathroomNumberOfRooms">
											<option selected="" value="" disabled="">공용(거실)</option>
											<option value="0">공용 없음</option>
											<option value="1">공용 1개</option>
											<option value="2">공용 2개</option>
											<option value="3">공용 3개</option>
										</select>
								
												<span class="select-input__icon">
													<svg class="icon" width="10" height="10" style="fill:currentColor" preserveAspectRatio="xMidYMid meet"><path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path></svg>
												</span></div>
								<!-- <div class="input-group select-input">
										<select class="form-control empty custom-select" name="">
											<option selected="" value="" disabled="">소형(안방)</option>
											<option value="0">소형 없음</option>
											<option value="1">소형 1개</option>
											<option value="2">소형 2개</option>
											<option value="3">소형 3개</option>
										</select>
										<span class="select-input__icon">
												<svg class="icon" width="10" height="10" style="fill:currentColor" preserveAspectRatio="xMidYMid meet"><path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path></svg>
										</span>
								</div> -->
							</div><!--end select row-->
					</div><!--end 욕실개수-->
				</div><!--END group-->

				<div class="expert-form-group"><!--선호욕실선택-->
						<div class="expert-form-group__title">
							<div class="expert-form-group__title__label">어떤 욕실 유형을 선호하시나요?</div>
						</div>
						<div class="estmate-form-group__content "><!--START 선호욕실선택-->
							<div class="estmate-form-group__row">
								<div class="btn-group d-flex btn-group-toggle btn-block" data-toggle="buttons">
									  <label class="btn btn-mint active  ">
									    <input type="radio" name="bathroomType" id="bathtub" value="0" autocomplete="off">
									    <span class="img-box">
									    	<figure class="image-item">
									    		<div class="image-item img">
									    			<img class="box shadow rounded" src="/images/estimate/bathroom_01bathtub.jpg" alt="욕조형">
									    		</div>
									    		<figcaption class="bathroom_caption">욕조형</figcaption>
									    	</figure>
									    </span>
									  </label>
									  <label class="btn btn-mint ">
									    <input type="radio" name="bathroomType" id="showerbooth" value="
									    1" autocomplete="off"> 
									    <span class="img-box">
									    	<figure class="image-item">
									    		<div class="image-item img">
									    			<img class="box shadow rounded" src="/images/estimate/bathroom_02shower.jpg" alt="샤워부스형">
									    		</div>
									    		<figcaption class="bathroom_caption">샤워부스형</figcaption>
									    	</figure>
									    </span>
									  </label>
									  <label class="btn btn-mint">
									    <input type="radio" name="bathroomType" id="powder" value="2" autocomplete="off">
									    <span class="img-box">
									    	<figure class="image-item">
									    		<div class="image-item img">
									    			<img class="box shadow rounded" src="/images/estimate/bathroom_03powder.jpg" alt="파우더형">
									    		</div>
									    		<figcaption class="bathroom_caption">파우더형</figcaption>
									    	</figure>
									    </span>
									  </label>
								</div>
						</div>
					</div><!--end 선호욕실선택-->
				</div><!--END group-->
				<div class="expert-form-group"><!--선호천장-->
						<div class="expert-form-group__title">
							<div class="expert-form-group__title__label">어떤 천장 유형을 선호하시나요?</div>
						
						</div>
						<div class="estmate-form-group__content "><!--START 선호천장-->
							<div class="estmate-form-group__row">
								<div class="btn-group d-flex btn-group-toggle btn-block" data-toggle="buttons">
									  <div class="btn-group d-flex btn-group-toggle btn-block" data-toggle="buttons">
									  <label class="btn btn-mint active  ">
									    <input type="radio" name="bathroomCeiling" id="bathtub" value="0" autocomplete="off">
									    <span class="img-box">
									    	<figure class="image-item">
									    		<div class="image-item img">
									    			<img class="box shadow rounded" src="/images/estimate/bathroom__01lw.jpg" alt="리빙우드">
									    		</div>
									    		<figcaption class="bathroom_caption">리빙우드</figcaption>
									    	</figure>
									    </span>
									  </label>
									  <label class="btn btn-mint ">
									    <input type="radio" name="bathroomCeiling" id="showerbooth" value="1" autocomplete="off"> 
									    <span class="img-box">
									    	<figure class="image-item">
									    		<div class="image-item img">
									    			<img class="box shadow rounded" src="/images/estimate/bathroom__02smc.jpg" alt="SMC돔">
									    		</div>
									    		<figcaption class="bathroom_caption">SMC돔</figcaption>
									    	</figure>
									    </span>
									  </label>
								</div>
							</div>
						</div>
					</div><!--end 선호천장-->
				</div><!--END group-->

				<div class="expert-form-group"><!--시공장소-->
						<div class="expert-form-group__title">
							<div class="expert-form-group__title__label">타일은 어디에 시공할까요?</div>
						
						</div>
						<div class="estmate-form-group__content "><!--START 타일시공장소-->
							<div class="estmate-form-group__row">
								<div class="btn-group d-flex btn-group-toggle btn-block" data-toggle="buttons">
									  <label class="btn btn-mint form active  ">
									    <input type="radio" name="bathroomTile" id="wall" value="0" autocomplete="off" > 벽
									  </label>
									  <label class="btn btn-mint ">
									    <input type="radio" name="bathroomTile" id="floor" value="1" autocomplete="off"> 바닥
									  </label>
									  <label class="btn btn-mint ">
									    <input type="radio" name="bathroomTile" id="both" value="2" autocomplete="off"> 벽 + 바닥
									  </label>
								</div>
						</div>
					</div><!--end 타일시공장소-->
				</div><!--END group-->
			</div><!--END 욕실-->


<!--------------------------------------------주방------------------------------------------------------>
			<div class="estimate-wrap col-md-10 hide-contents" id="kitchen">
				<div class="expert-calculate__content__header">
					<h1 class="expert-calculate__content__header__title">주방 견적 요청</h1>
					<button class="expert-reset-button" type="reset"><svg class="reset-icon" viewBox="0 0 20 20" width="20" height="20" preserveAspectRatio="xMidYMid meet"><path fill="#757575" fill-rule="nonzero" d="M15.4 8.78a6.52 6.52 0 1 0-1.8 5.83.74.74 0 0 1 1.06 1.05 8 8 0 1 1 2.12-7.56l.87-2.12a.75.75 0 0 1 1.39.57l-1.9 4.57-4.57-1.9a.75.75 0 1 1 .58-1.38l2.26.94z"></path></svg>초기화</button>
				</div>
				
				<div class="expert-form-group"><!--주방타입선택-->
					<div class="expert-form-group__title">
						<div class="expert-form-group__title__label">어떤 형태의 싱크대를 시공하실 생각이세요?</div>
						<div class="expert-form-group__title__right">
							<button class="expert-form-group-detail-popup__toggle" type="button">더 알아보기</button>
						</div>
					</div>
					<div class="estmate-form-group__content "><!--START 싱크대선택-->
						<div class="estmate-form-group__row">
								<div class="btn-group d-flex btn-group-toggle btn-block" data-toggle="buttons">
									  <label class="btn btn-mint">
									    <input type="radio" name="kitchenType" id="straight" value="0" autocomplete="off">
									    <span class="img-box">
									    	<figure class="image-item">
									    		<div class="image-item img">
									    			<img class="box shadow rounded" src="/images/estimate/kitchen_01_1.png" alt="ㅡ형">
									    		</div>
									    		<figcaption class="bathroom_caption">ㅡ형</figcaption>
									    	</figure>
									    </span>
									  </label>
									  <label class="btn btn-mint ">
									    <input type="radio" name="kitchenType" id="giyeok" value="1" autocomplete="off"> 
									    <span class="img-box">
									    	<figure class="image-item">
									    		<div class="image-item img">
									    			<img class="box shadow rounded" src="/images/estimate/kitchen_01_2.png" alt="ㄱ형">
									    		</div>
									    		<figcaption class="bathroom_caption">ㄱ형</figcaption>
									    	</figure>
									    </span>
									  </label>
									  <label class="btn btn-mint">
									    <input type="radio" name="kitchenType" id="deigle" value="2" autocomplete="off">
									    <span class="img-box">
									    	<figure class="image-item">
									    		<div class="image-item img">
									    			<img class="box shadow rounded" src="/images/estimate/kitchen_01_3.png" alt="ㄷ형">
									    		</div>
									    		<figcaption class="bathroom_caption">ㄷ형</figcaption>
									    	</figure>
									    </span>
									  </label>
								</div>
						</div>
					</div><!--end 싱크대선택-->
				</div><!--END group-->

				<div class="expert-form-group"><!--가로사이즈선택-->
						<div class="expert-form-group__title">
							<div class="expert-form-group__title__label">싱크대 가로 사이즈(가장 긴 면)이 어떻게 되나요?</div>
							<div class="expert-form-group__title__right">
								<button class="expert-form-group-detail-popup__toggle" type="button">더 알아보기</button>
							</div>
						</div>
						<div class="estmate-form-group__content "><!--START 가로사이즈선택-->
							<div class="estmate-form-group__row">
								<div class="btn-group d-flex btn-group-toggle btn-block" data-toggle="buttons">
									  <label class="btn btn-mint">
									    <input type="radio" name="kitchenMaxWidth" id="240cm" value="0" autocomplete="off"> 240cm
									  </label>
									  <label class="btn btn-mint ">
									    <input type="radio" name="kitchenMaxWidth" id="320cm" value="1" autocomplete="off"> 320cm
									  </label>
									  <label class="btn btn-mint">
									    <input type="radio" name="kitchenMaxWidth" id="directInput" value="2" autocomplete="off"> 기타
									  </label>
									  								  
								</div>
						</div>
					</div><!--end 가로사이즈선택-->
				</div><!--END group-->
				
				<div class="expert-form-group"><!--상판유형선택-->
						<div class="expert-form-group__title">
							<div class="expert-form-group__title__label">상판 유형은 어떤 걸로 할까요?</div>
							<div class="expert-form-group__title__right">
								<button class="expert-form-group-detail-popup__toggle" type="button">더 알아보기</button>
							</div>
						</div>
						<div class="estmate-form-group__content "><!--START 상판선택-->
							<div class="estmate-form-group__row">
								<div class="btn-group d-flex btn-group-toggle btn-block" data-toggle="buttons">
									<label class="btn btn-mint ">
									    <input type="radio" name="kitchenCountertop" id="pt" value="0" autocomplete="off"> 
									    <span class="img-box">
									    	<figure class="image-item">
									    		<div class="image-item img">
									    			<img class="box shadow rounded" src="/images/estimate/kitchen_02_1.png" alt="PT">
									    		</div>
									    		<figcaption class="bathroom_caption">PT</figcaption>
									    	</figure>
									    </span>
									  </label>
									  <label class="btn btn-mint">
									    <input type="radio" name="kitchenCountertop" id="marble" value="1" autocomplete="off">
									    <span class="img-box">
									    	<figure class="image-item">
									    		<div class="image-item img">
									    			<img class="box shadow rounded" src="/images/estimate/kitchen_02_2.png" alt="인조대리석">
									    		</div>
									    		<figcaption class="bathroom_caption">인조대리석</figcaption>
									    	</figure>
									    </span>
									  </label>							  
								</div>
						</div>
					</div><!--end 상판유형선택-->
				</div><!--END group-->
				
				
				<div class="expert-form-group"><!--도어선택-->
						<div class="expert-form-group__title">
							<div class="expert-form-group__title__label">도어 유형은 어떤 걸로 할까요?</div>
							<div class="expert-form-group__title__right">
								<button class="expert-form-group-detail-popup__toggle" type="button">더 알아보기</button>
							</div>
						</div>
						<div class="estmate-form-group__content "><!--START 도어유형선택-->
							<div class="estmate-form-group__row">
								<div class="btn-group d-flex btn-group-toggle btn-block" data-toggle="buttons">
									  <label class="btn btn-mint">
									    <input type="radio" name="kitchenDoor" id="hi" value="0" autocomplete="off" > 하이그로시(유광)
									  </label>
									  <label class="btn btn-mint ">
									    <input type="radio" name="kitchenDoor" id="pet" value="1" autocomplete="off"> PET(무광)
									  </label>
									  <label class="btn btn-mint">
									    <input type="radio" name="kitchenDoor" id="heat" value="2" autocomplete="off"> 열전사
									  </label>
									  <label class="btn btn-mint">
									    <input type="radio" name="kitchenDoor" id="uv" value="3" autocomplete="off"> UV도장
									  </label>
									  <label class="btn btn-mint">
									    <input type="radio" name="kitchenDoor" id="tree" value="4" autocomplete="off"> 원목
									  </label>
								</div>
						</div>
					</div><!--end 도어유형선택-->
				</div><!--END group-->
				
				<div class="expert-form-group"><!--벽타일선택-->
						<div class="expert-form-group__title">
							<div class="expert-form-group__title__label">벽타일은 어떻게 하실 생각이세요?</div>
							<div class="expert-form-group__title__right">
								<button class="expert-form-group-detail-popup__toggle" type="button">더 알아보기</button>
							</div>
						</div>
						<div class="estmate-form-group__content "><!--START 벽타일선택-->
							<div class="estmate-form-group__row">
								<div class="btn-group d-flex btn-group-toggle btn-block" data-toggle="buttons">
									  <label class="btn btn-mint">
									    <input type="radio" name="kitchenTile" id="existing" value="0" autocomplete="off" >기존유지
									  </label>
									  <label class="btn btn-mint ">
									    <input type="radio" name="kitchenTile" id="change" value="1" autocomplete="off"> 교체시공
									  </label>
								</div>
						</div>
					</div><!--end 벽타일선택-->
				</div><!--END group-->

			</div>

<!--------------------------------------------타일------------------------------------------------------>
			<div class="estimate-wrap col-md-10 hide-contents" id="tile">
				<div class="expert-calculate__content__header">
					<h1 class="expert-calculate__content__header__title">타일 견적 요청</h1>
					<button class="expert-reset-button" type="reset"><svg class="reset-icon" viewBox="0 0 20 20" width="20" height="20" preserveAspectRatio="xMidYMid meet"><path fill="#757575" fill-rule="nonzero" d="M15.4 8.78a6.52 6.52 0 1 0-1.8 5.83.74.74 0 0 1 1.06 1.05 8 8 0 1 1 2.12-7.56l.87-2.12a.75.75 0 0 1 1.39.57l-1.9 4.57-4.57-1.9a.75.75 0 1 1 .58-1.38l2.26.94z"></path></svg>초기화</button>
				</div>
				<div class="expert-form-group"><!--타일선택-->
						<div class="expert-form-group__title">
							<div class="expert-form-group__title__label">어떤 항목을 시공받을 생각이세요?</div>
						</div>
						<div class="estmate-form-group__content "><!--START 시공타일선택-->
							<div class="estmate-form-group__row">
								<div class="btn-group d-flex btn-group-toggle btn-block" data-toggle="buttons">
									  <label class="btn btn-mint">
									    <input type="radio" name="tileType" value="0" id="kitchen"> 주방
									  </label>
									  <label class="btn btn-mint ">
									    <input type="radio" name="tileType" value="1" id="frontDoor"> 현관
									  </label>
									  <label class="btn btn-mint">
									    <input type="radio" name="tileType" value="2" id="balcony"> 발코니
									  </label>
									  <label class="btn btn-mint">
									    <input type="radio" name="tileType" value="3" id="floor"> 바닥
									  </label>
								</div>
						</div>
	 
					</div><!--end 타일선택-->

				</div><!--END group-->

				<div class="expert-form-group"><!--시공규모-->
						<div class="expert-form-group__title">
							<div class="expert-form-group__title__label">집 전체 면적이 어떻게 되나요?</div>
							<div class="expert-form-group__title__right">
								<button class="expert-form-group-detail-popup__toggle" type="button">더 알아보기</button>
							</div>
						</div>
						<div class="estmate-form-group__content "><!--START 집 면적-->
							<div class="input-group select-input">
								<select class="form-control empty custom-select" name="tileArea">
									<option selected="" value="" disabled="">면적</option>
										<option value="16">16m² (5평)</option>
										<option value="19">19m² (6평)</option>
										<option value="23">23m² (7평)</option>
										<option value="26">26m² (8평)</option>
										<option value="29">29m² (9평)</option>
										<option value="33">33m² (10평)</option>
										<option value="36">36m² (11평)</option>
										<option value="39">39m² (12평)</option>
										<option value="52">42m² (13평)</option>
										<option value="46">46m² (14평)</option>
										<option value="49">49m² (15평)</option>
										<option value="52">52m² (16평)</option>
										<option value="56">56m² (17평)</option>
										<option value="59">59m² (18평)</option>
										<option value="62">62m² (19평)</option>
										<option value="66">66m² (20평)</option>
										<option value="69">69m² (21평)</option>
										<option value="72">72m² (22평)</option>
										<option value="75">75m² (23평)</option>
										<option value="79">79m² (24평)</option>
										<option value="82">82m² (25평)</option>
										<option value="85">85m² (26평)</option>
										<option value="89">89m² (27평)</option>
										<option value="92">92m² (28평)</option>
										<option value="95">95m² (29평)</option>
										<option value="99">99m² (30평)</option>
										<option value="102">102m² (31평)</option>
										<option value="105">105m² (32평)</option>
										<option value="108">108m² (33평)</option>
										<option value="112">112m² (34평)</option>
										<option value="115">115m² (35평)</option>
										<option value="118">118m² (36평)</option>
										<option value="122">122m² (37평)</option>
										<option value="126">125m² (38평)</option>
										<option value="128">128m² (39평)</option>
										<option value="132">132m² (40평)</option>
										<option value="135">135m² (41평)</option>
										<option value="138">138m² (42평)</option>
										<option value="141">141m² (43평)</option>
										<option value="145">145m² (44평)</option>
										<option value="148">148m² (45평)</option>
										<option value="151">151m² (46평)</option>
										<option value="155">155m² (47평)</option>
										<option value="158">158m² (48평)</option>
										<option value="161">161m² (49평)</option>
										<option value="165">165m² (50평)</option>
										<option value="168">168m² (51평)</option>
										<option value="171">171m² (52평)</option>
										<option value="174">174m² (53평)</option>
										<option value="178">178m² (54평)</option>
										<option value="181">181m² (55평)</option>
								</select>
								<span class="select-input__icon">
									<svg class="icon" width="10" height="10" style="fill:currentColor" preserveAspectRatio="xMidYMid meet"><path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path></svg>
								</span>
							</div>
						</div><!--end select row-->
				</div><!--end group-->
			</div>
			



<!-------------------------------------------------추가문의------------------------------------------------------->
			<div class="expert-form-group">
				<div class="expert-form-group__title">
					<div class="expert-form-group__title__label">추가 문의사항이 있으시면 남겨주세요</div>
				</div>
				<div class="estmate-form-group__content "><!--START comment-->
					<div class="estmate-form-group__row">
						<textarea class="form-control form-rounded" rows="2" id="estimate_comment"></textarea>
					</div>
				</div><!--end comment-->
			</div><!--END group-->
			<sec:authorize access="isAuthenticated()">
			<input type="submit" class="btn btn-mint submit btn-block" value="견적 요청하기">
			</sec:authorize>
			<sec:authorize access="isAnonymous()">
			<input type="submit" class="btn btn-mint submit btn-block" value="로그인 후 이용 가능합니다." disabled>
			</sec:authorize>
<!---------------------------------------------------------------------------------------------------------------->

		</section><!--end section-->
	</div><!--end main row-->
</div>
</form><!--END form-->
</section>







<!--☆★☆★☆ ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 여기까지 수정가능 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ ★☆★☆★-->
<!-- ↓↓↓↓↓↓↓↓↓ 이 밑부분 터치ㄴㄴ ↓↓↓↓↓↓↓↓↓-->
<div class="empty-space"></div>

  </body>
</html>