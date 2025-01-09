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
        class FlexApi
            class V2 < Version
                ##
                # Initialize the V2 version of FlexApi
                def initialize(domain)
                    super
                    @version = 'v2'
                    @flex_user = nil
                    @web_channels = nil
                end

                ##
                # @param [String] instance_sid The unique ID created by Twilio to identify a Flex instance.
                # @param [String] flex_user_sid The unique id for the flex user to be retrieved.
                # @return [Twilio::REST::FlexApi::V2::FlexUserContext] if instanceSid was passed.
                # @return [Twilio::REST::FlexApi::V2::FlexUserList]
                def flex_user(instance_sid=:unset, flex_user_sid=:unset)
                    if instance_sid.nil?
                        raise ArgumentError, 'instance_sid cannot be nil'
                    end
                    if flex_user_sid.nil?
                        raise ArgumentError, 'flex_user_sid cannot be nil'
                    end
                    if instance_sid == :unset && flex_user_sid == :unset
                        @flex_user ||= FlexUserList.new self
                    else
                        FlexUserContext.new(self, instance_sid, flex_user_sid)
                    end
                end
                ##
                # @param [String] instance_sid The unique ID created by Twilio to identify a Flex instance.
                # @param [String] flex_user_sid The unique id for the flex user to be retrieved.
                # @return [Twilio::REST::FlexApi::V2::FlexUserContext] if flexUserSid was passed.
                # @return [Twilio::REST::FlexApi::V2::FlexUserList]
                def flex_user(instance_sid=:unset, flex_user_sid=:unset)
                    if instance_sid.nil?
                        raise ArgumentError, 'instance_sid cannot be nil'
                    end
                    if flex_user_sid.nil?
                        raise ArgumentError, 'flex_user_sid cannot be nil'
                    end
                    if instance_sid == :unset && flex_user_sid == :unset
                        @flex_user ||= FlexUserList.new self
                    else
                        FlexUserContext.new(self, instance_sid, flex_user_sid)
                    end
                end
                ##
                # @return [Twilio::REST::FlexApi::V2::WebChannelsList]
                def web_channels
                    @web_channels ||= WebChannelsList.new self
                end
                ##
                # Provide a user friendly representation
                def to_s
                    '<Twilio::REST::FlexApi::V2>';
                end
            end
        end
    end
end
