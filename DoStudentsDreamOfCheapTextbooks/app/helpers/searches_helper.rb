module SearchesHelper

#!/usr/bin/env ruby


  require 'time'
  require 'uri'
  require 'openssl'
  require 'base64'
  require 'httparty'

  # Your AWS Access Key ID, as taken from the AWS Your Account page
  AWS_ACCESS_KEY_ID = "AKIAIX4DEBRSMTVHR2SQ"

  # Your AWS Secret Key corresponding to the above ID, as taken from the AWS Your Account page
  AWS_SECRET_KEY = "IwEI/oaBt/0fJtk8W5ueatZr3MYs4Gx7gGautuzD"

  # The region you are interested in
  ENDPOINT = "webservices.amazon.com"

  REQUEST_URI = "/onca/xml"

  #params = {
  #  "Service" => "AWSECommerceService",
  #  "Operation" => "ItemSearch",
  #  "AWSAccessKeyId" => "AKIAIX4DEBRSMTVHR2SQ",
  #  "AssociateTag" => "dostudentsdre-20",
  #  "SearchIndex" => "Books",
  #  "Keywords" => "book"
  #}

  def generate_request_url(params)
  params["Timestamp"] = Time.now.gmtime.iso8601 if !params.key?("Timestamp")
  canonical_query_string = params.sort.collect do |key, value|
    [URI.escape(key.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]")), URI.escape(value.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))].join('=')
  end.join('&')
  string_to_sign = "GET\n#{ENDPOINT}\n#{REQUEST_URI}\n#{canonical_query_string}"
  signature = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), AWS_SECRET_KEY, string_to_sign)).strip()
  request_url = "http://#{ENDPOINT}#{REQUEST_URI}?#{canonical_query_string}&Signature=#{URI.escape(signature, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))}"

  

  puts "Signed URL: \"#{request_url}\""

  results = HTTParty.get(request_url)

  puts results

  @resultSetAPI = results

  end

  def testAPI(keywords)
#    params = {
#  "Service" => "AWSECommerceService",
#  "Operation" => "ItemSearch",
#  "AWSAccessKeyId" => "AKIAIX4DEBRSMTVHR2SQ",
#  "AssociateTag" => "dostudentsdre-20",
#  "SearchIndex" => "All",
#  "Keywords" => keywords,
#  "ResponseGroup" => "Images,Offers,Small"
#  }


  params = {
  "Service" => "AWSECommerceService",
  "Operation" => "ItemSearch",
  "AWSAccessKeyId" => "AKIAIX4DEBRSMTVHR2SQ",
  "AssociateTag" => "dostudentsdre-20",
  "SearchIndex" => "Books",
  "ResponseGroup" => "Images,ItemAttributes,Offers",
  "Keywords" => keywords,
  "Condition" => "Used"
}
  generate_request_url(params)

  end
  #helper_method:testAPI

  end
