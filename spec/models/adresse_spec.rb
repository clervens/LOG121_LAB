require 'rails_helper'

RSpec.describe Adresse, type: :model do
  describe 'can be instanciated' do
    before do
      @adresse = Adresse.new
    end

    it 'and respond_to value' do
      @adresse.should respond_to(:valus)
    end
  end
end
