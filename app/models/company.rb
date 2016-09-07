class Company < ActiveRecord::Base
	has_attached_file :logo,
                   styles: { large: '1200x100',
                             medium: '150x150#',
                             thumb: '100x100#' },
                   keep_old_files: true,
                   default_url: '/images/:style/missing.png'
 	validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

end
