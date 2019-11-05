module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :all_books, [BookType], null: true, description: "Returns a list of all Books"

    field :book, BookType, null: true do
      description "Returns book given an ID"
      argument :id, ID, required: true
    end

    def all_books
      Book.all
    end

    def book(id:)
      Book.find_by(id: id)
    end
  end
end
