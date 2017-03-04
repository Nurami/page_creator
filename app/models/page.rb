class Page < ApplicationRecord
  validates :title, presence: true
  validates :title, length: {maximum: 10}
  validates :title, uniqueness: true

  def generate_password
    massive = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a 
    pass = massive.shuffle[0..8].join
  end

  def encode_password(pass)
    chifr =  pass.to_s + created_at.to_s
    Digest::SHA2.new(512).hexdigest(chifr)
  end

  def check_password?(pass_for_editing)
    password == encode_password(pass_for_editing)
  end

  
end
