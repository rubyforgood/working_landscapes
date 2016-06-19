class GenerateSurveyProtocolForm
  attr_reader :fields, :form_superclass

  def initialize(fields, form_superclass)
    @fields = fields
    @form_superclass = form_superclass
  end

  def each_field(&block)
    fields.map { |f| Field.new(f) }.each(&block)
  end

  def form_class
    @form_class ||= define_form_class
  end

private

  def define_form_class
    Class.new(form_superclass).tap do |klass| 
      each_field.each do |f|
        klass.send :property, f.name, virtual: true, on: :data
      end
    end
  end


  class Field
    attr_reader :label, :type, :required, :options, :name
    def initialize(data)
      @label    = data['label']
      @type     = data['field_type']
      @required = data['required']
      @options  = data['field_options'] || {}
      @name     = data['cid']
    end


    def input_type
      case @type
      when /dropdown/i
        "select"
      when /checkboxes/i
        "check_boxes"
      when /radio/i
        "radio_buttons"
      when /paragraph/i
        "text"
      else "string"
      end
    end

    def options
      Array(@options["options"]).map{|o| FieldOption.new o }
    end

  end

  class FieldOption
    attr_reader :label, :value, :checked
    def initialize(definition = {})
      @label     = definition.fetch("label")
      @value     = definition.fetch("value", label)
      @checked   = definition.fetch("checked", false)
    end

  end

end
