class AutomaticCancellationJob < Struct.new(:transaction_id)
  include DelayedExceptionNotification

  def perform
    #transaction = Transaction.find(transaction_id)
    #if transaction.status.eql?("requested")
      #MarketplaceService::Transaction::Command.transition_to(transaction.id, :canceled)
    #end
  end

end
