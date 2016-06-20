// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui.min
//= require jquery.scrollWindowTo
//= require underscore-min
//= require underscore.mixin.deepExtend
//= require bootstrap-sprockets
//= require turbolinks
//= require backbone-min
//= require deep-model.min
//= require rivets.min
//= require formbuilder
//= require_tree .

// Data Autocomplete
$(function() {
  $('[data-autocomplete]').keyup( function() {
    $this = $(this);
    $.get($this.data('autocomplete'), {
      input: $this.val()
    }).success(function() {
      $this.removeClass('field_with_errors');
    }).error(function() {
      $this.addClass('field_with_errors');
    }); 
  }); 
});

