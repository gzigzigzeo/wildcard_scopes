module WildcardScopes
  module Base
    extend ::ActiveSupport::Concern

    included do
      class_attribute :wildcard_scopes
    end

    module ClassMethods
      def wildcard_scope(name_regex, *args)
        self.wildcard_scopes ||= {}
        self.wildcard_scopes[name_regex] = args
      end
      
      def method_missing(method, *args, &block)
        super if self.wildcard_scopes.blank?
        self.wildcard_scopes.each do |name, scope_params|
          matchdata = name.match(method.to_s)
          if matchdata
            self.class_eval do
              scope method.to_sym, self.instance_exec(matchdata.to_a.slice(1..-1), &scope_params.first)
            end
            return self.send(method)
          end
        end
        super
      end      
    end    
  end
end