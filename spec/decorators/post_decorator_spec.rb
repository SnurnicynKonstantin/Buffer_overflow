require 'rails_helper'

describe PostDecorator do
  let(:post) {create(:first_post).decorate}

  it 'correct date with strftime' do
    expect(post.created_at_with_text).to eq "Asked #{post.created_at.strftime("%H:%M %d-%m-%Y")}"
  end
end