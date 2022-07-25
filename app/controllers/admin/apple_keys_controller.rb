# frozen_string_literal: true

class Admin::AppleKeysController < ApplicationController
  before_action :set_apple_key, only: %i[ show destroy sync_devices ]

  # GET /apple_keys
  def index
    @apple_keys = AppleKey.all
  end

  # GET /apple_keys/1
  def show
  end

  # GET /apple_keys/new
  def new
    @apple_key = AppleKey.new
  end

  # POST /apple_keys
  def create
    private_key = apple_key_params.delete(:private_key)
    @apple_key = AppleKey.new(apple_key_params)
    @apple_key.private_key = private_key&.read
    @apple_key.filename = private_key&.original_filename

    if @apple_key.save
      redirect_to admin_apple_key_path(@apple_key), notice: t('admin.apple_keys.create.successful')
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /apple_keys/1
  def destroy
    @apple_key.destroy
    notice = t('activerecord.success.destroy', key: t('admin.apple_keys.title'))
    redirect_to admin_apple_keys_url, notice: notice
  end

  # PUT /apple_keys/1/sync_devices
  def sync_devices
    is_success = @apple_key.sync_devices
    if is_success
      notice = t('activerecord.success.update', key: t('simple_form.labels.apple_key.devices'))
      redirect_to admin_apple_key_path(@apple_key), notice: notice
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def set_apple_key
    @apple_key = AppleKey.find(params[:id])
  end

  def apple_key_params
    params.require(:apple_key).permit(:issuer_id, :key_id, :private_key)
  end
end
