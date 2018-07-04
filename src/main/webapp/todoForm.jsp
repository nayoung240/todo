<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TODO LIST</title>
<style>
body {
	background-color: #ececec;
}

header {
	padding-top: 30px;
	height: 60px;
	width: 960px;
	background-color: white;
	text-align: center;
	margin: 0 auto;
}

header strong {
	font-size: 1.6rem;
}

section {
	background-color: white;
	min-height: 370px;
	height: auto;
	width: 960px;
	margin: 0 auto;
}

form {
	margin: 0 auto;
	width: 32rem;
	height: 325px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

#what {
	width: 32rem;
	height: 2rem;
	font-size: 1.5rem;
	margin-top: 5px;
}

#who {
	width: 15rem;
	height: 2rem;
	font-size: 1.5rem;
	margin-top: 5px;
}

#back a{
text-decoration: none;
color: black;
}

.radiodiv {
	width: 16rem;
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}

.button button {
	width: 6rem;
	height: 2rem;
	background-color: white;
	border: 1px solid gray;
}

.rbutton {
	float: right;
}

.rbutton button {
	background-color: deepskyblue;
	color: white;
}
</style>
</head>
<body>
  <header>
      <strong>할일 등록</strong>
    </header>
   <section>
    <form action="/Todo/add" method="post">
    <div>
        <label for="what">어떤일인가요?</label><br>
        <input type="text" id="what" name="what" maxlength="24"/>
    </div>
    <div>
        <label for="who">누가 할일인가요?</label><br>
        <input type="text" id="who" name="who"/>
    </div>
    <div>
        <label for="sequence">우선순위를 선택하세요</label><br>
        <div class="radiodiv">
        <label for="first"><input type="radio" name="sequence" id="first" value=1>1순위</label>
        <label for="second"><input type="radio" name="sequence" id="second" value=2>2순위</label>
        <label for="third"><input type="radio" name="sequence" id="third" value=3>3순위</label>
        </div>


    </div>
     <div class="button">
        <button id="back"><a href="/Todo/main">&#60;이전</a></button>
        <div class="rbutton">
	        <button type="submit">제출</button>
	        <button type="reset">내용지우기</button>
        </div>
    </div>
</form>
   </section>
</body>
</html>