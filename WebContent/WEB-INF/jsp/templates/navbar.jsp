<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page isELIgnored="false" %>

<head>
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet" href="<c:url value="/resources/css/styles.css" />">
	<script src="<c:url value="/resources/js/functions.js" />"></script>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.css" />
</head>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
        <sec:authorize access="isAnonymous()">
	        <li>
	        	<a href="#" data-toggle="modal" data-target="#login">Login</a>
					</li>
	        <li>
						<a href="#" data-toggle="modal" data-target="#register">Register</a>
					</li>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
        	<li>
        		<form:form method="POST" action="/WebsiteProject/logout" class="form-horizontal" role="form">
        			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        			<button type="submit" class="btn btn-link">Logout</button>
        		</form:form>                  
        	</li>
        </sec:authorize>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>


<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                       <span aria-hidden="true">&times;</span>
                       <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title">
                    Login
                </h4>
            </div>
            
            <!-- Modal Body -->
            <div class="modal-body">
            		<c:url var="loginUrl" value="/login" />
                <form method="POST" action="${loginUrl}" class="form-horizontal" role="form">
                  <div class="form-group">
                    <label class="col-sm-3 control-label" for="username" >Username</label>
                    <div class="col-sm-9">
                    		<input type="text" name="ssoId" class="form-control" id="username" placeholder="Username"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-3 control-label" for="password" >Password</label>
                    <div class="col-sm-9">
                    		<input type="password" name="password" class="form-control" id="password" placeholder="Password"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-9">
                    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                      <input name="submit" value="Login" type="submit" class="btn btn-success" />
                    </div>
                  </div>
                </form> 
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                       <span aria-hidden="true">&times;</span>
                       <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title">
                    Register
                </h4>
            </div>
            
            <!-- Modal Body -->
            <div class="modal-body">
                <form:form method="POST" action="/WebsiteProject/register" class="form-horizontal" role="form">
                  <div class="form-group">
                    <label class="col-sm-3 control-label" for="username" >Username</label>
                    <div class="col-sm-9">
                    		<input type="text" name="username" class="form-control" id="username" placeholder="Username"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-3 control-label" for="password" >Password</label>
                    <div class="col-sm-9">
                    		<input type="password" name="password" class="form-control" id="password" placeholder="Password"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-9">
                      <input name="submit" value="Register" type="submit" class="btn btn-success" />
                    </div>
                  </div>
                </form:form> 
            </div>
        </div>
    </div>
</div>