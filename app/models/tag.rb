class Tag < ActiveRecord::Base
	has_and_belongs_to_many :posts
	validates :name, uniqueness: true

	def to_param
		name.delete('#')
	end

	# The method above is a rails method to use the name of the tag
	# in the url so we can get localhost:3000/tags/yolo

end
