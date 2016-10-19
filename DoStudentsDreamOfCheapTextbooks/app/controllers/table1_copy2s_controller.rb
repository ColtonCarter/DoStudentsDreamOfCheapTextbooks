class Table1Copy2sController < ApplicationController
  before_action :set_table1_copy2, only: [:show, :edit, :update, :destroy]

  # GET /table1_copy2s
  # GET /table1_copy2s.json
  def index
    @table1_copy2s = Table1Copy2.all
  end

  # GET /table1_copy2s/1
  # GET /table1_copy2s/1.json
  def show
  end

  # GET /table1_copy2s/new
  def new
    @table1_copy2 = Table1Copy2.new
  end

  # GET /table1_copy2s/1/edit
  def edit
  end

  # POST /table1_copy2s
  # POST /table1_copy2s.json
  def create
    @table1_copy2 = Table1Copy2.new(table1_copy2_params)

    respond_to do |format|
      if @table1_copy2.save
        format.html { redirect_to @table1_copy2, notice: 'Table1 copy2 was successfully created.' }
        format.json { render :show, status: :created, location: @table1_copy2 }
      else
        format.html { render :new }
        format.json { render json: @table1_copy2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /table1_copy2s/1
  # PATCH/PUT /table1_copy2s/1.json
  def update
    respond_to do |format|
      if @table1_copy2.update(table1_copy2_params)
        format.html { redirect_to @table1_copy2, notice: 'Table1 copy2 was successfully updated.' }
        format.json { render :show, status: :ok, location: @table1_copy2 }
      else
        format.html { render :edit }
        format.json { render json: @table1_copy2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /table1_copy2s/1
  # DELETE /table1_copy2s/1.json
  def destroy
    @table1_copy2.destroy
    respond_to do |format|
      format.html { redirect_to table1_copy2s_url, notice: 'Table1 copy2 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table1_copy2
      @table1_copy2 = Table1Copy2.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def table1_copy2_params
      params.require(:table1_copy2).permit(:table1col, :table1col1)
    end
end
