module SearchesHelper

#!/usr/bin/env ruby


  require 'time'
  require 'uri'
  require 'openssl'
  require 'base64'
  require 'httparty'

### set AWS_ACCESS_KEY_ID and AWS_SECRET_KEY in /config/application.yml like so... 
#
#AWS_ACCESS_KEY_ID: your access key
#AWS_SECRET_KEY: your access key
# use them by calling  ENV["AWS_ACCESS_KEY_ID"] or ENV["AWS_SECRET_KEY"]


   # Your AWS Access Key ID, as taken from the AWS Your Account page
  AWS_ACCESS_KEY_ID = ENV["AWS_ACCESS_KEY_ID"]

  #AWS_ACCESS_KEY_ID = Figaro.env.AWS_ACCESS_KEY_ID

  # Your AWS Secret Key corresponding to the above ID, as taken from the AWS Your Account page
  AWS_SECRET_KEY = ENV["AWS_SECRET_KEY"]

  #AWS_SECRET_KEY = Figaro.env.AWS_SECRET_KEY

  # The region you are interested in
  ENDPOINT = "webservices.amazon.com"

  REQUEST_URI = "/onca/xml"

 

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
puts "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
puts "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"

@resultNum = results["ItemSearchResponse"]["Items"]["TotalResults"] # this checks to make sure there are results
  puts @resultNum
puts "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
puts "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"

#This will grab the first item in the list. if you try to get an item that doesn't exist, it will return nothing' if there is only one item, it will also not return correctly
  #item_hash = results["ItemSearchResponse"]["Items"]["Item"][0] 
  ###What do we want displayed? Picture, link, description, title, price, is prime. The first 5. Come to find out the description does not exist

if (@resultNum.to_f > 0)

@pricesL = Array.new(5)
@pricesH = Array.new(5)
@pictures = Array.new(5)
@links = Array.new(5)
@descriptions = Array.new(5)
@titles = Array.new(5)
@primes = Array.new(5)
@authors = Array.new(5)


 item_hash = results["ItemSearchResponse"]["Items"]["Item"][0]



puts "66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666"
if item_hash.nil? || item_hash.empty?
puts"Empty"

item_hash = results["ItemSearchResponse"]["Items"]["Item"]
puts "_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+"
puts item_hash
 @pricesL[0] = item_hash["OfferSummary"]["LowestUsedPrice"]["FormattedPrice"]
 @pricesH[0] = item_hash["OfferSummary"]["LowestNewPrice"]["FormattedPrice"]
  @pictures[0] = item_hash["LargeImage"]["URL"]
   @links[0] = item_hash["DetailPageURL"]
     @titles[0] = item_hash["ItemAttributes"]["Title"]
      
      @authors[0] = item_hash["ItemAttributes"]["Author"]

      if (item_hash["IsEligibleForPrime"] == 1)
      @primes[0] = "Elligible for Prime"
      else
       @primes[0] = "Not elligible for Prime"
      end
puts "_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+"


else
puts"Full"

item_hash = results["ItemSearchResponse"]["Items"]["Item"]
puts "_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+"
puts item_hash

for i in 0..4
  begin
      @titles[i] = item_hash[i]["ItemAttributes"]["Title"]
    if @titles[i].nil? || @titles[i].empty?
      @titles[i] = "Title does not exist in Amazon API"
      else
      @titles[i] = item_hash[i]["ItemAttributes"]["Title"]
      end
  rescue
      @titles[0] =  item_hash[0]["ItemAttributes"]["Title"]
      @titles[1] = nil
      @titles[2] = nil
      @titles[3] = nil
      @titles[4] = nil
  end

end


for i in 0..4
  begin
    @pricesL[i] = item_hash[i]["OfferSummary"]["LowestUsedPrice"]
    if @pricesL[i].nil? || @pricesL[i].empty?
    @pricesL[i] = "The lowest price does not exist in Amazon API"
    else
    @pricesL[i] = item_hash[i]["OfferSummary"]["LowestUsedPrice"]["FormattedPrice"]
    end
  rescue
  @pricesL[0] = item_hash[0]["OfferSummary"]["LowestUsedPrice"]["FormattedPrice"]
  @pricesL[1] = nil
      @pricesL[2] = nil
      @pricesL[3] = nil
      @pricesL[4] = nil

  end
 end

for i in 0..4
  begin
    @pricesH[i] = item_hash[i]["OfferSummary"]["LowestNewPrice"]["FormattedPrice"]
  rescue
    @pricesH[0] = item_hash[0]["OfferSummary"]["LowestNewPrice"]["FormattedPrice"]
    @pricesH[1] = nil
      @pricesH[2] = nil
      @pricesH[3] = nil
      @pricesH[4] = nil
  end
 
 end

 for i in 0..4    
    begin
       @pictures[i] = item_hash[i]["LargeImage"]["URL"]
    rescue
       @pictures[0] = item_hash[0]["LargeImage"]["URL"]
       @pictures[1] = nil
      @pictures[2] = nil
      @pictures[3] = nil
      @pictures[4] = nil
    end

    
  end
    
for i in 0..4
  begin
     @links[i] = item_hash[i]["DetailPageURL"]
    
  rescue
  @links[0] = item_hash[0]["DetailPageURL"]
    @links[1] = nil
      @links[2] = nil
      @links[3] = nil
      @links[4] = nil
  end
 end

for i in 0..4
  begin
    @authors[i] = item_hash[i]["ItemAttributes"]["Author"]
  rescue
    @authors[0] = item_hash[0]["ItemAttributes"]["Author"]
    @authors[1] = nil
      @authors[2] = nil
      @authors[3] = nil
      @authors[4] = nil
  end
     
end

for i in 0..4
  begin
    if (item_hash[i]["IsEligibleForPrime"] == 1)
      @primes[i] = "Elligible for Prime"
      else
       @primes[i] = "Not elligible for Prime"
      end
  rescue
    if (item_hash[0]["IsEligibleForPrime"] == 1)
      @primes[0] = "Elligible for Prime"
      else
       @primes[0] = "Not elligible for Prime"
      end
      @primes[1] = nil
      @primes[2] = nil
      @primes[3] = nil
      @primes[4] = nil
  end
   
end
     
puts "_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+"



end
puts "66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666"

  @resultSetAPI = item_hash

else


end

  end

  def testAPI(keywords)


searchFor = keywords.tr('-', '')
  params = {
  "Service" => "AWSECommerceService",
  "Operation" => "ItemSearch",
  "AWSAccessKeyId" => AWS_ACCESS_KEY_ID,
  "AssociateTag" => "dostudentsdre-20",
  "SearchIndex" => "Books",
  "ResponseGroup" => "Images,ItemAttributes,Offers",
  "Keywords" => searchFor,
  "Condition" => "Used"
}
  generate_request_url(params)

  end
  #helper_method:testAPI

  end
