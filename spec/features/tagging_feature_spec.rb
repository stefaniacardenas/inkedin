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

	describe 'filtering posts by tags' do
		
		before do
			create(:post, title: 'Pic1', tag_names: 'yolo')
			create(:post, title: 'Pic2', tag_names: 'swag')
			visit '/posts'
		end

		it 'uses the tag name in the url' do
			click_link '#yolo'

			expect(current_path).to eq '/tags/yolo'
		end

		it 'only shows posts with the selected tag' do
			click_link '#yolo'

			expect(page).to have_css 'h1', text: 'Posts tagged with #yolo'
			expect(page).to have_content 'Pic1'
			expect(page).not_to have_content 'Pic2'
		end

	end

end
