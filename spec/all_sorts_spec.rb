require 'helper'
require 'finders/activerecord_test_connector'
ActiverecordTestConnector.setup

describe AllSorts do
  extend ActiverecordTestConnector::FixtureSetup
  fixtures :users
  fixtures :posts

end
