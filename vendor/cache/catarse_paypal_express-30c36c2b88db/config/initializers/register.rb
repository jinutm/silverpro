begin
  PaymentEngines.register({
    name: 'paypal',
    review_path: ->(contribution) {
      CatarsePaypalExpress::Engine.routes.url_helpers.review_paypal_express_path(contribution)
    },
    refund_path: ->(contribution) {
      CatarsePaypalExpress::Engine.routes.url_helpers.refund_paypal_express_path(contribution)
    },
    locale: 'en'
  })
rescue Exception => e
  puts "Error while registering payment engine: #{e}"
end
