module ReverseMarkdown
  module Converters
    class TBody < Base
      def convert(node)
        treat_children(node)
      end
    end

    register :tbody, TBody.new
  end
end
