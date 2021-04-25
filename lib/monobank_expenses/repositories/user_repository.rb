class UserRepository < Hanami::Repository
  associations do
    has_many :accounts
  end

  def sync(user, &block)
    update(user.client_id, user)&.tap(&block) || assoc(:accounts).create(user)
  end

  def find_with_accounts(client_id)
    aggregate(:accounts).where(client_id: client_id).map_to(User).one
  end

  def find_by_phone_number(phone_number)
    users.where(phone_number: phone_number).first
  end
end
