module UrlField
  def self.included(base) 
    base.extend UrlFieldMethod
  end

  module UrlFieldMethod
    def url_field(*args)

      args.each do |field_name|
        before_validation :"clean_#{field_name}_url_field"                    # before_save :clean_url_url_field
      end

      class_eval do        
        
        args.each do |field_name|
          define_method(:"clean_#{field_name}_url_field") do              # def clean_url_url_field
            self.send("#{field_name}=", send("cleaned_#{field_name}"))    #   self.url = cleaned_url
          end                                                             # end
        end
        
        private

        args.each do |field_name|
          define_method("cleaned_#{field_name}") do
            return nil if send(field_name).nil? or send(field_name).blank?
            return "http://#{send(field_name)}" unless send(field_name).match(/https?:\/\/.*$/i)
            send(field_name)
          end
        end
      end
    end
  end
end

if Object.const_defined?("ActiveRecord")
  ActiveRecord::Base.send(:include, UrlField)
end
