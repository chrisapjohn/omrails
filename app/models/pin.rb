class Pin < ActiveRecord::Base
  attr_accessible :description, :image

  validates :description, presence: true
	validates :user_id, presence: true
	validates_attachment :image, presence: true,
																content_type: { content_type: ['image/jpeg','image/jpg','image/png','image/gif']},
																size: { less_than: 5.megabytes }
  belongs_to :user
  has_attached_file :image,
  	:styles => { :medium => "275x275>", :thumb => "175x155>" },
    :storage => :s3, :s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
    :path => "user/:attachment/:style/:id.:extension"
  
end
