class UserRepository < Hanami::Repository
  associations do
    has_many :accounts
  end

  def sync(client_id, data, &block)
    update(client_id, data)&.tap(&block) || assoc(:accounts).create(data)
  end

  def find_with_accounts(client_id)
    aggregate(:accounts).where(client_id: client_id).map_to(User).one
  end
end
