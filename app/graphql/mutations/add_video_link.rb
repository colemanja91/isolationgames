class Mutations::AddVideoLink < Types::BaseMutation
  null false

  description "Update a video link for a game"

  argument :game_id, ID, required: true
  argument :video_link, String, required: true

  def resolve(game_id:, video_link:)
    current_user = context[:current_user]
    game = current_user.games.find(game_id)
    game.update!(video_link: video_link)

    game.reload
    game
  end
end
