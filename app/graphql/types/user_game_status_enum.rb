class Types::UserGameStatusEnum < Types::BaseEnum
  ::UserGame.statuses.keys.each { |type| value(type) }
end
