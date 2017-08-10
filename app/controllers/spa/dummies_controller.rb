class Spa::DummiesController < Spa::SpaController
  def index
    @dummies = [{id: 1, name: 'snm', age: '28'}, {id: 2, name: 'snm', age: '28'}]
  end

  def new

  end

  def create

  end

  def edit

  end
  
  def update

  end

  def destroy

  end

  private
    def set_dummy

    end
end