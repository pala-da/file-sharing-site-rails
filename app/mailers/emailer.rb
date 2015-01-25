class Emailer < ActionMailer::Base
  default from: "from@example.com"

  def mailto(recipient, url, subject, message, from, sent_at = Time.now)
    @targy = subject
    @cimzett = recipient
    @kitol = from
    @sent_on = sent_at
    @url  = url
    @uzenet = message
    mail(:to => @cimzett, :subject => @targy, :from => @kitol)
  end

end
