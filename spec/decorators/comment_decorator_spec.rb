require 'rails_helper'

describe CommentDecorator do
  let(:comment) {create(:first_comment).decorate}

  it 'correct date with strftime' do
    expect(comment.answer_given).to eq "Дан #{comment.created_at.strftime("%H:%M %d-%m-%Y")}"
  end
end