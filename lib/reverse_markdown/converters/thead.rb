module ReverseMarkdown
  module Converters
    class THead < Base
      def convert(node)
        treat_children(node)
      end
    end

    register :thead, THead.new
  end
end
