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

It also adds a ".sortable_fields" method for you to limit by which fields
the records may be ordered.

### URL Examples
* http://whatever.com/wherever/?sort_name=asc
* http://whatever.com/wherever/?sort_1_name=asc
* http://whatever.com/wherever/?sort_1_name=asc&sort_2_salary=desc

### Active Record Calls
#### USING WITH ALL THE PARAMS FROM THE URL (usual usage)
    posts = Post.sort(params).all
    
#### EXAMPLE OF HOW IT JUST TAKES A HASH
    #GIVEN THE DATA IN THE DB IS AS FOLLOWS:
    adam:
      id: 1
      name: Adam
      salary: 80000
      bonus: true
    
    dave1:
      id: 2
      name: Dave
      salary: 9000
      bonus: true
    
    dave2:
      id: 3
      name: Dave
      salary: 70000
      bonus: true
    
    admin:
      id: 12
      name: admin
      salary: 10000
      bonus: false
    
    goofy:
      id: 13
      name: Goofy
      salary: 11000
      bonus: false
    
    #THE CALL
    users = User.sort({'sort_1_name' => 'asc', 'sort_2_salary' => 'desc'}).all

    #RESULTS
    [#<User id: 1, name: "Adam", salary: 80000, bonus: true, created_at: "2011-06-08 15:30:06", updated_at: "2011-06-08 15:30:06">,
    #<User id: 3, name: "Dave", salary: 70000, bonus: true, created_at: "2011-06-08 15:30:06", updated_at: "2011-06-08 15:30:06">,
    #<User id: 2, name: "Dave", salary: 9000, bonus: true, created_at: "2011-06-08 15:30:06", updated_at: "2011-06-08 15:30:06">,
    #<User id: 13, name: "Goofy", salary: 11000, bonus: false, created_at: "2011-06-08 15:30:06", updated_at: "2011-06-08 15:30:06">, 
    #<User id: 12, name: "admin", salary: 10000, bonus: false, created_at: "2011-06-08 15:30:06", updated_at: "2011-06-08 15:30:06">]

    

### Using sortable_fields in your model
    class Post < ActiveRecord::Base
      sortable_fields :title, :published_at
    end
