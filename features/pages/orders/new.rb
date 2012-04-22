module Pages
  module Orders
    class New < Pages::Base
      path 'orders/new'

      def checkout_form
        Components::CheckoutForm.new(find('.depot_form'))
      end

    end
  end
end
