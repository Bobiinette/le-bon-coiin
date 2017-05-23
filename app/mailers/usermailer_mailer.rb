class UsermailerMailer < ApplicationMailer
	default from: 'nicolasensiietestprojets@gmail.com'
	layout 'mailer'

	def sample_mail(utilisateur, objet)
		@user = utilisateur
		mail(:to => @user.email, :subject => objet)
	end
end
