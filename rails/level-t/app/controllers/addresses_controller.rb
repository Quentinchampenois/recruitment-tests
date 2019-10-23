class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  # GET /addresses
  # GET /addresses.json
  def index
   if current_user
     @addresses = current_user.address_ids
     @addresses = Address.all.where(user_id: current_user.id)
   else
     redirect_to new_user_session_path, notice: 'You are not logged in.'
   end
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = current_user.address.new(address_params)

    if @address.save
        redirect_to addresses_path
        #format.html { redirect_to @address, notice: t('Address was successfully created.') }
    else
        render :new
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to @address, notice: 'Address was successfully updated.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    if @address.destroy
        redirect_to addresses_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:name, :user_id)
    end

end
