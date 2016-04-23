$('.posts').html("<% @posts.each do |p| %>
                    <p><%= p.title %></p>
                  <% end %> ")