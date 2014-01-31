require 'digest'

class Student < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 2 }
  #validates :email, presence: true
  
  def image_url_with_fallback
    if image.present?
      image
    elsif email
      "http://gravatar.com/avatar/"+Digest::MD5.hexdigest(email)+"?d=mm"
    end
  end
end
