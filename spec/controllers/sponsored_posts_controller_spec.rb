require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do
  let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:sponsored_post) { my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }
  
  

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { topic_id: my_topic.id, id: sponsored_post.id }
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #show view" do
       get :show, params: { topic_id: my_topic.id, id: sponsored_post.id }
       expect(response).to render_template :show
     end
 
     it "assigns sponsored_post to @sponsored_post" do
       get :show, params: { topic_id: my_topic.id, id: sponsored_post.id }
       expect(assigns(:sponsored_post)).to eq(sponsored_post)
     end
  end

  describe "GET new" do
     it "returns http success" do
       get :new, params: { topic_id: my_topic.id }
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #new view" do
       get :new, params: { topic_id: my_topic.id }
       expect(response).to render_template :new
     end
 
     it "initializes @sponsored_post" do
       get :new, params: { topic_id: my_topic.id }
       expect(assigns(:sponsored_post)).not_to be_nil
     end
   end

  describe "GET edit" do
     it "returns http success" do
       get :edit, params: { topic_id: my_topic.id, id: sponsored_post.id }
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #edit view" do
       get :edit, params: { topic_id: my_topic.id, id: sponsored_post.id }
       expect(response).to render_template :edit
     end
 
     it "assigns sponsored post to be updated to @sponsored_post" do
       get :edit, params: { topic_id: my_topic.id, id: sponsored_post.id }
       sponsored_post_instance = assigns(:sponsored_post)
 
       expect(sponsored_post_instance.id).to eq my_topic.id
       expect(sponsored_post_instance.title).to eq new_name
       expect(sponsored_post_instance.description).to eq my_topic.description
     end
   end
   
   describe "PUT update" do
     it "updates sponsored_post with expected attributes" do
       new_name = RandomData.random_sentence
       new_description = RandomData.random_paragraph
 
       put :update, params: { topic_id: my_topic.id, sponsored_post: { name: new_name, description: new_description } }
 
       updated_sponsored_post = assigns(:sponsored_post)
       expect(updated_sponsored_post.id).to eq my_topic.id
       expect(updated_sponsored_post.title).to eq new_name
       expect(updated_sponsored_post.description).to eq new_description
     end
 
     it "redirects to the updated sponsored_post" do
       new_name = RandomData.random_sentence
       new_description = RandomData.random_paragraph
 
       put :update, params: { topic_id: my_topic.id, topic: { name: new_name, description: new_description } }
       expect(response).to redirect_to my_topic
     end
   end
   
   describe "DELETE destroy" do
     it "deletes the topic" do
       delete :destroy, params: { topic_id: my_topic.id, id: sponsored_post.id }
       count = SponsoredPost.where({ topic_id: my_topic.id, id: sponsored_post.id })
       expect(count).to eq 0
     end
   
     it "redirects to topics index" do
       delete :destroy, params: { topic_id: my_topic.id, id: sponsored_post.id }
       expect(response).to redirect_to sponsored_post_path
     end
   end
   

end
