module Web
  module Controllers
    module Accounts
      class Show
        include Web::Action

        expose :user, :account, :mcc_info, :statement_items_by_date

        def initialize(users: UserRepository.new,
                       statements: StatementItemRepository.new,
                       mcc_codes: MccCodeRepository.new)
          @users      = users
          @statements = statements
          @mcc_codes  = mcc_codes
        end

        def call(params)
          @user    = @users.find_with_accounts(params[:user_id])
          @account = @user.accounts.detect { |account| account.id == params[:id] }

          statement_items = @statements.find_by_account(@account)

          @mcc_info = build_mcc_info(statement_items)

          @statement_items_by_date = statement_items.group_by { |statement| statement.time.to_date }
        end

        private

        def build_mcc_info(statement_items)
          mccs = statement_items
            .map { |item| [item.mcc, item.original_mcc, item.edited_mcc] }
            .flatten
            .compact
            .uniq

          @mcc_codes
            .find_by_mccs(mccs)
            .to_a
            .map { |code| [code.mcc, { category: code.category&.name, label: code.mcc_label&.name }] }
            .to_h
        end
      end
    end
  end
end
