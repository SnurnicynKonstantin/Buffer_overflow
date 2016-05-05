describe CommentPolicy do
  subject { described_class }

  permissions :create?, :vote_up? do
    it 'denies access if user not logged' do
      expect(subject).to permit(create(:first_user))
    end
  end
end