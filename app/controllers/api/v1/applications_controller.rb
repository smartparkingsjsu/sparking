class API::V1::ApplicationsController < ApplicationController
   
  def calculate
    garage_id = params[:garage_id]
    date = params[:date]
    length = params[:length]

    if garage_id.present? & date.present? & length.present?
      if DateTime.parse(date).on_weekday?
        render json:  Garage.find(garage_id).weekday * length.to_i, status: :ok
      else
        render json:  Garage.find(garage_id).weekend * length.to_i, status: :ok
      end
    else
      render status: :bad_request, json: {
        message: "Params not found."
      }
    end
  end

end