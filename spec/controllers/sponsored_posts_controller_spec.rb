require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do
  let(:sponsored_post) { my_topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }
  let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
  

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

  describe "GET new" do
     it "returns http success" do
       get :new
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #new view" do
       get :new
       expect(response).to render_template :new
     end
 
     it "initializes @topic" do
       get :new
       expect(assigns(:topic)).not_to be_nil
     end
   end

  describe "GET edit" do
     it "returns http success" do
       get :show, params: { topic_id: my_topic.id, id: sponsored_post.id }
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #edit view" do
       get :show, params: { topic_id: my_topic.id, id: sponsored_post.id }
       expect(response).to render_template :edit
     end
 
     it "assigns topic to be updated to @topic" do
       get :show, params: { topic_id: my_topic.id, id: sponsored_post.id }
       topic_instance = assigns(:topic)
 
       expect(topic_instance.id).to eq my_topic.id
       expect(topic_instance.name).to eq my_topic.name
       expect(topic_instance.description).to eq my_topic.description
     end
   end
   
   describe "PUT update" do
     it "updates sponsored_post with expected attributes" do
       new_name = RandomData.random_sentence
       new_description = RandomData.random_paragraph
 
       put :update, params: { topic_id: my_topic.id, topic: { name: new_name, description: new_description } }
 
       updated_topic = assigns(:topic)
       expect(updated_topic.id).to eq my_topic.id
       expect(updated_topic.name).to eq new_name
       expect(updated_topic.description).to eq new_description
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
