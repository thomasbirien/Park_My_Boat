class BookingMailer < ApplicationMailer
  default from: 'parkmyboat@outlook.fr'

  def capitainerie(booking)
    @booking = booking
    mail( to: 'parkmyboat@outlook.fr'
      subject: 'une reservation est demandé pour votre port')
  end
end
