class Favorite < ActiveRecord::Base
    belongs_to :movie
    belongs_to :user
    belongs_to :director
end