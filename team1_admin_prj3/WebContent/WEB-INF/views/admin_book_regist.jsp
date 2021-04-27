<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    session="true"
    isELIgnored="false"
    %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%
 	request.setCharacterEncoding("UTF-8");  //request.setCharacterEncoding ->POST 방식에서만 적용된다.
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Book 등록</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/jsp_prj/common/css/main.css"/>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_admin_prj3/common/css/admin_main_design.css"/>
<style type="text/css">

   #registImage{  width: 200px; height: 500px;  padding-top:70px; float:left;  /* border: 1px solid #333; */ }
   #bookbutton{  width: 200px; height: 100px; padding: 10px; /* text-align: center; */ margin-left: 40px; }
   #registForm{  width: 400px; height: 500px; padding-left: 15px; padding-top:10px; margin-left: 220px;/*  border: 1px solid #333; */}
   #registButton{height: 100px; margin-left: 350px;}
   #subjectText{ font-size: 15px;  font-weight: bold;}
   #form-group col-md-4{ width: 200px;}
   
   
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script type="text/javascript">
$(function(){

	$("#bookInsert").click(function(){
		
    	if($("#title").val() == ""){
            alert("제목 입력바람");
            $("#title").focus();
            return;
    	}
		
		//JavaScript로 charset Encoding 함수 : encodeURI()
		
		/* var formData1 = new FormData();
		formData.append("img", encodeURI( $("#img").val() ));
		formData.append("category_code", encodeURI( $("#category_code").val() ));
		formData.append("book_code", encodeURI( $("#book_code").val() ));
		formData.append("title", encodeURI( $("#title").val() ));
		formData.append("author", encodeURI( $("#author").val() ));
		formData.append("translator", encodeURI( $("#translator").val() ));
		formData.append("company", encodeURI( $("#company").val() ));
		formData.append("sale_class", encodeURI( $("#sale_class").val() ));
		formData.append("sale_state", encodeURI( $("#sale_state").val() ));
		formData.append("intro", encodeURI( $("#intro").val() ));
		formData.append("review", encodeURI( $("#review").val() ));
		formData.append("author_intro", encodeURI( $("#author_intro").val() ));
		formData.append("book_index", encodeURI( $("#book_index").val() ));
		formData.append("sale_price", encodeURI( $("#sale_price").val() ));
		formData.append("rental_price", encodeURI( $("#rental_price").val() )); */
		
		/* var param="img="+encodeURI( $("#img").val() ) +"&category_code="+encodeURI( $("#category_code").val() )+"&book_code="+encodeURI( $("#book_code").val() )
					+"&title="+encodeURI( $("#title").val() ) +"&author="+encodeURI( $("#author").val() ) +"&translator="+encodeURI( $("#translator").val() ) 
					+"&company="+encodeURI( $("#company").val() ) +"&sale_class="+encodeURI( $("#sale_class").val() ) +"&sale_state="+encodeURI( $("#sale_state").val() ) 
					+"&intro="+encodeURI( $("#intro").val() ) +"&review="+encodeURI( $("#review").val() ) +"&author_intro="+encodeURI( $("#author_intro").val() ) 
					+"&book_index="+encodeURI( $("#book_index").val() ) +"&sale_price="+encodeURI( $("#sale_price").val() ) +"&rental_price="+encodeURI( $("#rental_price").val() );  */
					
		var form = document.getElementById('bookUpdate');
		//FormData parameter에 담아줌
		form.method = "POST";
		form.enctype = "multipart/form-data";
		
		var formData = new FormData(form);
		alert(formData);
					
		$.ajax({
			url:"admin_book_regist_process.do",
			type:"post",
			enctype: 'multipart/form-data',
			processData: false,
            contentType: false,
			data: formData,
			dataType: "json",
			error: function(xhr) {
				alert("상품 등록에 실패하였습니다. 잠시후 다시 시도해 주세요");
				console.log("에러코드 : "+xhr.status);
				console.log("에러메세지 : "+xhr.statusText);
			},
			success: function( json_obj ){
				//alert(json_obj);
				var flag=json_obj.insertResult;
				if( flag ) {
				    alert("상품 등록에 성공하였습니다.");
				    location.href="admin_book_list.do";
				    
				}else{
				    alert("상품 등록에 실패하였습니다.");
				}//end if
			}
		})//ajax
	});//click
	
	//이미지를 선택 했을 때 유효성을 확인하고 화면에 보여주는 JavaScipt 시작
	$("#upfile").on("change", handleImgFileSelect1);
	var sel_file1;
	function handleImgFileSelect1(e){
		////////// 이미지 유효성 확인 시작 //////////
		var upfile=$("#upfile").val();
		/* 보안의 이슈가 있기때문에 파일은 alert창만 띄워줌 */
		if(upfile=="") {
			alert("파일을 선택해주세요");
			return;
		}//end if
		
		//확장자가 java, class, jsp, xml은 업로드를 막기
		//서버에서 실행될 수 있는 언어는 업로드를 제한한다
		var blockExt=["java","class","jsp","xml"]; 
		//확장자
		var ext=$("#upfile").val().split("."); //"."을 기준으로 배열방 만듦
		var extFlag=false;
		extTemp=ext[ext.length-1].toLocaleLowerCase(); /* . 으로 나눠져 구성된 배열 중 마지막방 */
		for(var i=0; i < blockExt.length ; i++) {
			if( blockExt[i]==extTemp) {
				extFlag=true;
				break;
			}//end if
		}//end for
		
		if(extFlag) {
			alert(ext+"는 업로드 불가능한 파일 입니다.");
			return;
		}//end if
		
	   var files = e.target.files;
	   /* console.log(files[0]); */
	   var fileArr = Array.prototype.slice.call(files);
	   
	   fileArr.forEach(function(f){
	      if(!f.type.match("image.*")){
	         alert("확장자는 이미지 확장자만 가능합니다.");
	         return;
	      }//end if
	      
	      sel_file1 = f;
	      
          //////////이미지 화면에 보여주기 //////////
	      var reader = new FileReader();
	      reader.onload = function(e){
	         $("#viewImg").attr("src", e.target.result);
	      }
	      reader.readAsDataURL(f);
	   });
	}//handleImgFileSelect
	//이미지를 선택 했을 때 유효성을 확인하고 화면에 보여주는 JavaScipt 시작
	
});//ready

