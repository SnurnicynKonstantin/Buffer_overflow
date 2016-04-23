class TagDecorator < ApplicationDecorator
  delegate_all

  def show_post_with_style
    object.title
  end

end
