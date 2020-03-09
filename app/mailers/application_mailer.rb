class ApplicationMailer < ActionMailer::Base
  # default to: adamjsikora@gmail,
  #   from: "low_coin@example.com"

  # layout 'mailer'

  def coin_low

    puts "into email method"
    

    mail(
      from: "low_coin@example.com",
      subject: "Low Coin Warning",
      to: "adamjsikora@gmail.com"
    ) do |format|
      format.text {render plain: 'test test test'}
    end
  end


end
