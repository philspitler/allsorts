class Post < ActiveRecord::Base
  sortable_fields :title, :published_at
end
