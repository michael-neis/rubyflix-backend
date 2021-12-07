class Friendslist < ActiveRecord::Base
    belongs_to :user_a, :class_name => :User
    belongs_to :user_b, :class_name => :User
end