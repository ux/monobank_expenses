module Types
  UnixTime = Hanami::Entity::Types::Time.constructor(Time.method(:at))
end
