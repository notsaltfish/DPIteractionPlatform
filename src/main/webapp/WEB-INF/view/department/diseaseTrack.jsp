
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blueprint: Vertical Timeline</title>
    <meta name="description" content="Blueprint: Vertical Timeline" />
    <meta name="keywords" content="timeline, vertical, layout, style, component, web development, template, responsive" />
    <meta name="author" content="Codrops" />
    <link rel="shortcut icon" href="../favicon.ico">
    <link rel="stylesheet" type="text/css" href="/css/default.css" />
    <link rel="stylesheet" type="text/css" href="/css/component.css" />
    <script src="/js/modernizr.custom.js"></script>
</head>
<body>
<div class="container">
    <header class="clearfix">
        <span><h1>病情跟踪</h1></span>
        <span>DiseaseTrack</span>

    </header>
    <div class="main">
        <ul class="cbp_tmtimeline">
            <c:forEach items="${dataList}" var="o" varStatus="status">
            <li>
                <time class="cbp_tmtime" datetime="${o.date}"><span><fmt:formatDate value="${o.date}" pattern="MM-dd"></fmt:formatDate></span></time>
                <div class="cbp_tmicon cbp_tmicon-phone"></div>
                <div class="cbp_tmlabel">
                    <h2>${o.icdName}</h2>
                    <p>${o.description}</p>
                </div>
            </li>
            </c:forEach>

        </ul>
    </div>
</div>
</body>
</html>

