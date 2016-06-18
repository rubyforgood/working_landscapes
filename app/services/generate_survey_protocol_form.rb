class GenerateSurveyProtocolForm
  attr_reader :fields

  def initialize(format)
    @fields = format["fields"]
  end

  def each_field(&block)
    fields.map{|f| Field.new(f) }.each(&block)
  end

  def form_class
    @form_class ||= Class.new(EntryForm) do
    end
  end

  class Field
    attr_reader :label, :type, :required, :options, :name
    def initialize(data)
      @label    = data["label"]
      @type     = data["field_type"]
      @required = data["required"]
      @options  = data["options"]
      @name     = data["cid"]
    end
  end

end
