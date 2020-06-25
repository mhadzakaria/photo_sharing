class Post < ApplicationRecord
	belongs_to :user
	has_one    :photo
	has_many   :comments

	accepts_nested_attributes_for :photo

	acts_as_votable
end
