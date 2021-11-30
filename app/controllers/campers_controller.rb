class CampersController < ApplicationController

    #My solution
    # def index
    #     camper = Camper.all
    #     render json: camper.to_json(only: [:id, :name, :age])
    # end

    def index
        camper = Camper.all
        render json: camper, include: [:id, :name, :age]
    end

    def show
        camper = Camper.find_by(id: params[:id])
        if camper
            render json: camper #can also use---->     ,include: [:activities]
        else
            render json: {error: "Camper not found"}, status: 404
        end
    end
 

    def create
        
        camper = Camper.create(camper_params)
        if camper.valid?  #can use valid due to strong params
            render json: camper, status: 201
        else  
            render json: {"errors": ["validation errors"]}, status: :unprocessable_entity
        end
    end


    private

    def camper_params
        params.permit(:name, :age)
    end
end
