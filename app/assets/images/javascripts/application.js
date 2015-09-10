// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require bootstrap-multiselect
//= require_tree .

function loadChoices(id)
{
  var candArr = [];
  $('#select' + id).find('select').each(function() {
      candArr.push($(this).children(':selected').text());
  });
  candArr = $.map(candArr, function(val){
    if(val == "No Selection")
    {
      return "";
      console.log(val + "is ns");
    }
    else
    {
      return "<li>" + val + "</li>";
    }
  });
  $('#modal'+id+' .cand-list').html(candArr);
}

function toggleDiv(id)
{
  $(id).toggle();
}

var ready;
ready = function(){
  $('#yearSelect').multiselect();
};

$(document).ready(ready); //some fancy shit cause document.ready doesn't play nicely with rails because of turbolinks
$(document).on('page:load', ready);
