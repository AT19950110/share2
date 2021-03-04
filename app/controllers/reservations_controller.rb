class ReservationsController < ApplicationController
  
  before_action :set_current_room,{only:[:new,:create]}
  before_action:authenticate_user
    
    def index
     @reservations = Reservation.all
    end
     
     def new
       @reservation = Reservation.new(
         start_date: params[:start_date],
         end_date: params[:end_date],
         group: params[:group],
         n1_price: params[:n1_price],
         user_id: @current_user.id,
         room_id: @current_room.id,
       ) 
       if params[:start_date] == nil
        flash[:alert] = "フォームに入力してください"
        redirect_to("/rooms/#{@current_room.id}")
       elsif params[:end_date] == nil
        flash[:alert] = "フォームに入力してください"
        redirect_to("/rooms/#{@current_room.id}")
       elsif params[:group] == nil
        flash[:alert] = "フォームに入力してください"
        redirect_to("/rooms/#{@current_room.id}")
       end
        flash[:notice] = "予約は完了していません"
     end
      
     
     def create
       @reservation = Reservation.new(
         start_date: params[:start_date],
         end_date: params[:end_date],
         group: params[:group],
         total_price: params[:total_price],
         n1_price: params[:n1_price],
         user_id: @current_user.id,
         room_id: @current_room.id,
         room_image: @current_room.room_image,
         room_name: @current_room.room_name
         )
       if @reservation.save
           flash[:notice] = "予約が完了しました"
          redirect_to("/reservations/#{@reservation.id}")
       else
         flash[:notice] = @reservation.errors.full_messages.join("\n")
          render("reservations/new")
       end
     end
     
     def show
        @reservation = Reservation.find_by(id: params[:id])
        @room = @reservation.room
     end
     
     def destroy
        @reservation = Reservation.find_by(id: params[:id])
        if @reservation.destroy
         flash[:notice] = "予約を削除しました"
         redirect_to("reservations")
        end
     end
     
end
