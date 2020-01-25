class Patient < ActiveRecord::Base
	has_many :readings
end
