module WildcardScopes
  class Railtie < ::Rails::Railtie
    ActiveSupport.on_load :active_record do
      ActiveRecord::Base.send(:include, WildcardScopes::Base)
    end  
  end
end