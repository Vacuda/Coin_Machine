class AdminController < ApplicationController

    def all
        render json: Admin.all()
    end


    def create
        ##create Admin
        Admin.create(
            first_name: params[:first_name],
            last_name: params[:last_name],
            email: params[:email]
        )

        ##build response
        context = {
            message: "Admin added successfully",
            new_admin: Admin.last()
        }

        render json: context
    end


    def update
        ##find admin
        this_admin = Admin.find_by(id: params[:id])

        ##update admin
        this_admin.update(
            first_name: params[:first_name],
            last_name: params[:last_name],
            email: params[:email]
            )

        ##build response
        context = {
            message: "Admin updated properly", updated_admin: this_admin
        }

        render json: context
    end


    def destroy
        ##delete admin
        deleted_admin = Admin.find_by(id: params[:id]).destroy
        
        ##build response
        context = {
            message: "Admin deleted properly", deleted_admin: deleted_admin
        }
        
        render json: context
    end


    def all_emails
        ##call class method
        email_array = Admin.all_emails()

        ##build response
        context = {
            admin_emails: email_array
        }

        render json: context
    end






end
