require 'hanami/interactor'

class UpdateStatementItem
  include Hanami::Interactor

  include Import[
    'repositories.account_repository',
    'repositories.statement_item_repository'
  ]

  def call(account_id, statement_item_attributes)
    account        = account_repository.class.entity.new(id: account_id)
    statement_item = statement_item_repository.class.entity.new(statement_item_attributes)

    account_repository.transaction do
      statement_item_repository.sync(account, statement_item)

      balance = statement_item_repository.latest_for_account(account).balance

      account_repository.update(account.id, balance: balance)
    end

    PropagateStatementUpdate.perform_async(statement_item.id)
  end
end
