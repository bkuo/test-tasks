class CombinedMessages < SimpleDelegator
  def initialize(messages, broadcasts)
    super (messages + broadcasts).sort_by(&:created_at).reverse
  end
end