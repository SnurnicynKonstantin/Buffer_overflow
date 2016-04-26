class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  attr_accessor :provider_name
  extend FriendlyId

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         omniauth_providers: [:github, :facebook]

  enum role: [:user, :moderator, :admin]

  has_many :providers, dependent: :destroy
  has_many :posts,    dependent: :destroy
  has_many :comments
  has_and_belongs_to_many :tags

  validates :nick,      presence: true,
                        length: { in: 2..20 },
                        uniqueness: { case_sensitive: false }
  validates :name,      presence: true,
                        length: { in: 2..20 }
  validates :surname,   presence: true,
                        length: { in: 2..20 }
  validates :email,     presence: true, email: true

  after_initialize :set_default_role, :if => :new_record?

  friendly_id :nick

  acts_as_voter

  devise :omniauthable, :omniauth_providers => [:twitter, :facebook, :github]

  def self.find_for_oauth(auth, loggined_user)
    @provider_name = auth.provider
    provider = Provider.find_by(uid: auth.uid)

    if provider
      User.find(provider.user_id)
    elsif loggined_user
      loggined_user.providers.create(provider: auth.provider, uid: auth.uid)
      loggined_user
    else
      user = User.where(email: auth.info.email).first

      if user
        user.providers.create(provider: auth.provider, uid: auth.uid)
        user
      else
        user = User.new(name: auth.info.name,
                        surname: auth.info.name,
                        email: auth.info.email,
                        nick: auth.info.nickname
        )

        if user.save
          user.providers.create(provider: auth.provider, uid: auth.uid)
        end
        user
      end
    end
  end

  def password_required?
    ((provider_name.nil? || provider_name.empty? ) || !password.blank?) && super
  end

  def email_required?
    email && (provider_name.nil? || provider_name.empty? )
  end

  def unvote_for_post?(id)
    if Postratings.where(post_id: id).exists?
      false
    else
      true
    end

  end

  private
    def set_default_role
      self.role ||= :user
    end

end