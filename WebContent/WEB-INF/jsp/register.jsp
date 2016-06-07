<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="templates/navbar.jsp" %>
        <div class=container>
            <div class="row">
                <div class="col-sm-4 col-sm-offset-4">
                    <div class="login-form">
                        <form:form method="POST" action="/WebsiteProject/register" class="form-horizontal" role="form">
                            <c:if test="${not empty error}">
                                <div class="alert alert-danger text-center">
                                    <p><c:out value='${error}' /></p>
                                </div>
                            </c:if>
                            <div class="input-group input-sm">
                                <label class="input-group-addon" for="username"><i class="fa fa-user"></i></label>
                                <input type="text" name="username" class="form-control" id="username" placeholder="Username" required />
                            </div>
                            <div class="input-group input-sm">
                                <label class="input-group-addon" for="password"><i class="fa fa-lock"></i></label> 
                                <input type="password" name="password" class="form-control" id="password" placeholder="Password" required />
                            </div>
                                 
                            <div class="form-actions col-sm-4 col-sm-offset-4">
                                <input type="submit"
                                    class="btn btn-block btn-primary btn-default" value="Register">
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>