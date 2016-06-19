class GenerateSurveyProtocolForm
  attr_reader :fields

  def initialize(format)
    @fields = format['fields']
  end

  def each_field(&block)
    fields.map { |f| Field.new(f) }.each(&block)
  end

  def form_class
    @form_class ||= define_form_class
  end

private

  def define_form_class
    Class.new(EntryForm).tap do |klass| 
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
      @options  = data['options']
      @name     = data['cid']
    end
  end
end
