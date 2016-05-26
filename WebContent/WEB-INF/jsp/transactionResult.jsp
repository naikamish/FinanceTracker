<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Spring MVC Form Handling</title>
</head>
<body>

<h2>Submitted Transaction Information</h2>
   <table>
    <tr>
        <td>Name</td>
        <td>${name}</td>
    </tr>
    <tr>
        <td>Description</td>
        <td>${description}</td>
    </tr>
    <tr>
        <td>Type</td>
        <td>${type}</td>
    </tr>
    <tr>
        <td>Amount</td>
        <td>${amount}</td>
    </tr>
    <tr>
        <td>Date</td>
        <td>${date}</td>
    </tr>
</table>  
</body>
</html>