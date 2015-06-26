class Order < ActiveRecord::Base
  belongs_to :domain
  belongs_to :owner, class_name: User
end
