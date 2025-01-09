##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Taskrouter
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Taskrouter < TaskrouterBase
            class V1 < Version
                class WorkspaceContext < InstanceContext
                class TaskQueueContext < InstanceContext

                     class TaskQueueStatisticsList < ListResource
                
                    ##
                    # Initialize the TaskQueueStatisticsList
                    # @param [Version] version Version that contains the resource
                    # @return [TaskQueueStatisticsList] TaskQueueStatisticsList
                    def initialize(version, workspace_sid: nil, task_queue_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { workspace_sid: workspace_sid, task_queue_sid: task_queue_sid }
                        
                        
                    end
                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Taskrouter.V1.TaskQueueStatisticsList>'
                    end
                end


                class TaskQueueStatisticsContext < InstanceContext
                    ##
                    # Initialize the TaskQueueStatisticsContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] workspace_sid The SID of the Workspace with the TaskQueue to fetch.
                    # @param [String] task_queue_sid The SID of the TaskQueue for which to fetch statistics.
                    # @return [TaskQueueStatisticsContext] TaskQueueStatisticsContext
                    def initialize(version, workspace_sid, task_queue_sid)
                        super(version)

                        # Path Solution
                        @solution = { workspace_sid: workspace_sid, task_queue_sid: task_queue_sid,  }
                        @uri = "/Workspaces/#{@solution[:workspace_sid]}/TaskQueues/#{@solution[:task_queue_sid]}/Statistics"

                        
                    end
                    ##
                    # Fetch the TaskQueueStatisticsInstance
                    # @param [Time] end_date Only calculate statistics from this date and time and earlier, specified in GMT as an [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date-time.
                    # @param [String] minutes Only calculate statistics since this many minutes in the past. The default is 15 minutes.
                    # @param [Time] start_date Only calculate statistics from this date and time and later, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    # @param [String] task_channel Only calculate real-time and cumulative statistics for the specified TaskChannel. Can be the TaskChannel's SID or its `unique_name`, such as `voice`, `sms`, or `default`.
                    # @param [String] split_by_wait_time A comma separated list of values that describes the thresholds, in seconds, to calculate statistics on. For each threshold specified, the number of Tasks canceled and reservations accepted above and below the specified thresholds in seconds are computed.
                    # @return [TaskQueueStatisticsInstance] Fetched TaskQueueStatisticsInstance
                    def fetch(
                        end_date: :unset, 
                        minutes: :unset, 
                        start_date: :unset, 
                        task_channel: :unset, 
                        split_by_wait_time: :unset
                    )

                        params = Twilio::Values.of({
                            'EndDate' => Twilio.serialize_iso8601_datetime(end_date),
                            'Minutes' => minutes,
                            'StartDate' => Twilio.serialize_iso8601_datetime(start_date),
                            'TaskChannel' => task_channel,
                            'SplitByWaitTime' => split_by_wait_time,
                        })
                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, params: params, headers: headers)
                        TaskQueueStatisticsInstance.new(
                            @version,
                            payload,
                            workspace_sid: @solution[:workspace_sid],
                            task_queue_sid: @solution[:task_queue_sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Taskrouter.V1.TaskQueueStatisticsContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Taskrouter.V1.TaskQueueStatisticsContext #{context}>"
                    end
                end

                class TaskQueueStatisticsPage < Page
                    ##
                    # Initialize the TaskQueueStatisticsPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [TaskQueueStatisticsPage] TaskQueueStatisticsPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of TaskQueueStatisticsInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [TaskQueueStatisticsInstance] TaskQueueStatisticsInstance
                    def get_instance(payload)
                        TaskQueueStatisticsInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid], task_queue_sid: @solution[:task_queue_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Taskrouter.V1.TaskQueueStatisticsPage>'
                    end
                end
                class TaskQueueStatisticsInstance < InstanceResource
                    ##
                    # Initialize the TaskQueueStatisticsInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this TaskQueueStatistics
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [TaskQueueStatisticsInstance] TaskQueueStatisticsInstance
                    def initialize(version, payload , workspace_sid: nil, task_queue_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'cumulative' => payload['cumulative'],
                            'realtime' => payload['realtime'],
                            'task_queue_sid' => payload['task_queue_sid'],
                            'workspace_sid' => payload['workspace_sid'],
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'workspace_sid' => workspace_sid  || @properties['workspace_sid']  ,'task_queue_sid' => task_queue_sid  || @properties['task_queue_sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [TaskQueueStatisticsContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = TaskQueueStatisticsContext.new(@version , @params['workspace_sid'], @params['task_queue_sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the TaskQueue resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [Hash] An object that contains the cumulative statistics for the TaskQueue.
                    def cumulative
                        @properties['cumulative']
                    end
                    
                    ##
                    # @return [Hash] An object that contains the real-time statistics for the TaskQueue.
                    def realtime
                        @properties['realtime']
                    end
                    
                    ##
                    # @return [String] The SID of the TaskQueue from which these statistics were calculated.
                    def task_queue_sid
                        @properties['task_queue_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the Workspace that contains the TaskQueue.
                    def workspace_sid
                        @properties['workspace_sid']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the TaskQueue statistics resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Fetch the TaskQueueStatisticsInstance
                    # @param [Time] end_date Only calculate statistics from this date and time and earlier, specified in GMT as an [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date-time.
                    # @param [String] minutes Only calculate statistics since this many minutes in the past. The default is 15 minutes.
                    # @param [Time] start_date Only calculate statistics from this date and time and later, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    # @param [String] task_channel Only calculate real-time and cumulative statistics for the specified TaskChannel. Can be the TaskChannel's SID or its `unique_name`, such as `voice`, `sms`, or `default`.
                    # @param [String] split_by_wait_time A comma separated list of values that describes the thresholds, in seconds, to calculate statistics on. For each threshold specified, the number of Tasks canceled and reservations accepted above and below the specified thresholds in seconds are computed.
                    # @return [TaskQueueStatisticsInstance] Fetched TaskQueueStatisticsInstance
                    def fetch(
                        end_date: :unset, 
                        minutes: :unset, 
                        start_date: :unset, 
                        task_channel: :unset, 
                        split_by_wait_time: :unset
                    )

                        context.fetch(
                            end_date: end_date, 
                            minutes: minutes, 
                            start_date: start_date, 
                            task_channel: task_channel, 
                            split_by_wait_time: split_by_wait_time, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Taskrouter.V1.TaskQueueStatisticsInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Taskrouter.V1.TaskQueueStatisticsInstance #{values}>"
                    end
                end

             end
             end
            end
        end
    end
end


