require 'test_helper'

class EcrituresControllerTest < ActionController::TestCase
  setup do
    @ecriture = ecritures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ecritures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ecriture" do
    assert_difference('Ecriture.count') do
      post :create, ecriture: { compte: @ecriture.compte, credit: @ecriture.credit, date_ecriture: @ecriture.date_ecriture, debit: @ecriture.debit, echeance: @ecriture.echeance, journal: @ecriture.journal, lettrage: @ecriture.lettrage, libelle: @ecriture.libelle, mode_reglement: @ecriture.mode_reglement, numero_facture: @ecriture.numero_facture, numero_mouvement: @ecriture.numero_mouvement }
    end

    assert_redirected_to ecriture_path(assigns(:ecriture))
  end

  test "should show ecriture" do
    get :show, id: @ecriture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ecriture
    assert_response :success
  end

  test "should update ecriture" do
    patch :update, id: @ecriture, ecriture: { compte: @ecriture.compte, credit: @ecriture.credit, date_ecriture: @ecriture.date_ecriture, debit: @ecriture.debit, echeance: @ecriture.echeance, journal: @ecriture.journal, lettrage: @ecriture.lettrage, libelle: @ecriture.libelle, mode_reglement: @ecriture.mode_reglement, numero_facture: @ecriture.numero_facture, numero_mouvement: @ecriture.numero_mouvement }
    assert_redirected_to ecriture_path(assigns(:ecriture))
  end

  test "should destroy ecriture" do
    assert_difference('Ecriture.count', -1) do
      delete :destroy, id: @ecriture
    end

    assert_redirected_to ecritures_path
  end
end
