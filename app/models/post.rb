class Post < ActiveRecord::Base


	has_attached_file :picture, :styles => { :medium => "300x300>" }, 
	#the following line upload the pictures on s3 
	storage: :s3,
	s3_credentials: {
		bucket: 'stefaniacardenaspractice',
		access_key_id: Rails.application.secrets.s3_access_key, 
		secret_access_key: Rails.application.secrets.s3_secret_key
		#Rails.application.etc grabs our keys from secret.yml
	}
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
	belongs_to :user
	has_and_belongs_to_many :tags

	def tag_names(tag_names)
		''
	end 

	def tag_names=(tag_names)
		return if tag_names.blank?

		tag_names.split(', ').uniq.each do |tag_name|
			formatted_name = '#' + tag_name.delete('#')
			tag = Tag.find_or_create_by(name: formatted_name)
			tags << tag
			# tags.create(name: '#' + tag_name.delete('#'))
		end
	end 

end
