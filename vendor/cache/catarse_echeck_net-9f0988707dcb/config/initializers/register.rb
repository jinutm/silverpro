begin
  PaymentEngines.register({name: 'echeck_net', review_path: ->(contribution){ CatarseEcheckNet::Engine.routes.url_helpers.review_echeck_net_path(contribution) }, locale: 'en'})
rescue Exception => e
  puts "Error while registering payment engine: #{e}"
end
