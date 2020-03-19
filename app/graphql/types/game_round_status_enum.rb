class Types::GameRoundStatusEnum < Types::BaseEnum
  ::GameRound.statuses.keys.each { |type| value(type) }
end
