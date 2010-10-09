
module CustomMatchers
  class HasErrorOn
    def initialize(field)
      @field = field
    end

    def matches?(model)
      @model = model
      model.valid?
      model.errors[@field].any?
    end

    def failure_message
      "expected error on #{@field} not produced"
    end

    def negative_failure_message
      "expected no error on #{@field}, but was #{@model.errors[@field]}"
    end
  end



  constants.each do |it|
    # define 2 method based on class name HasSomething: has_something and have_something
    name = it.to_s.underscore
    them = [name, name.sub(/^has_/, 'have_')].uniq
    them.each do |matcher_name|
      define_method(matcher_name) { |expected| CustomMatchers.const_get(it).new(expected) }
    end
  end
end
