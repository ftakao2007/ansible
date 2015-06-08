class HelloController < ApplicationController
  def index
    render text: `ruby -v`
  end
end
