class IsolationgamesSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  # Opt in to the new runtime (default in future graphql-ruby versions)
  use GraphQL::Execution::Interpreter
  use GraphQL::Analysis::AST
  
  # Adding a change that doesn't matter

  # Add built-in connections for pagination
  use GraphQL::Pagination::Connections
end
