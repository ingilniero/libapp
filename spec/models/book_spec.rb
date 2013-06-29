require 'spec_helper'

describe Book do
  let(:book) { book = Book.new }

  describe 'validations' do
    it { should validate_uniqueness_of(:title) }
    it { should validate_presence_of(:title) }
    it { should belong_to(:reader) }
  end

  describe "#owned_by?" do
    it "returns true if book is created by provided reader" do
      owner = stub_model(Reader)
      book = Book.new(title: "title", reader: owner)
      expect(book.owned_by?(owner)).to be_true
    end

    it "returns false if book is not created by provided reader" do
      owner = stub_model(Reader)
      reader = stub_model(Reader)
      book = Book.new(title: "title", reader: owner)
      expect(book.owned_by?(reader)).to be_false
    end
  end

  describe 'attributes' do
    let(:book) { Book.new }

    it 'has a number of pages' do
      book.pages = 45
      expect(book.pages).to eq(45)
    end

    it 'has an author' do
      book.author = 'Shakespeare'
      expect(book.author).to eq('Shakespeare')
    end

    it 'has a description' do
      book.description = 'Lorem Ipsum do let'
      expect(book.description).to eq('Lorem Ipsum do let')
    end
  end
end

