require 'digest'

class Student < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 2 }
  #validates :email, presence: true
  #Schema: User(name:string, password_digest:string)
  validates :email, uniqueness:true
  has_secure_password
  validates_presence_of :password, :on => :create  
  def image_url_with_fallback
    if image.present?
      image
    elsif email
      "http://gravatar.com/avatar/"+Digest::MD5.hexdigest(email)+"?d=mm"
    end
  end
end
