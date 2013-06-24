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

  describe "GET #show" do
    context "book exists" do
      let!(:book) { stub_model(Book) }

      before :each do
        Book.stub(:find).and_return(book)
      end

      it "sends find message to Book class" do
        Book.should_receive(:find).with("1")
        get :show, id: 1
      end

      it "assigns @book to the view" do
        get :show, id: 1
        expect(assigns[:book]).to eq(book)
      end
    end

    context "book does't exist" do
      before :each do
        Book.stub(:find).and_raise(ActiveRecord::RecordNotFound)
      end

      it "redirects to not found page" do
        get :show, id: 1
        expect(response).to redirect_to root_path
      end

      it "assigns flash[:error]" do
        get :show, id: 0
        expect(flash[:error]).not_to be_nil
      end
    end
  end
end
