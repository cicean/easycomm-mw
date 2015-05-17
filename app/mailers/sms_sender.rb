class SmsSender < ActionMailer::Base
  def send_message(message)
      #@message = message
    account_sid = 'ACb0dbb69e0dde8f83b37b47e434098c33'
    auth_token = '3510e2b74715864002cb88501bb5f6b8'
    
    @client = Twilio::REST::Client.new account_sid, auth_token
    
    @message = @client.account.messages.create({:from => "+1"+message.sender,
                                               :to => "+1"+message.recipient,
                                               :body => message.body})
                                               
                                               #redirect_to '/'
    end
end
