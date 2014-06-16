class User < ActiveRecord::Base

  has_many :activities, dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :followers, through: :reverse_relationships, source: :follower
  has_many :lessons, dependent: :destroy
  has_many :relationships, foreign_key: 'follower_id', dependent: :destroy
  has_many :reverse_relationships, foreign_key: 'followed_id',
            class_name: 'Relationship', dependent: :destroy


  before_save {|user|
    user.email = email.downcase
  }
  before_create :create_remember_token

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: {maximum:30, minimum: 6}
  validates :email, presence: true, format: {with: EMAIL_REGEX}, uniqueness: true

  has_secure_password
  attr_accessor :no_password_validation
  validates :password, length:{minimum:6}, unless: :no_password_validation

  def following?(other_user)
    relationships.find_by_followed_id other_user.id
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def admin?
    self.role == 1  
  end

  def teacher?
    self.role == 2
  end

  def admin_accessible
    self && (self.admin? || self.teacher?)
  end

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
