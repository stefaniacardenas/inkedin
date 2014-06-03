require 'spec_helper'

describe 'liking posts' do 
	before do
		create(:post)
		login_as create(:user)
	end

	it 'increments the like count of a post' do 
		visit '/posts'
		click_link '❤ 0'
		expect(page).to have_link '❤ 1'
	end

end