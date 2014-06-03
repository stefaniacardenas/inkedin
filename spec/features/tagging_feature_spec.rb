require 'spec_helper' 

describe 'tagging posts' do 

	before do
		Stefania = create(:user)
		login_as Stefania
	end

	it 'displays the tags on the posts page' do
		visit '/posts/new'
		fill_in 'Description', with: 'My cat Negrita'
		fill_in 'Title', with: 'cat'
		attach_file 'Picture', Rails.root.join('public/images/cat.jpg')
		fill_in 'Tags', with: 'cute, kitten, cat'
		click_button 'Post it!'

		expect(page).to have_link '#cute'
		expect(page).to have_link '#kitten'
		expect(page).to have_link '#cat'
	end

	it 'can filter posts by tags' do 
		create(:post, title: 'Pic1', tag_names: 'yolo')
		create(:post, title: 'Pic2', tag_names: 'swag')

		visit '/posts'
		click_link '#yolo'
		expect(page).to have_css 'h1', text: 'Posts tagged with #yolo'
		expect(page).to have_content 'Pic1'
		expect(page).not_to have_content 'Pic2'
	end


end