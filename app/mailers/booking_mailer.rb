class BookingMailer < ApplicationMailer
  def capitainerie(booking)
    @booking = booking

    mail(
      to: "parkmyboat@outlook.com",
      subject: "Demande de réservation pour le port #{@booking.place.port.port_name}"
    )
  end
end
