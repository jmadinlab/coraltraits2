// Configure your import map in config/importmap.rb.
// Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "custom/menu"
// import "custom/map"
import "@nathanvda/cocoon"



$(document).on("turbolinks:load", function() {

  $("#doilist li").each(function(i,el){  // loop though each user
    var $doi = $(el).find(".doi");  // get the record count element
    var resourceid = $doi.data("resourceid");   // get the user id data param

    $.get( "/resources/"+resourceid+"/doi" )
      .done(function( data ) {
        console.log(data.sug.message);
        $doi.html(
          "<li>" + data.sug.message.items[0].DOI+" <small>(<a href='http://dx.doi.org/" + data.sug.message.items[0].DOI+"' target='_blank'>"+data.sug.message.items[0].title+"</a>)</small></li>" +
          "<li>" + data.sug.message.items[1].DOI+" <small>(<a href='http://dx.doi.org/" + data.sug.message.items[1].DOI+"' target='_blank'>"+data.sug.message.items[1].title+"</a>)</small></li>" +
          "<li>" + data.sug.message.items[2].DOI+" <small>(<a href='http://dx.doi.org/" + data.sug.message.items[2].DOI+"' target='_blank'>"+data.sug.message.items[2].title+"</a>)</small></li>"
        );
    });

  });
});

$(document).on("turbolinks:load", function() {

  $("#dupdetect p").each(function(i,el){  // loop though each user
    var $dup = $(el).find(".dup");  // get the record count element
    var resourceid = $dup.data("resourceid");   // get the user id data param

    $.get( "/resources/"+resourceid+"/duplicates.json" )
      .done(function( data ) {
        console.log(data);
        if (data.dups != 0) {
          $dup.html( "<a href='/resources/"+resourceid+"/duplicates' class='label label-warning'>"+data.dups+"</a> potential duplicates" );
        } else {
          $dup.html( false );
        }
    });
  });
});

$(document).on("turbolinks:load", function() {

  $("#duptrait p").each(function(i,el){  // loop though each user
    var $dup = $(el).find(".dup");  // get the record count element
    var traitid = $dup.data("traitid");   // get the user id data param

    $.get( "/traits/"+traitid+"/duplicates.json" )
      .done(function( data ) {
        console.log(data);
        if (data.dups != 0) {
          $dup.html( "<a href='/traits/"+traitid+"/duplicates' class='btn btn-xs btn-warning'>"+data.dups+" potential duplicates</a>" );
        } else {
          $dup.html( false );
        }
    });
  });
});

// $(document).ready(function() {
//   $('select#simple-example').select2();
// });
//


function EventHandler(e, chart, data) {
  var selection = chart.getSelection();
  if (selection.length > 0) {
    var row = selection[0].row;
    var obs = data.getValue(row, 2);
    window.open("/observations/" + obs)
  }
}

$(document).ready(function(){
    $('span').tooltip();
});

$(document).ready(function(){
    $('button').tooltip();
});

$(document).ready(function(){
    $('div').tooltip();
});


function checkUncheckAll(theElement) {
	var theForm = theElement.form, z = 0;
	for(z=0; z<theForm.length;z++){
		if(theForm[z].type == 'checkbox' && theForm[z].name != 'checkall'){
			theForm[z].checked = theElement.checked;
		}
	}
}



$(document).ready(function(){
  $('.panel-body').hide();

  $('.panel-heading').click(function(e){
    e.preventDefault();
    $(this).next('.panel-body').fadeToggle("slow");
  });

  process_precision()
});

/*
var element_id = 1;

$(document).bind('cocoon:after-insert', function(e,inserted_item) {
   e.preventDefault();
   setTimeout(function(){
   	window.element_id = window.element_id + 1;
   	custom_id = "trait_select" + element_id;
   	$('#sur_trait').attr('id', custom_id);
   	$('#sur_value').attr('id', 'trait_value' + element_id);
   	$('#sur_methodology').attr('id', 'trait_methodology' + element_id);
   	$('#sur_standard').attr('id', 'trait_standard' + element_id);
    $('#sur_suggested_standard').attr('id', 'suggested_standard' + element_id) ;
   	//alert('success');
   }, 2000);


});

$(window).on('load', function(){
	$('#sur_trait').attr('id', 'trait_select1');
	$('#sur_value').attr('id', 'trait_value1');
	$('#sur_methodology').attr('id', 'trait_methodology1');
	$('#sur_standard').attr('id', 'trait_standard1');
  $('#sur_suggested_standard').attr('id', 'suggested_standard1');

});


*/


function process_precision()

{

  // Process the precision fields while document loads for first time (new / edit)
  var selected_value_type = $('[id*=_value_type]');
  selected_value_type.each(function(){
    if ( $(this).val() =="" || $(this).val()== "raw_value")
      $(this).parents(".nested-fields").find(".precision").hide();
    else
      $(this).parents(".nested-fields").find(".precision").show();
  });

  // Add event listener for on change in value_type
  $("[id*=_value_type]").on("change", function() {
      var selected_value;
      selected_value = $(this).val();
      if (selected_value === "raw_value" || selected_value == "") {
        $(this).parents(".nested-fields").find(".precision").children().val("");
        $(this).parents(".nested-fields").find(".precision").hide();
      } else {
        $(this).parents(".nested-fields").find(".precision").show();
      }
    });

}

$(document).bind('cocoon:after-insert', function(e,inserted_item) {
    process_precision()
});

function get_suggestions(request, response){
  var params = { search: request.term };
  $.get("/search/json_completion", params, function(data){
    response(data);
  }, "json");
}

$(document).ready(function(){

 $( ".search" ).autocomplete({
  source: get_suggestions,
   minLength: 2
  });
});
