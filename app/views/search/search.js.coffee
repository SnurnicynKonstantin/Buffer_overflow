$('.posts').html("<% @posts.each do |post| %>
  <%= escape_javascript(render post.decorate)%>
<% end %> ")
