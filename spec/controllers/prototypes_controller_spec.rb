require 'rails_helper'
require 'devise'

describe PrototypesController do
  let(:user) { create(:user) }
  let(:prototype) { create(:prototype, user: user)}
  let(:update_params) { { id: prototype.id, prototype: attributes_for(:prototype, title: "takumi") }}
  let(:update_blank_title_params) { { id: prototype, prototype: attributes_for(:prototype, title: '') }}

  describe "login user" do
    before do
      login_user user
    end

    describe "GET #edit" do
      it "assigns the requested prototype to @prototype" do
        get :edit, id: prototype
        expect(assigns(:prototype)).to eq prototype
      end

      it "renders the :edit template" do
        get :edit, id: prototype
        expect(response).to render_template :edit
      end

      it "assigns main_image to @main_image" do
        get :edit, id: prototype
        expect(assigns(:main_image)).to eq prototype.capture_images.main.first
      end

      it "assigns sub_image to @sub_image" do
        get :edit, id: prototype
        expect(assigns(:sub_image)).to eq prototype.capture_images.sub.first
      end
    end

    describe "PATCH #update" do
      context "When save is success" do
        it "assigns the requested prototype to @prototype" do
          patch :update, update_params
          expect(assigns(:prototype)).to eq prototype
        end

        it "updates attributes of prototype" do
          patch :update, update_params
          prototype.reload
          expect(prototype.title).to eq "takumi"
        end

        it "redirect to root_path " do
          patch :update, update_params
          expect(response).to redirect_to root_path
        end

        it "flashes a notice  save message" do
          patch :update, update_params
          expect(flash[:notice]).to include('Update is success')
        end
      end

      context "When save is false" do
        it "redirects edit page when save is false" do
          patch :update, update_blank_title_params
          expect(response).to redirect_to prototype_path
        end

        it "flashes an alert unsave message" do
          patch :update, update_blank_title_params
          expect(flash[:alert]).to include("Titleを入力してください。")
        end
      end
    end
  end
end

