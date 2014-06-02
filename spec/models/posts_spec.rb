require 'spec_helper'

describe Post do
	let(:post) { create(:post) }

	describe '#tag_names' do

		describe 'with no tags' do 

			it 'does nothing' do
				post.tag_names = ''
				expect(post.tags).to be_empty
			end

		describe 'with one tags' do 
			
			it 'adds a single tag to the post' do
				post.tag_names = 'cute'
				expect(post.tags.count).to eq 1
			end

			it 'prepends the tags with a #' do
				post.tag_names = 'cute'
				tag = post.tags.last
				expect(tag.name).to eq '#cute'
			end
		end

		end
	end
end
