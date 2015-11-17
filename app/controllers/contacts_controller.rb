class ContactsController < ApplicationController

  def index
    render json: Contact.all
  end

  def create
    contact = Contact.new(contact_params)

    if contact.save
      render json: contact
    else
      render json: contact.errors.full_messages, status: 422
    end
  end

  def destroy
    contact = Contact.find_by(id: params[:id])

    if contact.destroy
      render json: contact
    else
      render json: "Can't destroy this user"
    end
  end

  def show
    contact = Contact.find_by(id: params[:id])
    render json: contact
  end

  def update
    contact = Contact.find_by(id: params[:id])

    if contact.update(contact_params)
      render json: contact
    else
      render json: contact.errors.full_messages, status: 422
    end
  end


  private
  def contact_params
    params.require(:contact).permit(:name, :user_id, :email)
  end
end
