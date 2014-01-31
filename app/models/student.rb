require 'digest'

class Student < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 2 }
  #validates :email, presence: true
  
  def image_url_with_fallback
    if image.present?
       
    elsif email
      "http://gavatar.com/"+MD5.hexdigest(:email)+"?d=mm"
    end
  end
end
