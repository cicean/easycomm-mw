class MessageCreator
  attr_accessor :message, :sms_record

  def initialize(params)
    @message = Message.new(allowed_params(params))
  end

  def ok?
      #if message = Messages.
      #   save_message && send_notification
      # else message =
      send_sms
    
  end

  private

  def send_notification
    MessageMailer.secure_message(@message).deliver_now
  end
  
  def send_sms
      
      SmsSender.send_message(@message).deliver_now
      
  end


  def save_message
    @message.secure_id = SecureRandom.urlsafe_base64(25)
    @message.save
  end

  def allowed_params(params)
    { sender_email: params[:message][:sender], recipient_email: params[:message][:recipient], body: params[:message][:body]}
  end
end
