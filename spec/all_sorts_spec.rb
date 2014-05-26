require 'spec_helper'
require 'support/active_record'

describe AllSorts do
  it "sorts by a single field" do
    expected_posts = Post.all.order('title desc')
    posts = Post.all.sort({'sort_title' => 'desc'})
    posts.should == expected_posts

    expected_posts = Post.all.order('title asc')
    posts = Post.all.sort({'sort_title' => 'asc'})
    posts.should == expected_posts
  end

  it "ignores fields not in sortable_fields if sortable_fields is set" do
    expected_posts = Post.all
    posts = Post.all.sort({'sort_body' => 'desc'})
    posts.should == expected_posts
  end

  it "sorts by multiple fields" do
    expected_users = User.all.order('name asc, salary desc')
    users = User.sort({'sort_1_name' => 'asc', 'sort_2_salary' => 'desc'}).all
    users.should == expected_users
  end

  it "ignores fields that don't make sense" do
    expected_users = User.all.order('name asc')
    users = User.sort({'sort_1_name' => 'asc', 'sort_2_blah' => 'desc'}).all
    users.should == expected_users
  end
end
