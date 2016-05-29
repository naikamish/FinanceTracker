<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Spring MVC Form Handling</title>
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet" href="<c:url value="/resources/css/styles.css" />">
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
	
	<script>
	$(document).ready(function(){
		$(".tableRow").each(function(){
			var color = ($(".rowType", this).text()=="Credit") ? "#D0F0C0" : "#FF9494";
			$(this).css({"background-color":color});
		});
		
	    $('#filterForm').on("keyup change", function () {
	      var textRex = new RegExp($("#filterText",this).val(), 'i');
	      var statusRex = new RegExp($("#statusFilter", this).find("option:selected").attr("value"), 'i');
	      var typeRex = new RegExp($("#typeFilter", this).find("option:selected").attr("value"), 'i');
	      $('.searchable tr').hide();
	      $('.searchable tr').filter(function () {
	    	  return textRex.test($(this).text()) 
	    	  				&& statusRex.test($(this).data('status'))
	    	  				&& typeRex.test($(".rowType", this).text());
	      }).show();
      });
      
      $('#clearFilters').on('click', function(e){
    	  e.preventDefault();
    	  $("#filterText").val("");
    	  $("#statusFilter").val("All").change();
    	  $("#typeFilter").val("All").change();
      });
	});
	
	$(function() {
	    $('.date-picker').datepicker( {
	        changeMonth: true,
	        changeYear: true,
	        showButtonPanel: true
	    });
	});
	
	$(document).on("click", ".editButton", function () {
	     var id = $(this).data('id');
	     var maxAmount = $(this).data('max-amount');
	     $("#editTransaction #editId").val( id );
	     $("#editTransaction #repaid").val( maxAmount );
	     $("#editTransaction #repaid").attr({"max":maxAmount});
	});
	
	$(document).on("click", ".deleteButton", function () {
	     var id = $(this).data('id');
	     var maxAmount = $(this).data('max-amount');
	     $("#deleteTransaction #deleteId").attr("value", id);
	});
	</script>
</head>
<body>
<h2>Transaction Information</h2>

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
  <tbody class="searchable">
		<c:if test="${not empty lists}">
			<c:forEach var="a" items="${lists}">
				<tr class="tableRow" data-status="<c:out value='${a.status}' />">
					<td><c:out value="${a.name}" /></td>
					<td><c:out value="${a.description}" /></td>
					<td class="rowType"><c:out value="${a.type}" /></td>
					<td>$<fmt:formatNumber type="number" minFractionDigits="2" value="${a.amount}" /></td>
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



<div class="modal fade" id="deleteTransaction" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            </div>
            <div class="modal-body">
            Are you sure you want to delete?
            </div>
            <div class="modal-footer">
	            <form:form method="POST" action="/WebsiteProject/deleteTransaction">
	            	<button type="submit" id="deleteId" name="id" class="btn btn-default">Yes</button>
	            </form:form>
              <button type="button" class="btn btn-default" data-dismiss="modal">No</button>  
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="editTransaction" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                       <span aria-hidden="true">&times;</span>
                       <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    Update Transaction
                </h4>
            </div>
            
            <!-- Modal Body -->
            <div class="modal-body">
                <form:form method="POST" action="/WebsiteProject/updateTransaction" class="form-horizontal" role="form">
                  <form:input type="hidden" path="id" class="form-control" id="editId" placeholder="ID"/>
                  <div class="form-group">
                    <label class="col-sm-2 control-label"
                          for="editAmount" >Paid Amount</label>
                    <div class="col-sm-10">
                    		<form:input path="repaid" class="form-control" type="number" id="repaid" placeholder="Repaid"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" class="btn btn-default">Update</button>
                    </div>
                  </div>
                </form:form> 
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addTransaction" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
       					<button type="button" class="close" data-dismiss="modal">
		                <span aria-hidden="true">&times;</span>
		                <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    Add Transaction
                </h4>
            </div>
            
            <!-- Modal Body -->
            <div class="modal-body">
                <form:form method="POST" action="/WebsiteProject/addTransaction" class="form-horizontal" role="form">
                  <div class="form-group">
                    <label  class="col-sm-2 control-label" for="name">Name</label>
                    <div class="col-sm-10">
                    	<form:input path="name" class="form-control" id="name" placeholder="Name"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="description" >Description</label>
                    <div class="col-sm-10">
                    	<form:input path="description" class="form-control" id="description" placeholder="Description"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="type" >Type</label>
                    <div class="col-sm-10">
	                    <form:select path="type" class="form-control">
							        	<form:option value="Credit" label="Credit" />
							        	<form:option value="Debit" label="Debit" />
						        	</form:select>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="amount" >Amount</label>
                    <div class="col-sm-10">
                        <form:input path="amount" class="form-control" id="amount" placeholder="Amount"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="date" >Date</label>
                    <div class="col-sm-10">
                        <form:input path="date" class="form-control date-picker" id="date" placeholder="Date" />
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="status" >Status</label>
                    <div class="col-sm-10">
	                    <form:select path="status" class="form-control">
							        	<form:option value="Open" label="Open" />
							        	<form:option value="Closed" label="Closed" />
						        	</form:select>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" class="btn btn-success">Add</button>
                    </div>
                  </div> 
                </form:form>   
            </div>
        </div>
    </div>
</div>
</body>
</html>