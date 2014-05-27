require 'spec_helper'

describe 'Instagram Homepage'  do

	context "when empty" do
		
		it 'should display no posts' do
			visit '/instagram' 
			expect(page).to have_content('No posts yet')
			expect(page).to have_content('Welcome to Instagram!')
		end
	end
end