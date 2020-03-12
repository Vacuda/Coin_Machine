class ApplicationMailer < ActionMailer::Base
  # default to: adamjsikora@gmail,
  #   from: "low_coin@example.com"

  # layout 'mailer'

  def coin_low

    puts "Send email message to"
    
    # def send_simple_message
    #   RestClient.post "https://api:###########"\
    #   "@api.mailgun.net/v3/##########.mailgun.org/messages",
    #   :from => "Excited User <mailgun@sandbox813b7193c5804af285d26ed7f7390962>",
    #   :to => "adamjsikora@gmail.com",
    #   :subject => "Hello",
    #   :text => "Testing some Mailgun awesomness!"
    # end



    # mail(
    #   from: "low_coin@example.com",
    #   subject: "Low Coin Warning",
    #   to: "adamjsikora@gmail.com"
    # ) do |format|
    #   format.text {render plain: 'test test test'}
    # end
  end


end
