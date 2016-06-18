class EntryForm < Reform::Form
  include Composition

  model :entry

  property :count, on: :entry
  property :taxa, on: :entry

end
