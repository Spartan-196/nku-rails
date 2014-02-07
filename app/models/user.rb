class User < ActiveRecord::Base
  # Schema: User(name:string, password_digest:string)
  attr_accessible :email, :password, :password_confirm
  validates :email, uniqueness:true
  has_secure_password
  validates_presence_of :password, :on => :create
end

