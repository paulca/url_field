$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'active_record'
require 'url_field'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
ActiveRecord::Schema.define do
  self.verbose = false

  create_table :test_models, :force => true do |t|
    t.string :url
    t.string :other_url
    t.string :another_url
  end
end
