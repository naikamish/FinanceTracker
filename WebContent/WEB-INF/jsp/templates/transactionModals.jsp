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
                <form:form id="addForm" method="POST" action="/WebsiteProject/addTransaction" class="form-horizontal" role="form">
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
                        <form:input path="amount" type="number" step="any" class="form-control" id="amount" placeholder="Amount"/>
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
                    <div class="col-sm-offset-2 col-sm-2">
                      <button type="submit" class="btn btn-success btn-block">Add</button>
                    </div>
                    <div class="col-sm-2">
                      <button type="button" class="btn btn-danger btn-block" id="clearAddForm">Clear</button>
                    </div>
                  </div>
                </form:form>   
            </div>
        </div>
    </div>
</div>




<div class="modal fade" id="deleteTransaction" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
       					<button type="button" class="close" data-dismiss="modal">
		                <span aria-hidden="true">&times;</span>
		                <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title">
                    Delete Transaction
                </h4>
            </div>
            <div class="modal-body">
            Are you sure you want to delete this transaction?
            </div>
            <div class="modal-footer">
	            <form:form method="POST" action="/WebsiteProject/deleteTransaction">
	            	<button type="submit" id="deleteId" name="id" class="btn btn-success">Yes</button>
	              <button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
	            </form:form>
                
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
                <h4 class="modal-title">
                    Update Transaction
                </h4>
            </div>
            
            <!-- Modal Body -->
            <div class="modal-body">
                <form:form method="POST" action="/WebsiteProject/updateTransaction" class="form-horizontal" role="form">
                  <form:input type="hidden" path="id" class="form-control" id="editId" placeholder="ID"/>
                  <div class="form-group">
                    <label class="col-sm-3 control-label" for="editAmount" >Paid Amount</label>
                    <div class="col-sm-9">
                    		<form:input path="repaid" class="form-control" type="number" step="any" id="repaid" placeholder="Repaid"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-9">
                      <button type="submit" class="btn btn-success">Update</button>
                    </div>
                  </div>
                </form:form> 
            </div>
        </div>
    </div>
</div>