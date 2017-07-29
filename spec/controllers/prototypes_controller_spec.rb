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
      before do
        get :edit, id: prototype
      end

      it "assigns the requested prototype to @prototype" do
        expect(assigns(:prototype)).to eq prototype
      end

      it "renders the :edit template" do
        expect(response).to render_template :edit
      end

      it "assigns main_image to @main_image" do
        expect(assigns(:main_image)).to eq prototype.capture_images.main.first
      end

      it "assigns sub_image to @sub_image" do
        expect(assigns(:sub_image)).to eq prototype.capture_images.sub.first
      end
    end

    describe "GET #new" do
      before do
        get :new
      end
      it "assigns the requested prototype to @prototype" do
        expect(assigns(:prototype)).to be_a_new(Prototype)
      end

      it "renders :new template " do
        expect(response).to render_template :new
      end
    end

    describe "PATCH #update" do

      context "When save is success" do
        before do
          patch :update, update_params
        end

        it "assigns the requested prototype to @prototype" do
          expect(assigns(:prototype)).to eq prototype
        end

        it "updates attributes of prototype" do
          prototype.reload
          expect(prototype.title).to eq "takumi"
        end

        it "redirects to root_path " do
          expect(response).to redirect_to root_path
        end

        it "flashes a notice  save message" do
          expect(flash[:notice]).to include('Update is success')
        end
      end

      context "When save is false" do
        before do
          patch :update, update_blank_title_params
        end

        it "redirects edit page when save is false" do
          expect(response).to redirect_to prototype_path
        end

        it "flashes an alert unsave message" do
          expect(flash[:alert]).to include("Titleを入力してください。")
        end
      end
    end
  end
end

