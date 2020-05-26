class Table < ApplicationRecord
  attr_accessor :id, :name, :color, :user_id
  belongs_to :user
end
