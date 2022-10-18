class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword
  field :username, type: String
  field :email, type: String
  field :password_digest, type: String
  validates :username, presence: true, :on => :create
  validates :email, presence: true, :uniqueness => true, email: true, :on => :create
  validates :password, presence: true, :length => { :minimum => 10 }, :on => :create
  has_many :books
  has_secure_password
end
