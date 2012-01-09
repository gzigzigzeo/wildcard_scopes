require 'spec_helper'

describe WildcardScopes do
  it "local & global wildcard scopes works" do
    User.ascend_by_created_at.to_sql.should == 'SELECT "users".* FROM "users"  ORDER BY users.created_at ASC'
    User.descend_by_created_at.to_sql.should == 'SELECT "users".* FROM "users"  ORDER BY users.created_at DESC'
  end
end