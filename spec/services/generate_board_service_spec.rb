require 'rails_helper'

RSpec.describe MineSweepers::UpsertMineSweepersService, type: :service do
  describe '#call' do
    let(:mine_sweeper) { FactoryBot.create(:mine_sweeper) } # Assuming you have a MineSweeper model and a FactoryBot factory for it

    context 'when the service is successful' do
      let(:attributes) { { height: 5, width: 5, mines: 5, name: Faker::Name.name, email: Faker::Internet.email } }

      it 'returns true and the mine_sweeper object' do
        service = described_class.new(mine_sweeper, attributes)

        expect(service.call).to eq([true, MineSweeper.last])
      end
    end

    context 'when the service encounters an error' do
      let(:attributes) { { height: 5, width: 5, mines: 25 } }

      it 'returns false and the mine_sweeper object' do
        service = described_class.new(mine_sweeper, attributes)

        expect(service.call).to eq([false, mine_sweeper])
      end
    end
  end
end
