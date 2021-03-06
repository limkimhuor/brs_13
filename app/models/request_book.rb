class RequestBook < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true, length: {maximum: 50}
  validates :decription, presence: true, length: {maximum: 500}
end
