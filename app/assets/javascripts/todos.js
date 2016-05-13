// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
    $('.change-item').hide();
    $('.check-mark').change(function(event){
        var $form = $(this).parents('form');
        $form.submit();
    });

/*
    console.log('fsdfas');

    var x = 10;
*/

    $('.todo-item').dblclick(function() {
        $(this).hide();
        var $input = $(this).siblings('.change-item');
        $input.show();
        $input.focus();

    });

    $('.change-item').blur(function() {
        $(this).hide();
        $(this).siblings('.todo-item').show();
        var $form = $(this).parents('form');
        $form.submit();

    });




});

