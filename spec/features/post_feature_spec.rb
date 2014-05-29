require 'spec_helper'

describe 'Instagram Homepage'  do

	context "when empty" do
		
		it 'should display no posts' do
			visit '/' 
			expect(page).to have_content('No posts yet')
			expect(page).to have_content('Welcome to Flickagram!')
		end
	end

	describe "when adding a new post" do

		context 'with logged out user' do

			it 'prompts us to sign in' do
				visit '/posts'
				click_button 'New post'
				expect(page).to have_content 'Sign in'
			end
		end


		context 'with logged in user' do

			before do 
				user = User.create(email: 'stefania@a.com', password: '12345678', password_confirmation: '12345678')

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
	end

end
