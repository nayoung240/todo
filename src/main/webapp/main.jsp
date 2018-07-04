<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TODO LIST</title>
    <style>
    	html, body{
    		height: -webkit-fill-available;
    	}
    	
        body {
            background-color: #ececec;
        }

        header {
            height: 6rem;
            width: 60rem;
            background-color: white;
            margin: 0 auto;

        }

        section {
            background-color: white;
            min-height: 500px;
            height: inherit;
            width: 60rem;
            margin: 0 auto;
        }

        #ltoph1 {
            transform: rotate(-30deg);
            position: absolute;
            top: 47px;
            font-size: 1.5rem;
            color: darkcyan;
            display: inline-block;

        }

        .headul {
            float: right;
            margin-top: 40px;
            margin-bottom: 40px;
            margin-right: 15px;
        }

        .headul li {
            list-style: none;
            background-color: deepskyblue;
            width: 12rem;
            height: 2rem;
        }

        .headul a {
            text-decoration: none;
            display: block;
            text-align: center;
            padding-top: 5px;
            color: white;
        }


        .tododiv {
            list-style: none;
            float: right;
            display: flex;
        }

        .tododiv div:nth-child(1) {
            padding-right: 8px;
        }

        .tododiv div:nth-child(2) {
            padding-right: 8px;
        }

        .tododiv div:nth-child(3) {
            padding-right: 8px;
        }

        .tododiv li {
            margin-bottom: 8px;
        }

        .toprow {
            display: flex;
            align-items: center;
            width: 18rem;
            height: 4rem;
            background-color: darkcyan;
        }

        .toprow strong {
            margin-left: 10px;
            color: white;
            font-size: 1.3rem;
        }

         .addrow {
            display: flex;
            flex-direction: column;
            justify-content: center;
            width: 18rem;
            height: 6rem;
            background-color: skyblue;
        }
		
        .addrow strong {
            font-size: 1.2rem;
            margin: 10px 10px 0px;
        }

        .addrow span {
            color: darkcyan;
            margin: 10px;
            font-size: 0.85rem;
        }

        .addrow button {
            float: right;
        }
 
    </style>
</head>
<body>
 <header>
        <div id="ltoph1">
            <strong>나의 해야할 일들</strong>
        </div>
        <ul class="headul">
            <li><a href="todoForm.jsp">새로운 TODO 등록</a></li>
        </ul>
    </header>
    <section>
        <div class="tododiv">
            <div class="todoindiv">
                <li class="toprow">
                    <strong>TODO</strong>
                </li>
                <c:forEach var="list" items="${list}">
                	<c:if test="${list.type=='TODO'}">
                	<fmt:parseDate value='${list.regdate}' var='date' pattern="yyyy-MM-dd H:m" />
	                <li class="addrow">
	                <c:set var="id" value="${list.id}" scope="request"/>
	                <c:set var="type" value="${list.type}" scope="request"/>
	                    <strong>${list.title}</strong>
		                    <span>등록날짜: <fmt:formatDate value="${date}" pattern="yyyy.MM.dd"/>, ${list.name},우선순위 ${list.sequence}
		                    	<button class="movebtn"  type="button" value="next" >&rarr;</button>
							 </span>
	                </li>
                	</c:if>
                </c:forEach> 
            </div>
            <div class="doingindiv">
                <li class="toprow">
                    <strong>DOING</strong>
                </li>
                 <c:forEach var="list" items="${list}">
                	<c:if test="${list.type=='DOING'}">
                	<fmt:parseDate value='${list.regdate}' var='date' pattern="yyyy-MM-dd H:m" />
	                
	                <li class="addrow">
	                    <strong>${list.title}</strong>
		                    <span>등록날짜: <fmt:formatDate value="${date}" pattern="yyyy.MM.dd"/>, ${list.name},우선순위 ${list.sequence}
		                    	<button class="movebtn"  type="button" value="next">&rarr;</button>
		                    </span>		             
	                </li>
                	</c:if>
                </c:forEach> 
            </div>
            <div class="doneindiv">
                <li class="toprow">
                    <strong>DONE</strong>
                </li>
                 <c:forEach var="list" items="${list}">
                	<c:if test="${list.type=='DONE'}">
                	<fmt:parseDate value='${list.regdate}' var='date' pattern="yyyy-MM-dd H:m" />
	                <li class="addrow">
	                    <strong>${list.title}</strong>
		                    <span>등록날짜: <fmt:formatDate value="${date}" pattern="yyyy.MM.dd"/>, ${list.name},우선순위 ${list.sequence}
		                    	<button class="movebtn"  type="button" value="next">&rarr;</button>
		                    </span>
	                </li>
                	</c:if>
                </c:forEach> 
            </div>

        </div>
    </section>
    <script>
    var xmlHttp;
	var id=parseInt("${id}");
	var type="${type}";
	
    function createXMLHttpRequest() {
        if (window.ActiveXObject) {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        } 
        else if (window.XMLHttpRequest) {
            xmlHttp = new XMLHttpRequest();
        }
    }
        
    function startRequest() {
        createXMLHttpRequest();
        xmlHttp.onreadystatechange = handleStateChange;
      //TodoTypeServlet에게 Todo의 Id와 상태 값을 전달
        xmlHttp.open("POST", "/Todo/type", true);
        xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xmlHttp.send("id="+id+"&type="+type);
    }
        
    function handleStateChange() {
        if(xmlHttp.readyState == 4) { //응답처리가 끝나면
            if(xmlHttp.status == 200) { //정상일 때

            	console.log("!!!!");
            	
            	var tododiv=document.querySelector(".todoindiv");
            	var doingdiv=document.querySelector(".doingindiv");
            	var donediv=document.querySelector(".doneindiv");

            	var addrow=document.querySelector(".addrow");
            	tododiv.removeChild(addrow);
            	doingdiv.insertAdjacentHTML('beforeend',addrow.outerHTML);
        	        	
            }
            else{
    			alert('error!!');
    		}
        }
    }
    //var btn=document.querySelector(".todoindiv .movebtn");
    var btn=document.querySelector("button.movebtn");
    btn.addEventListener("click", function(e){
    	startRequest();
    });

    </script>
</body>