$('#new_post').hide();
$('#post_form').html("<%= j (render 'form') %>").css({"border": "2.5px groove white", "padding": "2%"}).slideDown(350);
