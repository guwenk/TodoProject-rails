// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require select2
//= require activestorage
//= require_tree .
$(document).ready(function() {
	$('input').iCheck({
    checkboxClass: 'icheckbox_square-blue',
    radioClass: 'iradio_square-blue',
    increaseArea: '20%' // optional
  	});
	$('input[type=checkbox]').each(function () {
		checkbox_strikethrough(this);
	});
  	resized();
  	$('#todo_project_id').select2({
  		width:'100%',
  		minimumResultsForSearch: -1
  	});
	$('input:checkbox').on('ifToggled', function () {
        checkbox_strikethrough(this);
        var key = $(this).attr('name').match(/\[(\d+)\]/)[1];
        $.ajax({
		    url: '/projects/0/todos/'+key+'/toggle',
		    type: 'POST',
		    data: {"isCompleted": this.checked}
		});
    });
});

$(window).resize(function() {
	resized();
});


function resized(){
	var md = 768;
	var lg = 992;
	if ($(window).width() >= lg) {
        $(".column").attr('class', 'column col-lg-4');
    }else if ($(window).width() >=md) {
        $(".column").attr('class', 'column col-md-6');
    }else {
		$(".column").attr('class', 'column col-sm-12');
    }
}

function checkbox_strikethrough(obj){
	var input = $(obj).closest('label');
	if (obj.checked) {
		$(input).css('textDecoration', 'line-through');
	} else {
		$(input).css('textDecoration', 'none');
	}
}