<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<style>
        body {
            margin: 10px;
            padding: 10px;
            font-family: Arial, sans-serif;
            
        }

        #top {
            padding: 20px;
            margin: 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        #content {
            display: flex;
            justify-content: space-around;
            padding: 20px;
        }

        #left, #center, #right {
            padding: 10px;
            border: 1px solid #ddd;
            margin: 10px;
        }

        #left, #right {
            flex: 1;
        }

        #center {
            flex: 2; /* #center를 두 배 크기로 설정 */
        }

        #footer {
            background-color: #f2f2f2;
            padding: 10px;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
		 #navigation {
            font-size: 20px;
            font-weight: bold;
        }

        .menu-item {
            margin-top: 10px;
            align-items: center;
        }
		.img-box {
    width: 150px;
    height: 150px; 
    border-radius: 70%;
    overflow: hidden;
}
.image_container{
	width: 150px;
    height: 150px; 
    border-radius: 70%;
    overflow: hidden;
}

.profileImg {
  width: 150px;
  height: 150px;
  object-fit: cover;
  
}
 
	</style>
	<head>
 		<meta charset="UTF-8">
		<title>lifeMosaic</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" 
      	rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

	</head>
	<body>
		<div id="top">
				<c:url var="homePage" value="/" />
	 				  <a href="${homePage}">
			        <img alt="라이프 모자이크 로고" src="../img/logo.png" style="width:130px; height:38px"/>
			    </a>
			    
			 
		</div>
		 	
		<hr>

	<div class="container-fluid">
		<div id="content">
			<div id="left">
				<%@ include file="../fragments/settingNavigation.jspf"%>
			</div>
			<!-- 닉네임 변경 영역 -->
			<div id="center">
				<p class="text-center" style="font-size: 25px; font-weight: bold;">
					<svg xmlns="http://www.w3.org/2000/svg" style="font-size: 25px;"
						width="20" height="20" fill="currentColor"
						class="bi bi-person-circle" viewBox="0 0 16 16">
							  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
							  <path fill-rule="evenodd"
							d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1" />
							  </svg>
					프로필
				</p>
				<hr>
				<div class="input-group mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default">아이디</span>
					<input type="text" class="form-control" id="user_id" name="user_id"
						value="${user.user_id }" aria-label="Sizing example input"
						aria-describedby="inputGroup-sizing-default">
				</div>
				<div id="limitUserId">
					<!-- 아이디는 변경 불가라는 이미지 띄우기 -->
				</div>
				<hr>
				<div class="input-group mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default">이메일</span>
					<input class="form-control" id="email" type="text" name="email"
						value="${user.email }" aria-label="Sizing example input"
						aria-describedby="inputGroup-sizing-default">

				</div>
				<div id="limitEmail">
					<!-- 이메일은 변경 불가라는 이미지 띄우기 -->
				</div>
				<hr>


				<!-- 닉네임 변경 -->
					<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">닉네임</span>
						<input type="hidden" name="user_id" id="user_id" value="${user.user_id}">
						 <input class="form-control"name="nickname" id="nickname" type="text"	value="${user.nickname }" required aria-label="Sizing example input"aria-describedby="inputGroup-sizing-default">
						<button type="button" class="btn btn-secondary"	name="btnCheckNickname" id="btnCheckNickname">중복 확인</button>
					</div>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<button class="btn btn-dark" name="btnUpdateNickname" id="btnUpdateNickname" type="submit">저장</button>
					</div>
				</form>
			</div>


			<!-- 프로필 이미지 변경 영역 -->
			<div id="right">
				<p class="text-center" style="font-size: 20px; font-weight: bold;">
					프로필 사진</p>
					<div class="my-2 card">
						<div class="my-2 img-box mx-auto">
							<c:url var="settingImgPage" value="/setting/settingImg" />
							<img class="profileImg mx-auto" src="${settingImgPage}?fileName=${user.profile_url}" name="profileImg" id="profileImg" alt="프로필 사진">
						</div>
							
				<c:url var="updateImgPage" value="/setting/updateImg"></c:url>
				<form action="${updateImgPage}" method="post" enctype="multipart/form-data" >
						 <input type="file" id="profile" name="profile" accept="image/*" onchange="setThumbnail(event);" />
							<input type="hidden" name="profile_url" id="profile_url" value="${user.profile_url}">
							<input type="hidden" name="user_id" id="user_id" value="${user.user_id}">
							<button type="submit" class="btn btn-secondary" style="margin-left: auto;">변경</button>
				</form>
				<c:url var="settingBasicImg" value="/setting/settingBasicImg" />
				<form action="${settingBasicImg}"  >
					
					<input type="hidden" name="user_id" id="user_id" value="${user.user_id}">
					<button type="submit" class="btn btn-secondary"  style="margin-left: 10px;">기본 변경</button>
					
				</form>

					</div>
			</div>
		</div>
	</div>

	<script>
		var img = null;
		function setThumbnail(event) {
			var reader = new FileReader();
			if (!img) {
				img = document.createElement("img");

			}

			reader.onload = function(event) {
				img.setAttribute("src", event.target.result);
				img.setAttribute("class", "img-box");
				document.querySelector("div#image_container").appendChild(img);

			};

			reader.readAsDataURL(event.target.files[0]);
		}
	</script>
	
						  	
    	
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
       integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
       <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
		<script src="../js/profile-modify.js"></script>
		
	</body>
</html>