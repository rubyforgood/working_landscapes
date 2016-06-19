class EntryForm < Reform::Form
  include Composition

  model :entry

  property :count, on: :entry
  property :taxon, on: :entry

end
