# spec/heading_spec.rb
require_relative '../lib/heading.rb'

describe Heading do
  describe '.headings' do
    it 'should return correctly tabular and formatted headings with the provided test data 1' do
      data = [
        { id: 1, title: 'heading1', heading_level: 0 },
        { id: 2, title: 'heading2', heading_level: 2 },
        { id: 3, title: 'heading3', heading_level: 1 },
        { id: 4, title: 'heading4', heading_level: 1 }
      ]
      heading = Heading.new(data)
      expected_string =
        " 1. Heading1 \n\t\t 1.1.1. Heading2 \n\t 1.1. Heading3 \n\t 1.2. Heading4 \n"
        expect(heading.simulated_headings).to eq expected_string
    end

    it 'should return correctly tabular and formatted headings with the provided test data 2' do 
      data = [        
        { id: 1, title: 'heading1', heading_level: 0 },
        { id: 2, title: 'heading2', heading_level: 3 },
        { id: 3, title: 'heading3', heading_level: 4 },
        { id: 4, title: 'heading4', heading_level: 1 },
        { id: 5, title: 'heading5', heading_level: 0 }
      ]
      heading = Heading.new(data)
      expected_string =
        " 1. Heading1 \n\t\t\t 1.1.1.1. Heading2 \n\t\t\t\t 1.1.1.1.1. Heading3 \n\t 1.1. Heading4 \n 2. Heading5 \n"
        expect(heading.simulated_headings).to eq expected_string
    end
  end
end
