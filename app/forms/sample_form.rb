class SampleForm < Reform::Form
  include Composition

  model :sample

  property :subsite_id, on: :sample
end
