$LOAD_PATH << "." unless $LOAD_PATH.include?(".")

require 'rubygems'
require 'bundler/setup'
require 'wildcard_scopes'

WildcardScopes::Railtie.config.wildcard_scopes = proc {
  ActiveRecord::Base.wildcard_scope /ascend_by_(.*)/, proc { |a| order("#{table_name}.#{a.first} ASC") }
}

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3", 
  "database" => ":memory:"
)

ActiveRecord::Schema.define :version => 0 do
  create_table "users", :force => true do |t|
    t.datetime :created_at
  end
end

class User < ActiveRecord::Base
  wildcard_scope /descend_by_(.*)/, proc { |a| order("#{table_name}.#{a.first} DESC") }
end

$: << File.join(File.dirname(__FILE__), '..', 'lib')