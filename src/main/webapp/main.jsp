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
        
		.tododiv > ul{
			 padding-left: 0px; padding-right: 10px;
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
 
 		.type, .id{
 			display: none;
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
            <ul class="todoindiv">
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
		                    	<span class="type">${list.type}</span>
							 	<span class="id">${list.id}</span>
							 </span>
	                </li>
                	</c:if>
                </c:forEach> 
            </ul>
            <ul class="doingindiv">
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
							 	<span class="id">${list.id}</span>
		                    </span>		             
	                </li>
                	</c:if>
                </c:forEach> 
            </ul>
            <ul class="doneindiv">
                <li class="toprow">
                    <strong>DONE</strong>
                </li>
                 <c:forEach var="list" items="${list}">
                	<c:if test="${list.type=='DONE'}">
                	<fmt:parseDate value='${list.regdate}' var='date' pattern="yyyy-MM-dd H:m" />
	                <li class="addrow">
	                    <strong>${list.title}</strong>
		                    <span>등록날짜: <fmt:formatDate value="${date}" pattern="yyyy.MM.dd"/>, ${list.name},우선순위 ${list.sequence}
		                    </span>
	                </li>
                	</c:if>
                </c:forEach> 
            </ul>

        </div>
    </section>
    <script>
    
    function ajaxTodo(id, type, addrow) {
           
    	var oReq = new XMLHttpRequest();
    		
    	oReq.addEventListener("load", function() {
          	console.log("doing으로 이동");
        	
         	var tododiv=document.querySelector(".todoindiv");
           	var doingdiv=document.querySelector(".doingindiv");
        	
         	//카드 이동
        	tododiv.removeChild(addrow);
        	doingdiv.insertAdjacentHTML('beforeend',addrow.outerHTML);
    	 });
          
    	  oReq.open("POST", "/Todo/type", true);
    	  oReq.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    	  oReq.send("id="+id+"&type="+type);
    	}

    var todoul = document.querySelector(".todoindiv");
    todoul.addEventListener("click",function(e) {
        if (e.target.tagName === "BUTTON") {
        	var id=e.target.parentElement.querySelector(".id").innerText;
        	console.log(id);
        	var type="TODO";
        	var addrow=e.target.parentElement.parentElement;
        	ajaxTodo(id, type, addrow);
        }
    });

    function ajaxDoing(id, type, addrow) {
        
    	var oReq = new XMLHttpRequest();
 		
 	  oReq.addEventListener("load", function() {
       	console.log("done으로 이동");

     	var doingdiv=document.querySelector(".doingindiv");
     	var donediv=document.querySelector(".doneindiv");
     	
     	var span=addrow.children[1];
     	var moveBtn=span.children[0];
		
     	//이동 버튼 삭제
     	span.removeChild(moveBtn);
     	//카드 이동
     	doingdiv.removeChild(addrow);
     	donediv.insertAdjacentHTML('beforeend',addrow.outerHTML);
 	  });
       
 	  oReq.open("POST", "/Todo/type", true);
 	  oReq.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
 	  oReq.send("id="+id+"&type="+type);
 	}
    
    var doingUl=document.querySelector(".doingindiv");
    doingUl.addEventListener("click",function(e) {
        if (e.target.tagName === "BUTTON") {
         	var id=e.target.parentElement.querySelector(".id").innerText;
        	console.log(id);
        	var type="DOING";
        	var addrow=e.target.parentElement.parentElement;
        	ajaxDoing(id, type, addrow); 
        }
    });
    
    </script>
</body>