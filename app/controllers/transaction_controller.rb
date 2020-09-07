class TransactionController < ApplicationController
    before_action: :auth_and_get_user
    before_action: :get_transaction, only: [:update, :destroy]

    def index
        transactions = Transaction.all
        render json: transactions
    end

    def create
        @transaction = Tranaction.new(transaction_params)
        if @transaction.save 
            render json: @transaction, status: :created
        else
            format.json { render json: @transaction.errors.full_messages }
        end
    end

    def update
        if @transaction.update(transaction_params)
            render json: @transaction, status: :ok
        else
            format.json { render json: @transaction.errors.full_messages }
        end
    end

    def destroy
        if @transaction.destroy
            render status: :no_content
        else
            format.json { render json: @transaction.errors.full_messages }
    end

    private

    def transaction_params
        params.require(:transaction).permit(:amount, :message)
    end

    def get_transaction
        @transaction = Transaction.find(params[:id])
    end

end