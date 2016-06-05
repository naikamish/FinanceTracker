$(document).ready(function(){
	$(".tableRow").each(function(){
		var color = ($(".rowType", this).text()=="Credit") ? "#D0F0C0" : "#FF9494";
		$(".rowAmountColumn",this).css({"background-color":color});
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
      calculateTotals();
  });
  
  $('#clearFilters').on('click', function(e){
	  e.preventDefault();
	  $("#filterText").val("");
	  $("#statusFilter").val("All").change();
	  $("#typeFilter").val("All").change();
  });
  
  calculateTotals();
  
  /*$("#submitLogout").click(function(){
	     $("#logoutForm").submit();
  });*/
});

function calculateTotals(){
var totals=0;
$('.tableRow:visible').each(function(){
  var amount = parseFloat($('.rowAmount',this).text());
  totals+=$('.rowType',this).text()=='Credit' ? amount : amount*-1;
  console.log(amount);
});
var totalsColor = totals>0 ? "#D0F0C0" : "#FF9494";
$('.totalAmount').text("$"+Math.abs(totals).toFixed(2));
$('.totalAmount').css({"background-color":totalsColor});
}

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

$(document).on("click", "#clearAddForm", function () {
     $("#addForm")[0].reset();
});