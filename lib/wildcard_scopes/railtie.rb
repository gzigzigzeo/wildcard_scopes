module WildcardScopes
  class Railtie < ::Rails::Railtie
    config.wildcard_scopes = proc { }
    
    ActiveSupport.on_load :active_record do
      ActiveRecord::Base.send(:include, WildcardScopes::Base)
      ActiveRecord::Base.instance_exec(&WildcardScopes::Railtie.config.wildcard_scopes)
    end  
  end
end