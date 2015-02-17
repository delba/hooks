require "hooks/version"

module Hooks
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def method_missing(method, *args)
      unless /\A(before|after|around)_(.+)\z/ =~ method
        super
      end

      send "add_#{$1}_hook", $2, args
    end

  private

    def add_before_hook(method, hooks)
      prepend_method method do
        hooks.each { |hook| send hook }
        super()
      end
    end

    def add_after_hook(method, hooks)
      prepend_method method do
        super()
        hooks.each { |hook| send hook }
      end
    end

    def add_around_hook(method, hooks)
      prepend_method method do
        send hooks[0] { super() }
      end
    end

    def prepend_method(method, &block)
      prepend Module.new { define_method(method, &block) }
    end
  end
end
