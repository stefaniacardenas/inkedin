require 'spec_helper'

describe 'Flickagram Home'  do

	context 'when a user is not logged in' do 

		it 'should be desplayed' do
			visit '/'
			expect(page).to have_content('Flickagram')
		end

			it 'Should be desplayed' do
			visit '/'
			expect(page).to have_content('Flickagram')
		end

	end

end