class Post < ActiveRecord::Base
  attr_accessible :facebook_id, :from, :link, :message

  validates :facebook_id, uniqueness: true
end
