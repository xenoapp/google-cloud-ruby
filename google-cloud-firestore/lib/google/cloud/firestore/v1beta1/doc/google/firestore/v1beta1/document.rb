# Copyright 2018 Google LLC
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
  module Firestore
    module V1beta1
      # A Firestore document.
      #
      # Must not exceed 1 MiB - 4 bytes.
      # @!attribute [rw] name
      #   @return [String]
      #     The resource name of the document, for example
      #     +projects/\\{project_id}/databases/\\{database_id}/documents/\\{document_path}+.
      # @!attribute [rw] fields
      #   @return [Hash{String => Google::Firestore::V1beta1::Value}]
      #     The document's fields.
      #
      #     The map keys represent field names.
      #
      #     A simple field name contains only characters +a+ to +z+, +A+ to +Z+,
      #     +0+ to +9+, or +_+, and must not start with +0+ to +9+. For example,
      #     +foo_bar_17+.
      #
      #     Field names matching the regular expression +__.*__+ are reserved. Reserved
      #     field names are forbidden except in certain documented contexts. The map
      #     keys, represented as UTF-8, must not exceed 1,500 bytes and cannot be
      #     empty.
      #
      #     Field paths may be used in other contexts to refer to structured fields
      #     defined here. For +map_value+, the field path is represented by the simple
      #     or quoted field names of the containing fields, delimited by +.+. For
      #     example, the structured field
      #     +"foo" : { map_value: { "x&y" : { string_value: "hello" }}}+ would be
      #     represented by the field path +foo.x&y+.
      #
      #     Within a field path, a quoted field name starts and ends with + + + and
      #     may contain any character. Some characters, including + + +, must be
      #     escaped using a +\+. For example, + +x&y+ + represents +x&y+ and
      #     + +bak\+tik+ + represents + bak+tik +.
      # @!attribute [rw] create_time
      #   @return [Google::Protobuf::Timestamp]
      #     Output only. The time at which the document was created.
      #
      #     This value increases monotonically when a document is deleted then
      #     recreated. It can also be compared to values from other documents and
      #     the +read_time+ of a query.
      # @!attribute [rw] update_time
      #   @return [Google::Protobuf::Timestamp]
      #     Output only. The time at which the document was last changed.
      #
      #     This value is initially set to the +create_time+ then increases
      #     monotonically with each change to the document. It can also be
      #     compared to values from other documents and the +read_time+ of a query.
      class Document; end

      # A message that can hold any of the supported value types.
      # @!attribute [rw] null_value
      #   @return [Google::Protobuf::NullValue]
      #     A null value.
      # @!attribute [rw] boolean_value
      #   @return [true, false]
      #     A boolean value.
      # @!attribute [rw] integer_value
      #   @return [Integer]
      #     An integer value.
      # @!attribute [rw] double_value
      #   @return [Float]
      #     A double value.
      # @!attribute [rw] timestamp_value
      #   @return [Google::Protobuf::Timestamp]
      #     A timestamp value.
      #
      #     Precise only to microseconds. When stored, any additional precision is
      #     rounded down.
      # @!attribute [rw] string_value
      #   @return [String]
      #     A string value.
      #
      #     The string, represented as UTF-8, must not exceed 1 MiB - 89 bytes.
      #     Only the first 1,500 bytes of the UTF-8 representation are considered by
      #     queries.
      # @!attribute [rw] bytes_value
      #   @return [String]
      #     A bytes value.
      #
      #     Must not exceed 1 MiB - 89 bytes.
      #     Only the first 1,500 bytes are considered by queries.
      # @!attribute [rw] reference_value
      #   @return [String]
      #     A reference to a document. For example:
      #     +projects/\\{project_id}/databases/\\{database_id}/documents/\\{document_path}+.
      # @!attribute [rw] geo_point_value
      #   @return [Google::Type::LatLng]
      #     A geo point value representing a point on the surface of Earth.
      # @!attribute [rw] array_value
      #   @return [Google::Firestore::V1beta1::ArrayValue]
      #     An array value.
      #
      #     Cannot directly contain another array value, though can contain an
      #     map which contains another array.
      # @!attribute [rw] map_value
      #   @return [Google::Firestore::V1beta1::MapValue]
      #     A map value.
      class Value; end

      # An array value.
      # @!attribute [rw] values
      #   @return [Array<Google::Firestore::V1beta1::Value>]
      #     Values in the array.
      class ArrayValue; end

      # A map value.
      # @!attribute [rw] fields
      #   @return [Hash{String => Google::Firestore::V1beta1::Value}]
      #     The map's fields.
      #
      #     The map keys represent field names. Field names matching the regular
      #     expression +__.*__+ are reserved. Reserved field names are forbidden except
      #     in certain documented contexts. The map keys, represented as UTF-8, must
      #     not exceed 1,500 bytes and cannot be empty.
      class MapValue; end
    end
  end
end