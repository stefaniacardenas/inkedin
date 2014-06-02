require 'spec_helper'

describe Tag do
	it 'should be unique' do 
		Tag.create(name: '#cute')
		duplicate = Tag.new(name: '#cute')

		expect(duplicate).to have(1).error_on(:name)
	end
end
