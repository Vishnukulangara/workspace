class Employee < ActiveRecord::Base
	validates :email, :name, :date_of_joining, :employment_status, presence: true
	validates :email, uniqueness: true
	has_attached_file :profile_pic,
                   styles: { large: '300x300>',
                             medium: '150x150#',
                             thumb: '100x100#' },
                   keep_old_files: true,
                   default_url: '/images/:style/missing.png'
 	validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\Z/

end
