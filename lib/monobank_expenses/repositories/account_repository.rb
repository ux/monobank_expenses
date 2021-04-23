class AccountRepository < Hanami::Repository
  associations do
    belongs_to :user
  end

  def sync(user, account)
    data = account.to_h.merge(client_id: user.client_id)
    update(account.id, data) || create(data)
  end
end
