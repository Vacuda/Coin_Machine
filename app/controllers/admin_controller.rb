class AdminController < ApplicationController

    def all
        ##-----------------------api check---------------------------
        if Key.where(api_key: params[:api_key]).none?
            render json: {message: "api_key is not valid"} and return
        end
        ##-----------------------------------------------------------

        render json: Admin.all()
    end


    def create
        ##-----------------------api check---------------------------
        if Key.where(api_key: params[:api_key]).none?
            render json: {message: "api_key is not valid"} and return
        end
        ##-----------------------------------------------------------

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
        ##-----------------------api check---------------------------
        if Key.where(api_key: params[:api_key]).none?
            render json: {message: "api_key is not valid"} and return
        end
        ##-----------------------------------------------------------

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
        ##-----------------------api check---------------------------
        if Key.where(api_key: params[:api_key]).none?
            render json: {message: "api_key is not valid"} and return
        end
        ##-----------------------------------------------------------

        ##delete admin
        deleted_admin = Admin.find_by(id: params[:id]).destroy
        
        ##build response
        context = {
            message: "Admin deleted properly", deleted_admin: deleted_admin
        }
        
        render json: context
    end


    def all_emails
        ##-----------------------api check---------------------------
        if Key.where(api_key: params[:api_key]).none?
            render json: {message: "api_key is not valid"} and return
        end
        ##-----------------------------------------------------------

        ##call class method
        email_array = Admin.all_emails()

        ##build response
        context = {
            admin_emails: email_array
        }

        render json: context
    end






end
