class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  def index
    @properties = Property.all
  end

  def show
  end

  def new
    @property = Property.new
    2.times { @property.nearest_stations.build }
  end

  def edit
    @property.nearest_stations.build
  end

  def create
    @property = Property.new(property_params)

    if @property.save
      redirect_to @property, notice: '物件を登録しました。'
    else
      render :new
    end
  end

  def update
    if @property.update(property_params)
      redirect_to @property, notice: '物件を編集しました。'
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_url, notice: '物件を削除しました。'
  end

  private
    def set_property
      @property = Property.find(params[:id])
    end

    def property_params
      params.require(:property).permit(
        :property_name,
        :rent,
        :address,
        :age,
        :note,
        nearest_stations_attributes:[
          :route,
          :station,
          :minutes_walk ])
    end
end
