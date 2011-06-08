# All Sorts

## A DSL for sorting active record results based on hash keys with the term _sort_ in them.

### Installation

#### Bundler
gem 'all_sorts'

#### Other
gem install all_sorts

### Usage
All Sorts was originally developed to fill the need of being able to
sort by one or multiple columns passed in the URL, however it works with
ActiveRecord and basically takes in a hash.  This gem adds a ".sort" method
to ActiveRecord which basically does some clever stuff by looking at the
hash keys, creates a string by which to sort results, and calls ".order"
with that string.

### URL Examples
* http://whatever.com/wherever/?sort_name=asc
* http://whatever.com/wherever/?sort_1_name=asc
* http://whatever.com/wherever/?sort_1_name=asc&sort_2_salary=desc

### Active Record Call
* posts = Post.sort(params).all
