module Pages
  module Orders
    class New < CapybaraPageObject::Node
      def checkout_form
        Component::CheckoutForm.new(find('.depot_form'))
      end
    end
  end
end
