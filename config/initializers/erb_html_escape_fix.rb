class ERB
  module Util
    def html_escape(s)
      s = s.to_s
      if s.html_safe?
        s
      else
        s.gsub(/[&"><]/) { |special| HTML_ESCAPE[special] }.html_safe
      end
    end

    alias h html_escape

    module_function :h
    module_function :html_escape
  end
end

