require 'helper'
require 'finders/activerecord_test_connector'
ActiverecordTestConnector.setup

describe AllSorts do
  extend ActiverecordTestConnector::FixtureSetup
  fixtures :users
  fixtures :posts

  it "should sort by a single field" do
    posts = Post.sort({'sort_title' => 'desc'}).all
    count = 3
    posts.each do |post|
      post.id.should == count
      count -= 1
    end
    
    posts = Post.sort({'sort_title' => 'asc'}).all
    count = 1
    posts.each do |post|
      post.id.should == count
      count += 1
    end
  end
end
