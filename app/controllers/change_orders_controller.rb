class ChangeOrdersController < ApplicationController
  before_action :set_change_order, only: %i[ show edit update destroy ]

  # GET /change_orders
  def index
    @change_orders = ChangeOrder.all.order(created_at: :desc)
  end

  # GET /change_orders/1
  def show
  end

  # GET /change_orders/new
  def new
    @change_order = ChangeOrder.new
  end

  # GET /change_orders/1/edit
  def edit
  end

  # POST /change_orders
  def create
    @change_order = ChangeOrder.new(change_order_params)

    if @change_order.save
      deliver_finance_notification if @change_order.amount_changed?
      deliver_rpc_notification if @change_order.material_changed?
      deliver_pii_notification if @change_order.work_order_changed?
      redirect_to @change_order, notice: "Change order was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /change_orders/1
  def update
    if @change_order.update(change_order_params)
      redirect_to @change_order, notice: "Change order was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /change_orders/1
  def destroy
    @change_order.destroy
    redirect_to change_orders_url, notice: "Change order was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_change_order
      @change_order = ChangeOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def change_order_params
      params.require(:change_order).permit(:amount_changed, :material_changed, :work_order_changed)
    end

    def deliver_finance_notification
      change_order_notifier("Change Order #{@change_order.display_id} — the project price has changed").deliver(User.finance)
    end

    def deliver_pii_notification
      change_order_notifier("Change Order #{@change_order.display_id} — the scope of work has changed").deliver(User.pii)
    end

    def deliver_rpc_notification
      change_order_notifier("Change Order #{@change_order.display_id} — the materials have changed").deliver(User.rpc)
    end

    def change_order_notifier(message)
      ChangeOrderNotifier.with(record: @change_order, message:)
    end
end
