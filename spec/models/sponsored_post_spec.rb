require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:sponsored_post) { topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }
end
