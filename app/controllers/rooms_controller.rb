class RoomsController < ApplicationController

 before_action :set_current_room,{only:[:show]}
 before_action:authenticate_user,{only:[:edit,:update,:new,:create,:desstroy]}
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(
      room_name: params[:room_name],
      adress: params[:adress],
      introduction: params[:introduction],
      price: params[:price],
      room_image: "default_img.jpg",
      user_id: @current_user.id
      )
       if params[:room_image]
          @room.room_image = "#{@room.id}.jpg"
          room_image = params[:room_image]
          File.binwrite("public/rooms_img/#{@room.room_image}",room_image.read)
       end
      if @room.save
        flash[:notice] = "ルームを登録しました"
        redirect_to("/rooms/#{@room.id}")
      else
         flash[:notice] = @room.errors.full_messages.join("\n")
        render("rooms/new")
      end
  end
  
  def show
    @room = Room.find_by(id: params[:id])
    if @room
    session[:room_id] = @room.id
    end
    @user = @room.user
    @reservation = Reservation.new
  end
  
  def edit
    @room = Room.find_by(id: params[:id])
  end
  
  def update
    @room = Room.find_by(id: params[:id])
    @room.room_name = params[:room_name]
    @room.adress = params[:adress]
    @room.introduction = params[:introduction]
    @room.price = params[:price]
   if params[:room_image]
      @room.room_image = "#{@room.id}.jpg"
      room_image = params[:room_image]
      File.binwrite("public/rooms_img/#{@room.room_image}",room_image.read)
   end
   if @room.save
     flash[:notice] = "ルーム情報を更新しました"
     redirect_to("/rooms/#{@room.id}")
   else
    flash[:notice] = @room.errors.full_messages.join("\n")
     render("rooms/edit")
   end
  end
  
  def destroy
    @room = Room.find_by(id: params[:id])
    if @room.destroy
      flash[:notice] = "ルームを削除しました"
       redirect_to("/rooms/search")
    end
  end
  
  def search
    @rooms = Room.search(params[:adress],params[:search])
  end
  

  
end
