##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Accounts
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Accounts < AccountsBase
            class V1 < Version
                class BulkConsentsList < ListResource
                
                    ##
                    # Initialize the BulkConsentsList
                    # @param [Version] version Version that contains the resource
                    # @return [BulkConsentsList] BulkConsentsList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Consents/Bulk"
                        
                    end
                    ##
                    # Create the BulkConsentsInstance
                    # @param [Array[Hash]] items This is a list of objects that describes a contact's opt-in status. Each object contains the following fields: `contact_id`, which must be a string representing phone number in [E.164 format](https://www.twilio.com/docs/glossary/what-e164); `correlation_id`, a unique 32-character UUID used to uniquely map the request item with the response item; `sender_id`, which can be either a valid messaging service SID or a from phone number; `status`, a string representing the consent status. Can be one of [`opt-in`, `opt-out`]; and `source`, a string indicating the medium through which the consent was collected. Can be one of [`website`, `offline`, `opt-in-message`, `opt-out-message`, `others`].
                    # @return [BulkConsentsInstance] Created BulkConsentsInstance
                    def create(
                        items: nil
                    )

                        data = Twilio::Values.of({
                            'Items' => Twilio.serialize_list(items) { |e| Twilio.serialize_object(e) },
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        BulkConsentsInstance.new(
                            @version,
                            payload,
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Accounts.V1.BulkConsentsList>'
                    end
                end

                class BulkConsentsPage < Page
                    ##
                    # Initialize the BulkConsentsPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [BulkConsentsPage] BulkConsentsPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of BulkConsentsInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [BulkConsentsInstance] BulkConsentsInstance
                    def get_instance(payload)
                        BulkConsentsInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Accounts.V1.BulkConsentsPage>'
                    end
                end
                class BulkConsentsInstance < InstanceResource
                    ##
                    # Initialize the BulkConsentsInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this BulkConsents
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [BulkConsentsInstance] BulkConsentsInstance
                    def initialize(version, payload )
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'items' => payload['items'],
                        }
                    end

                    
                    ##
                    # @return [Hash] A list of objects where each object represents the result of processing a `correlation_id`. Each object contains the following fields: `correlation_id`, a unique 32-character UUID that maps the response to the original request; `error_code`, an integer where 0 indicates success and any non-zero value represents an error; and `error_messages`, an array of strings describing specific validation errors encountered. If the request is successful, the error_messages array will be empty.
                    def items
                        @properties['items']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Accounts.V1.BulkConsentsInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Accounts.V1.BulkConsentsInstance>"
                    end
                end

            end
        end
    end
end
