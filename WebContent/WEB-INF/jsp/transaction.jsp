<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Finance Tracker</title>
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet" href="<c:url value="/resources/css/styles.css" />">
	<script src="<c:url value="/resources/js/functions.js" />"></script>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
	

</head>
<body>
<h2>Transaction Information</h2>
<%@include file="templates/transactionModals.jsp" %>
<div class="container-fluid">
<form id="filterForm" class="form-horizontal" role="form">
	<div class="form-group col-sm-4">
		<label class="col-sm-2 control-label">Filter</label>
		<div class="col-sm-10">
			<input id="filterText" type="text" class="form-control" placeholder="Type here...">
		</div>
	</div>
	<div class="form-group col-sm-4">
		<label class="col-sm-2 control-label">Status</label>
		<div class="col-sm-10">
			<select class="form-control" id="statusFilter">
				<option value="">All</option>
				<option value="Open">Open</option>
				<option value="Closed">Closed</option>
			</select>
		</div>
	</div>
	<div class="form-group col-sm-4">
		<label class="col-sm-2 control-label">Type</label>
		<div class="col-sm-10">
			<select class="form-control" id="typeFilter">
				<option value="">All</option>
				<option value="Credit">Credit</option>
				<option value="Debit">Debit</option>
			</select>
		</div>
	</div>
	<div class="form-group col-sm-1">
		<button id="clearFilters" class="btn btn-success">Clear</button>
	</div>
</form>
</div>

<table class="table">
  <thead class="thead-inverse">
    <tr>
      <th>Name</th>
      <th>Description</th>
      <th>Type</th>
      <th>Amount</th>
      <th>Date</th>
      <th class="fit"></th>
      <th class="fit"></th>
    </tr>
  </thead>
  <tfoot>
    <tr>
      <td>Total</td>
      <td />
      <td />
      <td class="totalAmount"></td>
      <td />
      <td />
      <td />
    </tr>
  </tfoot>
  <tbody class="searchable">
		<c:if test="${not empty lists}">
			<c:forEach var="a" items="${lists}">
				<tr class="tableRow" data-status="<c:out value='${a.status}' />">
					<td><c:out value="${a.name}" /></td>
					<td><c:out value="${a.description}" /></td>
					<td class="rowType"><c:out value="${a.type}" /></td>
					<td class="rowAmountColumn">$<span class="rowAmount"><fmt:formatNumber type="number" minFractionDigits="2" value="${a.amount}" /></span></td>
					<td><c:out value="${a.date}" /></td>
					<td class="fit">
						<c:if test="${a.status=='Open'}">
							<button type="button" data-target="#editTransaction" data-max-amount="<c:out value='${a.amount}' />" data-id="<c:out value='${a.id}' />" data-toggle="modal" class="btn btn-success btn-sm btn-block editButton">
								<span class="glyphicon glyphicon-edit"></span> 
							</button>
						</c:if>
					</td>
					<td class="fit">
						<button type="button" data-target="#deleteTransaction" data-id="<c:out value='${a.id}' />" data-toggle="modal" class="btn btn-danger btn-sm btn-block deleteButton">
							<span class="glyphicon glyphicon-trash"></span> 
						</button>
					</td>
				<tr>
			</c:forEach>
		</c:if>
  </tbody>
</table>
<div class="container container-table">
    <div class="row vertical-center-row">
        <div class="text-center col-md-4 col-md-offset-4">
					<button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#addTransaction">
						Add Transaction
					</button>
				</div>
    </div>
</div>






</body>
</html>