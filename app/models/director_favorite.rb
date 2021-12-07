class DirectorFavorite < ActiveRecord::Base
    belongs_to :director
    belongs_to :user
end