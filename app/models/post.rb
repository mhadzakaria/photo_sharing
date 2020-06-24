class Post < ApplicationRecord
	has_one :photo

	accepts_nested_attributes_for :photo
end
