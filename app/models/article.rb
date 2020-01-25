class Article < ApplicationRecord
    belongs_to :user
    belongs_to :category
    validates_associated :user,:category
    validates :title,:text,:user,:category,presence:true
end
