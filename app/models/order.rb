class Order < ActiveRecord::Base
  belongs_to :domain
  belongs_to :user
end
