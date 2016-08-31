require 'bh/core_ext/rails/base_helper'
require 'bh/core_ext/rails/form_builder'

module Bh
  module Rails
    module Helpers
      include BaseHelper
      include ActionView::Helpers::FormHelper # for form_for

    private

      def add_form_options!(options)
        options[:html] ||= {}
        options[:html].merge! role: 'form'
        append_class! options[:html], class_for(options[:layout])
        options.merge! builder: FormBuilder
      end

      def class_for(layout)
        case layout.to_s
          when 'navbar' then 'navbar-form'
          when 'inline' then 'form-inline'
          when 'horizontal' then 'form-horizontal'
        end
      end
    end
  end
end