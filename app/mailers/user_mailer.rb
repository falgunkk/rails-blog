class UserMailer < ApplicationMailer
	def send_mail
      mail(from: 'lagobosone@geronra.com', to: 'lagobosone@geronra.com', subject: 'Welcome to My Awesome Site').deliver
	end
end
