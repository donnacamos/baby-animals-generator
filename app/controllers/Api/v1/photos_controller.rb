class Api::V1::PhotosController < ApplicationController
    def index 
        @photos = Photo.all 

        render json: @photos, status: 200
    end 

    def show 
        @photo = Photo.find(params[:id]) 

        render json: @photo, status: 200
    end 

    def create 
        @photo = Photo.create(photo_params)

        render json: @photo, status: 200 
    end

    def update 
        @note = Note.find(params[:id])
        @note.update(note_params)

        render json: @photo, status: 200 
    end 

    def destroy 
        @photo = Photo.find(params[:id])
        @photo.delete

        render json: {photoId: @photo.id}
    end 

    private
    def photo_params
        params.require(:photo).permit(:image_url)
    end 
end
