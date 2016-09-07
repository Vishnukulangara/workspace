class Newsletter < ActiveRecord::Base
	serialize :sent_to, Array 
	validates :schedule_at , presence: true
end
