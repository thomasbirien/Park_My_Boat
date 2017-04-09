class BookingMailer < ApplicationMailer
  default from: 'parkmyboat@outlook.fr'

  def capitainerie(booking)
    @booking = booking
    mail( to: 'anthonylegneu@gmail.com',
      subject: 'une reservation est demandé pour votre port')
  end
end
