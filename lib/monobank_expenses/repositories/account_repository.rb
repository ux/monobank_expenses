class AccountRepository < Hanami::Repository
  associations do
    belongs_to :user
  end

  def sync(id, data)
    update(id, data) || create(data)
  end
end
