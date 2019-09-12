# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


module Google
  module Identity
    module Accesscontextmanager
      module V1
        # An `AccessLevel` is a label that can be applied to requests to GCP services,
        # along with a list of requirements necessary for the label to be applied.
        # @!attribute [rw] name
        #   @return [String]
        #     Required. Resource name for the Access Level. The `short_name` component
        #     must begin with a letter and only include alphanumeric and '_'. Format:
        #     `accessPolicies/{policy_id}/accessLevels/{short_name}`
        # @!attribute [rw] title
        #   @return [String]
        #     Human readable title. Must be unique within the Policy.
        # @!attribute [rw] description
        #   @return [String]
        #     Description of the `AccessLevel` and its use. Does not affect behavior.
        # @!attribute [rw] basic
        #   @return [Google::Identity::Accesscontextmanager::V1::BasicLevel]
        #     A `BasicLevel` composed of `Conditions`.
        # @!attribute [rw] create_time
        #   @return [Google::Protobuf::Timestamp]
        #     Output only. Time the `AccessLevel` was created in UTC.
        # @!attribute [rw] update_time
        #   @return [Google::Protobuf::Timestamp]
        #     Output only. Time the `AccessLevel` was updated in UTC.
        class AccessLevel; end

        # `BasicLevel` is an `AccessLevel` using a set of recommended features.
        # @!attribute [rw] conditions
        #   @return [Array<Google::Identity::Accesscontextmanager::V1::Condition>]
        #     Required. A list of requirements for the `AccessLevel` to be granted.
        # @!attribute [rw] combining_function
        #   @return [Google::Identity::Accesscontextmanager::V1::BasicLevel::ConditionCombiningFunction]
        #     How the `conditions` list should be combined to determine if a request is
        #     granted this `AccessLevel`. If AND is used, each `Condition` in
        #     `conditions` must be satisfied for the `AccessLevel` to be applied. If OR
        #     is used, at least one `Condition` in `conditions` must be satisfied for the
        #     `AccessLevel` to be applied. Default behavior is AND.
        class BasicLevel
          # Options for how the `conditions` list should be combined to determine if
          # this `AccessLevel` is applied. Default is AND.
          module ConditionCombiningFunction
            # All `Conditions` must be true for the `BasicLevel` to be true.
            AND = 0

            # If at least one `Condition` is true, then the `BasicLevel` is true.
            OR = 1
          end
        end

        # A condition necessary for an `AccessLevel` to be granted. The Condition is an
        # AND over its fields. So a Condition is true if: 1) the request IP is from one
        # of the listed subnetworks AND 2) the originating device complies with the
        # listed device policy AND 3) all listed access levels are granted AND 4) the
        # request was sent at a time allowed by the DateTimeRestriction.
        # @!attribute [rw] ip_subnetworks
        #   @return [Array<String>]
        #     CIDR block IP subnetwork specification. May be IPv4 or IPv6. Note that for
        #     a CIDR IP address block, the specified IP address portion must be properly
        #     truncated (i.e. all the host bits must be zero) or the input is considered
        #     malformed. For example, "192.0.2.0/24" is accepted but "192.0.2.1/24" is
        #     not. Similarly, for IPv6, "2001:db8::/32" is accepted whereas
        #     "2001:db8::1/32" is not. The originating IP of a request must be in one of
        #     the listed subnets in order for this Condition to be true. If empty, all IP
        #     addresses are allowed.
        # @!attribute [rw] device_policy
        #   @return [Google::Identity::Accesscontextmanager::V1::DevicePolicy]
        #     Device specific restrictions, all restrictions must hold for the
        #     Condition to be true. If not specified, all devices are allowed.
        # @!attribute [rw] required_access_levels
        #   @return [Array<String>]
        #     A list of other access levels defined in the same `Policy`, referenced by
        #     resource name. Referencing an `AccessLevel` which does not exist is an
        #     error. All access levels listed must be granted for the Condition
        #     to be true. Example:
        #     "`accessPolicies/MY_POLICY/accessLevels/LEVEL_NAME"`
        # @!attribute [rw] negate
        #   @return [true, false]
        #     Whether to negate the Condition. If true, the Condition becomes a NAND over
        #     its non-empty fields, each field must be false for the Condition overall to
        #     be satisfied. Defaults to false.
        # @!attribute [rw] members
        #   @return [Array<String>]
        #     The request must be made by one of the provided user or service
        #     accounts. Groups are not supported.
        #     Syntax:
        #     `user:{emailid}`
        #     `serviceAccount:{emailid}`
        #     If not specified, a request may come from any user.
        # @!attribute [rw] regions
        #   @return [Array<String>]
        #     The request must originate from one of the provided countries/regions.
        #     Must be valid ISO 3166-1 alpha-2 codes.
        class Condition; end

        # `DevicePolicy` specifies device specific restrictions necessary to acquire a
        # given access level. A `DevicePolicy` specifies requirements for requests from
        # devices to be granted access levels, it does not do any enforcement on the
        # device. `DevicePolicy` acts as an AND over all specified fields, and each
        # repeated field is an OR over its elements. Any unset fields are ignored. For
        # example, if the proto is { os_type : DESKTOP_WINDOWS, os_type :
        # DESKTOP_LINUX, encryption_status: ENCRYPTED}, then the DevicePolicy will be
        # true for requests originating from encrypted Linux desktops and encrypted
        # Windows desktops.
        # @!attribute [rw] require_screenlock
        #   @return [true, false]
        #     Whether or not screenlock is required for the DevicePolicy to be true.
        #     Defaults to `false`.
        # @!attribute [rw] allowed_encryption_statuses
        #   @return [Array<Google::Identity::Accesscontextmanager::Type::DeviceEncryptionStatus>]
        #     Allowed encryptions statuses, an empty list allows all statuses.
        # @!attribute [rw] os_constraints
        #   @return [Array<Google::Identity::Accesscontextmanager::V1::OsConstraint>]
        #     Allowed OS versions, an empty list allows all types and all versions.
        # @!attribute [rw] allowed_device_management_levels
        #   @return [Array<Google::Identity::Accesscontextmanager::Type::DeviceManagementLevel>]
        #     Allowed device management levels, an empty list allows all management
        #     levels.
        # @!attribute [rw] require_admin_approval
        #   @return [true, false]
        #     Whether the device needs to be approved by the customer admin.
        # @!attribute [rw] require_corp_owned
        #   @return [true, false]
        #     Whether the device needs to be corp owned.
        class DevicePolicy; end

        # A restriction on the OS type and version of devices making requests.
        # @!attribute [rw] os_type
        #   @return [Google::Identity::Accesscontextmanager::Type::OsType]
        #     Required. The allowed OS type.
        # @!attribute [rw] minimum_version
        #   @return [String]
        #     The minimum allowed OS version. If not set, any version of this OS
        #     satisfies the constraint. Format: `"major.minor.patch"`.
        #     Examples: `"10.5.301"`, `"9.2.1"`.
        # @!attribute [rw] require_verified_chrome_os
        #   @return [true, false]
        #     Only allows requests from devices with a verified Chrome OS.
        #     Verifications includes requirements that the device is enterprise-managed,
        #     conformant to Dasher domain policies, and the caller has permission to call
        #     the API targeted by the request.
        class OsConstraint; end
      end
    end
  end
end