<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
 a:link { color: red; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}
</style>
</head>
<body>


${user_id }<br>
${gender }


<a href="insertmatchqna.do">내 질문 만들기</a>
<div class="container" style = "width : 500pt; height : 100pt;">  
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
   

    <!-- Wrapper for slides -->
    
    <div class="carousel-inner">
    
      <div class="item active">
        <div class="container"> 
        <a href="selectmatchqna.do">          
  <table class="table"style=" width : 200pt; position:relative; left:170px;">
    <thead>
      <tr>
        <th colspan="3"style="height : 200pt">사진
        <div>[이름][등급]</div> 
        <div style = "font-size: 5pt; color : gray">나이,혈액형,지역<div>
        </th>
        
      </tr>
    </thead>
    
    <tbody>
      <tr>
        <td>키,몸무게,스타일</td>
      </tr>
      <tr>
        <td  >종교</td>
      </tr>
      <tr>
        <td>평점 : ★★★★★</td>
      </tr>
    </tbody>
  </table>
  </a>
</div>
      </div>


</div>


    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
</body>
</html>