##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Flex
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class FlexApi < FlexApiBase
            class V1 < Version
                class InsightsSettingsAnswerSetsList < ListResource
                
                    ##
                    # Initialize the InsightsSettingsAnswerSetsList
                    # @param [Version] version Version that contains the resource
                    # @return [InsightsSettingsAnswerSetsList] InsightsSettingsAnswerSetsList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Insights/QualityManagement/Settings/AnswerSets"
                        
                    end
                    ##
                    # Fetch the InsightsSettingsAnswerSetsInstance
                    # @param [String] authorization The Authorization HTTP request header
                    # @return [InsightsSettingsAnswerSetsInstance] Fetched InsightsSettingsAnswerSetsInstance
                    def fetch(
                        authorization: :unset
                    )

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', 'Authorization' => authorization, })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        InsightsSettingsAnswerSetsInstance.new(
                            @version,
                            payload,
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.FlexApi.V1.InsightsSettingsAnswerSetsList>'
                    end
                end

                class InsightsSettingsAnswerSetsPage < Page
                    ##
                    # Initialize the InsightsSettingsAnswerSetsPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [InsightsSettingsAnswerSetsPage] InsightsSettingsAnswerSetsPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of InsightsSettingsAnswerSetsInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [InsightsSettingsAnswerSetsInstance] InsightsSettingsAnswerSetsInstance
                    def get_instance(payload)
                        InsightsSettingsAnswerSetsInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.FlexApi.V1.InsightsSettingsAnswerSetsPage>'
                    end
                end
                class InsightsSettingsAnswerSetsInstance < InstanceResource
                    ##
                    # Initialize the InsightsSettingsAnswerSetsInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this InsightsSettingsAnswerSets
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [InsightsSettingsAnswerSetsInstance] InsightsSettingsAnswerSetsInstance
                    def initialize(version, payload )
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'answer_sets' => payload['answer_sets'],
                            'answer_set_categories' => payload['answer_set_categories'],
                            'not_applicable' => payload['not_applicable'],
                            'url' => payload['url'],
                        }
                    end

                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Flex Insights resource and owns this resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [Hash] The lis of answer sets
                    def answer_sets
                        @properties['answer_sets']
                    end
                    
                    ##
                    # @return [Hash] The list of answer set categories
                    def answer_set_categories
                        @properties['answer_set_categories']
                    end
                    
                    ##
                    # @return [Hash] The details for not applicable answer set
                    def not_applicable
                        @properties['not_applicable']
                    end
                    
                    ##
                    # @return [String] 
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.FlexApi.V1.InsightsSettingsAnswerSetsInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.FlexApi.V1.InsightsSettingsAnswerSetsInstance>"
                    end
                end

            end
        end
    end
end
