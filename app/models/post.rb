class Post < ApplicationRecord
  belongs_to :user
  has_one    :photo,    dependent: :destroy
  has_many   :comments, dependent: :destroy

  accepts_nested_attributes_for :photo

  acts_as_votable
end
