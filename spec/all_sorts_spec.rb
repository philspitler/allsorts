require 'helper'
require 'finders/activerecord_test_connector'
ActiverecordTestConnector.setup

describe AllSorts do
  extend ActiverecordTestConnector::FixtureSetup
  fixtures :users
  fixtures :posts

  it "sorts by a single field" do
    posts = Post.sort({'sort_title' => 'desc'}).all
    post_ids = posts.map do |post|
      post.id
    end
    post_ids.should == [3, 2, 1]

    posts = Post.sort({'sort_title' => 'asc'}).all
    post_ids = posts.map do |post|
      post.id
    end
    post_ids.should == [1, 2, 3]
  end

  it "ignores fields not in sortable_fields if sortable_fields is set" do
    posts = Post.sort({'sort_body' => 'desc'}).all
    post_ids = posts.map do |post|
      post.id
    end
    post_ids.should == [1, 2, 3]
  end

  it "sorts by multiple fields" do
    users = User.sort({'sort_1_name' => 'asc', 'sort_2_salary' => 'desc'}).all
    user_ids = users.map do |user|
      user.id
    end
    user_ids.should == [1, 3, 2, 13, 12]
  end

  it "ignores fields that don't make sense" do
    users = User.sort({'sort_1_name' => 'asc', 'sort_2_blah' => 'desc'}).all
    user_ids = users.map do |user|
      user.id
    end
    user_ids.should == [1, 2, 3, 13, 12]
  end
end
