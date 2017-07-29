require 'rails_helper'
require 'devise'

describe PrototypesController do
  let(:user) { create(:user) }
  let(:prototype) { create(:prototype, user: user)}
  let(:prototype_params) { { id: prototype.id, prototype: attributes_for(:prototype, title: "takumi") }}
  let(:prototype_blank_title_params) { { id: prototype, prototype: attributes_for(:prototype, title: '') }}


  describe "login user" do
    before do
      login_user user
    end

    describe "GET #index" do

      # temp for error
      # it "populates an array of messages ordered by created_at DESC" do
      #   get :index
      #   expect(assigns(:prototypes)).to match(prototype {|a, b| b.created_at <=> a.created_at })
      # end

      it " renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end

    describe "GET #show" do
      before do
        get :show, id: prototype
      end

      it "assigns requested assigns prototype to @prototype" do
        expect(assigns(:prototype)).to eq prototype
      end

      it "the requested assigns comment to @comment" do
        expect(assigns(:comment)).to be_a_new(Comment)
      end

      it "renders the :show template" do
        expect(response).to render_template :show
      end

      # it "assigns likes associated with likes prototype to @likes" do
      #   expect(assigns(:likes)).to eq prototype.likes
      # end
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
          patch :update, prototype_params
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
          patch :update, prototype_blank_title_params
        end

        it "redirects edit page when save is false" do
          expect(response).to redirect_to prototype_path
        end

        it "flashes an alert unsave message" do
          expect(flash[:alert]).to include("Titleを入力してください。")
        end
      end

      describe "POST #create" do
        context " When save is success" do
          before do
            post :create, prototype_params
          end

          it "save the new prototype in the database" do
            expect{
              post :create,
              prototype_params
            }.to change(Prototype, :count).by(1)
          end

          it "redirects root_path" do
            expect(response).to redirect_to root_path
          end

          it "flashes a notice save message" do
            expect(flash[:notice]).to include("Post is success")
          end
        end

        context "When save is false" do
          before do
            post :create, prototype_blank_title_params
          end

          it "does not save the new prototype in the database" do
            expect{
              post :create,
              prototype_blank_title_params
            }.to change(Prototype, :count).by(0)
          end

          it "redirects new page" do
            expect(response).to redirect_to new_prototype_path
          end

          it "flashes an alert unsave message" do
            expect(flash[:alert]).to include("Titleを入力してください。")
          end
        end
      end

      describe "DELETE #destroy" do
        before do
          delete :destroy, id: prototype
        end

        it "assings the requestd prototype to @prototype" do
          expect(assigns(:prototype)).to eq prototype
        end

        it "delete the prototype" do
          prototype = create(:prototype)
          expect{ delete :destroy, id: prototype }.to change(Prototype, :count).by(-1)
        end

        it "redirects root_path" do
          expect(response).to redirect_to root_path
        end

        it "flashes a notice save message" do
          expect(flash[:notice]).to include("Delete is success")
        end
      end
    end
  end
end

