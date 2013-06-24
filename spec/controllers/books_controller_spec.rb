require 'spec_helper'

describe BooksController do

  describe "GET #new" do
    let!(:book) { mock_model("Book").as_new_record }

    before :each do
      Book.stub(:new).and_return(book)
      get :new
    end

    it "assigns book variable to view" do
      expect(assigns[:book]).to eq(book)
    end

    it "renders :new template" do
      expect(response).to render_template :new
    end
  end

  describe "GET #index" do
    before :each do
      Book.stub(:all).and_return([])
    end

    it "sends all message to Book" do
      Book.should_receive(:all)
      get :index
    end

    it "assigns @books to the view" do
      get :index
      expect(assigns[:books]).to eq([])
    end

    it "renders :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end
