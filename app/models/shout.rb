class Shout < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true
  validates :user, presence: true
  validates_associated :content
  delegate :username, to: :user
  delegate :body, to: :content 

  searchable do 
    text :content do 
      case content
      when TextShout then content.body
      when PhotoShout then content.image_file_name
      end
    end
  end
end
