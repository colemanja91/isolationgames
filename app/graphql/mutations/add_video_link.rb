# frozen_string_literal: true

class Mutations::AddVideoLink < Types::BaseMutation
  null false

  description 'Update a video link for a game'

  argument :video_link, String, required: true

  def resolve(video_link:)
    current_user = context[:current_user]
    game = current_user.games.active.first
    game.update!(video_link: video_link)

    game.reload
    game
  end
end
