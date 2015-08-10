class MensagemsController < ApplicationController
  before_action :set_mensagem, only: [:show, :edit, :update, :destroy]


  # GET /mensagems
  # GET /mensagems.json
  def index
    new
    @mensagems = Mensagem.all
  end

  # GET /mensagems/1
  # GET /mensagems/1.json
  def show
  end

  def color
    respond_to :js
  end

  def tamanho
    respond_to do |format|
      format.js
    end
  end


  # GET /mensagems/new
  def new
    @mensagem = Mensagem.new
  end

  # GET /mensagems/1/edit
  def edit
  end

  # POST /mensagems
  # POST /mensagems.json
  def create
    @mensagem = Mensagem.new(mensagem_params)

    respond_to do |format|
      if @mensagem.save
        format.html { redirect_to @mensagem, notice: 'Mensagem was successfully created.' }
        format.json { render :show, status: :created, location: @mensagem }
        format.js { render action: 'show', status: :created, location: mensagems_path}
      else
        format.html { render :new }
        format.json { render json: @mensagem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mensagems/1
  # PATCH/PUT /mensagems/1.json
  def update
    respond_to do |format|
      if @mensagem.update(mensagem_params)
        format.html { redirect_to @mensagem, notice: 'Mensagem was successfully updated.' }
        format.json { render :show, status: :ok, location: @mensagem }
      else
        format.html { render :edit }
        format.json { render json: @mensagem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mensagems/1
  # DELETE /mensagems/1.json
  def destroy
    @mensagem.destroy
    respond_to do |format|
      format.html { redirect_to mensagems_url, notice: 'Mensagem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mensagem
      @mensagem = Mensagem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mensagem_params
      params.require(:mensagem).permit(:conteudo, :autor)
    end
end
