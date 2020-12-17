require './lib/rubo'

describe Rubo do
  describe '.right-spaces' do
    it 'return an error if exist right spaces at the end line' do
      expect(Rubo.right_spaces('bad.rb', 'def my_method   ',
                               2)).to eql("bad.rb line:3 'Right blank space(s) in the line.'\n")
    end

    it "No return if doesn't exist a right space at the end line" do
      expect(Rubo.right_spaces('./examples/inside_example/good.rb', 'def my_method', 2)).to eql(nil)
    end
  end

  describe '.semicolon' do
    it 'return error because exist a semicolon at the end line' do
      expect(Rubo.semicolon('./examples/inside_example/bad.rb', 'p "puts";',
                            1)).to eql("./examples/inside_example/bad.rb line:2 'Semicolon is not neccesary'\n")
    end

    it "No return because there isn't error in the line" do
      expect(Rubo.semicolon('./examples/inside_example/good.rb', 'p "puts"', 3)).to eql(nil)
    end
  end

  describe '.nav_operator' do
    it 'return error because nav operator has blank-spaces between the symbol (left)' do
      expect(Rubo.nav_operator('bad.rb', 'foo &.bar',
                               25)).to eql("bad.rb line:26 'No space required between navigation operator'\n")
    end

    it 'return error because nav operator has blank-spaces between the symbol (right)' do
      expect(Rubo.nav_operator('bad.rb', 'foo&. bar',
                               25)).to eql("bad.rb line:26 'No space required between navigation operator'\n")
    end

    it 'no return because nav operator has not blank-spaces between the symbol' do
      expect(Rubo.nav_operator('bad.rb', 'foo&.bar', 25)).to eql(nil)
    end
  end

  describe '.space_between_elements' do
    it 'return error because a blank-space between elements is required' do
      text = "bad.rb line:36 'Space required between separator and array element'\n"
      expect(Rubo.space_between_elements('bad.rb', '[ 1,2, 3 ]', 35)).to eql(text)
    end

    it 'no return because the Array has good blank-spaces between the elements' do
      expect(Rubo.space_between_elements('good.rb', '[ 1, 2, 3 ]', 149)).to eql(nil)
    end
  end

  describe '.exponent' do
    it 'return error if the exponent and his elements has an space between them (left)' do
      expect(Rubo.exponent('bad.rb', 'e = m * c **2',
                           145)).to eql("bad.rb line:146 'No space required between an exponent operator'\n")
    end

    it 'return error if the exponent and his elements has an space between them (right)' do
      expect(Rubo.exponent('bad.rb', 'e = m * c** 2',
                           145)).to eql("bad.rb line:146 'No space required between an exponent operator'\n")
    end

    it "no return error because there's not blank-spaces around the symbol and his elements" do
      expect(Rubo.exponent('bad.rb', 'e = m * c**2', 145)).to eql(nil)
    end
  end
end
