class User < ActiveRecord::Base
  has_secure_password

  has_many :activities, dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :followers, through: :reverse_relationships, source: :follower
  has_many :lessons, dependent: :destroy
  has_many :relationships, foreign_key: 'follower_id', dependent: :destroy
  has_many :reverse_relationships, foreign_key: 'followed_id',
            class_name: 'Relationship', dependent: :destroy


  before_save {|user| user.email = email.downcase}
  before_save :create_remember_token

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: {maximum:30, minimum: 6}
  validates :email, presence: true, format: {with: EMAIL_REGEX}, uniqueness: true
  validates :password, presence: true, length: {maximum:32, minimum: 6}
  validates :password_confirmation, presence: true

  def following?(other_user)
    relationships.find_by_followed_id other_user.id
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  private
  def create_remember_token
    sefl.remember_token = SecureRandom.urlsafe_base64
  end
end
