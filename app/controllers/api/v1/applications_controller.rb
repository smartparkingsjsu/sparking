class API::V1::ApplicationsController < ApplicationController
   
  def calculate
    garage_id = params[:garage_id]
    date = params[:date]
    length = params[:length]

    if DateTime.parse(date).on_weekday?
      render json:  Garage.find(garage_id).weekday * length.to_i
    else
      render json:  Garage.find(garage_id).weekend * length.to_i
    end
  end

end