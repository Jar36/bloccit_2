require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { topic_id: my_topic.id, id: sponsored_post.id }
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #show view" do
       get :show, params: { topic_id: my_topic.id, id: sponsored_post.id }
       expect(response).to render_template :show
     end
 
     it "assigns sponsored_post to @topic" do
       get :show, params: { topic_id: my_topic.id, id: sponsored_post.id }
       expect(assigns(:topic)).to eq(sponsored_post)
     end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end
