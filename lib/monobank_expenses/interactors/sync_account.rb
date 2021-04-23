require 'hanami/interactor'

class SyncAccount
  include Hanami::Interactor

  STATEMENTS_PERIOD_SECONDS = 3600 * (31 * 24 + 1)

  expose :statement_items

  def initialize(monobank_class:  Monobank::Client,
                 monobank_error:  Monobank::Error,
                 statement_items: StatementItemRepository.new,
                 mcc_codes:       MccCodeRepository.new)
    @monobank_class             = monobank_class
    @monobank_error             = monobank_error
    @statement_items_repository = statement_items
    @mcc_codes                  = mcc_codes
  end

  def call(user, account)
    @statement_items = sync_statements(account, retrieve_statements(user.api_token, account.id))
  end

  private

  def retrieve_statements(api_token, account_id)
    to   = Time.now
    from = to - STATEMENTS_PERIOD_SECONDS

    monobank = @monobank_class.new(api_token)

    statements_attributes = monobank.statements(account_id, from: from, to: to)

    statements_attributes.map do |statement_attributes|
      @statement_items_repository.class.entity.new(statement_attributes)
    end
  rescue @monobank_error => error
    error!(error.message)
  end

  def sync_statements(account, statement_items)
    mccs = statement_items
      .map { |item| [item.mcc, item.original_mcc, item.edited_mcc] }
      .flatten
      .compact
      .uniq

    @statement_items_repository.transaction do
      @mcc_codes.create_empty_mccs(mccs)

      statement_items.map do |statement_item|
        @statement_items_repository.sync(account, statement_item)
      end
    end
  end
end
