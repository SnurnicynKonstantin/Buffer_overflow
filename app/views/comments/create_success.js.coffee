alert("Комментарий успешно создан");
$('.<%=@root_comment_id%> .comment-text').val('');
$("<div><%= escape_javascript(render @comment.decorate)%></div>").insertAfter(".<%=@past_post_id%>");

