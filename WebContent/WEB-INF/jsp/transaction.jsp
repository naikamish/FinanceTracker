<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Spring MVC Form Handling</title>
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
	<script>
	$(function() {
	    $('.date-picker').datepicker( {
	        changeMonth: true,
	        changeYear: true,
	        showButtonPanel: true
	    });
	});
	</script>
</head>
<body>
<h2>Transaction Information</h2>
<form:form method="POST" action="/WebsiteProject/addTransaction">
   <table>
    <tr>
        <td><form:label path="name">Name</form:label></td>
        <td><form:input path="name" /></td>
    </tr>
    <tr>
        <td><form:label path="description">Description</form:label></td>
        <td><form:input path="description" /></td>
    </tr>
    <tr>
        <td><form:label path="type">Type</form:label></td>
        <td>
        	<form:select path="type">
	        	<form:option value="CR" label="Credit" />
	        	<form:option value="DB" label="Debit" />
        	</form:select>
        </td>
    </tr>
    <tr>
    	<td><form:label path="amount">Amount</form:label></td>
        <td><form:input path="amount" /></td>
    </tr>
    <tr>
    	<td><form:label path="date">Date</form:label></td>
        <td><form:input path="date" cssClass="date-picker" /></td>
    </tr>
    <tr>
        <td colspan="2">
            <input type="submit" value="Submit"/>
        </td>
    </tr>
</table>  
</form:form>
</body>
</html>