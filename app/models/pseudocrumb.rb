class Pseudocrumb < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  belongs_to :receiver, class_name: "User"
end
