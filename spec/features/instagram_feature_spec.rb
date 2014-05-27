require 'spec_helper'

describe 'Instagram Homepage'  do

	context "when empty" do
		
		it 'should display no posts' do
			visit '/instagram' 
			expect(page).to have_content('No posts yet')
			expect(page).to have_content('Welcome to Instagram!')
		end
	
		
		it 'should have a upload button' do
			visit '/instagram' 
			expect(page).to have_button('Upload')
		end
	end

	# context "when adding a new post" do

	# 	it 'should add a post to the index' do
	# 	visit '/instagram'
	# 	fill_in 'Description', with: 'My cat Negrita'
	# 	fill_in 'title', with: 'cat'

	# 	expect(current_path).to eq '/instagram'
	# 	expect(page).to have_content('My cat Negrita')
	# 	end
	# end


end