class Book
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  belongs_to :user
end
