class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

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

  def apply_omniauth(omniauth)
    if nick.blank?
      self.nick = omniauth['info']['name'] || omniauth['info']['first_name'] || omniauth['info']['nickname']
      self.name = self.nick
      self.surname = self.nick
    end
    self.email =    omniauth['info']['email'] if email.blank?

    providers.build(:provider => omniauth['provider'],
                    :uid => omniauth['uid']
    )
  end

  def password_required?
    (providers.empty? || !password.blank?) && super
  end

  def email_required?
    email && providers.empty?
  end

  def unvote_for_post?(id)
    if PostRating.where(post_id: id).exists?
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