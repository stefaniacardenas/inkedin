require 'spec_helper'

describe 'Instagram Homepage'  do

	context "when empty" do
		
		it 'should display no posts' do
			visit '/' 
			expect(page).to have_content('No posts yet')
			expect(page).to have_content('Welcome to Instagram!')
		end
	end

	context "when adding a new post" do

		it 'should add a post to the index' do
			visit '/posts'
			fill_in 'Description', with: 'My cat Negrita'
			fill_in 'Title', with: 'cat'
			attach_file 'Picture', Rails.root.join('public/images/cat.jpg')
			click_button 'Post it!'

			expect(current_path).to eq '/'
			expect(page).to have_content('My cat Negrita')
			expect(page).to have_css('img.uploaded-pic')
		end
	
	end

end
