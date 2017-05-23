class UsermailerMailer < ApplicationMailer
	default from: 'nicolasensiietestprojets@gmail.com'
	layout 'mailer'

	def signal_mail()
		mail(:to => 'nicolasensiietestprojets@gmail.com', :subject => "Une annonce a été repérée comme abusive")
	end
end
