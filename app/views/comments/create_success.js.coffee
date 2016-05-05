alert("Комментарий успешно создан");
$("<div><%= escape_javascript(render @comment.decorate)%></div>").insertAfter(".<%=@past_post_id%>");

