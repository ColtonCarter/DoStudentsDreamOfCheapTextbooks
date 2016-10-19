class Table1sController < ApplicationController
  before_action :set_table1, only: [:show, :edit, :update, :destroy]

  # GET /table1s
  # GET /table1s.json
  def index
    @table1s = Table1.all
  end

  # GET /table1s/1
  # GET /table1s/1.json
  def show
  end

  # GET /table1s/new
  def new
    @table1 = Table1.new
  end

  # GET /table1s/1/edit
  def edit
  end

  # POST /table1s
  # POST /table1s.json
  def create
    @table1 = Table1.new(table1_params)

    respond_to do |format|
      if @table1.save
        format.html { redirect_to @table1, notice: 'Table1 was successfully created.' }
        format.json { render :show, status: :created, location: @table1 }
      else
        format.html { render :new }
        format.json { render json: @table1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /table1s/1
  # PATCH/PUT /table1s/1.json
  def update
    respond_to do |format|
      if @table1.update(table1_params)
        format.html { redirect_to @table1, notice: 'Table1 was successfully updated.' }
        format.json { render :show, status: :ok, location: @table1 }
      else
        format.html { render :edit }
        format.json { render json: @table1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /table1s/1
  # DELETE /table1s/1.json
  def destroy
    @table1.destroy
    respond_to do |format|
      format.html { redirect_to table1s_url, notice: 'Table1 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table1
      @table1 = Table1.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def table1_params
      params.fetch(:table1, {})
    end
end
