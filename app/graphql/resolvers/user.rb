class Resolvers::User < Resolvers::Base
  description "Return the current user"

  def resolve
    context[:current_user]
  end
end
