require 'hanami/interactor'

class UpdateStatementItem
  include Hanami::Interactor

  def initialize(accounts:        AccountRepository.new,
                 statement_items: StatementItemRepository.new)
    @accounts        = accounts
    @statement_items = statement_items
  end

  def call(account_id, statement_item_attributes)
    account        = @accounts.class.entity.new(id: account_id)
    statement_item = @statement_items.class.entity.new(statement_item_attributes)

    @accounts.transaction do
      @statement_items.sync(account, statement_item)
      @accounts.update(account.id, balance: @statement_items.last.balance)
    end
  end
end
