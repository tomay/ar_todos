require_relative '../../config/application'

# table users
class User < ActiveRecord::Base
  has_many :lists
end