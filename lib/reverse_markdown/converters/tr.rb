module ReverseMarkdown
  module Converters
    class Tr < Base
      def convert(node)
        content = treat_children(node).rstrip
        result  = "|#{content}\n"
        table_header_row?(node) ? result + underline_for(node) : result
      end

      def table_header_row?(node)
        (contained_in_thead?(node) || node.element_children.all? {|child| child.name.to_sym == :th}) && !contained_in_tbody?(node)
      end

      def underline_for(node)
        "| " + (['---'] * node.element_children.size).join(' | ') + " |\n"
      end
      
      def contained_in_thead?(node)
        node.parent && node.parent.name == 'thead'
      end
      
      def contained_in_tbody?(node)
        node.parent && node.parent.name == 'tbody'
      end
    end

    register :tr, Tr.new
  end
end
