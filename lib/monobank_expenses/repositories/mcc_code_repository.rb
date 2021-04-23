class MccCodeRepository < Hanami::Repository
  associations do
    belongs_to :mcc_label
    belongs_to :category
  end

  def find_by_mccs(mccs)
    aggregate(:mcc_label, :category)
      .where(mcc: mccs)
      .map_to(MccCode)
  end

  def create_empty_mccs(mccs)
    new_mccs = mccs - mcc_codes.where(mcc: mccs).pluck(:mcc)

    return [] if new_mccs.empty?

    data = new_mccs.map { |mcc| { mcc: mcc } }

    command(create: :mcc_codes, result: :many).call(data)
  end
end
