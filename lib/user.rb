class User < ActiveRecord::Base
  has_many :todoitems
  def self.authenticate(username, password)
    find_by(username: username, password: password)
  end

end