class InventoriesController < ApplicationController
    def index
        if params[:book_status].present?
            @inventories = Inventory.where('book_status = ?', params[:book_status])
        else
            @inventories = Inventory.all
        end
        @inventories = Inventory.order(:book_status).page(params[:page])
        @q = Inventory.ransack(params[:q])
        @inventories = @q.result(distinct: true).page(params[:page])
    end

    def create
        @inventory = Inventory.new(inventory_params)
        if @inventory.save
            redirect_to inventories_path, notice: "Se agregó un nuevo libro correctamente."
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def new
        @inventory = Inventory.new
    end
    
    def edit
        @inventory = Inventory.find(params[:id])
    end
    
    def show
        @inventory = Inventory.find(params[:id])
    end
    
    def update
        @inventory = Inventory.find params[:id]
        if @inventory.update(inventory_params) 
            redirect_to inventories_path, notice: "Se actualizó correctamente el libro."
        else
            flash.now[:alert] = 'No se puede crear el libro.'
            render :edit
        end
    end

    def destroy
        @inventory = Inventory.find(params[:id])
        @inventory.destroy
        redirect_to inventories_url, notice: "Se borró el libro correctamente."
    end

    private

    def inventory_params
        params.require(:inventory).permit(:title, :author, :book_status, :lent, :returned)
    end
end
