class GenerateSurveyProtocolForm
  attr_reader :fields

  def initialize(format)
    @fields = format["fields"]
  end

  def each_field
    fields.lazy.map{|f| Field.new(f) }
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
