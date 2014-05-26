# coding: utf-8

puts 'Seeding the database...'

[
  { pt: 'construções', en: 'Constructions' },
  { pt: 'assistência médica', en: 'Medical Aid' },
  { pt: 'sem casa', en: 'Homeless' },
  { pt: 'educação', en: 'Education' },
  { pt: 'pão de cada dia', en: 'Daily Bread' },
  { pt: 'endividado', en: 'Indebted' },
  { pt: 'religioso', en: 'Religious' },
  { pt: 'outros', en: 'Others' }
].each do |name|
   category = Category.find_or_initialize_by(name_pt: name[:pt])
   category.update_attributes({
     name_en: name[:en]
   })
 end

{
  company_name: 'Silver Alms',
  company_logo: 'http://silveralms.com/assets/catarse_bootstrap/logo_icon_catarse.png',
  host: 'silveralms.com',
  base_url: "http://silveralms.com",

  email_contact: 'comjitsolutions@gmail.com',
  email_payments: 'comjitsolutions@gmail.com',
  email_projects: 'comjitsolutions@gmail.com',
  email_system: 'comjitsolutions@gmail.com',
  email_no_reply: 'comjitsolutions@gmail.com',
  facebook_url: "http://www.facebook.com/pages/SilverAlmsCom/1432743666987583",
  facebook_app_id: '686963018037797',
  twitter_url: 'http://twitter.com/silveralms',
  twitter_username: "silveralms",
  mailchimp_url: "http://ownmanager.us8.list-manage1.com/subscribe?u=9f171110a102fc24feed06f24&id=1df03ad4dd",
  catarse_fee: '0.10',
  support_forum: 'http://support.silveralms.com',
  base_domain: 'silveralms.com',
  uservoice_secret_gadget: 't4YVh1DqPV4t99sFoAUv9wL2XY137LRjbD6gfyN0CtA',
  uservoice_key: 'CFL6GwuDuCmFpfAQhe8AA',
  faq_url: 'http://support.silveralms.com',
  feedback_url: 'http://support.silveralms.com/feedback',
  terms_url: 'http://support.silveralms.com/terms',
  privacy_url: 'http://support.silveralms.com/privacy',
  about_channel_url: 'http://support.silveralms.com/aboutchannel',
  instagram_url: 'http://instagram.com/silveralms',
  blog_url: "http://blog.silveralms.com",
  github_url: 'http://github.com/jinutm/silveralms.git',
  contato_url: 'http://support.silveralms.com'
}.each do |name, value|
   conf = Configuration.find_or_initialize_by(name: name)
   conf.update_attributes({
     value: value
   }) if conf.new_record?
end


OauthProvider.find_or_create_by!(name: 'facebook') do |o|
  o.key = '686963018037797'
  o.secret = 'aafec836b6d5493ce8ab61af0d63d5a1'
  o.path = 'facebook'
end

OauthProvider.find_or_create_by!(name: 'twitter') do |o|
  o.key = 'your_twitter_app_key'
  o.secret = 'your_twitter_app_secret'
  o.path = 'twitter'
end

OauthProvider.find_or_create_by!(name: 'google_oauth2') do |o|
  o.key = 'your_google_oauth2_app_key'
  o.secret = 'your_google_oauth2_app_secret'
  o.path = 'google_oauth2'
end

OauthProvider.find_or_create_by!(name: 'linkedin') do |o|
  o.key = 'your_linkedin_app_key'
  o.secret = 'your_linkedin_app_secret'
  o.path = 'linkedin'
end

puts
puts '============================================='
puts ' Showing all Authentication Providers'
puts '---------------------------------------------'

OauthProvider.all.each do |conf|
  a = conf.attributes
  puts "  name #{a['name']}"
  puts "     key: #{a['key']}"
  puts "     secret: #{a['secret']}"
  puts "     path: #{a['path']}"
  puts
end


puts
puts '============================================='
puts ' Showing all entries in Configuration Table...'
puts '---------------------------------------------'

Configuration.all.each do |conf|
  a = conf.attributes
  puts "  #{a['name']}: #{a['value']}"
end

puts '---------------------------------------------'
puts 'Done!'
