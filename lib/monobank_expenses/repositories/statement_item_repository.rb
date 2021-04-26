class StatementItemRepository < Hanami::Repository
  associations do
    belongs_to :account
    belongs_to :mcc_code
  end

  def sync(account, statement_item)
    data = statement_item.to_h.merge(account_id: account.id)
    update(statement_item.id, data) || create(data)
  end

  def find_by_account(account)
    aggregate(:mcc_code)
      .where(account_id: account.id)
      .order { time.desc }
      .map_to(StatementItem)
      .to_a
  end

  def latest_for_account(account)
    statement_items
      .where(account_id: account.id)
      .order { time.desc }
      .limit(1)
      .first
  end

  def find_between(account, from, to)
    statement_items
      .where(account_id: account.id, time: from.to_time...to.to_time)
      .order { time.desc }
      .to_a
  end
end
