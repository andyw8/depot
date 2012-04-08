module Pages
  module Orders
    class New < Pages::Base
      def checkout_form
        Components::CheckoutForm.new(find('.depot_form'))
      end

      def path
        # TODO use rails names routes here?
        # can we have a sensible default?
        '/orders/new'
      end
    end
  end
end
