class Types::GameStatusEnum < Types::BaseEnum
  ::Game.statuses.keys.each { |type| value(type) }
end
