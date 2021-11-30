class SignupsController < ApplicationController

    def create
        signup = Signup.create(signup_params)
        if signup.valid?
            render json: signup.activity, status: 201
        else
            render json:{ "errors": [ "validation errors"]}, status: 422
     end
    end

    private

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

end
