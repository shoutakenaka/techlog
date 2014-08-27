require 'rails_helper'

describe ArticlesController do
  describe "GET /articles/:id" do
    subject { get :show, id: "id" }

    let(:service) { double :service }

    before { expect(ArticleService).to receive(:new).and_return(service) }

    context "when article found" do
      let(:content) { {} }

      before { expect(service).to receive(:find).and_return(content) }

      it "responds 200 ok" do
        subject
        expect(response.status).to eq 200
      end

      it "renders show template" do
        subject
        expect(response).to render_template :show
      end

      it "assigns found article to @content" do
        subject
        expect(assigns[:content]).to be content
      end
    end
  end
end