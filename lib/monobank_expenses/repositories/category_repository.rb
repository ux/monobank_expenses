class CategoryRepository < Hanami::Repository
  associations do
    has_many :mcc_codes
  end
end
