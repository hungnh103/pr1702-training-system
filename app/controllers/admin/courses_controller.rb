class Admin::CoursesController < ApplicationController
  include Admin::CoursesHelper

  ID_PARAMS = {:@course => :id}
  DATA_MODEL = {:@course => :Course}
  DATA = [:@course]

  before_action :verify_supervisor, only: [:index, :show]
  before_action -> { load_data(DATA, DATA_MODEL, ID_PARAMS) }, only: :show

  def index
    @courses = Course.load_data.paginate page: params[:page]
  end

  def show;  end
end
