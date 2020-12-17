require './lib/rubo'

describe Rubo do
  describe '.run' do
    it 'return no errors in a good script' do
      expect(Rubo.run(['./examples/good.rb'])).to eql(['./examples/good.rb'])
    end

    it 'return errors in a bad script' do
      expect(Rubo.run(['./examples/bad.rb'])).to eql(['./examples/bad.rb'])
    end

    it 'return errors in a worst script' do
      expect(Rubo.run(['./examples/inside_example/worst.rb'])).to eql(['./examples/inside_example/worst.rb'])
    end
  end
end
