# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/asset/v1/asset_service.proto


require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/cloud/asset/v1/assets_pb'
require 'google/longrunning/operations_pb'
require 'google/protobuf/timestamp_pb'
require 'google/api/client_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.cloud.asset.v1.ExportAssetsRequest" do
    optional :parent, :string, 1
    optional :read_time, :message, 2, "google.protobuf.Timestamp"
    repeated :asset_types, :string, 3
    optional :content_type, :enum, 4, "google.cloud.asset.v1.ContentType"
    optional :output_config, :message, 5, "google.cloud.asset.v1.OutputConfig"
  end
  add_message "google.cloud.asset.v1.ExportAssetsResponse" do
    optional :read_time, :message, 1, "google.protobuf.Timestamp"
    optional :output_config, :message, 2, "google.cloud.asset.v1.OutputConfig"
  end
  add_message "google.cloud.asset.v1.BatchGetAssetsHistoryRequest" do
    optional :parent, :string, 1
    repeated :asset_names, :string, 2
    optional :content_type, :enum, 3, "google.cloud.asset.v1.ContentType"
    optional :read_time_window, :message, 4, "google.cloud.asset.v1.TimeWindow"
  end
  add_message "google.cloud.asset.v1.BatchGetAssetsHistoryResponse" do
    repeated :assets, :message, 1, "google.cloud.asset.v1.TemporalAsset"
  end
  add_message "google.cloud.asset.v1.OutputConfig" do
    oneof :destination do
      optional :gcs_destination, :message, 1, "google.cloud.asset.v1.GcsDestination"
      optional :bigquery_destination, :message, 2, "google.cloud.asset.v1.BigQueryDestination"
    end
  end
  add_message "google.cloud.asset.v1.GcsDestination" do
    oneof :object_uri do
      optional :uri, :string, 1
      optional :uri_prefix, :string, 2
    end
  end
  add_message "google.cloud.asset.v1.BigQueryDestination" do
    optional :dataset, :string, 1
    optional :table, :string, 2
    optional :force, :bool, 3
  end
  add_enum "google.cloud.asset.v1.ContentType" do
    value :CONTENT_TYPE_UNSPECIFIED, 0
    value :RESOURCE, 1
    value :IAM_POLICY, 2
    value :ORG_POLICY, 4
    value :ACCESS_POLICY, 5
  end
end

module Google
  module Cloud
    module Asset
      module V1
        ExportAssetsRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.asset.v1.ExportAssetsRequest").msgclass
        ExportAssetsResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.asset.v1.ExportAssetsResponse").msgclass
        BatchGetAssetsHistoryRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.asset.v1.BatchGetAssetsHistoryRequest").msgclass
        BatchGetAssetsHistoryResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.asset.v1.BatchGetAssetsHistoryResponse").msgclass
        OutputConfig = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.asset.v1.OutputConfig").msgclass
        GcsDestination = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.asset.v1.GcsDestination").msgclass
        BigQueryDestination = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.asset.v1.BigQueryDestination").msgclass
        ContentType = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.asset.v1.ContentType").enummodule
      end
    end
  end
end
