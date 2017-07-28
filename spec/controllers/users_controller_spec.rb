require 'rails_helper'

describe  UsersController do
  let!(:user) { create(:user) }
  context 'login user' do

    before do
      login_user user
    end

    describe "GET #show" do
      before do
        get :show, params: { id: user }
      end

      let!(:prototypes){ create_list(:prototype, 5, user: user) }

      it "assigns the requested @user" do
        expect(assigns(:user)).to eq user
      end

      it "populates an array of messages ordered by created_at DESC" do
        expect(prototypes).to match(prototypes)
      end

      it "renders the :show template" do
        expect(response).to render_template :show
      end
    end

    describe "GET #edit" do
      before do
        get :edit, params: { id: user }
      end

      it "assigns the requested @user" do
        expect(assigns(:user)).to eq user
      end

      it "render the :edit template" do
        expect(response).to render_template :edit
      end
    end
  end
end
