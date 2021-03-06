<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Index Page</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">

    </head>
    <body>
        <div class="container">
            <h1>Flooring Calculator</h1>
            <hr/>
            <div class="navbar">
                <ul class="nav nav-tabs">
                    <li role="presentation"><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
                    <li role="presentation"  class="active"><a href="${pageContext.request.contextPath}/displayFlooring">Flooring Calculator</a></li>
                </ul>    
            </div>
                <h2 style="text-align: center">Welcome to The Flooring Calculator!</h2><br>
            <h4 style="text-align: center">A few questions to set everything up...</h4><br>

            <p style="text-align: center">Enter the Width of the area to be covered in square feet:</p>
            <form style="text-align: center" action="submitFlooring" method="POST">
                <input type="text" name="width"/>
                <p style="text-align: center">Enter the Length of the area to be covered in square feet:</p>
                <input type="text" name="length"/>
                <p style="text-align: center">Enter the Cost of the Product per square foot:</p>
                <input type="text" name="costPSF"/><br/>
                <button type="submit" class="btn btn-primary">Submit</button>

            </form>
        </div>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    </body>
</html>
