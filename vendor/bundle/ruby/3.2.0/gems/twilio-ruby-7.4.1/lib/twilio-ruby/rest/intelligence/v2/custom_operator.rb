##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Intelligence
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Intelligence < IntelligenceBase
            class V2 < Version
                class CustomOperatorList < ListResource
                
                    ##
                    # Initialize the CustomOperatorList
                    # @param [Version] version Version that contains the resource
                    # @return [CustomOperatorList] CustomOperatorList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Operators/Custom"
                        
                    end
                    ##
                    # Create the CustomOperatorInstance
                    # @param [String] friendly_name A human readable description of the new Operator, up to 64 characters.
                    # @param [String] operator_type Operator Type for this Operator. References an existing Operator Type resource.
                    # @param [Object] config Operator configuration, following the schema defined by the Operator Type.
                    # @return [CustomOperatorInstance] Created CustomOperatorInstance
                    def create(
                        friendly_name: nil, 
                        operator_type: nil, 
                        config: nil
                    )

                        data = Twilio::Values.of({
                            'FriendlyName' => friendly_name,
                            'OperatorType' => operator_type,
                            'Config' => Twilio.serialize_object(config),
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        CustomOperatorInstance.new(
                            @version,
                            payload,
                        )
                    end

                
                    ##
                    # Lists CustomOperatorInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Availability] availability Returns Custom Operators with the provided availability type. Possible values: internal, beta, public, retired.
                    # @param [String] language_code Returns Custom Operators that support the provided language code.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(availability: :unset, language_code: :unset, limit: nil, page_size: nil)
                        self.stream(
                            availability: availability,
                            language_code: language_code,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Availability] availability Returns Custom Operators with the provided availability type. Possible values: internal, beta, public, retired.
                    # @param [String] language_code Returns Custom Operators that support the provided language code.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(availability: :unset, language_code: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            availability: availability,
                            language_code: language_code,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields CustomOperatorInstance records from the API.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    def each
                        limits = @version.read_limits

                        page = self.page(page_size: limits[:page_size], )

                        @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
                    end

                    ##
                    # Retrieve a single page of CustomOperatorInstance records from the API.
                    # Request is executed immediately.
                    # @param [Availability] availability Returns Custom Operators with the provided availability type. Possible values: internal, beta, public, retired.
                    # @param [String] language_code Returns Custom Operators that support the provided language code.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of CustomOperatorInstance
                    def page(availability: :unset, language_code: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'Availability' => availability,
                            'LanguageCode' => language_code,
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        CustomOperatorPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of CustomOperatorInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of CustomOperatorInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    CustomOperatorPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Intelligence.V2.CustomOperatorList>'
                    end
                end


                class CustomOperatorContext < InstanceContext
                    ##
                    # Initialize the CustomOperatorContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid A 34 character string that uniquely identifies this Custom Operator.
                    # @return [CustomOperatorContext] CustomOperatorContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/Operators/Custom/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Delete the CustomOperatorInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the CustomOperatorInstance
                    # @return [CustomOperatorInstance] Fetched CustomOperatorInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        CustomOperatorInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the CustomOperatorInstance
                    # @param [String] friendly_name A human-readable name of this resource, up to 64 characters.
                    # @param [Object] config Operator configuration, following the schema defined by the Operator Type.
                    # @param [String] if_match The If-Match HTTP request header
                    # @return [CustomOperatorInstance] Updated CustomOperatorInstance
                    def update(
                        friendly_name: nil, 
                        config: nil, 
                        if_match: :unset
                    )

                        data = Twilio::Values.of({
                            'FriendlyName' => friendly_name,
                            'Config' => Twilio.serialize_object(config),
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', 'If-Match' => if_match, })
                        
                        
                        
                        
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        CustomOperatorInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Intelligence.V2.CustomOperatorContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Intelligence.V2.CustomOperatorContext #{context}>"
                    end
                end

                class CustomOperatorPage < Page
                    ##
                    # Initialize the CustomOperatorPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [CustomOperatorPage] CustomOperatorPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of CustomOperatorInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [CustomOperatorInstance] CustomOperatorInstance
                    def get_instance(payload)
                        CustomOperatorInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Intelligence.V2.CustomOperatorPage>'
                    end
                end
                class CustomOperatorInstance < InstanceResource
                    ##
                    # Initialize the CustomOperatorInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this CustomOperator
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [CustomOperatorInstance] CustomOperatorInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'sid' => payload['sid'],
                            'friendly_name' => payload['friendly_name'],
                            'description' => payload['description'],
                            'author' => payload['author'],
                            'operator_type' => payload['operator_type'],
                            'version' => payload['version'] == nil ? payload['version'] : payload['version'].to_i,
                            'availability' => payload['availability'],
                            'config' => payload['config'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [CustomOperatorContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = CustomOperatorContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique SID identifier of the Account the Custom Operator belongs to.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] A 34 character string that uniquely identifies this Custom Operator.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] A human-readable name of this resource, up to 64 characters.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [String] A human-readable description of this resource, longer than the friendly name.
                    def description
                        @properties['description']
                    end
                    
                    ##
                    # @return [String] The creator of the Custom Operator. Custom Operators can only be created by a Twilio Account.
                    def author
                        @properties['author']
                    end
                    
                    ##
                    # @return [String] Operator Type for this Operator. References an existing Operator Type resource.
                    def operator_type
                        @properties['operator_type']
                    end
                    
                    ##
                    # @return [String] Numeric Custom Operator version. Incremented with each update on the resource, used to ensure integrity when updating the Custom Operator.
                    def version
                        @properties['version']
                    end
                    
                    ##
                    # @return [Availability] 
                    def availability
                        @properties['availability']
                    end
                    
                    ##
                    # @return [Hash] Operator configuration, following the schema defined by the Operator Type. Only available on Operators created by the Account.
                    def config
                        @properties['config']
                    end
                    
                    ##
                    # @return [Time] The date that this Custom Operator was created, given in ISO 8601 format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date that this Custom Operator was updated, given in ISO 8601 format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The URL of this resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Delete the CustomOperatorInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the CustomOperatorInstance
                    # @return [CustomOperatorInstance] Fetched CustomOperatorInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the CustomOperatorInstance
                    # @param [String] friendly_name A human-readable name of this resource, up to 64 characters.
                    # @param [Object] config Operator configuration, following the schema defined by the Operator Type.
                    # @param [String] if_match The If-Match HTTP request header
                    # @return [CustomOperatorInstance] Updated CustomOperatorInstance
                    def update(
                        friendly_name: nil, 
                        config: nil, 
                        if_match: :unset
                    )

                        context.update(
                            friendly_name: friendly_name, 
                            config: config, 
                            if_match: if_match, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Intelligence.V2.CustomOperatorInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Intelligence.V2.CustomOperatorInstance #{values}>"
                    end
                end

            end
        end
    end
end
