require 'spec_helper'

describe Post do
	let(:post) { create(:post) }

	describe '#tag_names' do

		describe 'with no tags' do 

			it 'does nothing' do
				post.tag_names = ''
				expect(post.tags).to be_empty
			end
		end

		describe 'with one tags' do 
			
			it 'adds a single tag to the post' do
				post.tag_names = 'cute'
				expect(post.tags.count).to eq 1
			end

			it 'prepends the tags with a # if necessary' do
				post.tag_names = 'cute'
				tag = post.tags.last
				expect(tag.name).to eq '#cute'
			end

			it 'does not double up #s' do
				post.tag_names = '#cute'
				tag = post.tags.last
				expect(tag.name).to eq '#cute'
			end
		end

		describe 'multiple comma-separated tags' do 
			it 'adds each tag to the post' do 
				post.tag_names = 'cute, kitten'
				expect(post.tags.count).to eq 2
			end
		end

		context 'without spaces' do 
			it 'adds each tag to the post' do 
				post.tag_names = 'cute,cat'
				expect(post.tags.count).to eq 2
			end
		end

		describe 'multiple duplicate tags' do 
			it 'uses only unique tags' do 
				post.tag_names = 'cute, kitten, cute'
				expect(post.tags.count).to eq 2
			end
		end

		describe 'reusing tags' do 
			let!(:tag) { Tag.create(name: '#cute') }

			it 'reuses tags if they exist' do
				post.tag_names = 'cute'
				expect(Tag.count).to eq 1

				expect(tag.posts).to include post
			end
		end


	end
end
