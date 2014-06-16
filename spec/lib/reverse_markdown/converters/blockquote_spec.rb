require 'spec_helper'

describe ReverseMarkdown::Converters::Blockquote do

  let(:converter) { ReverseMarkdown::Converters::Blockquote.new }

  it 'converts nested elements as well' do
    input = Nokogiri::XML.parse("<blockquote><ul><li>foo</li></ul></blockquote>").root
    result = converter.convert(input)
    result.should eq "> - foo\n"
  end

  it 'can deal with paragraphs inside' do
    input = Nokogiri::XML.parse("<blockquote><p>Some text.</p><p>Some more text.</p></blockquote>").root
    result = converter.convert(input)
    result.should eq "> Some text.\n> \n> Some more text.\n"
  end
end
