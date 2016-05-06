describe UserPolicy do
  subject { described_class }

  permissions :update?, :edit?, :destroy? do
    it 'denies access if user not admin' do
      expect(subject).not_to permit(create(:first_user),create(:first_post))
    end

    it 'access if user admin' do
      expect(subject).to permit(create(:second_user),create(:first_post))
    end
  end

  permissions :show? do
    it 'access if user logged' do
      expect(subject).to permit(create(:first_user))
    end
  end

end