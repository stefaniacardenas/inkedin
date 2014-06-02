require 'spec_helper'

describe 'Flickagram Index'  do

	context "when empty" do
		
		it 'should display no posts' do
			visit '/posts' 
			expect(page).to have_content('No posts yet')
		end
	end

	describe "when adding a new post" do

		context 'when logged out' do

			it 'prompts us to sign in' do
				visit '/posts'
				click_link 'New post'
				expect(page).to have_content 'Sign in'
			end
		end


		context 'when logged in' do

			before do 
				user = User.create(email: 'stefania@a.com', password: '12345678', password_confirmation: '12345678')
				login_as user
			end

			it 'should add a post to the index' do
				visit '/posts/new'
				fill_in 'Description', with: 'My cat Negrita'
				fill_in 'Title', with: 'cat'
				attach_file 'Picture', Rails.root.join('public/images/cat.jpg')
				click_button 'Post it!'

				expect(current_path).to eq '/posts'
				expect(page).to have_content('My cat Negrita')
				expect(page).to have_css('img.uploaded-pic')
			end
		end
	end

	describe 'when deleting' do 

		context 'my post' do 

			before do 
				Stefania = User.create(email: 'stefania@a.com', password: '12345678', password_confirmation: '12345678')
				login_as Stefania
				Post.create(title: 'Hello', description: 'World', user: Stefania)
			end

			it 'is removed from the posts page' do 
				visit '/posts'
				click_link 'Delete'

				expect(page).to have_content('Successfully deleted')
			end
		end

		context "someone else's posts" do 

			before do 
				Stefania = User.create(email: 'stefania@a.com', password: '12345678', password_confirmation: '12345678')
				Sam = User.create(email: 'sam@a.com', password: '12345678', password_confirmation: '12345678')
				Post.create(title: "Sam's pic", description: 'test', user: Sam)

				login_as Stefania

			end

			it 'is not removed from the posts page' do 
				visit '/posts'

				expect(page).to have_content("Sam's pic")
			end

			it 'shows no delete button' do
				visit '/posts'
				expect(page).not_to have_button("Delete")
			end

		end

		it 'shows no delete button when no user are logged in' do

				visit '/posts'
				expect(page).not_to have_button("Delete")
			end

	end
end
