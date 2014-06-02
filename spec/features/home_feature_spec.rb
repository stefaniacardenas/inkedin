require 'spec_helper'

describe 'Flickagram Home'  do

	context 'when a user is not logged in' do 

		it 'the homepage should be desplayed' do
			visit '/'
			expect(page).to have_content('Flickagram')
		end

			it 'has a sign up button' do
			visit '/'
			click_link('Sign Up')
			expect(current_path).to eq '/users/sign_up'
		end

	end

end