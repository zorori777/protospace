require 'rails_helper'

describe  UsersController do
  let(:user) { create(:user) }
  let(:update_params) {{ id: user.id, user: attributes_for(:user, name: "wata") }}
  let(:update_blank_name) {{ id: user.id, user: attributes_for(:user, name: '') }}

  context 'login user' do
    before do
      login_user user
    end

    describe "GET #show" do
      before do
        get :show, id: user
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
        get :edit, id: user
      end

      it "assigns the requested @user" do
        expect(assigns(:user)).to eq user
      end

      it "render the :edit template" do
        expect(response).to render_template :edit
      end
    end

    describe "PATCH #update" do

      context "When save is success" do
        before do
          patch :update, update_params
        end

        it "assigns the requested @user" do
          expect(assigns(:user)).to eq user
        end

        it "changes @user's attributes" do
          user.reload
          expect(user.name).to eq "wata"
        end

        it "redirect show page when save is success" do
          expect(response).to redirect_to user_path
        end

        it "flashes a notice save_message" do
          expect(flash[:notice]).to include("Update is success!!")
        end
      end

      context "When save is false" do
        before do
          patch :update, update_blank_name
        end

        it "redirected edit page when save is false" do
          patch :update, update_blank_name
          expect(response).to redirect_to edit_user_path
        end

        it "flashes a alert unsave_message" do
          patch :update, update_blank_name
          expect(flash[:alert]).to include("Update is false")
        end
      end
    end
  end
end