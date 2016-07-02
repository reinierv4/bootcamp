class School < ActiveRecord::Base

	validates :name, presence: true, length: { maximum: 255 },
	                    uniqueness: { case_sensitive: false }
	
	has_attached_file :image, styles: {large: "600x600>", medium: "300x300>"}
  	
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  	

end
