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
                class InsightsSegmentsList < ListResource
                
                    ##
                    # Initialize the InsightsSegmentsList
                    # @param [Version] version Version that contains the resource
                    # @return [InsightsSegmentsList] InsightsSegmentsList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Insights/Segments"
                        
                    end
                
                    ##
                    # Lists InsightsSegmentsInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [String] authorization The Authorization HTTP request header
                    # @param [String] segment_id To unique id of the segment
                    # @param [Array[String]] reservation_id The list of reservation Ids
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(authorization: :unset, segment_id: :unset, reservation_id: :unset, limit: nil, page_size: nil)
                        self.stream(
                            authorization: authorization,
                            segment_id: segment_id,
                            reservation_id: reservation_id,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [String] authorization The Authorization HTTP request header
                    # @param [String] segment_id To unique id of the segment
                    # @param [Array[String]] reservation_id The list of reservation Ids
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(authorization: :unset, segment_id: :unset, reservation_id: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            authorization: authorization,
                            segment_id: segment_id,
                            reservation_id: reservation_id,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields InsightsSegmentsInstance records from the API.
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
                    # Retrieve a single page of InsightsSegmentsInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] authorization The Authorization HTTP request header
                    # @param [String] segment_id To unique id of the segment
                    # @param [Array[String]] reservation_id The list of reservation Ids
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of InsightsSegmentsInstance
                    def page(authorization: :unset, segment_id: :unset, reservation_id: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'Authorization' => authorization,
                            'SegmentId' => segment_id,
                            
                            'ReservationId' =>  Twilio.serialize_list(reservation_id) { |e| e },
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        InsightsSegmentsPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of InsightsSegmentsInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of InsightsSegmentsInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    InsightsSegmentsPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.FlexApi.V1.InsightsSegmentsList>'
                    end
                end

                class InsightsSegmentsPage < Page
                    ##
                    # Initialize the InsightsSegmentsPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [InsightsSegmentsPage] InsightsSegmentsPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of InsightsSegmentsInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [InsightsSegmentsInstance] InsightsSegmentsInstance
                    def get_instance(payload)
                        InsightsSegmentsInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.FlexApi.V1.InsightsSegmentsPage>'
                    end
                end
                class InsightsSegmentsInstance < InstanceResource
                    ##
                    # Initialize the InsightsSegmentsInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this InsightsSegments
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [InsightsSegmentsInstance] InsightsSegmentsInstance
                    def initialize(version, payload )
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'segment_id' => payload['segment_id'],
                            'external_id' => payload['external_id'],
                            'queue' => payload['queue'],
                            'external_contact' => payload['external_contact'],
                            'external_segment_link_id' => payload['external_segment_link_id'],
                            'date' => payload['date'],
                            'account_id' => payload['account_id'],
                            'external_segment_link' => payload['external_segment_link'],
                            'agent_id' => payload['agent_id'],
                            'agent_phone' => payload['agent_phone'],
                            'agent_name' => payload['agent_name'],
                            'agent_team_name' => payload['agent_team_name'],
                            'agent_team_name_in_hierarchy' => payload['agent_team_name_in_hierarchy'],
                            'agent_link' => payload['agent_link'],
                            'customer_phone' => payload['customer_phone'],
                            'customer_name' => payload['customer_name'],
                            'customer_link' => payload['customer_link'],
                            'segment_recording_offset' => payload['segment_recording_offset'],
                            'media' => payload['media'],
                            'assessment_type' => payload['assessment_type'],
                            'assessment_percentage' => payload['assessment_percentage'],
                            'url' => payload['url'],
                        }
                    end

                    
                    ##
                    # @return [String] To unique id of the segment
                    def segment_id
                        @properties['segment_id']
                    end
                    
                    ##
                    # @return [String] The unique id for the conversation.
                    def external_id
                        @properties['external_id']
                    end
                    
                    ##
                    # @return [String] 
                    def queue
                        @properties['queue']
                    end
                    
                    ##
                    # @return [String] 
                    def external_contact
                        @properties['external_contact']
                    end
                    
                    ##
                    # @return [String] The uuid for the external_segment_link.
                    def external_segment_link_id
                        @properties['external_segment_link_id']
                    end
                    
                    ##
                    # @return [String] The date of the conversation.
                    def date
                        @properties['date']
                    end
                    
                    ##
                    # @return [String] The unique id for the account.
                    def account_id
                        @properties['account_id']
                    end
                    
                    ##
                    # @return [String] The hyperlink to recording of the task event.
                    def external_segment_link
                        @properties['external_segment_link']
                    end
                    
                    ##
                    # @return [String] The unique id for the agent.
                    def agent_id
                        @properties['agent_id']
                    end
                    
                    ##
                    # @return [String] The phone number of the agent.
                    def agent_phone
                        @properties['agent_phone']
                    end
                    
                    ##
                    # @return [String] The name of the agent.
                    def agent_name
                        @properties['agent_name']
                    end
                    
                    ##
                    # @return [String] The team name to which agent belongs.
                    def agent_team_name
                        @properties['agent_team_name']
                    end
                    
                    ##
                    # @return [String] he team name to which agent belongs.
                    def agent_team_name_in_hierarchy
                        @properties['agent_team_name_in_hierarchy']
                    end
                    
                    ##
                    # @return [String] The link to the agent conversation.
                    def agent_link
                        @properties['agent_link']
                    end
                    
                    ##
                    # @return [String] The phone number of the customer.
                    def customer_phone
                        @properties['customer_phone']
                    end
                    
                    ##
                    # @return [String] The name of the customer.
                    def customer_name
                        @properties['customer_name']
                    end
                    
                    ##
                    # @return [String] The link to the customer conversation.
                    def customer_link
                        @properties['customer_link']
                    end
                    
                    ##
                    # @return [String] The offset value for the recording.
                    def segment_recording_offset
                        @properties['segment_recording_offset']
                    end
                    
                    ##
                    # @return [Hash] The media identifiers of the conversation.
                    def media
                        @properties['media']
                    end
                    
                    ##
                    # @return [Hash] The type of the assessment.
                    def assessment_type
                        @properties['assessment_type']
                    end
                    
                    ##
                    # @return [Hash] The percentage scored on the Assessments.
                    def assessment_percentage
                        @properties['assessment_percentage']
                    end
                    
                    ##
                    # @return [String] 
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.FlexApi.V1.InsightsSegmentsInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.FlexApi.V1.InsightsSegmentsInstance>"
                    end
                end

            end
        end
    end
end
