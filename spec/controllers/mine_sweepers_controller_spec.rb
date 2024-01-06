require 'rails_helper'

RSpec.describe MineSweepersController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    let(:mine_sweeper) { FactoryBot.create(:mine_sweeper) }

    it 'renders the show template' do
      get :show, params: { id: mine_sweeper.id }
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new, params: { name: 'Test Mine Sweeper' }
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    let(:valid_params) { { mine_sweeper: { name: 'Test Mine Sweeper', email: 'test@example.com', height: 10, width: 10, mines: 5 } } }

    it 'creates a new mine sweeper' do
      expect do
        post :create, params: valid_params
      end.to change(MineSweeper, :count).by(1)
    end

    it 'redirects to the show page on success' do
      post :create, params: valid_params
      expect(response).to redirect_to mine_sweeper_path(MineSweeper.last)
    end
  end

  describe 'GET #edit' do
    let(:mine_sweeper) { FactoryBot.create(:mine_sweeper) }

    it 'renders the edit template' do
      get :edit, params: { id: mine_sweeper.id }
      expect(response).to render_template :edit
    end
  end

  describe 'DELETE #destroy' do
    let!(:mine_sweeper) { FactoryBot.create(:mine_sweeper) }

    it 'destroys the mine sweeper' do
      expect do
        delete :destroy, params: { id: mine_sweeper.id }
      end.to change(MineSweeper, :count).by(-1)
    end

    it 'redirects to the index page on success' do
      delete :destroy, params: { id: mine_sweeper.id }
      expect(response).to redirect_to mine_sweepers_path
    end
  end

  describe 'GET #view_all' do
    it 'renders the view_all template' do
      get :view_all
      expect(response).to render_template :view_all
    end
  end
end
