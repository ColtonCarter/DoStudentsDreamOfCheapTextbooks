class Table1Copy1sController < ApplicationController
  before_action :set_table1_copy1, only: [:show, :edit, :update, :destroy]

  # GET /table1_copy1s
  # GET /table1_copy1s.json
  def index
    @table1_copy1s = Table1Copy1.all
  end

  # GET /table1_copy1s/1
  # GET /table1_copy1s/1.json
  def show
  end

  # GET /table1_copy1s/new
  def new
    @table1_copy1 = Table1Copy1.new
  end

  # GET /table1_copy1s/1/edit
  def edit
  end

  # POST /table1_copy1s
  # POST /table1_copy1s.json
  def create
    @table1_copy1 = Table1Copy1.new(table1_copy1_params)

    respond_to do |format|
      if @table1_copy1.save
        format.html { redirect_to @table1_copy1, notice: 'Table1 copy1 was successfully created.' }
        format.json { render :show, status: :created, location: @table1_copy1 }
      else
        format.html { render :new }
        format.json { render json: @table1_copy1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /table1_copy1s/1
  # PATCH/PUT /table1_copy1s/1.json
  def update
    respond_to do |format|
      if @table1_copy1.update(table1_copy1_params)
        format.html { redirect_to @table1_copy1, notice: 'Table1 copy1 was successfully updated.' }
        format.json { render :show, status: :ok, location: @table1_copy1 }
      else
        format.html { render :edit }
        format.json { render json: @table1_copy1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /table1_copy1s/1
  # DELETE /table1_copy1s/1.json
  def destroy
    @table1_copy1.destroy
    respond_to do |format|
      format.html { redirect_to table1_copy1s_url, notice: 'Table1 copy1 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table1_copy1
      @table1_copy1 = Table1Copy1.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def table1_copy1_params
      params.fetch(:table1_copy1, {})
    end
end
