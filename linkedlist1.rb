class LinkedList
    attr_accessor :head
    attr_accessor :tail
  
    def add_node(value)
      new_node = LinkedListNode.new(value)
  
      self.head ||= new_node
  
      if tail
       tail.next_node = new_node
      end
  
      self.tail = new_node
    end
  
    
    def print_values(list_node=head)
      if list_node
        print "#{list_node.value} --> "
        print_values(list_node.next_node)
      else
        print "nil\n"
        return
      end
    end
  end
  
  class LinkedListNode
    attr_accessor :value, :next_node
  
    def initialize(value, next_node=nil)
      @value = value
      @next_node = next_node
    end
  end
  
  class Stack
      attr_reader :data
  
      def initialize
          @data = nil
      end
 
      def push(value)
          # implementation
          @data = LinkedListNode.new(value, @data)
      end
  
      
      def pop
          return nil if @data.nil?
          top_stack_value = @data.value
          @data = @data.next_node
          top_stack_value
      end
  
  end
  
  def reverse_list(list)
      stack = Stack.new
      node = list.head
  
      while node
          stack.push(node.value)
          node = node.next_node
      end
  
      reversed_list = LinkedList.new
      while value = stack.pop
          reversed_list.add_node(value)
      end
      reversed_list
      #  LinkedListNode.new(stack.pop, stack.data)
  end
  
  list = LinkedList.new
  list.add_node(12)
  list.add_node(99)
  list.add_node(37)
  # Passing no parameters to print_values causes the LinkedList class to use the first_node in the list
  list.print_values
  reversed_list = reverse_list(list)
  reversed_list.print_values