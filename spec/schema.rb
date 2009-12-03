ActiveRecord::Schema.define(:version => 0) do
  create_table :test_models, :force => true do |t|
    t.string :url
    t.string :other_url
    t.string :another_url
  end
end