# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)      not null
#  token           :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :username, :password, :token
  attr_reader :password

  before_validation :ensure_session_token

  validates :username, :password_digest, :token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :username, uniqueness: true

  has_many :subs,
    class_name: "Sub",
    foreign_key: :moderator_id

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest)
      .is_password?(password)
  end

  def ensure_session_token
    self.token ||= self.class.generate_session_token
  end

  def reset_session_token!
    self.token = self.class.generate_session_token
    self.save!

    nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def self.find_by_credentials(username, password)
    @user = User.find_by_username(username)

    if @user
      @user if @user.is_password?(password)
    else
      nil
    end
  end
end
