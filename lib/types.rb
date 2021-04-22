require 'hanami/model/sql/types/schema/coercions'
# https://github.com/hanami/model/blob/v1.3.2/lib/hanami/model/sql/types.rb

module Types
  Time = Hanami::Entity::Types::Time.constructor(Hanami::Model::Sql::Types::Schema::Coercions.method(:time))
end
