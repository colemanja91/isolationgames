class Mutations::UpdateUserName < Types::BaseMutation
  null false

  description "Update a user's name"

  argument :name, String, required: true

  def resolve(name:)
    current_user = context[:current_user]
    current_user.update!(name: name)
    current_user.reload
  end
end
