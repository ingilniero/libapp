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
end
