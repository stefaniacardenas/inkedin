require 'spec_helper'

describe 'Flickagram Home'  do

	it 'Should be desplayed when user are not logged in' do
		visit '/'
		expect(page).to have_content('Flickagram')
	end

end