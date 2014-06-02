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
	end
end
