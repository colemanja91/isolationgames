class Types::BaseMutation < GraphQL::Schema::Mutation
  def self.enum(ruby_values, name)
    Class.new(Types::BaseEnum) do
      graphql_name name
      ruby_values.each do |v|
        value(v.to_s, value: v)
      end
    end
  end
end
