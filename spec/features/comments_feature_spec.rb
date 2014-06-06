require 'spec_helper'

describe 'Comments' do 

	context 'with no comments' do 
		before do 
			Stefania = create(:user)
			login_as Stefania
			create(:post, user: Stefania)
		end

		it 'displays a text field' do
			visit '/posts'
			expect(page).to have_css('input.form-control')	
		end

		it 'has one comment' do
			visit '/posts'
			fill_in 'Comment', with: 'Hello!'
			expect(page).to have_content 'Hello!'
		end

	end

end