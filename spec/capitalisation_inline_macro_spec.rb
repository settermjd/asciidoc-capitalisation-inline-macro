require 'rspec'
require './lib/capitalisation_inline_macro'

describe 'CapitalisationInlineMacroSpec' do
  before do
    @macro = CapitalisationInlineMacro.new
  end

  describe ".process_string" do
    context 'given the style "first"' do
      it 'returns the first letter of the supplied string capitalised' do
        attrs = {
          'style' => 'first'
        }
        expect(@macro.process_string("book", attrs)).to eq('Book')
      end
    end

    context 'given the style "upper"' do
      it 'returns the supplied string in uppercase' do
        attrs = {
          'style' => 'upper'
        }
        expect(@macro.process_string("book", attrs)).to eq('BOOK')
      end
    end

    context 'given the style "lower"' do
      it 'returns the supplied string in lowercase' do
        attrs = {
          'style' => 'lower'
        }
        expect(@macro.process_string("book", attrs)).to eq('book')
      end
    end

    context 'given an empty style' do
      it 'returns the supplied string' do
        expect(@macro.process_string("book", {})).to eq('book')
      end
    end

    context 'given an unknown style' do
      it 'returns the supplied string' do
        attrs = {
          'style' => 'yellow'
        }
        expect(@macro.process_string("book", attrs)).to eq('book')
      end
    end

    context 'given no supplied attributes' do
      it 'returns the supplied string' do
        expect(@macro.process_string("book", nil)).to eq('book')
      end
    end
  end
end
