class BookingController < ApplicationController

    def index 
        @bookings = Booking.all
    end
    
    def new
        @bookings = Booking.new
    end

    def update
        respond_to do |format|
    if @booking.update(booking_params)
        format.html { redirect_to booking_url(@booking), notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
    else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end 

  def destroy
    @booking.destroy!

    respond_to do |format|
      format.html { redirect_to flights_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

    def create
        @bookings = Booking.new(booking_params)
        if @bookings.save
            redirect_to @bookings
        else
            render :new
        end
    end

    private
    def booking_params
        params.require(:booking).permit(:flight_id, :passenger_name, :passenger_email, :no_passenger)
    end
end