class V1::StoresController < ApplicationController
    def index 
        @stores = Store.all

        render json: @stores, include: {menus: {only: [:items]}}, status: :ok
    end

    def create 
        @store = Store.new(store_params)
        
        @store.save
        render json: @store, status: :created
    end

    def destroy
        @store = Store.Where(id: params[:id]).first
        if @contact.destroy
            head(:ok)
        else
            head(:unprocessable_entity)
        end
    end

    private

    def store_params
        params.require(:store).permit(:name, :location, :email)
    end
end
