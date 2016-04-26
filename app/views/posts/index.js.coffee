$('.posts').html("<% @posts.each do |p| %>
  <div class='col-lg-4'>
    <div class='list-group table-of-contents'>
      <a class='list-group-item' href='<%= post_path(p)%>'>
        <span class='label label-warning'><%=p.tags.first.tag_name %></span>
        <%=p.show_post_with_style %>
        <p>Автор: <%=p.user.name %></p>
      <a>
    </div>
  </div>
<% end %> ")
