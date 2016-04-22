describe CommentPolicy do
  subject { described_class }
  include Devise::TestHelpers

  permissions :create?, :vote_up? do
    it 'denies access if user not logged' do
      expect(subject).not_to permit(nil)
    end

    # it 'access if user logged' do #Необходимо войти юзеру
    #   user = create(:first_user)
    #   sign_in user
    #   expect(subject).to permit(create(:first_user), create(:comment_first))
    # end
  end


end