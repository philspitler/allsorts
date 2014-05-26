require 'active_record'

ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"

load "spec/db/schema.rb"

FactoryGirl.find_definitions

class User < ActiveRecord::Base
end

class Post < ActiveRecord::Base
  sortable_fields :title, :published_at
end

FactoryGirl.create_list(:user, 12)
FactoryGirl.create_list(:post, 3)
