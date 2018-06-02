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
            height: 6rem;
            width: 960px;
            background-color: white;
            margin: 0 auto;

        }

        section {
            background-color: white;
            min-height: 500px;
            height: auto;
            width: 960px;
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
            margin-left: 10px;
        }

        .addrow span {
            color: darkcyan;
            margin-left: 10px;
        }

        .addrow button {
            float: right;
            margin-right: 10px;
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
                <li class="addrow">
                    <strong>asdasd</strong>
                    <span>asdasd<button>&rarr;</button></span>
                </li>
            </div>
            <div class="doingindiv">
                <li class="toprow">
                    <strong>DOING</strong>
                </li>
            </div>
            <div class="doneindiv">
                <li class="toprow">
                    <strong>DONE</strong>
                </li>
            </div>

        </div>

    </section>
</body>
</html>