</script>
</head>
<body>
<div id="books">

<div id="header">

 <%@ include file="../../common/jsp/admin_include_header.jsp" %>
   
</div> <!-- header 끝 -->

<div id="container">

	<div id="snb">
	
	 <%@ include file="../../common/jsp/admin_include_snb_ebook_list.jsp" %>
	
	</div>

	<div id="content">
		
	<h6>e-book 관리 > e-book 등록</h6>
	<h3>| e-book 등록</h3>
	<br/>

		<form action="admin_book_regist_process.do"  id="bookUpdate" name="bookUpdate" method="post" enctype="multipart/form-data"> <!-- enctype ... -->
		<div id="bookResist"> 
		<div style="margin-left: 300px">
		
			<div id="registImage">
				<img id="viewImg"src="http://localhost:8080/team1_admin_prj3/common/images/book/noImg.jpg" width="200px" height="250px"/>
				
			    <!-- RFC 1867 HTML Form 기반의 파일 업로드 -->
				<input type="file" name="upfile" id="upfile" class="inputBox"  style="width: 200px; margin-top: 15px;"><br/>
				<input type="hidden" id="img" name="img"/>

			</div> <!-- registImage 끝 -->
			
			<div id="registForm">
			
		  		<div class="form-row">
			    	<div class="form-group col-md-4">
			    	<label><span id="subjectText">카테고리</span></label> 
				      <select id="category_code" name="category_code" class="form-control" style="width:200px;">
				        <option value="BC_000001"><c:out value="소설"/></option> <!-- 보이기엔 뒤가 넘어가고 실제로는 앞이 넘어감 -->
						<option value="BC_000002"><c:out value="경영/경제"/></option> 
						<option value="BC_000003"><c:out value="인문/사회/역사"/></option> 
						<option value="BC_000004"><c:out value="자기계발"/></option> 
						<option value="BC_000005"><c:out value="에세이/시"/></option> 
						<option value="BC_000006"><c:out value="여행"/></option> 
						<option value="BC_000007"><c:out value="컴퓨터/IT"/></option> 
						<option value="BC_000008"><c:out value="건강/다이어트"/></option> 
						<option value="BC_000009"><c:out value="경제"/></option> 
				      </select>
				    </div>
				  </div>
				 
				 <div class="form-row">
					<div class="form-group col-md-6">
					<label><span id="subjectText">도서명</span></label> 
			      		<input type="text" class="form-control" id="title" name="title" style="width:380px;">
			    	</div>  
		  		</div>
		  		
				<div class="form-row">
					<div class="form-group col-md-6">
				  		<label><span id="subjectText">저자</span></label> 
				  		<input type="text" class="form-control" id="author"  name="author" >
			  		</div> 
					<div class="form-group col-md-6">
				  		<label><span id="subjectText">번역</span></label> 
				  		<input type="text" class="form-control" id="translator"  name="translator" >
			  		</div> 
		  		</div>
		  		
				<div class="form-row">
			  		<div class="form-group col-md-6">
			  			<label ><span id="subjectText">출판사</span></label>
			      		<input type="text" class="form-control" id="company"  name="company" >
			    	</div>  
			    	
				    <div class="form-group col-md-6">
				  		<label><span id="subjectText">출간일</span></label> 
				  		<input type="text" class="form-control" id="pub_date"  name="pub_date" >
			  		</div> 
				    
			  	</div>
			  	
				<div class="form-row">
				
				    <div class="form-group col-md-4">
				      <label for="inputState"><span id="subjectText">판매분류</span></label>
				      <select id="sale_class"  name="sale_class"  class="form-control" style="width:100px;">
						<option value="p/r"><c:out value="전체"/></option>
						<option value="p"><c:out value="구매"/></option>
						<option value="r"><c:out value="대여"/></option>
				      </select>
				    </div>
				    
				    <div class="form-group col-md-4">
			      	  <label for="bookPrice"><span id="subjectText">판매가격</span></label>
			          <input type="text" class="form-control" id="sale_price" value="0" name="sale_price"  style="width:100px;">
			    	</div>
			    	
			    	<div class="form-group col-md-4">
			      	  <label for="bookPrice"><span id="subjectText">대여가격</span></label>
			          <input type="text" class="form-control" id="rental_price" value="0" name="rental_price" style="width:100px;">
			    	</div>
				    
			  	</div>
			
			</div> <!-- registForm 끝 -->
			</div>
		</div> <!-- bookResist 끝 -->

	  <div class="form-group">
	    <label for="exampleFormControlTextarea1">책 소개</label>
	    <textarea class="form-control" id="intro"  name="intro"  style="height: 300px">
	    </textarea>
	  </div>
	  
	  <div class="form-group">
	    <label for="exampleFormControlTextarea1">출판사 서평</label>
	    <textarea class="form-control" id="review"  name="review"  style="height: 300px">
	    </textarea>
	  </div>
	  
	  <div class="form-group">
	    <label for="exampleFormControlTextarea1">저자 소개(프로필)</label>
	    <textarea class="form-control" id="author_intro"  name="author_intro"  style="height: 300px">
	    </textarea>
	  </div>
	  
	  <div class="form-group">
	    <label for="exampleFormControlTextarea1">목차</label>
	    <textarea class="form-control" id="book_index"  name="book_index" style="height: 150px">
	    </textarea>
	  </div>
	
		<div id="registButton" style="margin-left: 500px;">
		<input type="button" class="btn btn-primary btn-lg" id="bookInsert" value="등록"/>
		</div>
	</form>
	</div><!-- content 끝 -->


</div> <!-- container 끝 -->


<div id="footer">

 <%@ include file="../../common/jsp/admin_include_footer.jsp" %>

</div>
</div>
</body>
</html>