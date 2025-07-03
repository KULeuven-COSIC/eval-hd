// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : Core
// Git hash  : 819eb9a47fe0c8202a615077335b32fbe1eff690

`timescale 1ns/1ps

module Core (
  output wire          io_charOut_valid,
  output wire [7:0]    io_charOut_payload,
  output wire          io_testDev_valid,
  output wire [31:0]   io_testDev_payload,
  output wire          io_byteDev_wdata_valid,
  output wire [7:0]    io_byteDev_wdata_payload,
  input  wire          io_byteDev_rdata_valid,
  output wire          io_byteDev_rdata_ready,
  input  wire [7:0]    io_byteDev_rdata_payload,
  output wire          io_axi_arw_valid,
  input  wire          io_axi_arw_ready,
  output wire [23:0]   io_axi_arw_payload_addr,
  output wire [3:0]    io_axi_arw_payload_id,
  output wire [7:0]    io_axi_arw_payload_len,
  output wire [2:0]    io_axi_arw_payload_size,
  output wire [1:0]    io_axi_arw_payload_burst,
  output wire          io_axi_arw_payload_write,
  output wire          io_axi_w_valid,
  input  wire          io_axi_w_ready,
  output wire [31:0]   io_axi_w_payload_data,
  output wire [3:0]    io_axi_w_payload_strb,
  output wire          io_axi_w_payload_last,
  input  wire          io_axi_b_valid,
  output wire          io_axi_b_ready,
  input  wire [3:0]    io_axi_b_payload_id,
  input  wire [1:0]    io_axi_b_payload_resp,
  input  wire          io_axi_r_valid,
  output wire          io_axi_r_ready,
  input  wire [31:0]   io_axi_r_payload_data,
  input  wire [3:0]    io_axi_r_payload_id,
  input  wire [1:0]    io_axi_r_payload_resp,
  input  wire          io_axi_r_payload_last,
  input  wire          reset,
  input  wire          clk
);

  wire       [31:0]   pipeline_ibus_rsp_payload_rdata;
  wire       [31:0]   pipeline_dbus_rsp_payload_rdata;
  reg                 soc_dbusAxi_decoder_io_input_r_ready;
  wire       [23:0]   io_axi_arbiter_io_readInputs_0_ar_payload_addr;
  wire       [23:0]   io_axi_arbiter_io_sharedInputs_0_arw_payload_addr;
  wire       [3:0]    soc_machineTimers_io_apb_PADDR;
  wire       [3:0]    soc_charDev_io_apb_PADDR;
  wire       [3:0]    soc_testDev_io_apb_PADDR;
  wire       [3:0]    soc_byteDev_io_apb_PADDR;
  wire                pipeline_ibus_cmd_valid;
  wire       [31:0]   pipeline_ibus_cmd_payload_address;
  wire                pipeline_ibus_rsp_ready;
  wire                pipeline_dbus_cmd_valid;
  wire       [31:0]   pipeline_dbus_cmd_payload_address;
  wire                pipeline_dbus_cmd_payload_write;
  wire       [31:0]   pipeline_dbus_cmd_payload_wdata;
  wire       [3:0]    pipeline_dbus_cmd_payload_wmask;
  wire                pipeline_dbus_rsp_ready;
  wire                soc_apbBridge_io_axi_arw_ready;
  wire                soc_apbBridge_io_axi_w_ready;
  wire                soc_apbBridge_io_axi_b_valid;
  wire       [3:0]    soc_apbBridge_io_axi_b_payload_id;
  wire       [1:0]    soc_apbBridge_io_axi_b_payload_resp;
  wire                soc_apbBridge_io_axi_r_valid;
  wire       [31:0]   soc_apbBridge_io_axi_r_payload_data;
  wire       [3:0]    soc_apbBridge_io_axi_r_payload_id;
  wire       [1:0]    soc_apbBridge_io_axi_r_payload_resp;
  wire                soc_apbBridge_io_axi_r_payload_last;
  wire       [31:0]   soc_apbBridge_io_apb_PADDR;
  wire       [0:0]    soc_apbBridge_io_apb_PSEL;
  wire                soc_apbBridge_io_apb_PENABLE;
  wire                soc_apbBridge_io_apb_PWRITE;
  wire       [31:0]   soc_apbBridge_io_apb_PWDATA;
  wire                soc_ibusAxi_decoder_io_input_ar_ready;
  wire                soc_ibusAxi_decoder_io_input_r_valid;
  wire       [31:0]   soc_ibusAxi_decoder_io_input_r_payload_data;
  wire                soc_ibusAxi_decoder_io_input_r_payload_last;
  wire                soc_ibusAxi_decoder_io_outputs_0_ar_valid;
  wire       [31:0]   soc_ibusAxi_decoder_io_outputs_0_ar_payload_addr;
  wire                soc_ibusAxi_decoder_io_outputs_0_r_ready;
  wire                soc_dbusAxi_decoder_io_input_arw_ready;
  wire                soc_dbusAxi_decoder_io_input_w_ready;
  wire                soc_dbusAxi_decoder_io_input_b_valid;
  wire                soc_dbusAxi_decoder_io_input_r_valid;
  wire       [31:0]   soc_dbusAxi_decoder_io_input_r_payload_data;
  wire                soc_dbusAxi_decoder_io_input_r_payload_last;
  wire                soc_dbusAxi_decoder_io_sharedOutputs_0_arw_valid;
  wire       [31:0]   soc_dbusAxi_decoder_io_sharedOutputs_0_arw_payload_addr;
  wire                soc_dbusAxi_decoder_io_sharedOutputs_0_arw_payload_write;
  wire                soc_dbusAxi_decoder_io_sharedOutputs_0_w_valid;
  wire       [31:0]   soc_dbusAxi_decoder_io_sharedOutputs_0_w_payload_data;
  wire       [3:0]    soc_dbusAxi_decoder_io_sharedOutputs_0_w_payload_strb;
  wire                soc_dbusAxi_decoder_io_sharedOutputs_0_w_payload_last;
  wire                soc_dbusAxi_decoder_io_sharedOutputs_0_b_ready;
  wire                soc_dbusAxi_decoder_io_sharedOutputs_0_r_ready;
  wire                soc_dbusAxi_decoder_io_sharedOutputs_1_arw_valid;
  wire       [31:0]   soc_dbusAxi_decoder_io_sharedOutputs_1_arw_payload_addr;
  wire                soc_dbusAxi_decoder_io_sharedOutputs_1_arw_payload_write;
  wire                soc_dbusAxi_decoder_io_sharedOutputs_1_w_valid;
  wire       [31:0]   soc_dbusAxi_decoder_io_sharedOutputs_1_w_payload_data;
  wire       [3:0]    soc_dbusAxi_decoder_io_sharedOutputs_1_w_payload_strb;
  wire                soc_dbusAxi_decoder_io_sharedOutputs_1_w_payload_last;
  wire                soc_dbusAxi_decoder_io_sharedOutputs_1_b_ready;
  wire                soc_dbusAxi_decoder_io_sharedOutputs_1_r_ready;
  wire                io_axi_arbiter_io_readInputs_0_ar_ready;
  wire                io_axi_arbiter_io_readInputs_0_r_valid;
  wire       [31:0]   io_axi_arbiter_io_readInputs_0_r_payload_data;
  wire       [2:0]    io_axi_arbiter_io_readInputs_0_r_payload_id;
  wire       [1:0]    io_axi_arbiter_io_readInputs_0_r_payload_resp;
  wire                io_axi_arbiter_io_readInputs_0_r_payload_last;
  wire                io_axi_arbiter_io_sharedInputs_0_arw_ready;
  wire                io_axi_arbiter_io_sharedInputs_0_w_ready;
  wire                io_axi_arbiter_io_sharedInputs_0_b_valid;
  wire       [2:0]    io_axi_arbiter_io_sharedInputs_0_b_payload_id;
  wire       [1:0]    io_axi_arbiter_io_sharedInputs_0_b_payload_resp;
  wire                io_axi_arbiter_io_sharedInputs_0_r_valid;
  wire       [31:0]   io_axi_arbiter_io_sharedInputs_0_r_payload_data;
  wire       [2:0]    io_axi_arbiter_io_sharedInputs_0_r_payload_id;
  wire       [1:0]    io_axi_arbiter_io_sharedInputs_0_r_payload_resp;
  wire                io_axi_arbiter_io_sharedInputs_0_r_payload_last;
  wire                io_axi_arbiter_io_output_arw_valid;
  wire       [23:0]   io_axi_arbiter_io_output_arw_payload_addr;
  wire       [3:0]    io_axi_arbiter_io_output_arw_payload_id;
  wire       [7:0]    io_axi_arbiter_io_output_arw_payload_len;
  wire       [2:0]    io_axi_arbiter_io_output_arw_payload_size;
  wire       [1:0]    io_axi_arbiter_io_output_arw_payload_burst;
  wire                io_axi_arbiter_io_output_arw_payload_write;
  wire                io_axi_arbiter_io_output_w_valid;
  wire       [31:0]   io_axi_arbiter_io_output_w_payload_data;
  wire       [3:0]    io_axi_arbiter_io_output_w_payload_strb;
  wire                io_axi_arbiter_io_output_w_payload_last;
  wire                io_axi_arbiter_io_output_b_ready;
  wire                io_axi_arbiter_io_output_r_ready;
  wire                soc_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  wire                soc_apbBridge_io_axi_arbiter_io_sharedInputs_0_w_ready;
  wire                soc_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_valid;
  wire       [3:0]    soc_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_id;
  wire       [1:0]    soc_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_resp;
  wire                soc_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_valid;
  wire       [31:0]   soc_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_data;
  wire       [3:0]    soc_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_id;
  wire       [1:0]    soc_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_resp;
  wire                soc_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_last;
  wire                soc_apbBridge_io_axi_arbiter_io_output_arw_valid;
  wire       [31:0]   soc_apbBridge_io_axi_arbiter_io_output_arw_payload_addr;
  wire       [3:0]    soc_apbBridge_io_axi_arbiter_io_output_arw_payload_id;
  wire       [7:0]    soc_apbBridge_io_axi_arbiter_io_output_arw_payload_len;
  wire       [2:0]    soc_apbBridge_io_axi_arbiter_io_output_arw_payload_size;
  wire       [1:0]    soc_apbBridge_io_axi_arbiter_io_output_arw_payload_burst;
  wire                soc_apbBridge_io_axi_arbiter_io_output_arw_payload_write;
  wire                soc_apbBridge_io_axi_arbiter_io_output_w_valid;
  wire       [31:0]   soc_apbBridge_io_axi_arbiter_io_output_w_payload_data;
  wire       [3:0]    soc_apbBridge_io_axi_arbiter_io_output_w_payload_strb;
  wire                soc_apbBridge_io_axi_arbiter_io_output_w_payload_last;
  wire                soc_apbBridge_io_axi_arbiter_io_output_b_ready;
  wire                soc_apbBridge_io_axi_arbiter_io_output_r_ready;
  wire                soc_machineTimers_io_mtimer_update;
  wire                soc_machineTimers_io_mtimer_interruptPending;
  wire                soc_machineTimers_io_apb_PREADY;
  wire       [31:0]   soc_machineTimers_io_apb_PRDATA;
  wire                soc_machineTimers_io_apb_PSLVERROR;
  wire                soc_charDev_io_char_valid;
  wire       [7:0]    soc_charDev_io_char_payload;
  wire                soc_charDev_io_apb_PREADY;
  wire       [31:0]   soc_charDev_io_apb_PRDATA;
  wire                soc_charDev_io_apb_PSLVERROR;
  wire                soc_testDev_io_test_valid;
  wire       [31:0]   soc_testDev_io_test_payload;
  wire                soc_testDev_io_apb_PREADY;
  wire       [31:0]   soc_testDev_io_apb_PRDATA;
  wire                soc_testDev_io_apb_PSLVERROR;
  wire                soc_byteDev_io_bytes_wdata_valid;
  wire       [7:0]    soc_byteDev_io_bytes_wdata_payload;
  wire                soc_byteDev_io_bytes_rdata_ready;
  wire                soc_byteDev_io_irq_update;
  wire                soc_byteDev_io_irq_interruptPending;
  wire                soc_byteDev_io_apb_PREADY;
  wire       [31:0]   soc_byteDev_io_apb_PRDATA;
  wire                soc_byteDev_io_apb_PSLVERROR;
  wire                io_apb_decoder_io_input_PREADY;
  wire       [31:0]   io_apb_decoder_io_input_PRDATA;
  wire                io_apb_decoder_io_input_PSLVERROR;
  wire       [31:0]   io_apb_decoder_io_output_PADDR;
  wire       [3:0]    io_apb_decoder_io_output_PSEL;
  wire                io_apb_decoder_io_output_PENABLE;
  wire                io_apb_decoder_io_output_PWRITE;
  wire       [31:0]   io_apb_decoder_io_output_PWDATA;
  wire                apb3Router_1_io_input_PREADY;
  wire       [31:0]   apb3Router_1_io_input_PRDATA;
  wire                apb3Router_1_io_input_PSLVERROR;
  wire       [31:0]   apb3Router_1_io_outputs_0_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_0_PSEL;
  wire                apb3Router_1_io_outputs_0_PENABLE;
  wire                apb3Router_1_io_outputs_0_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_0_PWDATA;
  wire       [31:0]   apb3Router_1_io_outputs_1_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_1_PSEL;
  wire                apb3Router_1_io_outputs_1_PENABLE;
  wire                apb3Router_1_io_outputs_1_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_1_PWDATA;
  wire       [31:0]   apb3Router_1_io_outputs_2_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_2_PSEL;
  wire                apb3Router_1_io_outputs_2_PENABLE;
  wire                apb3Router_1_io_outputs_2_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_2_PWDATA;
  wire       [31:0]   apb3Router_1_io_outputs_3_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_3_PSEL;
  wire                apb3Router_1_io_outputs_3_PENABLE;
  wire                apb3Router_1_io_outputs_3_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_3_PWDATA;
  wire                soc_ibusAxi_ar_valid;
  reg                 soc_ibusAxi_ar_ready;
  wire       [31:0]   soc_ibusAxi_ar_payload_addr;
  wire                soc_ibusAxi_r_valid;
  wire                soc_ibusAxi_r_ready;
  wire       [31:0]   soc_ibusAxi_r_payload_data;
  wire                soc_ibusAxi_r_payload_last;
  wire                soc_dbusAxi_arw_valid;
  wire                soc_dbusAxi_arw_ready;
  wire       [31:0]   soc_dbusAxi_arw_payload_addr;
  wire                soc_dbusAxi_arw_payload_write;
  wire                soc_dbusAxi_w_valid;
  wire                soc_dbusAxi_w_ready;
  wire       [31:0]   soc_dbusAxi_w_payload_data;
  wire       [3:0]    soc_dbusAxi_w_payload_strb;
  wire                soc_dbusAxi_w_payload_last;
  wire                soc_dbusAxi_b_valid;
  wire                soc_dbusAxi_b_ready;
  wire                soc_dbusAxi_r_valid;
  wire                soc_dbusAxi_r_ready;
  wire       [31:0]   soc_dbusAxi_r_payload_data;
  wire                soc_dbusAxi_r_payload_last;
  wire                soc_ibusAxi_ar_m2sPipe_valid;
  wire                soc_ibusAxi_ar_m2sPipe_ready;
  wire       [31:0]   soc_ibusAxi_ar_m2sPipe_payload_addr;
  reg                 soc_ibusAxi_ar_rValid;
  reg        [31:0]   soc_ibusAxi_ar_rData_addr;
  wire                when_Stream_l375;
  wire                toplevel_soc_ibusAxi_decoder_io_input_r_s2mPipe_valid;
  wire                toplevel_soc_ibusAxi_decoder_io_input_r_s2mPipe_ready;
  wire       [31:0]   toplevel_soc_ibusAxi_decoder_io_input_r_s2mPipe_payload_data;
  wire                toplevel_soc_ibusAxi_decoder_io_input_r_s2mPipe_payload_last;
  reg                 toplevel_soc_ibusAxi_decoder_io_input_r_rValidN;
  reg        [31:0]   toplevel_soc_ibusAxi_decoder_io_input_r_rData_data;
  reg                 toplevel_soc_ibusAxi_decoder_io_input_r_rData_last;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_rData_last;
  wire                when_Stream_l375_1;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_rData_last;
  wire                when_Stream_l375_2;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_3;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_4;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_5;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_6;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_7;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_8;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_9;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_10;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_11;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_12;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_13;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_14;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_15;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_16;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_17;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_18;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_19;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_20;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_21;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_22;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_23;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_24;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_25;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_26;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_27;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_28;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_29;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_30;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_31;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
  wire       [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  wire                toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  reg        [31:0]   toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  reg                 toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  wire                when_Stream_l375_32;
  wire       [7:0]    _zz_io_readInputs_0_ar_payload_len;
  wire       [7:0]    _zz_io_sharedInputs_0_arw_payload_len;
  wire       [7:0]    _zz_io_sharedInputs_0_arw_payload_len_1;

  Pipeline pipeline (
    .reset                     (reset                                       ), //i
    .mtimer_update             (soc_machineTimers_io_mtimer_update          ), //i
    .mtimer_interruptPending   (soc_machineTimers_io_mtimer_interruptPending), //i
    .external_update           (soc_byteDev_io_irq_update                   ), //i
    .external_interruptPending (soc_byteDev_io_irq_interruptPending         ), //i
    .ibus_cmd_valid            (pipeline_ibus_cmd_valid                     ), //o
    .ibus_cmd_ready            (soc_ibusAxi_ar_ready                        ), //i
    .ibus_cmd_payload_address  (pipeline_ibus_cmd_payload_address[31:0]     ), //o
    .ibus_rsp_valid            (soc_ibusAxi_r_valid                         ), //i
    .ibus_rsp_ready            (pipeline_ibus_rsp_ready                     ), //o
    .ibus_rsp_payload_rdata    (pipeline_ibus_rsp_payload_rdata[31:0]       ), //i
    .dbus_cmd_valid            (pipeline_dbus_cmd_valid                     ), //o
    .dbus_cmd_ready            (soc_dbusAxi_arw_ready                       ), //i
    .dbus_cmd_payload_address  (pipeline_dbus_cmd_payload_address[31:0]     ), //o
    .dbus_cmd_payload_write    (pipeline_dbus_cmd_payload_write             ), //o
    .dbus_cmd_payload_wdata    (pipeline_dbus_cmd_payload_wdata[31:0]       ), //o
    .dbus_cmd_payload_wmask    (pipeline_dbus_cmd_payload_wmask[3:0]        ), //o
    .dbus_rsp_valid            (soc_dbusAxi_r_valid                         ), //i
    .dbus_rsp_ready            (pipeline_dbus_rsp_ready                     ), //o
    .dbus_rsp_payload_rdata    (pipeline_dbus_rsp_payload_rdata[31:0]       ), //i
    .clk                       (clk                                         )  //i
  );
  Axi4SharedToApb3Bridge soc_apbBridge (
    .io_axi_arw_valid         (soc_apbBridge_io_axi_arbiter_io_output_arw_valid             ), //i
    .io_axi_arw_ready         (soc_apbBridge_io_axi_arw_ready                               ), //o
    .io_axi_arw_payload_addr  (soc_apbBridge_io_axi_arbiter_io_output_arw_payload_addr[31:0]), //i
    .io_axi_arw_payload_id    (soc_apbBridge_io_axi_arbiter_io_output_arw_payload_id[3:0]   ), //i
    .io_axi_arw_payload_len   (soc_apbBridge_io_axi_arbiter_io_output_arw_payload_len[7:0]  ), //i
    .io_axi_arw_payload_size  (soc_apbBridge_io_axi_arbiter_io_output_arw_payload_size[2:0] ), //i
    .io_axi_arw_payload_burst (soc_apbBridge_io_axi_arbiter_io_output_arw_payload_burst[1:0]), //i
    .io_axi_arw_payload_write (soc_apbBridge_io_axi_arbiter_io_output_arw_payload_write     ), //i
    .io_axi_w_valid           (soc_apbBridge_io_axi_arbiter_io_output_w_valid               ), //i
    .io_axi_w_ready           (soc_apbBridge_io_axi_w_ready                                 ), //o
    .io_axi_w_payload_data    (soc_apbBridge_io_axi_arbiter_io_output_w_payload_data[31:0]  ), //i
    .io_axi_w_payload_strb    (soc_apbBridge_io_axi_arbiter_io_output_w_payload_strb[3:0]   ), //i
    .io_axi_w_payload_last    (soc_apbBridge_io_axi_arbiter_io_output_w_payload_last        ), //i
    .io_axi_b_valid           (soc_apbBridge_io_axi_b_valid                                 ), //o
    .io_axi_b_ready           (soc_apbBridge_io_axi_arbiter_io_output_b_ready               ), //i
    .io_axi_b_payload_id      (soc_apbBridge_io_axi_b_payload_id[3:0]                       ), //o
    .io_axi_b_payload_resp    (soc_apbBridge_io_axi_b_payload_resp[1:0]                     ), //o
    .io_axi_r_valid           (soc_apbBridge_io_axi_r_valid                                 ), //o
    .io_axi_r_ready           (soc_apbBridge_io_axi_arbiter_io_output_r_ready               ), //i
    .io_axi_r_payload_data    (soc_apbBridge_io_axi_r_payload_data[31:0]                    ), //o
    .io_axi_r_payload_id      (soc_apbBridge_io_axi_r_payload_id[3:0]                       ), //o
    .io_axi_r_payload_resp    (soc_apbBridge_io_axi_r_payload_resp[1:0]                     ), //o
    .io_axi_r_payload_last    (soc_apbBridge_io_axi_r_payload_last                          ), //o
    .io_apb_PADDR             (soc_apbBridge_io_apb_PADDR[31:0]                             ), //o
    .io_apb_PSEL              (soc_apbBridge_io_apb_PSEL                                    ), //o
    .io_apb_PENABLE           (soc_apbBridge_io_apb_PENABLE                                 ), //o
    .io_apb_PREADY            (io_apb_decoder_io_input_PREADY                               ), //i
    .io_apb_PWRITE            (soc_apbBridge_io_apb_PWRITE                                  ), //o
    .io_apb_PWDATA            (soc_apbBridge_io_apb_PWDATA[31:0]                            ), //o
    .io_apb_PRDATA            (io_apb_decoder_io_input_PRDATA[31:0]                         ), //i
    .io_apb_PSLVERROR         (io_apb_decoder_io_input_PSLVERROR                            ), //i
    .clk                      (clk                                                          ), //i
    .reset                    (reset                                                        )  //i
  );
  Axi4ReadOnlyDecoder soc_ibusAxi_decoder (
    .io_input_ar_valid            (soc_ibusAxi_ar_m2sPipe_valid                          ), //i
    .io_input_ar_ready            (soc_ibusAxi_decoder_io_input_ar_ready                 ), //o
    .io_input_ar_payload_addr     (soc_ibusAxi_ar_m2sPipe_payload_addr[31:0]             ), //i
    .io_input_r_valid             (soc_ibusAxi_decoder_io_input_r_valid                  ), //o
    .io_input_r_ready             (toplevel_soc_ibusAxi_decoder_io_input_r_rValidN       ), //i
    .io_input_r_payload_data      (soc_ibusAxi_decoder_io_input_r_payload_data[31:0]     ), //o
    .io_input_r_payload_last      (soc_ibusAxi_decoder_io_input_r_payload_last           ), //o
    .io_outputs_0_ar_valid        (soc_ibusAxi_decoder_io_outputs_0_ar_valid             ), //o
    .io_outputs_0_ar_ready        (io_axi_arbiter_io_readInputs_0_ar_ready               ), //i
    .io_outputs_0_ar_payload_addr (soc_ibusAxi_decoder_io_outputs_0_ar_payload_addr[31:0]), //o
    .io_outputs_0_r_valid         (io_axi_arbiter_io_readInputs_0_r_valid                ), //i
    .io_outputs_0_r_ready         (soc_ibusAxi_decoder_io_outputs_0_r_ready              ), //o
    .io_outputs_0_r_payload_data  (io_axi_arbiter_io_readInputs_0_r_payload_data[31:0]   ), //i
    .io_outputs_0_r_payload_last  (io_axi_arbiter_io_readInputs_0_r_payload_last         ), //i
    .clk                          (clk                                                   ), //i
    .reset                        (reset                                                 )  //i
  );
  Axi4SharedDecoder soc_dbusAxi_decoder (
    .io_input_arw_valid                   (soc_dbusAxi_arw_valid                                              ), //i
    .io_input_arw_ready                   (soc_dbusAxi_decoder_io_input_arw_ready                             ), //o
    .io_input_arw_payload_addr            (soc_dbusAxi_arw_payload_addr[31:0]                                 ), //i
    .io_input_arw_payload_write           (soc_dbusAxi_arw_payload_write                                      ), //i
    .io_input_w_valid                     (soc_dbusAxi_w_valid                                                ), //i
    .io_input_w_ready                     (soc_dbusAxi_decoder_io_input_w_ready                               ), //o
    .io_input_w_payload_data              (soc_dbusAxi_w_payload_data[31:0]                                   ), //i
    .io_input_w_payload_strb              (soc_dbusAxi_w_payload_strb[3:0]                                    ), //i
    .io_input_w_payload_last              (soc_dbusAxi_w_payload_last                                         ), //i
    .io_input_b_valid                     (soc_dbusAxi_decoder_io_input_b_valid                               ), //o
    .io_input_b_ready                     (soc_dbusAxi_b_ready                                                ), //i
    .io_input_r_valid                     (soc_dbusAxi_decoder_io_input_r_valid                               ), //o
    .io_input_r_ready                     (soc_dbusAxi_decoder_io_input_r_ready                               ), //i
    .io_input_r_payload_data              (soc_dbusAxi_decoder_io_input_r_payload_data[31:0]                  ), //o
    .io_input_r_payload_last              (soc_dbusAxi_decoder_io_input_r_payload_last                        ), //o
    .io_sharedOutputs_0_arw_valid         (soc_dbusAxi_decoder_io_sharedOutputs_0_arw_valid                   ), //o
    .io_sharedOutputs_0_arw_ready         (io_axi_arbiter_io_sharedInputs_0_arw_ready                         ), //i
    .io_sharedOutputs_0_arw_payload_addr  (soc_dbusAxi_decoder_io_sharedOutputs_0_arw_payload_addr[31:0]      ), //o
    .io_sharedOutputs_0_arw_payload_write (soc_dbusAxi_decoder_io_sharedOutputs_0_arw_payload_write           ), //o
    .io_sharedOutputs_0_w_valid           (soc_dbusAxi_decoder_io_sharedOutputs_0_w_valid                     ), //o
    .io_sharedOutputs_0_w_ready           (io_axi_arbiter_io_sharedInputs_0_w_ready                           ), //i
    .io_sharedOutputs_0_w_payload_data    (soc_dbusAxi_decoder_io_sharedOutputs_0_w_payload_data[31:0]        ), //o
    .io_sharedOutputs_0_w_payload_strb    (soc_dbusAxi_decoder_io_sharedOutputs_0_w_payload_strb[3:0]         ), //o
    .io_sharedOutputs_0_w_payload_last    (soc_dbusAxi_decoder_io_sharedOutputs_0_w_payload_last              ), //o
    .io_sharedOutputs_0_b_valid           (io_axi_arbiter_io_sharedInputs_0_b_valid                           ), //i
    .io_sharedOutputs_0_b_ready           (soc_dbusAxi_decoder_io_sharedOutputs_0_b_ready                     ), //o
    .io_sharedOutputs_0_r_valid           (io_axi_arbiter_io_sharedInputs_0_r_valid                           ), //i
    .io_sharedOutputs_0_r_ready           (soc_dbusAxi_decoder_io_sharedOutputs_0_r_ready                     ), //o
    .io_sharedOutputs_0_r_payload_data    (io_axi_arbiter_io_sharedInputs_0_r_payload_data[31:0]              ), //i
    .io_sharedOutputs_0_r_payload_last    (io_axi_arbiter_io_sharedInputs_0_r_payload_last                    ), //i
    .io_sharedOutputs_1_arw_valid         (soc_dbusAxi_decoder_io_sharedOutputs_1_arw_valid                   ), //o
    .io_sharedOutputs_1_arw_ready         (soc_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_ready           ), //i
    .io_sharedOutputs_1_arw_payload_addr  (soc_dbusAxi_decoder_io_sharedOutputs_1_arw_payload_addr[31:0]      ), //o
    .io_sharedOutputs_1_arw_payload_write (soc_dbusAxi_decoder_io_sharedOutputs_1_arw_payload_write           ), //o
    .io_sharedOutputs_1_w_valid           (soc_dbusAxi_decoder_io_sharedOutputs_1_w_valid                     ), //o
    .io_sharedOutputs_1_w_ready           (soc_apbBridge_io_axi_arbiter_io_sharedInputs_0_w_ready             ), //i
    .io_sharedOutputs_1_w_payload_data    (soc_dbusAxi_decoder_io_sharedOutputs_1_w_payload_data[31:0]        ), //o
    .io_sharedOutputs_1_w_payload_strb    (soc_dbusAxi_decoder_io_sharedOutputs_1_w_payload_strb[3:0]         ), //o
    .io_sharedOutputs_1_w_payload_last    (soc_dbusAxi_decoder_io_sharedOutputs_1_w_payload_last              ), //o
    .io_sharedOutputs_1_b_valid           (soc_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_valid             ), //i
    .io_sharedOutputs_1_b_ready           (soc_dbusAxi_decoder_io_sharedOutputs_1_b_ready                     ), //o
    .io_sharedOutputs_1_r_valid           (soc_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_valid             ), //i
    .io_sharedOutputs_1_r_ready           (soc_dbusAxi_decoder_io_sharedOutputs_1_r_ready                     ), //o
    .io_sharedOutputs_1_r_payload_data    (soc_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_data[31:0]), //i
    .io_sharedOutputs_1_r_payload_last    (soc_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_last      ), //i
    .clk                                  (clk                                                                ), //i
    .reset                                (reset                                                              )  //i
  );
  Axi4SharedArbiter io_axi_arbiter (
    .io_readInputs_0_ar_valid            (soc_ibusAxi_decoder_io_outputs_0_ar_valid                  ), //i
    .io_readInputs_0_ar_ready            (io_axi_arbiter_io_readInputs_0_ar_ready                    ), //o
    .io_readInputs_0_ar_payload_addr     (io_axi_arbiter_io_readInputs_0_ar_payload_addr[23:0]       ), //i
    .io_readInputs_0_ar_payload_id       (3'b000                                                     ), //i
    .io_readInputs_0_ar_payload_len      (_zz_io_readInputs_0_ar_payload_len[7:0]                    ), //i
    .io_readInputs_0_ar_payload_size     (3'b010                                                     ), //i
    .io_readInputs_0_ar_payload_burst    (2'b01                                                      ), //i
    .io_readInputs_0_r_valid             (io_axi_arbiter_io_readInputs_0_r_valid                     ), //o
    .io_readInputs_0_r_ready             (soc_ibusAxi_decoder_io_outputs_0_r_ready                   ), //i
    .io_readInputs_0_r_payload_data      (io_axi_arbiter_io_readInputs_0_r_payload_data[31:0]        ), //o
    .io_readInputs_0_r_payload_id        (io_axi_arbiter_io_readInputs_0_r_payload_id[2:0]           ), //o
    .io_readInputs_0_r_payload_resp      (io_axi_arbiter_io_readInputs_0_r_payload_resp[1:0]         ), //o
    .io_readInputs_0_r_payload_last      (io_axi_arbiter_io_readInputs_0_r_payload_last              ), //o
    .io_sharedInputs_0_arw_valid         (soc_dbusAxi_decoder_io_sharedOutputs_0_arw_valid           ), //i
    .io_sharedInputs_0_arw_ready         (io_axi_arbiter_io_sharedInputs_0_arw_ready                 ), //o
    .io_sharedInputs_0_arw_payload_addr  (io_axi_arbiter_io_sharedInputs_0_arw_payload_addr[23:0]    ), //i
    .io_sharedInputs_0_arw_payload_id    (3'b000                                                     ), //i
    .io_sharedInputs_0_arw_payload_len   (_zz_io_sharedInputs_0_arw_payload_len[7:0]                 ), //i
    .io_sharedInputs_0_arw_payload_size  (3'b010                                                     ), //i
    .io_sharedInputs_0_arw_payload_burst (2'b01                                                      ), //i
    .io_sharedInputs_0_arw_payload_write (soc_dbusAxi_decoder_io_sharedOutputs_0_arw_payload_write   ), //i
    .io_sharedInputs_0_w_valid           (soc_dbusAxi_decoder_io_sharedOutputs_0_w_valid             ), //i
    .io_sharedInputs_0_w_ready           (io_axi_arbiter_io_sharedInputs_0_w_ready                   ), //o
    .io_sharedInputs_0_w_payload_data    (soc_dbusAxi_decoder_io_sharedOutputs_0_w_payload_data[31:0]), //i
    .io_sharedInputs_0_w_payload_strb    (soc_dbusAxi_decoder_io_sharedOutputs_0_w_payload_strb[3:0] ), //i
    .io_sharedInputs_0_w_payload_last    (soc_dbusAxi_decoder_io_sharedOutputs_0_w_payload_last      ), //i
    .io_sharedInputs_0_b_valid           (io_axi_arbiter_io_sharedInputs_0_b_valid                   ), //o
    .io_sharedInputs_0_b_ready           (soc_dbusAxi_decoder_io_sharedOutputs_0_b_ready             ), //i
    .io_sharedInputs_0_b_payload_id      (io_axi_arbiter_io_sharedInputs_0_b_payload_id[2:0]         ), //o
    .io_sharedInputs_0_b_payload_resp    (io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0]       ), //o
    .io_sharedInputs_0_r_valid           (io_axi_arbiter_io_sharedInputs_0_r_valid                   ), //o
    .io_sharedInputs_0_r_ready           (soc_dbusAxi_decoder_io_sharedOutputs_0_r_ready             ), //i
    .io_sharedInputs_0_r_payload_data    (io_axi_arbiter_io_sharedInputs_0_r_payload_data[31:0]      ), //o
    .io_sharedInputs_0_r_payload_id      (io_axi_arbiter_io_sharedInputs_0_r_payload_id[2:0]         ), //o
    .io_sharedInputs_0_r_payload_resp    (io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0]       ), //o
    .io_sharedInputs_0_r_payload_last    (io_axi_arbiter_io_sharedInputs_0_r_payload_last            ), //o
    .io_output_arw_valid                 (io_axi_arbiter_io_output_arw_valid                         ), //o
    .io_output_arw_ready                 (io_axi_arw_ready                                           ), //i
    .io_output_arw_payload_addr          (io_axi_arbiter_io_output_arw_payload_addr[23:0]            ), //o
    .io_output_arw_payload_id            (io_axi_arbiter_io_output_arw_payload_id[3:0]               ), //o
    .io_output_arw_payload_len           (io_axi_arbiter_io_output_arw_payload_len[7:0]              ), //o
    .io_output_arw_payload_size          (io_axi_arbiter_io_output_arw_payload_size[2:0]             ), //o
    .io_output_arw_payload_burst         (io_axi_arbiter_io_output_arw_payload_burst[1:0]            ), //o
    .io_output_arw_payload_write         (io_axi_arbiter_io_output_arw_payload_write                 ), //o
    .io_output_w_valid                   (io_axi_arbiter_io_output_w_valid                           ), //o
    .io_output_w_ready                   (io_axi_w_ready                                             ), //i
    .io_output_w_payload_data            (io_axi_arbiter_io_output_w_payload_data[31:0]              ), //o
    .io_output_w_payload_strb            (io_axi_arbiter_io_output_w_payload_strb[3:0]               ), //o
    .io_output_w_payload_last            (io_axi_arbiter_io_output_w_payload_last                    ), //o
    .io_output_b_valid                   (io_axi_b_valid                                             ), //i
    .io_output_b_ready                   (io_axi_arbiter_io_output_b_ready                           ), //o
    .io_output_b_payload_id              (io_axi_b_payload_id[3:0]                                   ), //i
    .io_output_b_payload_resp            (io_axi_b_payload_resp[1:0]                                 ), //i
    .io_output_r_valid                   (io_axi_r_valid                                             ), //i
    .io_output_r_ready                   (io_axi_arbiter_io_output_r_ready                           ), //o
    .io_output_r_payload_data            (io_axi_r_payload_data[31:0]                                ), //i
    .io_output_r_payload_id              (io_axi_r_payload_id[3:0]                                   ), //i
    .io_output_r_payload_resp            (io_axi_r_payload_resp[1:0]                                 ), //i
    .io_output_r_payload_last            (io_axi_r_payload_last                                      ), //i
    .clk                                 (clk                                                        ), //i
    .reset                               (reset                                                      )  //i
  );
  Axi4SharedArbiter_1 soc_apbBridge_io_axi_arbiter (
    .io_sharedInputs_0_arw_valid         (soc_dbusAxi_decoder_io_sharedOutputs_1_arw_valid                   ), //i
    .io_sharedInputs_0_arw_ready         (soc_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_ready           ), //o
    .io_sharedInputs_0_arw_payload_addr  (soc_dbusAxi_decoder_io_sharedOutputs_1_arw_payload_addr[31:0]      ), //i
    .io_sharedInputs_0_arw_payload_id    (4'b0000                                                            ), //i
    .io_sharedInputs_0_arw_payload_len   (_zz_io_sharedInputs_0_arw_payload_len_1[7:0]                       ), //i
    .io_sharedInputs_0_arw_payload_size  (3'b010                                                             ), //i
    .io_sharedInputs_0_arw_payload_burst (2'b01                                                              ), //i
    .io_sharedInputs_0_arw_payload_write (soc_dbusAxi_decoder_io_sharedOutputs_1_arw_payload_write           ), //i
    .io_sharedInputs_0_w_valid           (soc_dbusAxi_decoder_io_sharedOutputs_1_w_valid                     ), //i
    .io_sharedInputs_0_w_ready           (soc_apbBridge_io_axi_arbiter_io_sharedInputs_0_w_ready             ), //o
    .io_sharedInputs_0_w_payload_data    (soc_dbusAxi_decoder_io_sharedOutputs_1_w_payload_data[31:0]        ), //i
    .io_sharedInputs_0_w_payload_strb    (soc_dbusAxi_decoder_io_sharedOutputs_1_w_payload_strb[3:0]         ), //i
    .io_sharedInputs_0_w_payload_last    (soc_dbusAxi_decoder_io_sharedOutputs_1_w_payload_last              ), //i
    .io_sharedInputs_0_b_valid           (soc_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_valid             ), //o
    .io_sharedInputs_0_b_ready           (soc_dbusAxi_decoder_io_sharedOutputs_1_b_ready                     ), //i
    .io_sharedInputs_0_b_payload_id      (soc_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_id[3:0]   ), //o
    .io_sharedInputs_0_b_payload_resp    (soc_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0] ), //o
    .io_sharedInputs_0_r_valid           (soc_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_valid             ), //o
    .io_sharedInputs_0_r_ready           (soc_dbusAxi_decoder_io_sharedOutputs_1_r_ready                     ), //i
    .io_sharedInputs_0_r_payload_data    (soc_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_data[31:0]), //o
    .io_sharedInputs_0_r_payload_id      (soc_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_id[3:0]   ), //o
    .io_sharedInputs_0_r_payload_resp    (soc_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0] ), //o
    .io_sharedInputs_0_r_payload_last    (soc_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_last      ), //o
    .io_output_arw_valid                 (soc_apbBridge_io_axi_arbiter_io_output_arw_valid                   ), //o
    .io_output_arw_ready                 (soc_apbBridge_io_axi_arw_ready                                     ), //i
    .io_output_arw_payload_addr          (soc_apbBridge_io_axi_arbiter_io_output_arw_payload_addr[31:0]      ), //o
    .io_output_arw_payload_id            (soc_apbBridge_io_axi_arbiter_io_output_arw_payload_id[3:0]         ), //o
    .io_output_arw_payload_len           (soc_apbBridge_io_axi_arbiter_io_output_arw_payload_len[7:0]        ), //o
    .io_output_arw_payload_size          (soc_apbBridge_io_axi_arbiter_io_output_arw_payload_size[2:0]       ), //o
    .io_output_arw_payload_burst         (soc_apbBridge_io_axi_arbiter_io_output_arw_payload_burst[1:0]      ), //o
    .io_output_arw_payload_write         (soc_apbBridge_io_axi_arbiter_io_output_arw_payload_write           ), //o
    .io_output_w_valid                   (soc_apbBridge_io_axi_arbiter_io_output_w_valid                     ), //o
    .io_output_w_ready                   (soc_apbBridge_io_axi_w_ready                                       ), //i
    .io_output_w_payload_data            (soc_apbBridge_io_axi_arbiter_io_output_w_payload_data[31:0]        ), //o
    .io_output_w_payload_strb            (soc_apbBridge_io_axi_arbiter_io_output_w_payload_strb[3:0]         ), //o
    .io_output_w_payload_last            (soc_apbBridge_io_axi_arbiter_io_output_w_payload_last              ), //o
    .io_output_b_valid                   (soc_apbBridge_io_axi_b_valid                                       ), //i
    .io_output_b_ready                   (soc_apbBridge_io_axi_arbiter_io_output_b_ready                     ), //o
    .io_output_b_payload_id              (soc_apbBridge_io_axi_b_payload_id[3:0]                             ), //i
    .io_output_b_payload_resp            (soc_apbBridge_io_axi_b_payload_resp[1:0]                           ), //i
    .io_output_r_valid                   (soc_apbBridge_io_axi_r_valid                                       ), //i
    .io_output_r_ready                   (soc_apbBridge_io_axi_arbiter_io_output_r_ready                     ), //o
    .io_output_r_payload_data            (soc_apbBridge_io_axi_r_payload_data[31:0]                          ), //i
    .io_output_r_payload_id              (soc_apbBridge_io_axi_r_payload_id[3:0]                             ), //i
    .io_output_r_payload_resp            (soc_apbBridge_io_axi_r_payload_resp[1:0]                           ), //i
    .io_output_r_payload_last            (soc_apbBridge_io_axi_r_payload_last                                ), //i
    .clk                                 (clk                                                                ), //i
    .reset                               (reset                                                              )  //i
  );
  Apb3MachineTimers soc_machineTimers (
    .io_mtimer_update           (soc_machineTimers_io_mtimer_update          ), //o
    .io_mtimer_interruptPending (soc_machineTimers_io_mtimer_interruptPending), //o
    .io_apb_PADDR               (soc_machineTimers_io_apb_PADDR[3:0]         ), //i
    .io_apb_PSEL                (apb3Router_1_io_outputs_0_PSEL              ), //i
    .io_apb_PENABLE             (apb3Router_1_io_outputs_0_PENABLE           ), //i
    .io_apb_PREADY              (soc_machineTimers_io_apb_PREADY             ), //o
    .io_apb_PWRITE              (apb3Router_1_io_outputs_0_PWRITE            ), //i
    .io_apb_PWDATA              (apb3Router_1_io_outputs_0_PWDATA[31:0]      ), //i
    .io_apb_PRDATA              (soc_machineTimers_io_apb_PRDATA[31:0]       ), //o
    .io_apb_PSLVERROR           (soc_machineTimers_io_apb_PSLVERROR          ), //o
    .clk                        (clk                                         ), //i
    .reset                      (reset                                       )  //i
  );
  Apb3CharDev soc_charDev (
    .io_char_valid    (soc_charDev_io_char_valid             ), //o
    .io_char_payload  (soc_charDev_io_char_payload[7:0]      ), //o
    .io_apb_PADDR     (soc_charDev_io_apb_PADDR[3:0]         ), //i
    .io_apb_PSEL      (apb3Router_1_io_outputs_1_PSEL        ), //i
    .io_apb_PENABLE   (apb3Router_1_io_outputs_1_PENABLE     ), //i
    .io_apb_PREADY    (soc_charDev_io_apb_PREADY             ), //o
    .io_apb_PWRITE    (apb3Router_1_io_outputs_1_PWRITE      ), //i
    .io_apb_PWDATA    (apb3Router_1_io_outputs_1_PWDATA[31:0]), //i
    .io_apb_PRDATA    (soc_charDev_io_apb_PRDATA[31:0]       ), //o
    .io_apb_PSLVERROR (soc_charDev_io_apb_PSLVERROR          )  //o
  );
  Apb3TestDev soc_testDev (
    .io_test_valid    (soc_testDev_io_test_valid             ), //o
    .io_test_payload  (soc_testDev_io_test_payload[31:0]     ), //o
    .io_apb_PADDR     (soc_testDev_io_apb_PADDR[3:0]         ), //i
    .io_apb_PSEL      (apb3Router_1_io_outputs_3_PSEL        ), //i
    .io_apb_PENABLE   (apb3Router_1_io_outputs_3_PENABLE     ), //i
    .io_apb_PREADY    (soc_testDev_io_apb_PREADY             ), //o
    .io_apb_PWRITE    (apb3Router_1_io_outputs_3_PWRITE      ), //i
    .io_apb_PWDATA    (apb3Router_1_io_outputs_3_PWDATA[31:0]), //i
    .io_apb_PRDATA    (soc_testDev_io_apb_PRDATA[31:0]       ), //o
    .io_apb_PSLVERROR (soc_testDev_io_apb_PSLVERROR          )  //o
  );
  Apb3ByteDev soc_byteDev (
    .io_bytes_wdata_valid    (soc_byteDev_io_bytes_wdata_valid       ), //o
    .io_bytes_wdata_payload  (soc_byteDev_io_bytes_wdata_payload[7:0]), //o
    .io_bytes_rdata_valid    (io_byteDev_rdata_valid                 ), //i
    .io_bytes_rdata_ready    (soc_byteDev_io_bytes_rdata_ready       ), //o
    .io_bytes_rdata_payload  (io_byteDev_rdata_payload[7:0]          ), //i
    .io_irq_update           (soc_byteDev_io_irq_update              ), //o
    .io_irq_interruptPending (soc_byteDev_io_irq_interruptPending    ), //o
    .io_apb_PADDR            (soc_byteDev_io_apb_PADDR[3:0]          ), //i
    .io_apb_PSEL             (apb3Router_1_io_outputs_2_PSEL         ), //i
    .io_apb_PENABLE          (apb3Router_1_io_outputs_2_PENABLE      ), //i
    .io_apb_PREADY           (soc_byteDev_io_apb_PREADY              ), //o
    .io_apb_PWRITE           (apb3Router_1_io_outputs_2_PWRITE       ), //i
    .io_apb_PWDATA           (apb3Router_1_io_outputs_2_PWDATA[31:0] ), //i
    .io_apb_PRDATA           (soc_byteDev_io_apb_PRDATA[31:0]        ), //o
    .io_apb_PSLVERROR        (soc_byteDev_io_apb_PSLVERROR           ), //o
    .clk                     (clk                                    ), //i
    .reset                   (reset                                  )  //i
  );
  Apb3Decoder io_apb_decoder (
    .io_input_PADDR      (soc_apbBridge_io_apb_PADDR[31:0]     ), //i
    .io_input_PSEL       (soc_apbBridge_io_apb_PSEL            ), //i
    .io_input_PENABLE    (soc_apbBridge_io_apb_PENABLE         ), //i
    .io_input_PREADY     (io_apb_decoder_io_input_PREADY       ), //o
    .io_input_PWRITE     (soc_apbBridge_io_apb_PWRITE          ), //i
    .io_input_PWDATA     (soc_apbBridge_io_apb_PWDATA[31:0]    ), //i
    .io_input_PRDATA     (io_apb_decoder_io_input_PRDATA[31:0] ), //o
    .io_input_PSLVERROR  (io_apb_decoder_io_input_PSLVERROR    ), //o
    .io_output_PADDR     (io_apb_decoder_io_output_PADDR[31:0] ), //o
    .io_output_PSEL      (io_apb_decoder_io_output_PSEL[3:0]   ), //o
    .io_output_PENABLE   (io_apb_decoder_io_output_PENABLE     ), //o
    .io_output_PREADY    (apb3Router_1_io_input_PREADY         ), //i
    .io_output_PWRITE    (io_apb_decoder_io_output_PWRITE      ), //o
    .io_output_PWDATA    (io_apb_decoder_io_output_PWDATA[31:0]), //o
    .io_output_PRDATA    (apb3Router_1_io_input_PRDATA[31:0]   ), //i
    .io_output_PSLVERROR (apb3Router_1_io_input_PSLVERROR      )  //i
  );
  Apb3Router apb3Router_1 (
    .io_input_PADDR         (io_apb_decoder_io_output_PADDR[31:0]  ), //i
    .io_input_PSEL          (io_apb_decoder_io_output_PSEL[3:0]    ), //i
    .io_input_PENABLE       (io_apb_decoder_io_output_PENABLE      ), //i
    .io_input_PREADY        (apb3Router_1_io_input_PREADY          ), //o
    .io_input_PWRITE        (io_apb_decoder_io_output_PWRITE       ), //i
    .io_input_PWDATA        (io_apb_decoder_io_output_PWDATA[31:0] ), //i
    .io_input_PRDATA        (apb3Router_1_io_input_PRDATA[31:0]    ), //o
    .io_input_PSLVERROR     (apb3Router_1_io_input_PSLVERROR       ), //o
    .io_outputs_0_PADDR     (apb3Router_1_io_outputs_0_PADDR[31:0] ), //o
    .io_outputs_0_PSEL      (apb3Router_1_io_outputs_0_PSEL        ), //o
    .io_outputs_0_PENABLE   (apb3Router_1_io_outputs_0_PENABLE     ), //o
    .io_outputs_0_PREADY    (soc_machineTimers_io_apb_PREADY       ), //i
    .io_outputs_0_PWRITE    (apb3Router_1_io_outputs_0_PWRITE      ), //o
    .io_outputs_0_PWDATA    (apb3Router_1_io_outputs_0_PWDATA[31:0]), //o
    .io_outputs_0_PRDATA    (soc_machineTimers_io_apb_PRDATA[31:0] ), //i
    .io_outputs_0_PSLVERROR (soc_machineTimers_io_apb_PSLVERROR    ), //i
    .io_outputs_1_PADDR     (apb3Router_1_io_outputs_1_PADDR[31:0] ), //o
    .io_outputs_1_PSEL      (apb3Router_1_io_outputs_1_PSEL        ), //o
    .io_outputs_1_PENABLE   (apb3Router_1_io_outputs_1_PENABLE     ), //o
    .io_outputs_1_PREADY    (soc_charDev_io_apb_PREADY             ), //i
    .io_outputs_1_PWRITE    (apb3Router_1_io_outputs_1_PWRITE      ), //o
    .io_outputs_1_PWDATA    (apb3Router_1_io_outputs_1_PWDATA[31:0]), //o
    .io_outputs_1_PRDATA    (soc_charDev_io_apb_PRDATA[31:0]       ), //i
    .io_outputs_1_PSLVERROR (soc_charDev_io_apb_PSLVERROR          ), //i
    .io_outputs_2_PADDR     (apb3Router_1_io_outputs_2_PADDR[31:0] ), //o
    .io_outputs_2_PSEL      (apb3Router_1_io_outputs_2_PSEL        ), //o
    .io_outputs_2_PENABLE   (apb3Router_1_io_outputs_2_PENABLE     ), //o
    .io_outputs_2_PREADY    (soc_byteDev_io_apb_PREADY             ), //i
    .io_outputs_2_PWRITE    (apb3Router_1_io_outputs_2_PWRITE      ), //o
    .io_outputs_2_PWDATA    (apb3Router_1_io_outputs_2_PWDATA[31:0]), //o
    .io_outputs_2_PRDATA    (soc_byteDev_io_apb_PRDATA[31:0]       ), //i
    .io_outputs_2_PSLVERROR (soc_byteDev_io_apb_PSLVERROR          ), //i
    .io_outputs_3_PADDR     (apb3Router_1_io_outputs_3_PADDR[31:0] ), //o
    .io_outputs_3_PSEL      (apb3Router_1_io_outputs_3_PSEL        ), //o
    .io_outputs_3_PENABLE   (apb3Router_1_io_outputs_3_PENABLE     ), //o
    .io_outputs_3_PREADY    (soc_testDev_io_apb_PREADY             ), //i
    .io_outputs_3_PWRITE    (apb3Router_1_io_outputs_3_PWRITE      ), //o
    .io_outputs_3_PWDATA    (apb3Router_1_io_outputs_3_PWDATA[31:0]), //o
    .io_outputs_3_PRDATA    (soc_testDev_io_apb_PRDATA[31:0]       ), //i
    .io_outputs_3_PSLVERROR (soc_testDev_io_apb_PSLVERROR          ), //i
    .clk                    (clk                                   ), //i
    .reset                  (reset                                 )  //i
  );
  assign soc_ibusAxi_ar_valid = pipeline_ibus_cmd_valid;
  assign soc_ibusAxi_ar_payload_addr = pipeline_ibus_cmd_payload_address;
  assign pipeline_ibus_rsp_payload_rdata = soc_ibusAxi_r_payload_data;
  assign soc_ibusAxi_r_ready = pipeline_ibus_rsp_ready;
  assign soc_dbusAxi_arw_valid = pipeline_dbus_cmd_valid;
  assign soc_dbusAxi_arw_payload_addr = pipeline_dbus_cmd_payload_address;
  assign soc_dbusAxi_arw_payload_write = pipeline_dbus_cmd_payload_write;
  assign soc_dbusAxi_w_valid = pipeline_dbus_cmd_valid;
  assign soc_dbusAxi_w_payload_data = pipeline_dbus_cmd_payload_wdata;
  assign soc_dbusAxi_w_payload_strb = pipeline_dbus_cmd_payload_wmask;
  assign soc_dbusAxi_w_payload_last = 1'b1;
  assign soc_dbusAxi_b_ready = 1'b1;
  assign soc_dbusAxi_r_ready = pipeline_dbus_rsp_ready;
  assign pipeline_dbus_rsp_payload_rdata = soc_dbusAxi_r_payload_data;
  always @(*) begin
    soc_ibusAxi_ar_ready = soc_ibusAxi_ar_m2sPipe_ready;
    if(when_Stream_l375) begin
      soc_ibusAxi_ar_ready = 1'b1;
    end
  end

  assign when_Stream_l375 = (! soc_ibusAxi_ar_m2sPipe_valid);
  assign soc_ibusAxi_ar_m2sPipe_valid = soc_ibusAxi_ar_rValid;
  assign soc_ibusAxi_ar_m2sPipe_payload_addr = soc_ibusAxi_ar_rData_addr;
  assign soc_ibusAxi_ar_m2sPipe_ready = soc_ibusAxi_decoder_io_input_ar_ready;
  assign toplevel_soc_ibusAxi_decoder_io_input_r_s2mPipe_valid = (soc_ibusAxi_decoder_io_input_r_valid || (! toplevel_soc_ibusAxi_decoder_io_input_r_rValidN));
  assign toplevel_soc_ibusAxi_decoder_io_input_r_s2mPipe_payload_data = (toplevel_soc_ibusAxi_decoder_io_input_r_rValidN ? soc_ibusAxi_decoder_io_input_r_payload_data : toplevel_soc_ibusAxi_decoder_io_input_r_rData_data);
  assign toplevel_soc_ibusAxi_decoder_io_input_r_s2mPipe_payload_last = (toplevel_soc_ibusAxi_decoder_io_input_r_rValidN ? soc_ibusAxi_decoder_io_input_r_payload_last : toplevel_soc_ibusAxi_decoder_io_input_r_rData_last);
  assign soc_ibusAxi_r_valid = toplevel_soc_ibusAxi_decoder_io_input_r_s2mPipe_valid;
  assign toplevel_soc_ibusAxi_decoder_io_input_r_s2mPipe_ready = soc_ibusAxi_r_ready;
  assign soc_ibusAxi_r_payload_data = toplevel_soc_ibusAxi_decoder_io_input_r_s2mPipe_payload_data;
  assign soc_ibusAxi_r_payload_last = toplevel_soc_ibusAxi_decoder_io_input_r_s2mPipe_payload_last;
  assign soc_dbusAxi_arw_ready = soc_dbusAxi_decoder_io_input_arw_ready;
  assign soc_dbusAxi_w_ready = soc_dbusAxi_decoder_io_input_w_ready;
  always @(*) begin
    soc_dbusAxi_decoder_io_input_r_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_ready;
    if(when_Stream_l375_1) begin
      soc_dbusAxi_decoder_io_input_r_ready = 1'b1;
    end
  end

  assign when_Stream_l375_1 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_2) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_2 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_3) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_3 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_4) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_4 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_5) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_5 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_6) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_6 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_7) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_7 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_8) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_8 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_9) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_9 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_10) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_10 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_11) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_11 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_12) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_12 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_13) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_13 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_14) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_14 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_15) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_15 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_16) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_16 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_17) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_17 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_18) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_18 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_19) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_19 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_20) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_20 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_21) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_21 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_22) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_22 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_23) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_23 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_24) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_24 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_25) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_25 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_26) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_26 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_27) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_27 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_28) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_28 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_29) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_29 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_30) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_30 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_31) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_31 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  always @(*) begin
    toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready;
    if(when_Stream_l375_32) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l375_32 = (! toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid);
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last;
  assign soc_dbusAxi_r_valid = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
  assign toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready = soc_dbusAxi_r_ready;
  assign soc_dbusAxi_r_payload_data = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
  assign soc_dbusAxi_r_payload_last = toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
  assign soc_dbusAxi_b_valid = soc_dbusAxi_decoder_io_input_b_valid;
  assign io_axi_arbiter_io_readInputs_0_ar_payload_addr = soc_ibusAxi_decoder_io_outputs_0_ar_payload_addr[23:0];
  assign _zz_io_readInputs_0_ar_payload_len[7 : 0] = 8'h0;
  assign io_axi_arbiter_io_sharedInputs_0_arw_payload_addr = soc_dbusAxi_decoder_io_sharedOutputs_0_arw_payload_addr[23:0];
  assign _zz_io_sharedInputs_0_arw_payload_len[7 : 0] = 8'h0;
  assign io_axi_arw_valid = io_axi_arbiter_io_output_arw_valid;
  assign io_axi_arw_payload_addr = io_axi_arbiter_io_output_arw_payload_addr;
  assign io_axi_arw_payload_id = io_axi_arbiter_io_output_arw_payload_id;
  assign io_axi_arw_payload_len = io_axi_arbiter_io_output_arw_payload_len;
  assign io_axi_arw_payload_size = io_axi_arbiter_io_output_arw_payload_size;
  assign io_axi_arw_payload_burst = io_axi_arbiter_io_output_arw_payload_burst;
  assign io_axi_arw_payload_write = io_axi_arbiter_io_output_arw_payload_write;
  assign io_axi_w_valid = io_axi_arbiter_io_output_w_valid;
  assign io_axi_w_payload_data = io_axi_arbiter_io_output_w_payload_data;
  assign io_axi_w_payload_strb = io_axi_arbiter_io_output_w_payload_strb;
  assign io_axi_w_payload_last = io_axi_arbiter_io_output_w_payload_last;
  assign io_axi_b_ready = io_axi_arbiter_io_output_b_ready;
  assign io_axi_r_ready = io_axi_arbiter_io_output_r_ready;
  assign _zz_io_sharedInputs_0_arw_payload_len_1[7 : 0] = 8'h0;
  assign io_charOut_valid = soc_charDev_io_char_valid;
  assign io_charOut_payload = soc_charDev_io_char_payload;
  assign io_testDev_valid = soc_testDev_io_test_valid;
  assign io_testDev_payload = soc_testDev_io_test_payload;
  assign io_byteDev_wdata_valid = soc_byteDev_io_bytes_wdata_valid;
  assign io_byteDev_wdata_payload = soc_byteDev_io_bytes_wdata_payload;
  assign io_byteDev_rdata_ready = soc_byteDev_io_bytes_rdata_ready;
  assign soc_machineTimers_io_apb_PADDR = apb3Router_1_io_outputs_0_PADDR[3:0];
  assign soc_charDev_io_apb_PADDR = apb3Router_1_io_outputs_1_PADDR[3:0];
  assign soc_byteDev_io_apb_PADDR = apb3Router_1_io_outputs_2_PADDR[3:0];
  assign soc_testDev_io_apb_PADDR = apb3Router_1_io_outputs_3_PADDR[3:0];
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      soc_ibusAxi_ar_rValid <= 1'b0;
      toplevel_soc_ibusAxi_decoder_io_input_r_rValidN <= 1'b1;
      toplevel_soc_dbusAxi_decoder_io_input_r_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= 1'b0;
    end else begin
      if(soc_ibusAxi_ar_ready) begin
        soc_ibusAxi_ar_rValid <= soc_ibusAxi_ar_valid;
      end
      if(soc_ibusAxi_decoder_io_input_r_valid) begin
        toplevel_soc_ibusAxi_decoder_io_input_r_rValidN <= 1'b0;
      end
      if(toplevel_soc_ibusAxi_decoder_io_input_r_s2mPipe_ready) begin
        toplevel_soc_ibusAxi_decoder_io_input_r_rValidN <= 1'b1;
      end
      if(soc_dbusAxi_decoder_io_input_r_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_rValid <= soc_dbusAxi_decoder_io_input_r_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
      if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
        toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rValid <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(soc_ibusAxi_ar_ready) begin
      soc_ibusAxi_ar_rData_addr <= soc_ibusAxi_ar_payload_addr;
    end
    if(toplevel_soc_ibusAxi_decoder_io_input_r_rValidN) begin
      toplevel_soc_ibusAxi_decoder_io_input_r_rData_data <= soc_ibusAxi_decoder_io_input_r_payload_data;
      toplevel_soc_ibusAxi_decoder_io_input_r_rData_last <= soc_ibusAxi_decoder_io_input_r_payload_last;
    end
    if(soc_dbusAxi_decoder_io_input_r_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_rData_data <= soc_dbusAxi_decoder_io_input_r_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_rData_last <= soc_dbusAxi_decoder_io_input_r_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
    if(toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_ready) begin
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_data <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_data;
      toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_rData_last <= toplevel_soc_dbusAxi_decoder_io_input_r_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_m2sPipe_payload_last;
    end
  end


endmodule

module Apb3Router (
  input  wire [31:0]   io_input_PADDR,
  input  wire [3:0]    io_input_PSEL,
  input  wire          io_input_PENABLE,
  output wire          io_input_PREADY,
  input  wire          io_input_PWRITE,
  input  wire [31:0]   io_input_PWDATA,
  output wire [31:0]   io_input_PRDATA,
  output wire          io_input_PSLVERROR,
  output wire [31:0]   io_outputs_0_PADDR,
  output wire [0:0]    io_outputs_0_PSEL,
  output wire          io_outputs_0_PENABLE,
  input  wire          io_outputs_0_PREADY,
  output wire          io_outputs_0_PWRITE,
  output wire [31:0]   io_outputs_0_PWDATA,
  input  wire [31:0]   io_outputs_0_PRDATA,
  input  wire          io_outputs_0_PSLVERROR,
  output wire [31:0]   io_outputs_1_PADDR,
  output wire [0:0]    io_outputs_1_PSEL,
  output wire          io_outputs_1_PENABLE,
  input  wire          io_outputs_1_PREADY,
  output wire          io_outputs_1_PWRITE,
  output wire [31:0]   io_outputs_1_PWDATA,
  input  wire [31:0]   io_outputs_1_PRDATA,
  input  wire          io_outputs_1_PSLVERROR,
  output wire [31:0]   io_outputs_2_PADDR,
  output wire [0:0]    io_outputs_2_PSEL,
  output wire          io_outputs_2_PENABLE,
  input  wire          io_outputs_2_PREADY,
  output wire          io_outputs_2_PWRITE,
  output wire [31:0]   io_outputs_2_PWDATA,
  input  wire [31:0]   io_outputs_2_PRDATA,
  input  wire          io_outputs_2_PSLVERROR,
  output wire [31:0]   io_outputs_3_PADDR,
  output wire [0:0]    io_outputs_3_PSEL,
  output wire          io_outputs_3_PENABLE,
  input  wire          io_outputs_3_PREADY,
  output wire          io_outputs_3_PWRITE,
  output wire [31:0]   io_outputs_3_PWDATA,
  input  wire [31:0]   io_outputs_3_PRDATA,
  input  wire          io_outputs_3_PSLVERROR,
  input  wire          clk,
  input  wire          reset
);

  reg                 _zz_io_input_PREADY;
  reg        [31:0]   _zz_io_input_PRDATA;
  reg                 _zz_io_input_PSLVERROR;
  wire                _zz_selIndex;
  wire                _zz_selIndex_1;
  wire                _zz_selIndex_2;
  reg        [1:0]    selIndex;

  always @(*) begin
    case(selIndex)
      2'b00 : begin
        _zz_io_input_PREADY = io_outputs_0_PREADY;
        _zz_io_input_PRDATA = io_outputs_0_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_0_PSLVERROR;
      end
      2'b01 : begin
        _zz_io_input_PREADY = io_outputs_1_PREADY;
        _zz_io_input_PRDATA = io_outputs_1_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_1_PSLVERROR;
      end
      2'b10 : begin
        _zz_io_input_PREADY = io_outputs_2_PREADY;
        _zz_io_input_PRDATA = io_outputs_2_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_2_PSLVERROR;
      end
      default : begin
        _zz_io_input_PREADY = io_outputs_3_PREADY;
        _zz_io_input_PRDATA = io_outputs_3_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_3_PSLVERROR;
      end
    endcase
  end

  assign io_outputs_0_PADDR = io_input_PADDR;
  assign io_outputs_0_PENABLE = io_input_PENABLE;
  assign io_outputs_0_PSEL[0] = io_input_PSEL[0];
  assign io_outputs_0_PWRITE = io_input_PWRITE;
  assign io_outputs_0_PWDATA = io_input_PWDATA;
  assign io_outputs_1_PADDR = io_input_PADDR;
  assign io_outputs_1_PENABLE = io_input_PENABLE;
  assign io_outputs_1_PSEL[0] = io_input_PSEL[1];
  assign io_outputs_1_PWRITE = io_input_PWRITE;
  assign io_outputs_1_PWDATA = io_input_PWDATA;
  assign io_outputs_2_PADDR = io_input_PADDR;
  assign io_outputs_2_PENABLE = io_input_PENABLE;
  assign io_outputs_2_PSEL[0] = io_input_PSEL[2];
  assign io_outputs_2_PWRITE = io_input_PWRITE;
  assign io_outputs_2_PWDATA = io_input_PWDATA;
  assign io_outputs_3_PADDR = io_input_PADDR;
  assign io_outputs_3_PENABLE = io_input_PENABLE;
  assign io_outputs_3_PSEL[0] = io_input_PSEL[3];
  assign io_outputs_3_PWRITE = io_input_PWRITE;
  assign io_outputs_3_PWDATA = io_input_PWDATA;
  assign _zz_selIndex = io_input_PSEL[3];
  assign _zz_selIndex_1 = (io_input_PSEL[1] || _zz_selIndex);
  assign _zz_selIndex_2 = (io_input_PSEL[2] || _zz_selIndex);
  assign io_input_PREADY = _zz_io_input_PREADY;
  assign io_input_PRDATA = _zz_io_input_PRDATA;
  assign io_input_PSLVERROR = _zz_io_input_PSLVERROR;
  always @(posedge clk) begin
    selIndex <= {_zz_selIndex_2,_zz_selIndex_1};
  end


endmodule

module Apb3Decoder (
  input  wire [31:0]   io_input_PADDR,
  input  wire [0:0]    io_input_PSEL,
  input  wire          io_input_PENABLE,
  output reg           io_input_PREADY,
  input  wire          io_input_PWRITE,
  input  wire [31:0]   io_input_PWDATA,
  output wire [31:0]   io_input_PRDATA,
  output reg           io_input_PSLVERROR,
  output wire [31:0]   io_output_PADDR,
  output reg  [3:0]    io_output_PSEL,
  output wire          io_output_PENABLE,
  input  wire          io_output_PREADY,
  output wire          io_output_PWRITE,
  output wire [31:0]   io_output_PWDATA,
  input  wire [31:0]   io_output_PRDATA,
  input  wire          io_output_PSLVERROR
);

  wire                when_Apb3Decoder_l88;

  assign io_output_PADDR = io_input_PADDR;
  assign io_output_PENABLE = io_input_PENABLE;
  assign io_output_PWRITE = io_input_PWRITE;
  assign io_output_PWDATA = io_input_PWDATA;
  always @(*) begin
    io_output_PSEL[0] = (((io_input_PADDR & (~ 32'h00000fff)) == 32'h02000000) && io_input_PSEL[0]);
    io_output_PSEL[1] = (((io_input_PADDR & (~ 32'h00000fff)) == 32'h10000000) && io_input_PSEL[0]);
    io_output_PSEL[2] = (((io_input_PADDR & (~ 32'h00000fff)) == 32'h20000000) && io_input_PSEL[0]);
    io_output_PSEL[3] = (((io_input_PADDR & (~ 32'h00000fff)) == 32'h30000000) && io_input_PSEL[0]);
  end

  always @(*) begin
    io_input_PREADY = io_output_PREADY;
    if(when_Apb3Decoder_l88) begin
      io_input_PREADY = 1'b1;
    end
  end

  assign io_input_PRDATA = io_output_PRDATA;
  always @(*) begin
    io_input_PSLVERROR = io_output_PSLVERROR;
    if(when_Apb3Decoder_l88) begin
      io_input_PSLVERROR = 1'b1;
    end
  end

  assign when_Apb3Decoder_l88 = (io_input_PSEL[0] && (io_output_PSEL == 4'b0000));

endmodule

module Apb3ByteDev (
  output reg           io_bytes_wdata_valid,
  output wire [7:0]    io_bytes_wdata_payload,
  input  wire          io_bytes_rdata_valid,
  output wire          io_bytes_rdata_ready,
  input  wire [7:0]    io_bytes_rdata_payload,
  output reg           io_irq_update,
  output reg           io_irq_interruptPending,
  input  wire [3:0]    io_apb_PADDR,
  input  wire [0:0]    io_apb_PSEL,
  input  wire          io_apb_PENABLE,
  output wire          io_apb_PREADY,
  input  wire          io_apb_PWRITE,
  input  wire [31:0]   io_apb_PWDATA,
  output reg  [31:0]   io_apb_PRDATA,
  output wire          io_apb_PSLVERROR,
  input  wire          clk,
  input  wire          reset
);

  reg        [7:0]    rbuf;
  reg                 rbufFull;
  wire                when_Apb3ByteDev_l33;
  wire                busCtrl_readErrorFlag;
  wire                busCtrl_writeErrorFlag;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  reg        [7:0]    rdata;

  always @(*) begin
    io_irq_update = 1'b0;
    if(when_Apb3ByteDev_l33) begin
      io_irq_update = 1'b1;
    end
    case(io_apb_PADDR)
      4'b0000 : begin
        if(busCtrl_doRead) begin
          io_irq_update = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_irq_interruptPending = 1'b0;
    if(when_Apb3ByteDev_l33) begin
      io_irq_interruptPending = 1'b1;
    end
    case(io_apb_PADDR)
      4'b0000 : begin
        if(busCtrl_doRead) begin
          io_irq_interruptPending = 1'b0;
        end
      end
      default : begin
      end
    endcase
  end

  assign io_bytes_rdata_ready = (! rbufFull);
  assign when_Apb3ByteDev_l33 = (io_bytes_rdata_valid && (! rbufFull));
  assign busCtrl_readErrorFlag = 1'b0;
  assign busCtrl_writeErrorFlag = 1'b0;
  assign io_apb_PREADY = 1'b1;
  always @(*) begin
    io_apb_PRDATA = 32'h0;
    case(io_apb_PADDR)
      4'b0000 : begin
        io_apb_PRDATA[7 : 0] = rdata;
      end
      default : begin
      end
    endcase
  end

  assign busCtrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign busCtrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign busCtrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign busCtrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  assign io_apb_PSLVERROR = ((busCtrl_doWrite && busCtrl_writeErrorFlag) || (busCtrl_doRead && busCtrl_readErrorFlag));
  always @(*) begin
    io_bytes_wdata_valid = 1'b0;
    case(io_apb_PADDR)
      4'b0000 : begin
        if(busCtrl_doWrite) begin
          io_bytes_wdata_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    rdata = 8'h0;
    if(rbufFull) begin
      rdata = rbuf;
    end else begin
      if(io_bytes_rdata_valid) begin
        rdata = io_bytes_rdata_payload;
      end
    end
  end

  assign io_bytes_wdata_payload = io_apb_PWDATA[7 : 0];
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      rbuf <= 8'h0;
      rbufFull <= 1'b0;
    end else begin
      if(when_Apb3ByteDev_l33) begin
        rbuf <= io_bytes_rdata_payload;
        rbufFull <= 1'b1;
      end
      case(io_apb_PADDR)
        4'b0000 : begin
          if(busCtrl_doRead) begin
            rbufFull <= 1'b0;
          end
        end
        default : begin
        end
      endcase
    end
  end


endmodule

module Apb3TestDev (
  output reg           io_test_valid,
  output wire [31:0]   io_test_payload,
  input  wire [3:0]    io_apb_PADDR,
  input  wire [0:0]    io_apb_PSEL,
  input  wire          io_apb_PENABLE,
  output wire          io_apb_PREADY,
  input  wire          io_apb_PWRITE,
  input  wire [31:0]   io_apb_PWDATA,
  output wire [31:0]   io_apb_PRDATA,
  output wire          io_apb_PSLVERROR
);

  wire                busCtrl_readErrorFlag;
  wire                busCtrl_writeErrorFlag;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;

  assign busCtrl_readErrorFlag = 1'b0;
  assign busCtrl_writeErrorFlag = 1'b0;
  assign io_apb_PREADY = 1'b1;
  assign io_apb_PRDATA = 32'h0;
  assign busCtrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign busCtrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign busCtrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign busCtrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  assign io_apb_PSLVERROR = ((busCtrl_doWrite && busCtrl_writeErrorFlag) || (busCtrl_doRead && busCtrl_readErrorFlag));
  always @(*) begin
    io_test_valid = 1'b0;
    case(io_apb_PADDR)
      4'b0000 : begin
        if(busCtrl_doWrite) begin
          io_test_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign io_test_payload = io_apb_PWDATA[31 : 0];

endmodule

module Apb3CharDev (
  output reg           io_char_valid,
  output wire [7:0]    io_char_payload,
  input  wire [3:0]    io_apb_PADDR,
  input  wire [0:0]    io_apb_PSEL,
  input  wire          io_apb_PENABLE,
  output wire          io_apb_PREADY,
  input  wire          io_apb_PWRITE,
  input  wire [31:0]   io_apb_PWDATA,
  output wire [31:0]   io_apb_PRDATA,
  output wire          io_apb_PSLVERROR
);

  wire                busCtrl_readErrorFlag;
  wire                busCtrl_writeErrorFlag;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;

  assign busCtrl_readErrorFlag = 1'b0;
  assign busCtrl_writeErrorFlag = 1'b0;
  assign io_apb_PREADY = 1'b1;
  assign io_apb_PRDATA = 32'h0;
  assign busCtrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign busCtrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign busCtrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign busCtrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  assign io_apb_PSLVERROR = ((busCtrl_doWrite && busCtrl_writeErrorFlag) || (busCtrl_doRead && busCtrl_readErrorFlag));
  always @(*) begin
    io_char_valid = 1'b0;
    case(io_apb_PADDR)
      4'b0000 : begin
        if(busCtrl_doWrite) begin
          io_char_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign io_char_payload = io_apb_PWDATA[7 : 0];

endmodule

module Apb3MachineTimers (
  output reg           io_mtimer_update,
  output reg           io_mtimer_interruptPending,
  input  wire [3:0]    io_apb_PADDR,
  input  wire [0:0]    io_apb_PSEL,
  input  wire          io_apb_PENABLE,
  output wire          io_apb_PREADY,
  input  wire          io_apb_PWRITE,
  input  wire [31:0]   io_apb_PWDATA,
  output reg  [31:0]   io_apb_PRDATA,
  output wire          io_apb_PSLVERROR,
  input  wire          clk,
  input  wire          reset
);

  reg        [63:0]   mtime;
  reg        [63:0]   mtimecmp;
  wire                when_Apb3MachineTimers_l30;
  wire                busCtrl_readErrorFlag;
  wire                busCtrl_writeErrorFlag;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  wire       [63:0]   _zz_io_apb_PRDATA;
  wire       [63:0]   _zz_io_apb_PRDATA_1;
  wire                when_Apb3SlaveFactory_l81;
  wire                when_Apb3SlaveFactory_l81_1;
  wire                when_Apb3SlaveFactory_l81_2;
  wire                when_Apb3SlaveFactory_l81_3;

  always @(*) begin
    io_mtimer_update = 1'b0;
    if(when_Apb3MachineTimers_l30) begin
      io_mtimer_update = 1'b1;
    end
    case(io_apb_PADDR)
      4'b1000 : begin
        if(busCtrl_doWrite) begin
          io_mtimer_update = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_mtimer_interruptPending = 1'b0;
    if(when_Apb3MachineTimers_l30) begin
      io_mtimer_interruptPending = 1'b1;
    end
    case(io_apb_PADDR)
      4'b1000 : begin
        if(busCtrl_doWrite) begin
          io_mtimer_interruptPending = 1'b0;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_Apb3MachineTimers_l30 = (mtimecmp <= mtime);
  assign busCtrl_readErrorFlag = 1'b0;
  assign busCtrl_writeErrorFlag = 1'b0;
  assign io_apb_PREADY = 1'b1;
  always @(*) begin
    io_apb_PRDATA = 32'h0;
    if(when_Apb3SlaveFactory_l81) begin
      io_apb_PRDATA[31 : 0] = _zz_io_apb_PRDATA[31 : 0];
    end
    if(when_Apb3SlaveFactory_l81_1) begin
      io_apb_PRDATA[31 : 0] = _zz_io_apb_PRDATA[63 : 32];
    end
    if(when_Apb3SlaveFactory_l81_2) begin
      io_apb_PRDATA[31 : 0] = _zz_io_apb_PRDATA_1[31 : 0];
    end
    if(when_Apb3SlaveFactory_l81_3) begin
      io_apb_PRDATA[31 : 0] = _zz_io_apb_PRDATA_1[63 : 32];
    end
  end

  assign busCtrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign busCtrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign busCtrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign busCtrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  assign io_apb_PSLVERROR = ((busCtrl_doWrite && busCtrl_writeErrorFlag) || (busCtrl_doRead && busCtrl_readErrorFlag));
  assign _zz_io_apb_PRDATA = mtime;
  assign _zz_io_apb_PRDATA_1 = mtimecmp;
  assign when_Apb3SlaveFactory_l81 = ((io_apb_PADDR & (~ 4'b0011)) == 4'b0000);
  assign when_Apb3SlaveFactory_l81_1 = ((io_apb_PADDR & (~ 4'b0011)) == 4'b0100);
  assign when_Apb3SlaveFactory_l81_2 = ((io_apb_PADDR & (~ 4'b0011)) == 4'b1000);
  assign when_Apb3SlaveFactory_l81_3 = ((io_apb_PADDR & (~ 4'b0011)) == 4'b1100);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      mtime <= 64'h0;
      mtimecmp <= 64'h0;
    end else begin
      mtime <= (mtime + 64'h0000000000000001);
      if(when_Apb3SlaveFactory_l81) begin
        if(busCtrl_doWrite) begin
          mtime[31 : 0] <= io_apb_PWDATA[31 : 0];
        end
      end
      if(when_Apb3SlaveFactory_l81_1) begin
        if(busCtrl_doWrite) begin
          mtime[63 : 32] <= io_apb_PWDATA[31 : 0];
        end
      end
      if(when_Apb3SlaveFactory_l81_2) begin
        if(busCtrl_doWrite) begin
          mtimecmp[31 : 0] <= io_apb_PWDATA[31 : 0];
        end
      end
      if(when_Apb3SlaveFactory_l81_3) begin
        if(busCtrl_doWrite) begin
          mtimecmp[63 : 32] <= io_apb_PWDATA[31 : 0];
        end
      end
    end
  end


endmodule

module Axi4SharedArbiter_1 (
  input  wire          io_sharedInputs_0_arw_valid,
  output wire          io_sharedInputs_0_arw_ready,
  input  wire [31:0]   io_sharedInputs_0_arw_payload_addr,
  input  wire [3:0]    io_sharedInputs_0_arw_payload_id,
  input  wire [7:0]    io_sharedInputs_0_arw_payload_len,
  input  wire [2:0]    io_sharedInputs_0_arw_payload_size,
  input  wire [1:0]    io_sharedInputs_0_arw_payload_burst,
  input  wire          io_sharedInputs_0_arw_payload_write,
  input  wire          io_sharedInputs_0_w_valid,
  output wire          io_sharedInputs_0_w_ready,
  input  wire [31:0]   io_sharedInputs_0_w_payload_data,
  input  wire [3:0]    io_sharedInputs_0_w_payload_strb,
  input  wire          io_sharedInputs_0_w_payload_last,
  output wire          io_sharedInputs_0_b_valid,
  input  wire          io_sharedInputs_0_b_ready,
  output wire [3:0]    io_sharedInputs_0_b_payload_id,
  output wire [1:0]    io_sharedInputs_0_b_payload_resp,
  output wire          io_sharedInputs_0_r_valid,
  input  wire          io_sharedInputs_0_r_ready,
  output wire [31:0]   io_sharedInputs_0_r_payload_data,
  output wire [3:0]    io_sharedInputs_0_r_payload_id,
  output wire [1:0]    io_sharedInputs_0_r_payload_resp,
  output wire          io_sharedInputs_0_r_payload_last,
  output wire          io_output_arw_valid,
  input  wire          io_output_arw_ready,
  output wire [31:0]   io_output_arw_payload_addr,
  output wire [3:0]    io_output_arw_payload_id,
  output wire [7:0]    io_output_arw_payload_len,
  output wire [2:0]    io_output_arw_payload_size,
  output wire [1:0]    io_output_arw_payload_burst,
  output wire          io_output_arw_payload_write,
  output wire          io_output_w_valid,
  input  wire          io_output_w_ready,
  output wire [31:0]   io_output_w_payload_data,
  output wire [3:0]    io_output_w_payload_strb,
  output wire          io_output_w_payload_last,
  input  wire          io_output_b_valid,
  output wire          io_output_b_ready,
  input  wire [3:0]    io_output_b_payload_id,
  input  wire [1:0]    io_output_b_payload_resp,
  input  wire          io_output_r_valid,
  output wire          io_output_r_ready,
  input  wire [31:0]   io_output_r_payload_data,
  input  wire [3:0]    io_output_r_payload_id,
  input  wire [1:0]    io_output_r_payload_resp,
  input  wire          io_output_r_payload_last,
  input  wire          clk,
  input  wire          reset
);

  reg                 cmdArbiter_io_output_ready;
  wire                cmdRouteFork_thrown_translated_fifo_io_pop_ready;
  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [31:0]   cmdArbiter_io_output_payload_addr;
  wire       [3:0]    cmdArbiter_io_output_payload_id;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire                cmdArbiter_io_output_payload_write;
  wire       [0:0]    cmdArbiter_io_chosenOH;
  wire                cmdRouteFork_thrown_translated_fifo_io_push_ready;
  wire                cmdRouteFork_thrown_translated_fifo_io_pop_valid;
  wire       [2:0]    cmdRouteFork_thrown_translated_fifo_io_occupancy;
  wire       [2:0]    cmdRouteFork_thrown_translated_fifo_io_availability;
  wire                inputsCmd_0_valid;
  wire                inputsCmd_0_ready;
  wire       [31:0]   inputsCmd_0_payload_addr;
  wire       [3:0]    inputsCmd_0_payload_id;
  wire       [7:0]    inputsCmd_0_payload_len;
  wire       [2:0]    inputsCmd_0_payload_size;
  wire       [1:0]    inputsCmd_0_payload_burst;
  wire                inputsCmd_0_payload_write;
  wire                cmdOutputFork_valid;
  wire                cmdOutputFork_ready;
  wire       [31:0]   cmdOutputFork_payload_addr;
  wire       [3:0]    cmdOutputFork_payload_id;
  wire       [7:0]    cmdOutputFork_payload_len;
  wire       [2:0]    cmdOutputFork_payload_size;
  wire       [1:0]    cmdOutputFork_payload_burst;
  wire                cmdOutputFork_payload_write;
  wire                cmdRouteFork_valid;
  reg                 cmdRouteFork_ready;
  wire       [31:0]   cmdRouteFork_payload_addr;
  wire       [3:0]    cmdRouteFork_payload_id;
  wire       [7:0]    cmdRouteFork_payload_len;
  wire       [2:0]    cmdRouteFork_payload_size;
  wire       [1:0]    cmdRouteFork_payload_burst;
  wire                cmdRouteFork_payload_write;
  reg                 soc_apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0;
  reg                 soc_apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1;
  wire                when_Stream_l1063;
  wire                when_Stream_l1063_1;
  wire                cmdOutputFork_fire;
  wire                cmdRouteFork_fire;
  wire                when_Stream_l445;
  reg                 cmdRouteFork_thrown_valid;
  wire                cmdRouteFork_thrown_ready;
  wire       [31:0]   cmdRouteFork_thrown_payload_addr;
  wire       [3:0]    cmdRouteFork_thrown_payload_id;
  wire       [7:0]    cmdRouteFork_thrown_payload_len;
  wire       [2:0]    cmdRouteFork_thrown_payload_size;
  wire       [1:0]    cmdRouteFork_thrown_payload_burst;
  wire                cmdRouteFork_thrown_payload_write;
  wire                cmdRouteFork_thrown_translated_valid;
  wire                cmdRouteFork_thrown_translated_ready;
  wire                writeLogic_routeDataInput_valid;
  wire                writeLogic_routeDataInput_ready;
  wire       [31:0]   writeLogic_routeDataInput_payload_data;
  wire       [3:0]    writeLogic_routeDataInput_payload_strb;
  wire                writeLogic_routeDataInput_payload_last;
  wire                io_output_w_fire;
  wire                writeLogic_writeRspSels_0;
  wire                readRspSels_0;

  StreamArbiter cmdArbiter (
    .io_inputs_0_valid         (inputsCmd_0_valid                      ), //i
    .io_inputs_0_ready         (cmdArbiter_io_inputs_0_ready           ), //o
    .io_inputs_0_payload_addr  (inputsCmd_0_payload_addr[31:0]         ), //i
    .io_inputs_0_payload_id    (inputsCmd_0_payload_id[3:0]            ), //i
    .io_inputs_0_payload_len   (inputsCmd_0_payload_len[7:0]           ), //i
    .io_inputs_0_payload_size  (inputsCmd_0_payload_size[2:0]          ), //i
    .io_inputs_0_payload_burst (inputsCmd_0_payload_burst[1:0]         ), //i
    .io_inputs_0_payload_write (inputsCmd_0_payload_write              ), //i
    .io_output_valid           (cmdArbiter_io_output_valid             ), //o
    .io_output_ready           (cmdArbiter_io_output_ready             ), //i
    .io_output_payload_addr    (cmdArbiter_io_output_payload_addr[31:0]), //o
    .io_output_payload_id      (cmdArbiter_io_output_payload_id[3:0]   ), //o
    .io_output_payload_len     (cmdArbiter_io_output_payload_len[7:0]  ), //o
    .io_output_payload_size    (cmdArbiter_io_output_payload_size[2:0] ), //o
    .io_output_payload_burst   (cmdArbiter_io_output_payload_burst[1:0]), //o
    .io_output_payload_write   (cmdArbiter_io_output_payload_write     ), //o
    .io_chosenOH               (cmdArbiter_io_chosenOH                 ), //o
    .clk                       (clk                                    ), //i
    .reset                     (reset                                  )  //i
  );
  StreamFifoLowLatency_1 cmdRouteFork_thrown_translated_fifo (
    .io_push_valid   (cmdRouteFork_thrown_translated_valid                    ), //i
    .io_push_ready   (cmdRouteFork_thrown_translated_fifo_io_push_ready       ), //o
    .io_pop_valid    (cmdRouteFork_thrown_translated_fifo_io_pop_valid        ), //o
    .io_pop_ready    (cmdRouteFork_thrown_translated_fifo_io_pop_ready        ), //i
    .io_flush        (1'b0                                                    ), //i
    .io_occupancy    (cmdRouteFork_thrown_translated_fifo_io_occupancy[2:0]   ), //o
    .io_availability (cmdRouteFork_thrown_translated_fifo_io_availability[2:0]), //o
    .clk             (clk                                                     ), //i
    .reset           (reset                                                   )  //i
  );
  assign inputsCmd_0_valid = io_sharedInputs_0_arw_valid;
  assign io_sharedInputs_0_arw_ready = inputsCmd_0_ready;
  assign inputsCmd_0_payload_addr = io_sharedInputs_0_arw_payload_addr;
  assign inputsCmd_0_payload_id = io_sharedInputs_0_arw_payload_id;
  assign inputsCmd_0_payload_len = io_sharedInputs_0_arw_payload_len;
  assign inputsCmd_0_payload_size = io_sharedInputs_0_arw_payload_size;
  assign inputsCmd_0_payload_burst = io_sharedInputs_0_arw_payload_burst;
  assign inputsCmd_0_payload_write = io_sharedInputs_0_arw_payload_write;
  assign inputsCmd_0_ready = cmdArbiter_io_inputs_0_ready;
  always @(*) begin
    cmdArbiter_io_output_ready = 1'b1;
    if(when_Stream_l1063) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
    if(when_Stream_l1063_1) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
  end

  assign when_Stream_l1063 = ((! cmdOutputFork_ready) && soc_apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign when_Stream_l1063_1 = ((! cmdRouteFork_ready) && soc_apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdOutputFork_valid = (cmdArbiter_io_output_valid && soc_apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign cmdOutputFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdOutputFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdOutputFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdOutputFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdOutputFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdOutputFork_payload_write = cmdArbiter_io_output_payload_write;
  assign cmdOutputFork_fire = (cmdOutputFork_valid && cmdOutputFork_ready);
  assign cmdRouteFork_valid = (cmdArbiter_io_output_valid && soc_apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdRouteFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdRouteFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdRouteFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdRouteFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdRouteFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdRouteFork_payload_write = cmdArbiter_io_output_payload_write;
  assign cmdRouteFork_fire = (cmdRouteFork_valid && cmdRouteFork_ready);
  assign io_output_arw_valid = cmdOutputFork_valid;
  assign cmdOutputFork_ready = io_output_arw_ready;
  assign io_output_arw_payload_addr = cmdOutputFork_payload_addr;
  assign io_output_arw_payload_len = cmdOutputFork_payload_len;
  assign io_output_arw_payload_size = cmdOutputFork_payload_size;
  assign io_output_arw_payload_burst = cmdOutputFork_payload_burst;
  assign io_output_arw_payload_write = cmdOutputFork_payload_write;
  assign io_output_arw_payload_id = (cmdOutputFork_payload_write ? cmdOutputFork_payload_id : cmdOutputFork_payload_id);
  assign when_Stream_l445 = (! cmdRouteFork_payload_write);
  always @(*) begin
    cmdRouteFork_thrown_valid = cmdRouteFork_valid;
    if(when_Stream_l445) begin
      cmdRouteFork_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    cmdRouteFork_ready = cmdRouteFork_thrown_ready;
    if(when_Stream_l445) begin
      cmdRouteFork_ready = 1'b1;
    end
  end

  assign cmdRouteFork_thrown_payload_addr = cmdRouteFork_payload_addr;
  assign cmdRouteFork_thrown_payload_id = cmdRouteFork_payload_id;
  assign cmdRouteFork_thrown_payload_len = cmdRouteFork_payload_len;
  assign cmdRouteFork_thrown_payload_size = cmdRouteFork_payload_size;
  assign cmdRouteFork_thrown_payload_burst = cmdRouteFork_payload_burst;
  assign cmdRouteFork_thrown_payload_write = cmdRouteFork_payload_write;
  assign cmdRouteFork_thrown_translated_valid = cmdRouteFork_thrown_valid;
  assign cmdRouteFork_thrown_ready = cmdRouteFork_thrown_translated_ready;
  assign cmdRouteFork_thrown_translated_ready = cmdRouteFork_thrown_translated_fifo_io_push_ready;
  assign writeLogic_routeDataInput_valid = io_sharedInputs_0_w_valid;
  assign writeLogic_routeDataInput_ready = io_sharedInputs_0_w_ready;
  assign writeLogic_routeDataInput_payload_data = io_sharedInputs_0_w_payload_data;
  assign writeLogic_routeDataInput_payload_strb = io_sharedInputs_0_w_payload_strb;
  assign writeLogic_routeDataInput_payload_last = io_sharedInputs_0_w_payload_last;
  assign io_output_w_valid = (cmdRouteFork_thrown_translated_fifo_io_pop_valid && writeLogic_routeDataInput_valid);
  assign io_output_w_payload_data = writeLogic_routeDataInput_payload_data;
  assign io_output_w_payload_strb = writeLogic_routeDataInput_payload_strb;
  assign io_output_w_payload_last = writeLogic_routeDataInput_payload_last;
  assign io_sharedInputs_0_w_ready = ((cmdRouteFork_thrown_translated_fifo_io_pop_valid && io_output_w_ready) && 1'b1);
  assign io_output_w_fire = (io_output_w_valid && io_output_w_ready);
  assign cmdRouteFork_thrown_translated_fifo_io_pop_ready = (io_output_w_fire && io_output_w_payload_last);
  assign writeLogic_writeRspSels_0 = 1'b1;
  assign io_sharedInputs_0_b_valid = (io_output_b_valid && writeLogic_writeRspSels_0);
  assign io_sharedInputs_0_b_payload_resp = io_output_b_payload_resp;
  assign io_sharedInputs_0_b_payload_id = io_output_b_payload_id;
  assign io_output_b_ready = io_sharedInputs_0_b_ready;
  assign readRspSels_0 = 1'b1;
  assign io_sharedInputs_0_r_valid = (io_output_r_valid && readRspSels_0);
  assign io_sharedInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_sharedInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_sharedInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_sharedInputs_0_r_payload_id = io_output_r_payload_id;
  assign io_output_r_ready = io_sharedInputs_0_r_ready;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      soc_apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
      soc_apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
    end else begin
      if(cmdOutputFork_fire) begin
        soc_apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b0;
      end
      if(cmdRouteFork_fire) begin
        soc_apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b0;
      end
      if(cmdArbiter_io_output_ready) begin
        soc_apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
        soc_apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
      end
    end
  end


endmodule

module Axi4SharedArbiter (
  input  wire          io_readInputs_0_ar_valid,
  output wire          io_readInputs_0_ar_ready,
  input  wire [23:0]   io_readInputs_0_ar_payload_addr,
  input  wire [2:0]    io_readInputs_0_ar_payload_id,
  input  wire [7:0]    io_readInputs_0_ar_payload_len,
  input  wire [2:0]    io_readInputs_0_ar_payload_size,
  input  wire [1:0]    io_readInputs_0_ar_payload_burst,
  output wire          io_readInputs_0_r_valid,
  input  wire          io_readInputs_0_r_ready,
  output wire [31:0]   io_readInputs_0_r_payload_data,
  output wire [2:0]    io_readInputs_0_r_payload_id,
  output wire [1:0]    io_readInputs_0_r_payload_resp,
  output wire          io_readInputs_0_r_payload_last,
  input  wire          io_sharedInputs_0_arw_valid,
  output wire          io_sharedInputs_0_arw_ready,
  input  wire [23:0]   io_sharedInputs_0_arw_payload_addr,
  input  wire [2:0]    io_sharedInputs_0_arw_payload_id,
  input  wire [7:0]    io_sharedInputs_0_arw_payload_len,
  input  wire [2:0]    io_sharedInputs_0_arw_payload_size,
  input  wire [1:0]    io_sharedInputs_0_arw_payload_burst,
  input  wire          io_sharedInputs_0_arw_payload_write,
  input  wire          io_sharedInputs_0_w_valid,
  output wire          io_sharedInputs_0_w_ready,
  input  wire [31:0]   io_sharedInputs_0_w_payload_data,
  input  wire [3:0]    io_sharedInputs_0_w_payload_strb,
  input  wire          io_sharedInputs_0_w_payload_last,
  output wire          io_sharedInputs_0_b_valid,
  input  wire          io_sharedInputs_0_b_ready,
  output wire [2:0]    io_sharedInputs_0_b_payload_id,
  output wire [1:0]    io_sharedInputs_0_b_payload_resp,
  output wire          io_sharedInputs_0_r_valid,
  input  wire          io_sharedInputs_0_r_ready,
  output wire [31:0]   io_sharedInputs_0_r_payload_data,
  output wire [2:0]    io_sharedInputs_0_r_payload_id,
  output wire [1:0]    io_sharedInputs_0_r_payload_resp,
  output wire          io_sharedInputs_0_r_payload_last,
  output wire          io_output_arw_valid,
  input  wire          io_output_arw_ready,
  output wire [23:0]   io_output_arw_payload_addr,
  output wire [3:0]    io_output_arw_payload_id,
  output wire [7:0]    io_output_arw_payload_len,
  output wire [2:0]    io_output_arw_payload_size,
  output wire [1:0]    io_output_arw_payload_burst,
  output wire          io_output_arw_payload_write,
  output wire          io_output_w_valid,
  input  wire          io_output_w_ready,
  output wire [31:0]   io_output_w_payload_data,
  output wire [3:0]    io_output_w_payload_strb,
  output wire          io_output_w_payload_last,
  input  wire          io_output_b_valid,
  output wire          io_output_b_ready,
  input  wire [3:0]    io_output_b_payload_id,
  input  wire [1:0]    io_output_b_payload_resp,
  input  wire          io_output_r_valid,
  output wire          io_output_r_ready,
  input  wire [31:0]   io_output_r_payload_data,
  input  wire [3:0]    io_output_r_payload_id,
  input  wire [1:0]    io_output_r_payload_resp,
  input  wire          io_output_r_payload_last,
  input  wire          clk,
  input  wire          reset
);

  reg                 cmdArbiter_io_output_ready;
  wire                cmdRouteFork_thrown_translated_fifo_io_pop_ready;
  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_inputs_1_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [23:0]   cmdArbiter_io_output_payload_addr;
  wire       [2:0]    cmdArbiter_io_output_payload_id;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire                cmdArbiter_io_output_payload_write;
  wire       [0:0]    cmdArbiter_io_chosen;
  wire       [1:0]    cmdArbiter_io_chosenOH;
  wire                cmdRouteFork_thrown_translated_fifo_io_push_ready;
  wire                cmdRouteFork_thrown_translated_fifo_io_pop_valid;
  wire       [2:0]    cmdRouteFork_thrown_translated_fifo_io_occupancy;
  wire       [2:0]    cmdRouteFork_thrown_translated_fifo_io_availability;
  wire       [1:0]    _zz__zz_io_output_arw_payload_id;
  wire       [3:0]    _zz_io_output_arw_payload_id_1;
  wire       [2:0]    _zz_io_output_arw_payload_id_2;
  reg                 _zz_io_output_r_ready;
  wire                inputsCmd_0_valid;
  wire                inputsCmd_0_ready;
  wire       [23:0]   inputsCmd_0_payload_addr;
  wire       [2:0]    inputsCmd_0_payload_id;
  wire       [7:0]    inputsCmd_0_payload_len;
  wire       [2:0]    inputsCmd_0_payload_size;
  wire       [1:0]    inputsCmd_0_payload_burst;
  wire                inputsCmd_0_payload_write;
  wire                inputsCmd_1_valid;
  wire                inputsCmd_1_ready;
  wire       [23:0]   inputsCmd_1_payload_addr;
  wire       [2:0]    inputsCmd_1_payload_id;
  wire       [7:0]    inputsCmd_1_payload_len;
  wire       [2:0]    inputsCmd_1_payload_size;
  wire       [1:0]    inputsCmd_1_payload_burst;
  wire                inputsCmd_1_payload_write;
  wire                cmdOutputFork_valid;
  wire                cmdOutputFork_ready;
  wire       [23:0]   cmdOutputFork_payload_addr;
  wire       [2:0]    cmdOutputFork_payload_id;
  wire       [7:0]    cmdOutputFork_payload_len;
  wire       [2:0]    cmdOutputFork_payload_size;
  wire       [1:0]    cmdOutputFork_payload_burst;
  wire                cmdOutputFork_payload_write;
  wire                cmdRouteFork_valid;
  reg                 cmdRouteFork_ready;
  wire       [23:0]   cmdRouteFork_payload_addr;
  wire       [2:0]    cmdRouteFork_payload_id;
  wire       [7:0]    cmdRouteFork_payload_len;
  wire       [2:0]    cmdRouteFork_payload_size;
  wire       [1:0]    cmdRouteFork_payload_burst;
  wire                cmdRouteFork_payload_write;
  reg                 io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0;
  reg                 io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1;
  wire                when_Stream_l1063;
  wire                when_Stream_l1063_1;
  wire                cmdOutputFork_fire;
  wire                cmdRouteFork_fire;
  wire                _zz_io_output_arw_payload_id;
  wire                when_Stream_l445;
  reg                 cmdRouteFork_thrown_valid;
  wire                cmdRouteFork_thrown_ready;
  wire       [23:0]   cmdRouteFork_thrown_payload_addr;
  wire       [2:0]    cmdRouteFork_thrown_payload_id;
  wire       [7:0]    cmdRouteFork_thrown_payload_len;
  wire       [2:0]    cmdRouteFork_thrown_payload_size;
  wire       [1:0]    cmdRouteFork_thrown_payload_burst;
  wire                cmdRouteFork_thrown_payload_write;
  wire                cmdRouteFork_thrown_translated_valid;
  wire                cmdRouteFork_thrown_translated_ready;
  wire                writeLogic_routeDataInput_valid;
  wire                writeLogic_routeDataInput_ready;
  wire       [31:0]   writeLogic_routeDataInput_payload_data;
  wire       [3:0]    writeLogic_routeDataInput_payload_strb;
  wire                writeLogic_routeDataInput_payload_last;
  wire                io_output_w_fire;
  wire                writeLogic_writeRspSels_0;
  wire       [0:0]    readRspIndex;
  wire                readRspSels_0;
  wire                readRspSels_1;

  assign _zz__zz_io_output_arw_payload_id = {cmdArbiter_io_chosenOH[1 : 1],cmdArbiter_io_chosenOH[0 : 0]};
  assign _zz_io_output_arw_payload_id_2 = cmdOutputFork_payload_id;
  assign _zz_io_output_arw_payload_id_1 = {1'd0, _zz_io_output_arw_payload_id_2};
  StreamArbiter_1 cmdArbiter (
    .io_inputs_0_valid         (inputsCmd_0_valid                      ), //i
    .io_inputs_0_ready         (cmdArbiter_io_inputs_0_ready           ), //o
    .io_inputs_0_payload_addr  (inputsCmd_0_payload_addr[23:0]         ), //i
    .io_inputs_0_payload_id    (inputsCmd_0_payload_id[2:0]            ), //i
    .io_inputs_0_payload_len   (inputsCmd_0_payload_len[7:0]           ), //i
    .io_inputs_0_payload_size  (inputsCmd_0_payload_size[2:0]          ), //i
    .io_inputs_0_payload_burst (inputsCmd_0_payload_burst[1:0]         ), //i
    .io_inputs_0_payload_write (inputsCmd_0_payload_write              ), //i
    .io_inputs_1_valid         (inputsCmd_1_valid                      ), //i
    .io_inputs_1_ready         (cmdArbiter_io_inputs_1_ready           ), //o
    .io_inputs_1_payload_addr  (inputsCmd_1_payload_addr[23:0]         ), //i
    .io_inputs_1_payload_id    (inputsCmd_1_payload_id[2:0]            ), //i
    .io_inputs_1_payload_len   (inputsCmd_1_payload_len[7:0]           ), //i
    .io_inputs_1_payload_size  (inputsCmd_1_payload_size[2:0]          ), //i
    .io_inputs_1_payload_burst (inputsCmd_1_payload_burst[1:0]         ), //i
    .io_inputs_1_payload_write (inputsCmd_1_payload_write              ), //i
    .io_output_valid           (cmdArbiter_io_output_valid             ), //o
    .io_output_ready           (cmdArbiter_io_output_ready             ), //i
    .io_output_payload_addr    (cmdArbiter_io_output_payload_addr[23:0]), //o
    .io_output_payload_id      (cmdArbiter_io_output_payload_id[2:0]   ), //o
    .io_output_payload_len     (cmdArbiter_io_output_payload_len[7:0]  ), //o
    .io_output_payload_size    (cmdArbiter_io_output_payload_size[2:0] ), //o
    .io_output_payload_burst   (cmdArbiter_io_output_payload_burst[1:0]), //o
    .io_output_payload_write   (cmdArbiter_io_output_payload_write     ), //o
    .io_chosen                 (cmdArbiter_io_chosen                   ), //o
    .io_chosenOH               (cmdArbiter_io_chosenOH[1:0]            ), //o
    .clk                       (clk                                    ), //i
    .reset                     (reset                                  )  //i
  );
  StreamFifoLowLatency_1 cmdRouteFork_thrown_translated_fifo (
    .io_push_valid   (cmdRouteFork_thrown_translated_valid                    ), //i
    .io_push_ready   (cmdRouteFork_thrown_translated_fifo_io_push_ready       ), //o
    .io_pop_valid    (cmdRouteFork_thrown_translated_fifo_io_pop_valid        ), //o
    .io_pop_ready    (cmdRouteFork_thrown_translated_fifo_io_pop_ready        ), //i
    .io_flush        (1'b0                                                    ), //i
    .io_occupancy    (cmdRouteFork_thrown_translated_fifo_io_occupancy[2:0]   ), //o
    .io_availability (cmdRouteFork_thrown_translated_fifo_io_availability[2:0]), //o
    .clk             (clk                                                     ), //i
    .reset           (reset                                                   )  //i
  );
  always @(*) begin
    case(readRspIndex)
      1'b0 : _zz_io_output_r_ready = io_readInputs_0_r_ready;
      default : _zz_io_output_r_ready = io_sharedInputs_0_r_ready;
    endcase
  end

  assign inputsCmd_0_valid = io_readInputs_0_ar_valid;
  assign io_readInputs_0_ar_ready = inputsCmd_0_ready;
  assign inputsCmd_0_payload_addr = io_readInputs_0_ar_payload_addr;
  assign inputsCmd_0_payload_id = io_readInputs_0_ar_payload_id;
  assign inputsCmd_0_payload_len = io_readInputs_0_ar_payload_len;
  assign inputsCmd_0_payload_size = io_readInputs_0_ar_payload_size;
  assign inputsCmd_0_payload_burst = io_readInputs_0_ar_payload_burst;
  assign inputsCmd_0_payload_write = 1'b0;
  assign inputsCmd_1_valid = io_sharedInputs_0_arw_valid;
  assign io_sharedInputs_0_arw_ready = inputsCmd_1_ready;
  assign inputsCmd_1_payload_addr = io_sharedInputs_0_arw_payload_addr;
  assign inputsCmd_1_payload_id = io_sharedInputs_0_arw_payload_id;
  assign inputsCmd_1_payload_len = io_sharedInputs_0_arw_payload_len;
  assign inputsCmd_1_payload_size = io_sharedInputs_0_arw_payload_size;
  assign inputsCmd_1_payload_burst = io_sharedInputs_0_arw_payload_burst;
  assign inputsCmd_1_payload_write = io_sharedInputs_0_arw_payload_write;
  assign inputsCmd_0_ready = cmdArbiter_io_inputs_0_ready;
  assign inputsCmd_1_ready = cmdArbiter_io_inputs_1_ready;
  always @(*) begin
    cmdArbiter_io_output_ready = 1'b1;
    if(when_Stream_l1063) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
    if(when_Stream_l1063_1) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
  end

  assign when_Stream_l1063 = ((! cmdOutputFork_ready) && io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign when_Stream_l1063_1 = ((! cmdRouteFork_ready) && io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdOutputFork_valid = (cmdArbiter_io_output_valid && io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign cmdOutputFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdOutputFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdOutputFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdOutputFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdOutputFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdOutputFork_payload_write = cmdArbiter_io_output_payload_write;
  assign cmdOutputFork_fire = (cmdOutputFork_valid && cmdOutputFork_ready);
  assign cmdRouteFork_valid = (cmdArbiter_io_output_valid && io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdRouteFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdRouteFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdRouteFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdRouteFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdRouteFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdRouteFork_payload_write = cmdArbiter_io_output_payload_write;
  assign cmdRouteFork_fire = (cmdRouteFork_valid && cmdRouteFork_ready);
  assign io_output_arw_valid = cmdOutputFork_valid;
  assign cmdOutputFork_ready = io_output_arw_ready;
  assign io_output_arw_payload_addr = cmdOutputFork_payload_addr;
  assign io_output_arw_payload_len = cmdOutputFork_payload_len;
  assign io_output_arw_payload_size = cmdOutputFork_payload_size;
  assign io_output_arw_payload_burst = cmdOutputFork_payload_burst;
  assign io_output_arw_payload_write = cmdOutputFork_payload_write;
  assign _zz_io_output_arw_payload_id = _zz__zz_io_output_arw_payload_id[1];
  assign io_output_arw_payload_id = (cmdOutputFork_payload_write ? _zz_io_output_arw_payload_id_1 : {_zz_io_output_arw_payload_id,cmdOutputFork_payload_id});
  assign when_Stream_l445 = (! cmdRouteFork_payload_write);
  always @(*) begin
    cmdRouteFork_thrown_valid = cmdRouteFork_valid;
    if(when_Stream_l445) begin
      cmdRouteFork_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    cmdRouteFork_ready = cmdRouteFork_thrown_ready;
    if(when_Stream_l445) begin
      cmdRouteFork_ready = 1'b1;
    end
  end

  assign cmdRouteFork_thrown_payload_addr = cmdRouteFork_payload_addr;
  assign cmdRouteFork_thrown_payload_id = cmdRouteFork_payload_id;
  assign cmdRouteFork_thrown_payload_len = cmdRouteFork_payload_len;
  assign cmdRouteFork_thrown_payload_size = cmdRouteFork_payload_size;
  assign cmdRouteFork_thrown_payload_burst = cmdRouteFork_payload_burst;
  assign cmdRouteFork_thrown_payload_write = cmdRouteFork_payload_write;
  assign cmdRouteFork_thrown_translated_valid = cmdRouteFork_thrown_valid;
  assign cmdRouteFork_thrown_ready = cmdRouteFork_thrown_translated_ready;
  assign cmdRouteFork_thrown_translated_ready = cmdRouteFork_thrown_translated_fifo_io_push_ready;
  assign writeLogic_routeDataInput_valid = io_sharedInputs_0_w_valid;
  assign writeLogic_routeDataInput_ready = io_sharedInputs_0_w_ready;
  assign writeLogic_routeDataInput_payload_data = io_sharedInputs_0_w_payload_data;
  assign writeLogic_routeDataInput_payload_strb = io_sharedInputs_0_w_payload_strb;
  assign writeLogic_routeDataInput_payload_last = io_sharedInputs_0_w_payload_last;
  assign io_output_w_valid = (cmdRouteFork_thrown_translated_fifo_io_pop_valid && writeLogic_routeDataInput_valid);
  assign io_output_w_payload_data = writeLogic_routeDataInput_payload_data;
  assign io_output_w_payload_strb = writeLogic_routeDataInput_payload_strb;
  assign io_output_w_payload_last = writeLogic_routeDataInput_payload_last;
  assign io_sharedInputs_0_w_ready = ((cmdRouteFork_thrown_translated_fifo_io_pop_valid && io_output_w_ready) && 1'b1);
  assign io_output_w_fire = (io_output_w_valid && io_output_w_ready);
  assign cmdRouteFork_thrown_translated_fifo_io_pop_ready = (io_output_w_fire && io_output_w_payload_last);
  assign writeLogic_writeRspSels_0 = 1'b1;
  assign io_sharedInputs_0_b_valid = (io_output_b_valid && writeLogic_writeRspSels_0);
  assign io_sharedInputs_0_b_payload_resp = io_output_b_payload_resp;
  assign io_sharedInputs_0_b_payload_id = io_output_b_payload_id[2:0];
  assign io_output_b_ready = io_sharedInputs_0_b_ready;
  assign readRspIndex = io_output_r_payload_id[3 : 3];
  assign readRspSels_0 = (readRspIndex == 1'b0);
  assign readRspSels_1 = (readRspIndex == 1'b1);
  assign io_readInputs_0_r_valid = (io_output_r_valid && readRspSels_0);
  assign io_readInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_readInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_readInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_readInputs_0_r_payload_id = io_output_r_payload_id[2:0];
  assign io_sharedInputs_0_r_valid = (io_output_r_valid && readRspSels_1);
  assign io_sharedInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_sharedInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_sharedInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_sharedInputs_0_r_payload_id = io_output_r_payload_id[2:0];
  assign io_output_r_ready = _zz_io_output_r_ready;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
      io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
    end else begin
      if(cmdOutputFork_fire) begin
        io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b0;
      end
      if(cmdRouteFork_fire) begin
        io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b0;
      end
      if(cmdArbiter_io_output_ready) begin
        io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
        io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
      end
    end
  end


endmodule

module Axi4SharedDecoder (
  input  wire          io_input_arw_valid,
  output wire          io_input_arw_ready,
  input  wire [31:0]   io_input_arw_payload_addr,
  input  wire          io_input_arw_payload_write,
  input  wire          io_input_w_valid,
  output wire          io_input_w_ready,
  input  wire [31:0]   io_input_w_payload_data,
  input  wire [3:0]    io_input_w_payload_strb,
  input  wire          io_input_w_payload_last,
  output wire          io_input_b_valid,
  input  wire          io_input_b_ready,
  output wire          io_input_r_valid,
  input  wire          io_input_r_ready,
  output wire [31:0]   io_input_r_payload_data,
  output reg           io_input_r_payload_last,
  output wire          io_sharedOutputs_0_arw_valid,
  input  wire          io_sharedOutputs_0_arw_ready,
  output wire [31:0]   io_sharedOutputs_0_arw_payload_addr,
  output wire          io_sharedOutputs_0_arw_payload_write,
  output wire          io_sharedOutputs_0_w_valid,
  input  wire          io_sharedOutputs_0_w_ready,
  output wire [31:0]   io_sharedOutputs_0_w_payload_data,
  output wire [3:0]    io_sharedOutputs_0_w_payload_strb,
  output wire          io_sharedOutputs_0_w_payload_last,
  input  wire          io_sharedOutputs_0_b_valid,
  output wire          io_sharedOutputs_0_b_ready,
  input  wire          io_sharedOutputs_0_r_valid,
  output wire          io_sharedOutputs_0_r_ready,
  input  wire [31:0]   io_sharedOutputs_0_r_payload_data,
  input  wire          io_sharedOutputs_0_r_payload_last,
  output wire          io_sharedOutputs_1_arw_valid,
  input  wire          io_sharedOutputs_1_arw_ready,
  output wire [31:0]   io_sharedOutputs_1_arw_payload_addr,
  output wire          io_sharedOutputs_1_arw_payload_write,
  output wire          io_sharedOutputs_1_w_valid,
  input  wire          io_sharedOutputs_1_w_ready,
  output wire [31:0]   io_sharedOutputs_1_w_payload_data,
  output wire [3:0]    io_sharedOutputs_1_w_payload_strb,
  output wire          io_sharedOutputs_1_w_payload_last,
  input  wire          io_sharedOutputs_1_b_valid,
  output wire          io_sharedOutputs_1_b_ready,
  input  wire          io_sharedOutputs_1_r_valid,
  output wire          io_sharedOutputs_1_r_ready,
  input  wire [31:0]   io_sharedOutputs_1_r_payload_data,
  input  wire          io_sharedOutputs_1_r_payload_last,
  input  wire          clk,
  input  wire          reset
);

  wire                errorSlave_io_axi_arw_valid;
  wire                errorSlave_io_axi_w_valid;
  wire                errorSlave_io_axi_arw_ready;
  wire                errorSlave_io_axi_w_ready;
  wire                errorSlave_io_axi_b_valid;
  wire                errorSlave_io_axi_r_valid;
  wire       [31:0]   errorSlave_io_axi_r_payload_data;
  wire                errorSlave_io_axi_r_payload_last;
  wire       [1:0]    _zz__zz_writeRspIndex;
  wire       [1:0]    _zz__zz_readRspIndex;
  reg        [31:0]   _zz_io_input_r_payload_data;
  reg                 _zz_io_input_r_payload_last;
  reg        [2:0]    _zz_pendingCmdCounter;
  reg        [2:0]    _zz_pendingCmdCounter_1;
  reg        [2:0]    _zz_pendingCmdCounter_2;
  wire                cmdAllowedStart;
  wire                io_input_arw_fire;
  wire                io_input_b_fire;
  wire                io_input_r_fire;
  wire                when_Utils_l766;
  reg        [2:0]    pendingCmdCounter;
  wire       [2:0]    _zz_pendingCmdCounter_3;
  wire                when_Utils_l706;
  wire                io_input_w_fire;
  wire                when_Utils_l709;
  reg                 pendingDataCounter_incrementIt;
  reg                 pendingDataCounter_decrementIt;
  wire       [2:0]    pendingDataCounter_valueNext;
  reg        [2:0]    pendingDataCounter_value;
  wire                pendingDataCounter_mayOverflow;
  wire                pendingDataCounter_willOverflowIfInc;
  wire                pendingDataCounter_willOverflow;
  reg        [2:0]    pendingDataCounter_finalIncrement;
  wire                when_Utils_l735;
  wire                when_Utils_l737;
  wire       [1:0]    decodedCmdSels;
  wire                decodedCmdError;
  reg        [1:0]    pendingSels;
  reg                 pendingError;
  wire                allowCmd;
  wire                allowData;
  reg                 _zz_cmdAllowedStart;
  wire       [1:0]    _zz_io_sharedOutputs_0_arw_valid;
  wire       [1:0]    _zz_io_sharedOutputs_0_w_valid;
  wire                _zz_writeRspIndex;
  wire       [0:0]    writeRspIndex;
  wire                _zz_readRspIndex;
  wire       [0:0]    readRspIndex;

  assign _zz__zz_writeRspIndex = pendingSels[1 : 0];
  assign _zz__zz_readRspIndex = pendingSels[1 : 0];
  Axi4SharedErrorSlave errorSlave (
    .io_axi_arw_valid         (errorSlave_io_axi_arw_valid           ), //i
    .io_axi_arw_ready         (errorSlave_io_axi_arw_ready           ), //o
    .io_axi_arw_payload_addr  (io_input_arw_payload_addr[31:0]       ), //i
    .io_axi_arw_payload_write (io_input_arw_payload_write            ), //i
    .io_axi_w_valid           (errorSlave_io_axi_w_valid             ), //i
    .io_axi_w_ready           (errorSlave_io_axi_w_ready             ), //o
    .io_axi_w_payload_data    (io_input_w_payload_data[31:0]         ), //i
    .io_axi_w_payload_strb    (io_input_w_payload_strb[3:0]          ), //i
    .io_axi_w_payload_last    (io_input_w_payload_last               ), //i
    .io_axi_b_valid           (errorSlave_io_axi_b_valid             ), //o
    .io_axi_b_ready           (io_input_b_ready                      ), //i
    .io_axi_r_valid           (errorSlave_io_axi_r_valid             ), //o
    .io_axi_r_ready           (io_input_r_ready                      ), //i
    .io_axi_r_payload_data    (errorSlave_io_axi_r_payload_data[31:0]), //o
    .io_axi_r_payload_last    (errorSlave_io_axi_r_payload_last      ), //o
    .clk                      (clk                                   ), //i
    .reset                    (reset                                 )  //i
  );
  always @(*) begin
    case(readRspIndex)
      1'b0 : begin
        _zz_io_input_r_payload_data = io_sharedOutputs_0_r_payload_data;
        _zz_io_input_r_payload_last = io_sharedOutputs_0_r_payload_last;
      end
      default : begin
        _zz_io_input_r_payload_data = io_sharedOutputs_1_r_payload_data;
        _zz_io_input_r_payload_last = io_sharedOutputs_1_r_payload_last;
      end
    endcase
  end

  always @(*) begin
    _zz_pendingCmdCounter = _zz_pendingCmdCounter_1;
    if(when_Utils_l766) begin
      _zz_pendingCmdCounter = (_zz_pendingCmdCounter_1 - 3'b001);
    end
  end

  always @(*) begin
    _zz_pendingCmdCounter_1 = _zz_pendingCmdCounter_2;
    if(io_input_b_fire) begin
      _zz_pendingCmdCounter_1 = (_zz_pendingCmdCounter_2 - 3'b001);
    end
  end

  always @(*) begin
    _zz_pendingCmdCounter_2 = _zz_pendingCmdCounter_3;
    if(io_input_arw_fire) begin
      _zz_pendingCmdCounter_2 = (_zz_pendingCmdCounter_3 + 3'b001);
    end
  end

  assign io_input_arw_fire = (io_input_arw_valid && io_input_arw_ready);
  assign io_input_b_fire = (io_input_b_valid && io_input_b_ready);
  assign io_input_r_fire = (io_input_r_valid && io_input_r_ready);
  assign when_Utils_l766 = (io_input_r_fire && io_input_r_payload_last);
  assign _zz_pendingCmdCounter_3 = pendingCmdCounter;
  assign when_Utils_l706 = (cmdAllowedStart && io_input_arw_payload_write);
  assign io_input_w_fire = (io_input_w_valid && io_input_w_ready);
  assign when_Utils_l709 = (io_input_w_fire && io_input_w_payload_last);
  always @(*) begin
    pendingDataCounter_incrementIt = 1'b0;
    if(when_Utils_l706) begin
      pendingDataCounter_incrementIt = 1'b1;
    end
  end

  always @(*) begin
    pendingDataCounter_decrementIt = 1'b0;
    if(when_Utils_l709) begin
      pendingDataCounter_decrementIt = 1'b1;
    end
  end

  assign pendingDataCounter_mayOverflow = (pendingDataCounter_value == 3'b111);
  assign pendingDataCounter_willOverflowIfInc = (pendingDataCounter_mayOverflow && (! pendingDataCounter_decrementIt));
  assign pendingDataCounter_willOverflow = (pendingDataCounter_willOverflowIfInc && pendingDataCounter_incrementIt);
  assign when_Utils_l735 = (pendingDataCounter_incrementIt && (! pendingDataCounter_decrementIt));
  always @(*) begin
    if(when_Utils_l735) begin
      pendingDataCounter_finalIncrement = 3'b001;
    end else begin
      if(when_Utils_l737) begin
        pendingDataCounter_finalIncrement = 3'b111;
      end else begin
        pendingDataCounter_finalIncrement = 3'b000;
      end
    end
  end

  assign when_Utils_l737 = ((! pendingDataCounter_incrementIt) && pendingDataCounter_decrementIt);
  assign pendingDataCounter_valueNext = (pendingDataCounter_value + pendingDataCounter_finalIncrement);
  assign decodedCmdSels = {((io_input_arw_payload_addr & (~ 32'h3fffffff)) == 32'h0),((32'h80000000 <= io_input_arw_payload_addr) && (io_input_arw_payload_addr < 32'h80a00000))};
  assign decodedCmdError = (decodedCmdSels == 2'b00);
  assign allowCmd = ((pendingCmdCounter == 3'b000) || ((pendingCmdCounter != 3'b111) && (pendingSels == decodedCmdSels)));
  assign allowData = (pendingDataCounter_value != 3'b000);
  assign cmdAllowedStart = ((io_input_arw_valid && allowCmd) && _zz_cmdAllowedStart);
  assign io_input_arw_ready = (((|(decodedCmdSels & {io_sharedOutputs_1_arw_ready,io_sharedOutputs_0_arw_ready})) || (decodedCmdError && errorSlave_io_axi_arw_ready)) && allowCmd);
  assign errorSlave_io_axi_arw_valid = ((io_input_arw_valid && decodedCmdError) && allowCmd);
  assign _zz_io_sharedOutputs_0_arw_valid = decodedCmdSels[1 : 0];
  assign io_sharedOutputs_0_arw_valid = ((io_input_arw_valid && _zz_io_sharedOutputs_0_arw_valid[0]) && allowCmd);
  assign io_sharedOutputs_0_arw_payload_addr = io_input_arw_payload_addr;
  assign io_sharedOutputs_0_arw_payload_write = io_input_arw_payload_write;
  assign io_sharedOutputs_1_arw_valid = ((io_input_arw_valid && _zz_io_sharedOutputs_0_arw_valid[1]) && allowCmd);
  assign io_sharedOutputs_1_arw_payload_addr = io_input_arw_payload_addr;
  assign io_sharedOutputs_1_arw_payload_write = io_input_arw_payload_write;
  assign io_input_w_ready = (((|(pendingSels[1 : 0] & {io_sharedOutputs_1_w_ready,io_sharedOutputs_0_w_ready})) || (pendingError && errorSlave_io_axi_w_ready)) && allowData);
  assign errorSlave_io_axi_w_valid = ((io_input_w_valid && pendingError) && allowData);
  assign _zz_io_sharedOutputs_0_w_valid = pendingSels[1 : 0];
  assign io_sharedOutputs_0_w_valid = ((io_input_w_valid && _zz_io_sharedOutputs_0_w_valid[0]) && allowData);
  assign io_sharedOutputs_0_w_payload_data = io_input_w_payload_data;
  assign io_sharedOutputs_0_w_payload_strb = io_input_w_payload_strb;
  assign io_sharedOutputs_0_w_payload_last = io_input_w_payload_last;
  assign io_sharedOutputs_1_w_valid = ((io_input_w_valid && _zz_io_sharedOutputs_0_w_valid[1]) && allowData);
  assign io_sharedOutputs_1_w_payload_data = io_input_w_payload_data;
  assign io_sharedOutputs_1_w_payload_strb = io_input_w_payload_strb;
  assign io_sharedOutputs_1_w_payload_last = io_input_w_payload_last;
  assign _zz_writeRspIndex = _zz__zz_writeRspIndex[1];
  assign writeRspIndex = _zz_writeRspIndex;
  assign io_input_b_valid = ((|{io_sharedOutputs_1_b_valid,io_sharedOutputs_0_b_valid}) || errorSlave_io_axi_b_valid);
  assign io_sharedOutputs_0_b_ready = io_input_b_ready;
  assign io_sharedOutputs_1_b_ready = io_input_b_ready;
  assign _zz_readRspIndex = _zz__zz_readRspIndex[1];
  assign readRspIndex = _zz_readRspIndex;
  assign io_input_r_valid = ((|{io_sharedOutputs_1_r_valid,io_sharedOutputs_0_r_valid}) || errorSlave_io_axi_r_valid);
  assign io_input_r_payload_data = _zz_io_input_r_payload_data;
  always @(*) begin
    io_input_r_payload_last = _zz_io_input_r_payload_last;
    if(pendingError) begin
      io_input_r_payload_last = errorSlave_io_axi_r_payload_last;
    end
  end

  assign io_sharedOutputs_0_r_ready = io_input_r_ready;
  assign io_sharedOutputs_1_r_ready = io_input_r_ready;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      pendingCmdCounter <= 3'b000;
      pendingDataCounter_value <= 3'b000;
      pendingSels <= 2'b00;
      pendingError <= 1'b0;
      _zz_cmdAllowedStart <= 1'b1;
    end else begin
      pendingCmdCounter <= _zz_pendingCmdCounter;
      pendingDataCounter_value <= pendingDataCounter_valueNext;
      if(cmdAllowedStart) begin
        pendingSels <= decodedCmdSels;
      end
      if(cmdAllowedStart) begin
        pendingError <= decodedCmdError;
      end
      if(cmdAllowedStart) begin
        _zz_cmdAllowedStart <= 1'b0;
      end
      if(io_input_arw_ready) begin
        _zz_cmdAllowedStart <= 1'b1;
      end
    end
  end


endmodule

module Axi4ReadOnlyDecoder (
  input  wire          io_input_ar_valid,
  output wire          io_input_ar_ready,
  input  wire [31:0]   io_input_ar_payload_addr,
  output reg           io_input_r_valid,
  input  wire          io_input_r_ready,
  output wire [31:0]   io_input_r_payload_data,
  output reg           io_input_r_payload_last,
  output wire          io_outputs_0_ar_valid,
  input  wire          io_outputs_0_ar_ready,
  output wire [31:0]   io_outputs_0_ar_payload_addr,
  input  wire          io_outputs_0_r_valid,
  output wire          io_outputs_0_r_ready,
  input  wire [31:0]   io_outputs_0_r_payload_data,
  input  wire          io_outputs_0_r_payload_last,
  input  wire          clk,
  input  wire          reset
);

  wire                errorSlave_io_axi_ar_valid;
  wire                errorSlave_io_axi_ar_ready;
  wire                errorSlave_io_axi_r_valid;
  wire       [31:0]   errorSlave_io_axi_r_payload_data;
  wire                errorSlave_io_axi_r_payload_last;
  wire                io_input_ar_fire;
  wire                io_input_r_fire;
  wire                when_Utils_l709;
  reg                 pendingCmdCounter_incrementIt;
  reg                 pendingCmdCounter_decrementIt;
  wire       [2:0]    pendingCmdCounter_valueNext;
  reg        [2:0]    pendingCmdCounter_value;
  wire                pendingCmdCounter_mayOverflow;
  wire                pendingCmdCounter_willOverflowIfInc;
  wire                pendingCmdCounter_willOverflow;
  reg        [2:0]    pendingCmdCounter_finalIncrement;
  wire                when_Utils_l735;
  wire                when_Utils_l737;
  wire       [0:0]    decodedCmdSels;
  wire                decodedCmdError;
  reg        [0:0]    pendingSels;
  reg                 pendingError;
  wire                allowCmd;

  Axi4ReadOnlyErrorSlave errorSlave (
    .io_axi_ar_valid        (errorSlave_io_axi_ar_valid            ), //i
    .io_axi_ar_ready        (errorSlave_io_axi_ar_ready            ), //o
    .io_axi_ar_payload_addr (io_input_ar_payload_addr[31:0]        ), //i
    .io_axi_r_valid         (errorSlave_io_axi_r_valid             ), //o
    .io_axi_r_ready         (io_input_r_ready                      ), //i
    .io_axi_r_payload_data  (errorSlave_io_axi_r_payload_data[31:0]), //o
    .io_axi_r_payload_last  (errorSlave_io_axi_r_payload_last      ), //o
    .clk                    (clk                                   ), //i
    .reset                  (reset                                 )  //i
  );
  assign io_input_ar_fire = (io_input_ar_valid && io_input_ar_ready);
  assign io_input_r_fire = (io_input_r_valid && io_input_r_ready);
  assign when_Utils_l709 = (io_input_r_fire && io_input_r_payload_last);
  always @(*) begin
    pendingCmdCounter_incrementIt = 1'b0;
    if(io_input_ar_fire) begin
      pendingCmdCounter_incrementIt = 1'b1;
    end
  end

  always @(*) begin
    pendingCmdCounter_decrementIt = 1'b0;
    if(when_Utils_l709) begin
      pendingCmdCounter_decrementIt = 1'b1;
    end
  end

  assign pendingCmdCounter_mayOverflow = (pendingCmdCounter_value == 3'b111);
  assign pendingCmdCounter_willOverflowIfInc = (pendingCmdCounter_mayOverflow && (! pendingCmdCounter_decrementIt));
  assign pendingCmdCounter_willOverflow = (pendingCmdCounter_willOverflowIfInc && pendingCmdCounter_incrementIt);
  assign when_Utils_l735 = (pendingCmdCounter_incrementIt && (! pendingCmdCounter_decrementIt));
  always @(*) begin
    if(when_Utils_l735) begin
      pendingCmdCounter_finalIncrement = 3'b001;
    end else begin
      if(when_Utils_l737) begin
        pendingCmdCounter_finalIncrement = 3'b111;
      end else begin
        pendingCmdCounter_finalIncrement = 3'b000;
      end
    end
  end

  assign when_Utils_l737 = ((! pendingCmdCounter_incrementIt) && pendingCmdCounter_decrementIt);
  assign pendingCmdCounter_valueNext = (pendingCmdCounter_value + pendingCmdCounter_finalIncrement);
  assign decodedCmdSels = (((32'h80000000 <= io_input_ar_payload_addr) && (io_input_ar_payload_addr < 32'h80a00000)) && io_input_ar_valid);
  assign decodedCmdError = (decodedCmdSels == 1'b0);
  assign allowCmd = ((pendingCmdCounter_value == 3'b000) || ((pendingCmdCounter_value != 3'b111) && (pendingSels == decodedCmdSels)));
  assign io_input_ar_ready = (((|(decodedCmdSels & io_outputs_0_ar_ready)) || (decodedCmdError && errorSlave_io_axi_ar_ready)) && allowCmd);
  assign errorSlave_io_axi_ar_valid = ((io_input_ar_valid && decodedCmdError) && allowCmd);
  assign io_outputs_0_ar_valid = ((io_input_ar_valid && decodedCmdSels[0]) && allowCmd);
  assign io_outputs_0_ar_payload_addr = io_input_ar_payload_addr;
  always @(*) begin
    io_input_r_valid = (|io_outputs_0_r_valid);
    if(errorSlave_io_axi_r_valid) begin
      io_input_r_valid = 1'b1;
    end
  end

  assign io_input_r_payload_data = io_outputs_0_r_payload_data;
  always @(*) begin
    io_input_r_payload_last = io_outputs_0_r_payload_last;
    if(pendingError) begin
      io_input_r_payload_last = errorSlave_io_axi_r_payload_last;
    end
  end

  assign io_outputs_0_r_ready = io_input_r_ready;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      pendingCmdCounter_value <= 3'b000;
      pendingSels <= 1'b0;
      pendingError <= 1'b0;
    end else begin
      pendingCmdCounter_value <= pendingCmdCounter_valueNext;
      if(io_input_ar_ready) begin
        pendingSels <= decodedCmdSels;
      end
      if(io_input_ar_ready) begin
        pendingError <= decodedCmdError;
      end
    end
  end


endmodule

module Axi4SharedToApb3Bridge (
  input  wire          io_axi_arw_valid,
  output reg           io_axi_arw_ready,
  input  wire [31:0]   io_axi_arw_payload_addr,
  input  wire [3:0]    io_axi_arw_payload_id,
  input  wire [7:0]    io_axi_arw_payload_len,
  input  wire [2:0]    io_axi_arw_payload_size,
  input  wire [1:0]    io_axi_arw_payload_burst,
  input  wire          io_axi_arw_payload_write,
  input  wire          io_axi_w_valid,
  output reg           io_axi_w_ready,
  input  wire [31:0]   io_axi_w_payload_data,
  input  wire [3:0]    io_axi_w_payload_strb,
  input  wire          io_axi_w_payload_last,
  output reg           io_axi_b_valid,
  input  wire          io_axi_b_ready,
  output wire [3:0]    io_axi_b_payload_id,
  output wire [1:0]    io_axi_b_payload_resp,
  output reg           io_axi_r_valid,
  input  wire          io_axi_r_ready,
  output wire [31:0]   io_axi_r_payload_data,
  output wire [3:0]    io_axi_r_payload_id,
  output wire [1:0]    io_axi_r_payload_resp,
  output wire          io_axi_r_payload_last,
  output wire [31:0]   io_apb_PADDR,
  output reg  [0:0]    io_apb_PSEL,
  output reg           io_apb_PENABLE,
  input  wire          io_apb_PREADY,
  output wire          io_apb_PWRITE,
  output wire [31:0]   io_apb_PWDATA,
  input  wire [31:0]   io_apb_PRDATA,
  input  wire          io_apb_PSLVERROR,
  input  wire          clk,
  input  wire          reset
);
  localparam Axi4ToApb3BridgePhase_SETUP = 2'd0;
  localparam Axi4ToApb3BridgePhase_ACCESS_1 = 2'd1;
  localparam Axi4ToApb3BridgePhase_RESPONSE = 2'd2;

  reg        [1:0]    phase;
  reg                 write;
  reg        [31:0]   readedData;
  reg        [3:0]    id;
  wire                when_Axi4SharedToApb3Bridge_l91;
  wire                when_Axi4SharedToApb3Bridge_l97;
  `ifndef SYNTHESIS
  reg [63:0] phase_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : phase_string = "SETUP   ";
      Axi4ToApb3BridgePhase_ACCESS_1 : phase_string = "ACCESS_1";
      Axi4ToApb3BridgePhase_RESPONSE : phase_string = "RESPONSE";
      default : phase_string = "????????";
    endcase
  end
  `endif

  always @(*) begin
    io_axi_arw_ready = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
        if(when_Axi4SharedToApb3Bridge_l91) begin
          if(when_Axi4SharedToApb3Bridge_l97) begin
            io_axi_arw_ready = 1'b1;
          end
        end
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
        if(io_apb_PREADY) begin
          io_axi_arw_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axi_w_ready = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
        if(when_Axi4SharedToApb3Bridge_l91) begin
          if(when_Axi4SharedToApb3Bridge_l97) begin
            io_axi_w_ready = 1'b1;
          end
        end
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
        if(io_apb_PREADY) begin
          io_axi_w_ready = write;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axi_b_valid = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
      end
      default : begin
        if(write) begin
          io_axi_b_valid = 1'b1;
        end
      end
    endcase
  end

  always @(*) begin
    io_axi_r_valid = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
      end
      default : begin
        if(!write) begin
          io_axi_r_valid = 1'b1;
        end
      end
    endcase
  end

  always @(*) begin
    io_apb_PSEL[0] = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
        if(when_Axi4SharedToApb3Bridge_l91) begin
          io_apb_PSEL[0] = 1'b1;
          if(when_Axi4SharedToApb3Bridge_l97) begin
            io_apb_PSEL[0] = 1'b0;
          end
        end
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
        io_apb_PSEL[0] = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_apb_PENABLE = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
        io_apb_PENABLE = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign when_Axi4SharedToApb3Bridge_l91 = (io_axi_arw_valid && ((! io_axi_arw_payload_write) || io_axi_w_valid));
  assign when_Axi4SharedToApb3Bridge_l97 = (io_axi_arw_payload_write && (io_axi_w_payload_strb == 4'b0000));
  assign io_apb_PADDR = io_axi_arw_payload_addr;
  assign io_apb_PWDATA = io_axi_w_payload_data;
  assign io_apb_PWRITE = io_axi_arw_payload_write;
  assign io_axi_r_payload_resp = {io_apb_PSLVERROR,1'b0};
  assign io_axi_b_payload_resp = {io_apb_PSLVERROR,1'b0};
  assign io_axi_r_payload_id = id;
  assign io_axi_b_payload_id = id;
  assign io_axi_r_payload_data = readedData;
  assign io_axi_r_payload_last = 1'b1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      phase <= Axi4ToApb3BridgePhase_SETUP;
    end else begin
      case(phase)
        Axi4ToApb3BridgePhase_SETUP : begin
          if(when_Axi4SharedToApb3Bridge_l91) begin
            phase <= Axi4ToApb3BridgePhase_ACCESS_1;
            if(when_Axi4SharedToApb3Bridge_l97) begin
              phase <= Axi4ToApb3BridgePhase_RESPONSE;
            end
          end
        end
        Axi4ToApb3BridgePhase_ACCESS_1 : begin
          if(io_apb_PREADY) begin
            phase <= Axi4ToApb3BridgePhase_RESPONSE;
          end
        end
        default : begin
          if(write) begin
            if(io_axi_b_ready) begin
              phase <= Axi4ToApb3BridgePhase_SETUP;
            end
          end else begin
            if(io_axi_r_ready) begin
              phase <= Axi4ToApb3BridgePhase_SETUP;
            end
          end
        end
      endcase
    end
  end

  always @(posedge clk) begin
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
        write <= io_axi_arw_payload_write;
        id <= io_axi_arw_payload_id;
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
        if(io_apb_PREADY) begin
          readedData <= io_apb_PRDATA;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module Pipeline (
  input  wire          reset,
  input  wire          mtimer_update,
  input  wire          mtimer_interruptPending,
  input  wire          external_update,
  input  wire          external_interruptPending,
  output wire          ibus_cmd_valid,
  input  wire          ibus_cmd_ready,
  output wire [31:0]   ibus_cmd_payload_address,
  input  wire          ibus_rsp_valid,
  output wire          ibus_rsp_ready,
  input  wire [31:0]   ibus_rsp_payload_rdata,
  output wire          dbus_cmd_valid,
  input  wire          dbus_cmd_ready,
  output wire [31:0]   dbus_cmd_payload_address,
  output wire          dbus_cmd_payload_write,
  output wire [31:0]   dbus_cmd_payload_wdata,
  output wire [3:0]    dbus_cmd_payload_wmask,
  input  wire          dbus_rsp_valid,
  output wire          dbus_rsp_ready,
  input  wire [31:0]   dbus_rsp_payload_rdata,
  input  wire          clk
);
  localparam RegisterType_NONE = 1'd0;
  localparam RegisterType_GPR = 1'd1;
  localparam BranchCondition_NONE = 3'd0;
  localparam BranchCondition_EQ = 3'd1;
  localparam BranchCondition_NE = 3'd2;
  localparam BranchCondition_LT = 3'd3;
  localparam BranchCondition_GE = 3'd4;
  localparam BranchCondition_LTU = 3'd5;
  localparam BranchCondition_GEU = 3'd6;
  localparam LsuOperationType_NONE = 2'd0;
  localparam LsuOperationType_LOAD = 2'd1;
  localparam LsuOperationType_STORE = 2'd2;
  localparam CsrOp_NONE = 2'd0;
  localparam CsrOp_RW = 2'd1;
  localparam CsrOp_RS = 2'd2;
  localparam CsrOp_RC = 2'd3;
  localparam ShiftOp_NONE = 2'd0;
  localparam ShiftOp_SLL_1 = 2'd1;
  localparam ShiftOp_SRL_1 = 2'd2;
  localparam ShiftOp_SRA_1 = 2'd3;
  localparam Src1Select_RS1 = 1'd0;
  localparam Src1Select_PC = 1'd1;
  localparam AluOp_ADD = 3'd0;
  localparam AluOp_SUB = 3'd1;
  localparam AluOp_SLT = 3'd2;
  localparam AluOp_SLTU = 3'd3;
  localparam AluOp_XOR_1 = 3'd4;
  localparam AluOp_OR_1 = 3'd5;
  localparam AluOp_AND_1 = 3'd6;
  localparam AluOp_SRC2 = 3'd7;
  localparam Src2Select_RS2 = 1'd0;
  localparam Src2Select_IMM = 1'd1;
  localparam LsuAccessWidth_B = 2'd0;
  localparam LsuAccessWidth_H = 2'd1;
  localparam LsuAccessWidth_W = 2'd2;

  reg                 fetch_arbitration_isValid;
  wire                fetch_arbitration_isStalled;
  reg                 decode_arbitration_isValid;
  wire                decode_arbitration_isStalled;
  reg                 execute_arbitration_isValid;
  reg                 execute_arbitration_isStalled;
  reg        [31:0]   execute_in_RS1_DATA;
  reg        [31:0]   execute_in_RS2_DATA;
  reg                 memory_arbitration_isValid;
  reg                 memory_arbitration_isStalled;
  reg        [31:0]   memory_in_RS2_DATA;
  reg        [31:0]   memory_in_RS1_DATA;
  reg                 writeback_arbitration_isValid;
  wire                writeback_arbitration_isStalled;
  reg        [31:0]   writeback_in_RS1_DATA;
  reg        [31:0]   pipelineRegs_ID_1_in_RS1_DATA;
  reg                 pipelineRegs_ID_1_shift_RS1_DATA;
  reg        [31:0]   pipelineRegs_ID_1_in_RS2_DATA;
  reg                 pipelineRegs_ID_1_shift_RS2_DATA;
  reg        [31:0]   pipelineRegs_EX_1_in_RS1_DATA;
  reg                 pipelineRegs_EX_1_shift_RS1_DATA;
  reg        [31:0]   pipelineRegs_EX_1_in_RS2_DATA;
  reg                 pipelineRegs_EX_1_shift_RS2_DATA;
  reg        [31:0]   pipelineRegs_MEM_1_in_RS1_DATA;
  reg                 pipelineRegs_MEM_1_shift_RS1_DATA;
  wire                fetch_arbitration_isReady;
  wire                fetch_arbitration_isDone;
  wire                fetch_arbitration_rs1Needed;
  wire                fetch_arbitration_rs2Needed;
  wire                fetch_arbitration_jumpRequested;
  wire                fetch_arbitration_isAvailable;
  wire                fetch_Fetcher_ibus_cmd_valid;
  wire       [31:0]   fetch_Fetcher_ibus_cmd_payload_address;
  wire                fetch_Fetcher_ibus_rsp_ready;
  wire       [31:0]   fetch_out_NEXT_PC;
  wire       [31:0]   fetch_out_IR;
  wire                fetch_out_HAS_TRAPPED;
  wire                fetch_out_TRAP_IS_INTERRUPT;
  wire       [3:0]    fetch_out_TRAP_CAUSE;
  wire       [31:0]   fetch_out_TRAP_VAL;
  wire       [31:0]   fetch_out_PC;
  wire                decode_arbitration_isReady;
  wire                decode_arbitration_isDone;
  wire                decode_arbitration_rs1Needed;
  wire                decode_arbitration_rs2Needed;
  wire                decode_arbitration_jumpRequested;
  wire                decode_arbitration_isAvailable;
  wire       [2:0]    decode_out_BU_CONDITION;
  wire       [1:0]    decode_out_LSU_OPERATION_TYPE;
  wire       [1:0]    decode_out_CSR_OP;
  wire       [1:0]    decode_out_SHIFT_OP;
  wire                decode_out_ECALL;
  wire                decode_out_LSU_IS_EXTERNAL_OP;
  wire                decode_out_REM;
  wire                decode_out_MUL_HIGH;
  wire                decode_out_BU_WRITE_RET_ADDR_TO_RD;
  wire                decode_out_LSU_IS_UNSIGNED;
  wire                decode_out_EBREAK;
  wire                decode_out_MUL;
  wire                decode_out_DIV;
  wire                decode_out_MULDIV_RS2_SIGNED;
  wire                decode_out_RD_DATA_VALID;
  wire                decode_out_BU_IGNORE_TARGET_LSB;
  wire                decode_out_MRET;
  wire                decode_out_CSR_USE_IMM;
  wire                decode_out_BU_IS_BRANCH;
  wire                decode_out_MULDIV_RS1_SIGNED;
  wire       [31:0]   decode_out_IMM;
  wire       [0:0]    decode_out_ALU_SRC1;
  wire                decode_out_ALU_COMMIT_RESULT;
  wire       [4:0]    decode_out_RS1;
  wire       [4:0]    decode_out_RS2;
  wire       [4:0]    decode_out_RD;
  wire                decode_out_IMM_USED;
  wire       [0:0]    decode_out_RS1_TYPE;
  wire       [0:0]    decode_out_RS2_TYPE;
  wire       [0:0]    decode_out_RD_TYPE;
  wire       [2:0]    decode_out_ALU_OP;
  wire       [0:0]    decode_out_ALU_SRC2;
  wire       [1:0]    decode_out_LSU_ACCESS_WIDTH;
  wire                decode_out_LSU_TARGET_VALID;
  wire       [4:0]    decode_RegisterFileAccessor_regFileIo_rs1;
  wire       [4:0]    decode_RegisterFileAccessor_regFileIo_rs2;
  wire       [31:0]   decode_out_RS1_DATA;
  wire       [31:0]   decode_out_RS2_DATA;
  wire                decode_out_HAS_TRAPPED;
  wire                decode_out_TRAP_IS_INTERRUPT;
  wire       [3:0]    decode_out_TRAP_CAUSE;
  wire       [31:0]   decode_out_TRAP_VAL;
  wire       [31:0]   decode_out_IR;
  wire       [31:0]   decode_out_PC;
  wire       [31:0]   decode_out_NEXT_PC;
  wire                execute_arbitration_isReady;
  wire                execute_arbitration_isDone;
  wire                execute_arbitration_rs1Needed;
  wire                execute_arbitration_rs2Needed;
  wire                execute_arbitration_jumpRequested;
  wire                execute_arbitration_isAvailable;
  wire       [31:0]   execute_out_RD_DATA;
  wire                execute_out_RD_DATA_VALID;
  wire       [31:0]   execute_out_ALU_RESULT;
  wire       [31:0]   execute_out_NEXT_PC;
  wire                execute_out_HAS_TRAPPED;
  wire                execute_out_TRAP_IS_INTERRUPT;
  wire       [3:0]    execute_out_TRAP_CAUSE;
  wire       [31:0]   execute_out_TRAP_VAL;
  wire       [0:0]    execute_out_RD_TYPE;
  wire       [0:0]    execute_out_RS2_TYPE;
  wire       [4:0]    execute_out_RS2;
  wire       [31:0]   execute_out_IR;
  wire       [31:0]   execute_out_RS1_DATA;
  wire       [4:0]    execute_out_RS1;
  wire       [1:0]    execute_out_LSU_OPERATION_TYPE;
  wire       [31:0]   execute_out_PC;
  wire                execute_out_LSU_IS_UNSIGNED;
  wire       [1:0]    execute_out_CSR_OP;
  wire       [31:0]   execute_out_RS2_DATA;
  wire       [4:0]    execute_out_RD;
  wire                execute_out_CSR_USE_IMM;
  wire                execute_out_MRET;
  wire       [1:0]    execute_out_LSU_ACCESS_WIDTH;
  wire       [0:0]    execute_out_RS1_TYPE;
  wire                execute_out_LSU_TARGET_VALID;
  wire                memory_arbitration_isReady;
  wire                memory_arbitration_isDone;
  wire                memory_arbitration_rs1Needed;
  wire                memory_arbitration_rs2Needed;
  wire                memory_arbitration_jumpRequested;
  wire                memory_arbitration_isAvailable;
  wire       [31:0]   memory_out_LSU_TARGET_ADDRESS;
  wire                memory_out_LSU_TARGET_VALID;
  wire                memory_StaticMemoryBackbone_dbus_cmd_valid;
  wire       [31:0]   memory_StaticMemoryBackbone_dbus_cmd_payload_address;
  wire                memory_StaticMemoryBackbone_dbus_cmd_payload_write;
  wire       [31:0]   memory_StaticMemoryBackbone_dbus_cmd_payload_wdata;
  wire       [3:0]    memory_StaticMemoryBackbone_dbus_cmd_payload_wmask;
  wire                memory_StaticMemoryBackbone_dbus_rsp_ready;
  wire       [31:0]   memory_out_RD_DATA;
  wire                memory_out_RD_DATA_VALID;
  wire                memory_out_HAS_TRAPPED;
  wire                memory_out_TRAP_IS_INTERRUPT;
  wire       [3:0]    memory_out_TRAP_CAUSE;
  wire       [31:0]   memory_out_TRAP_VAL;
  wire       [0:0]    memory_out_RD_TYPE;
  wire       [0:0]    memory_out_RS2_TYPE;
  wire       [4:0]    memory_out_RS2;
  wire       [31:0]   memory_out_IR;
  wire       [31:0]   memory_out_RS1_DATA;
  wire       [4:0]    memory_out_RS1;
  wire       [31:0]   memory_out_PC;
  wire       [1:0]    memory_out_CSR_OP;
  wire       [4:0]    memory_out_RD;
  wire                memory_out_CSR_USE_IMM;
  wire                memory_out_MRET;
  wire       [31:0]   memory_out_NEXT_PC;
  wire       [0:0]    memory_out_RS1_TYPE;
  wire                writeback_arbitration_isReady;
  wire                writeback_arbitration_isDone;
  wire                writeback_arbitration_rs1Needed;
  wire                writeback_arbitration_rs2Needed;
  wire                writeback_arbitration_jumpRequested;
  wire                writeback_arbitration_isAvailable;
  wire       [4:0]    writeback_out_RS1;
  wire       [0:0]    writeback_out_RS1_TYPE;
  wire       [4:0]    writeback_out_RS2;
  wire       [0:0]    writeback_out_RS2_TYPE;
  wire                writeback_out_RD_DATA_VALID;
  wire       [4:0]    writeback_out_RD;
  wire       [0:0]    writeback_out_RD_TYPE;
  wire       [4:0]    writeback_RegisterFileAccessor_regFileIo_rd;
  wire       [31:0]   writeback_RegisterFileAccessor_regFileIo_data;
  wire                writeback_RegisterFileAccessor_regFileIo_write;
  wire                writeback_out_HAS_TRAPPED;
  wire       [11:0]   writeback_CsrFile_csrIo_rid;
  wire       [11:0]   writeback_CsrFile_csrIo_wid;
  wire       [31:0]   writeback_CsrFile_csrIo_wdata;
  wire                writeback_CsrFile_csrIo_read;
  wire                writeback_CsrFile_csrIo_write;
  wire       [31:0]   writeback_out_RD_DATA;
  wire                writeback_out_TRAP_IS_INTERRUPT;
  wire       [3:0]    writeback_out_TRAP_CAUSE;
  wire       [31:0]   writeback_out_TRAP_VAL;
  wire       [31:0]   writeback_TrapHandler_mstatus_wdata;
  wire                writeback_TrapHandler_mstatus_write;
  wire       [31:0]   writeback_TrapHandler_mtvec_wdata;
  wire                writeback_TrapHandler_mtvec_write;
  wire       [31:0]   writeback_TrapHandler_mcause_wdata;
  wire                writeback_TrapHandler_mcause_write;
  wire       [31:0]   writeback_TrapHandler_mepc_wdata;
  wire                writeback_TrapHandler_mepc_write;
  wire       [31:0]   writeback_TrapHandler_mtval_wdata;
  wire                writeback_TrapHandler_mtval_write;
  wire       [31:0]   writeback_out_NEXT_PC;
  wire       [31:0]   writeback_Interrupts_mstatus_wdata;
  wire                writeback_Interrupts_mstatus_write;
  wire       [31:0]   writeback_Interrupts_mie_wdata;
  wire                writeback_Interrupts_mie_write;
  wire       [31:0]   writeback_Interrupts_mip_wdata;
  wire                writeback_Interrupts_mip_write;
  wire       [31:0]   writeback_out_PC;
  wire       [31:0]   writeback_out_IR;
  wire                pipelineRegs_IF_1_out_TRAP_IS_INTERRUPT;
  wire       [31:0]   pipelineRegs_IF_1_out_IR;
  wire       [31:0]   pipelineRegs_IF_1_out_TRAP_VAL;
  wire       [31:0]   pipelineRegs_IF_1_out_PC;
  wire                pipelineRegs_IF_1_out_HAS_TRAPPED;
  wire       [3:0]    pipelineRegs_IF_1_out_TRAP_CAUSE;
  wire       [31:0]   pipelineRegs_IF_1_out_NEXT_PC;
  wire       [2:0]    pipelineRegs_ID_1_out_BU_CONDITION;
  wire       [1:0]    pipelineRegs_ID_1_out_SHIFT_OP;
  wire                pipelineRegs_ID_1_out_MUL;
  wire                pipelineRegs_ID_1_out_EBREAK;
  wire       [0:0]    pipelineRegs_ID_1_out_RD_TYPE;
  wire                pipelineRegs_ID_1_out_TRAP_IS_INTERRUPT;
  wire       [0:0]    pipelineRegs_ID_1_out_RS2_TYPE;
  wire       [4:0]    pipelineRegs_ID_1_out_RS2;
  wire       [31:0]   pipelineRegs_ID_1_out_IR;
  wire       [31:0]   pipelineRegs_ID_1_out_RS1_DATA;
  wire       [4:0]    pipelineRegs_ID_1_out_RS1;
  wire                pipelineRegs_ID_1_out_IMM_USED;
  wire       [1:0]    pipelineRegs_ID_1_out_LSU_OPERATION_TYPE;
  wire                pipelineRegs_ID_1_out_BU_IS_BRANCH;
  wire       [2:0]    pipelineRegs_ID_1_out_ALU_OP;
  wire                pipelineRegs_ID_1_out_REM;
  wire                pipelineRegs_ID_1_out_ALU_COMMIT_RESULT;
  wire       [31:0]   pipelineRegs_ID_1_out_TRAP_VAL;
  wire                pipelineRegs_ID_1_out_BU_WRITE_RET_ADDR_TO_RD;
  wire       [31:0]   pipelineRegs_ID_1_out_PC;
  wire                pipelineRegs_ID_1_out_HAS_TRAPPED;
  wire                pipelineRegs_ID_1_out_ECALL;
  wire       [3:0]    pipelineRegs_ID_1_out_TRAP_CAUSE;
  wire                pipelineRegs_ID_1_out_LSU_IS_UNSIGNED;
  wire       [1:0]    pipelineRegs_ID_1_out_CSR_OP;
  wire       [31:0]   pipelineRegs_ID_1_out_RS2_DATA;
  wire       [0:0]    pipelineRegs_ID_1_out_ALU_SRC1;
  wire       [4:0]    pipelineRegs_ID_1_out_RD;
  wire                pipelineRegs_ID_1_out_MUL_HIGH;
  wire                pipelineRegs_ID_1_out_CSR_USE_IMM;
  wire                pipelineRegs_ID_1_out_BU_IGNORE_TARGET_LSB;
  wire                pipelineRegs_ID_1_out_RD_DATA_VALID;
  wire                pipelineRegs_ID_1_out_DIV;
  wire                pipelineRegs_ID_1_out_MRET;
  wire       [1:0]    pipelineRegs_ID_1_out_LSU_ACCESS_WIDTH;
  wire       [31:0]   pipelineRegs_ID_1_out_NEXT_PC;
  wire       [0:0]    pipelineRegs_ID_1_out_RS1_TYPE;
  wire       [31:0]   pipelineRegs_ID_1_out_IMM;
  wire       [0:0]    pipelineRegs_ID_1_out_ALU_SRC2;
  wire                pipelineRegs_ID_1_out_MULDIV_RS2_SIGNED;
  wire                pipelineRegs_ID_1_out_LSU_TARGET_VALID;
  wire                pipelineRegs_ID_1_out_MULDIV_RS1_SIGNED;
  wire       [0:0]    pipelineRegs_EX_1_out_RD_TYPE;
  wire                pipelineRegs_EX_1_out_TRAP_IS_INTERRUPT;
  wire       [0:0]    pipelineRegs_EX_1_out_RS2_TYPE;
  wire       [4:0]    pipelineRegs_EX_1_out_RS2;
  wire       [31:0]   pipelineRegs_EX_1_out_IR;
  wire       [31:0]   pipelineRegs_EX_1_out_RS1_DATA;
  wire       [4:0]    pipelineRegs_EX_1_out_RS1;
  wire       [1:0]    pipelineRegs_EX_1_out_LSU_OPERATION_TYPE;
  wire       [31:0]   pipelineRegs_EX_1_out_RD_DATA;
  wire       [31:0]   pipelineRegs_EX_1_out_TRAP_VAL;
  wire       [31:0]   pipelineRegs_EX_1_out_PC;
  wire                pipelineRegs_EX_1_out_HAS_TRAPPED;
  wire       [31:0]   pipelineRegs_EX_1_out_ALU_RESULT;
  wire       [3:0]    pipelineRegs_EX_1_out_TRAP_CAUSE;
  wire                pipelineRegs_EX_1_out_LSU_IS_UNSIGNED;
  wire       [1:0]    pipelineRegs_EX_1_out_CSR_OP;
  wire       [31:0]   pipelineRegs_EX_1_out_RS2_DATA;
  wire       [4:0]    pipelineRegs_EX_1_out_RD;
  wire                pipelineRegs_EX_1_out_CSR_USE_IMM;
  wire                pipelineRegs_EX_1_out_RD_DATA_VALID;
  wire                pipelineRegs_EX_1_out_MRET;
  wire       [1:0]    pipelineRegs_EX_1_out_LSU_ACCESS_WIDTH;
  wire       [31:0]   pipelineRegs_EX_1_out_NEXT_PC;
  wire       [0:0]    pipelineRegs_EX_1_out_RS1_TYPE;
  wire                pipelineRegs_EX_1_out_LSU_TARGET_VALID;
  wire       [0:0]    pipelineRegs_MEM_1_out_RD_TYPE;
  wire                pipelineRegs_MEM_1_out_TRAP_IS_INTERRUPT;
  wire       [0:0]    pipelineRegs_MEM_1_out_RS2_TYPE;
  wire       [4:0]    pipelineRegs_MEM_1_out_RS2;
  wire       [31:0]   pipelineRegs_MEM_1_out_IR;
  wire       [31:0]   pipelineRegs_MEM_1_out_RS1_DATA;
  wire       [4:0]    pipelineRegs_MEM_1_out_RS1;
  wire       [31:0]   pipelineRegs_MEM_1_out_RD_DATA;
  wire       [31:0]   pipelineRegs_MEM_1_out_TRAP_VAL;
  wire       [31:0]   pipelineRegs_MEM_1_out_PC;
  wire                pipelineRegs_MEM_1_out_HAS_TRAPPED;
  wire       [3:0]    pipelineRegs_MEM_1_out_TRAP_CAUSE;
  wire       [1:0]    pipelineRegs_MEM_1_out_CSR_OP;
  wire       [4:0]    pipelineRegs_MEM_1_out_RD;
  wire                pipelineRegs_MEM_1_out_CSR_USE_IMM;
  wire                pipelineRegs_MEM_1_out_RD_DATA_VALID;
  wire                pipelineRegs_MEM_1_out_MRET;
  wire       [31:0]   pipelineRegs_MEM_1_out_NEXT_PC;
  wire       [0:0]    pipelineRegs_MEM_1_out_RS1_TYPE;
  wire       [31:0]   CsrFile_io_rdata;
  wire                CsrFile_io_error;
  wire                CsrFile_writeNotify_write;
  wire       [31:0]   CsrFile_io_768_rdata;
  wire       [31:0]   CsrFile_io_773_rdata;
  wire       [31:0]   CsrFile_io_834_rdata;
  wire       [31:0]   CsrFile_io_833_rdata;
  wire       [31:0]   CsrFile_io_835_rdata;
  wire       [31:0]   CsrFile_io_768_rdata_1;
  wire       [31:0]   CsrFile_io_772_rdata;
  wire       [31:0]   CsrFile_io_836_rdata;
  wire       [31:0]   RegisterFileAccessor_readIo_rs1Data;
  wire       [31:0]   RegisterFileAccessor_readIo_rs2Data;
  wire                _zz_when;
  wire                PcManager_pcOverride_valid;
  wire       [31:0]   PcManager_pcOverride_payload;
  reg                 _zz_arbitration_isValid;
  wire                when_Scheduler_l42;
  reg                 _zz_arbitration_isValid_1;
  wire                when_Scheduler_l42_1;
  reg                 _zz_arbitration_isValid_2;
  wire                when_Scheduler_l42_2;
  reg                 _zz_arbitration_isValid_3;
  wire                when_Scheduler_l42_3;
  wire                when_TrapHandler_l33;
  wire                when_TrapHandler_l33_1;
  wire                when_TrapHandler_l33_2;
  wire                when_TrapHandler_l33_3;
  reg        [4:0]    DataHazardResolver_lastWrittenRd_id;
  reg                 DataHazardResolver_lastWrittenRd_valid;
  reg        [31:0]   DataHazardResolver_lastWrittenRd_data;
  wire                when_DataHazardResolver_l77;
  reg                 when_DataHazardResolver_l124;
  reg        [31:0]   _zz_in_RS1_DATA;
  wire                when_DataHazardResolver_l99;
  wire                when_DataHazardResolver_l100;
  wire                when_DataHazardResolver_l113;
  wire                when_DataHazardResolver_l113_1;
  reg                 when_DataHazardResolver_l124_1;
  reg        [31:0]   _zz_in_RS2_DATA;
  wire                when_DataHazardResolver_l99_1;
  wire                when_DataHazardResolver_l100_1;
  wire                when_DataHazardResolver_l113_2;
  wire                when_DataHazardResolver_l113_3;
  wire                when_DataHazardResolver_l150;
  reg                 when_DataHazardResolver_l124_2;
  reg        [31:0]   _zz_in_RS1_DATA_1;
  wire                when_DataHazardResolver_l99_2;
  wire                when_DataHazardResolver_l100_2;
  wire                when_DataHazardResolver_l113_4;
  reg                 when_DataHazardResolver_l124_3;
  reg        [31:0]   _zz_in_RS2_DATA_1;
  wire                when_DataHazardResolver_l99_3;
  wire                when_DataHazardResolver_l100_3;
  wire                when_DataHazardResolver_l113_5;
  wire                when_DataHazardResolver_l150_1;
  reg                 when_DataHazardResolver_l124_4;
  reg        [31:0]   _zz_in_RS1_DATA_2;
  wire                when_DataHazardResolver_l99_4;
  wire                when_DataHazardResolver_l100_4;
  wire                when_DataHazardResolver_l150_2;
  reg        [31:0]   PcManager_pc;
  wire                when_PcManager_l129;
  wire                when_PcManager_l129_1;

  assign _zz_when = 1'b0;
  Stage_IF fetch (
    .arbitration_isValid              (fetch_arbitration_isValid                   ), //i
    .arbitration_isStalled            (fetch_arbitration_isStalled                 ), //i
    .arbitration_isReady              (fetch_arbitration_isReady                   ), //o
    .arbitration_isDone               (fetch_arbitration_isDone                    ), //o
    .arbitration_rs1Needed            (fetch_arbitration_rs1Needed                 ), //o
    .arbitration_rs2Needed            (fetch_arbitration_rs2Needed                 ), //o
    .arbitration_jumpRequested        (fetch_arbitration_jumpRequested             ), //o
    .arbitration_isAvailable          (fetch_arbitration_isAvailable               ), //o
    .Fetcher_ibus_cmd_valid           (fetch_Fetcher_ibus_cmd_valid                ), //o
    .Fetcher_ibus_cmd_ready           (ibus_cmd_ready                              ), //i
    .Fetcher_ibus_cmd_payload_address (fetch_Fetcher_ibus_cmd_payload_address[31:0]), //o
    .Fetcher_ibus_rsp_valid           (ibus_rsp_valid                              ), //i
    .Fetcher_ibus_rsp_ready           (fetch_Fetcher_ibus_rsp_ready                ), //o
    .Fetcher_ibus_rsp_payload_rdata   (ibus_rsp_payload_rdata[31:0]                ), //i
    .in_PC                            (PcManager_pc[31:0]                          ), //i
    .out_NEXT_PC                      (fetch_out_NEXT_PC[31:0]                     ), //o
    .out_IR                           (fetch_out_IR[31:0]                          ), //o
    .in_HAS_TRAPPED                   (1'b0                                        ), //i
    .out_HAS_TRAPPED                  (fetch_out_HAS_TRAPPED                       ), //o
    .out_TRAP_IS_INTERRUPT            (fetch_out_TRAP_IS_INTERRUPT                 ), //o
    .out_TRAP_CAUSE                   (fetch_out_TRAP_CAUSE[3:0]                   ), //o
    .out_TRAP_VAL                     (fetch_out_TRAP_VAL[31:0]                    ), //o
    .out_PC                           (fetch_out_PC[31:0]                          ), //o
    .clk                              (clk                                         ), //i
    .reset                            (reset                                       )  //i
  );
  Stage_ID decode (
    .arbitration_isValid                    (decode_arbitration_isValid                    ), //i
    .arbitration_isStalled                  (decode_arbitration_isStalled                  ), //i
    .arbitration_isReady                    (decode_arbitration_isReady                    ), //o
    .arbitration_isDone                     (decode_arbitration_isDone                     ), //o
    .arbitration_rs1Needed                  (decode_arbitration_rs1Needed                  ), //o
    .arbitration_rs2Needed                  (decode_arbitration_rs2Needed                  ), //o
    .arbitration_jumpRequested              (decode_arbitration_jumpRequested              ), //o
    .arbitration_isAvailable                (decode_arbitration_isAvailable                ), //o
    .out_BU_CONDITION                       (decode_out_BU_CONDITION[2:0]                  ), //o
    .out_LSU_OPERATION_TYPE                 (decode_out_LSU_OPERATION_TYPE[1:0]            ), //o
    .out_CSR_OP                             (decode_out_CSR_OP[1:0]                        ), //o
    .out_SHIFT_OP                           (decode_out_SHIFT_OP[1:0]                      ), //o
    .out_ECALL                              (decode_out_ECALL                              ), //o
    .out_LSU_IS_EXTERNAL_OP                 (decode_out_LSU_IS_EXTERNAL_OP                 ), //o
    .out_REM                                (decode_out_REM                                ), //o
    .out_MUL_HIGH                           (decode_out_MUL_HIGH                           ), //o
    .out_BU_WRITE_RET_ADDR_TO_RD            (decode_out_BU_WRITE_RET_ADDR_TO_RD            ), //o
    .out_LSU_IS_UNSIGNED                    (decode_out_LSU_IS_UNSIGNED                    ), //o
    .out_EBREAK                             (decode_out_EBREAK                             ), //o
    .out_MUL                                (decode_out_MUL                                ), //o
    .out_DIV                                (decode_out_DIV                                ), //o
    .out_MULDIV_RS2_SIGNED                  (decode_out_MULDIV_RS2_SIGNED                  ), //o
    .out_RD_DATA_VALID                      (decode_out_RD_DATA_VALID                      ), //o
    .out_BU_IGNORE_TARGET_LSB               (decode_out_BU_IGNORE_TARGET_LSB               ), //o
    .out_MRET                               (decode_out_MRET                               ), //o
    .out_CSR_USE_IMM                        (decode_out_CSR_USE_IMM                        ), //o
    .out_BU_IS_BRANCH                       (decode_out_BU_IS_BRANCH                       ), //o
    .out_MULDIV_RS1_SIGNED                  (decode_out_MULDIV_RS1_SIGNED                  ), //o
    .out_IMM                                (decode_out_IMM[31:0]                          ), //o
    .out_ALU_SRC1                           (decode_out_ALU_SRC1                           ), //o
    .out_ALU_COMMIT_RESULT                  (decode_out_ALU_COMMIT_RESULT                  ), //o
    .out_RS1                                (decode_out_RS1[4:0]                           ), //o
    .out_RS2                                (decode_out_RS2[4:0]                           ), //o
    .out_RD                                 (decode_out_RD[4:0]                            ), //o
    .out_IMM_USED                           (decode_out_IMM_USED                           ), //o
    .out_RS1_TYPE                           (decode_out_RS1_TYPE                           ), //o
    .out_RS2_TYPE                           (decode_out_RS2_TYPE                           ), //o
    .out_RD_TYPE                            (decode_out_RD_TYPE                            ), //o
    .out_ALU_OP                             (decode_out_ALU_OP[2:0]                        ), //o
    .out_ALU_SRC2                           (decode_out_ALU_SRC2                           ), //o
    .out_LSU_ACCESS_WIDTH                   (decode_out_LSU_ACCESS_WIDTH[1:0]              ), //o
    .out_LSU_TARGET_VALID                   (decode_out_LSU_TARGET_VALID                   ), //o
    .RegisterFileAccessor_regFileIo_rs1     (decode_RegisterFileAccessor_regFileIo_rs1[4:0]), //o
    .RegisterFileAccessor_regFileIo_rs2     (decode_RegisterFileAccessor_regFileIo_rs2[4:0]), //o
    .RegisterFileAccessor_regFileIo_rs1Data (RegisterFileAccessor_readIo_rs1Data[31:0]     ), //i
    .RegisterFileAccessor_regFileIo_rs2Data (RegisterFileAccessor_readIo_rs2Data[31:0]     ), //i
    .out_RS1_DATA                           (decode_out_RS1_DATA[31:0]                     ), //o
    .out_RS2_DATA                           (decode_out_RS2_DATA[31:0]                     ), //o
    .out_HAS_TRAPPED                        (decode_out_HAS_TRAPPED                        ), //o
    .out_TRAP_IS_INTERRUPT                  (decode_out_TRAP_IS_INTERRUPT                  ), //o
    .out_TRAP_CAUSE                         (decode_out_TRAP_CAUSE[3:0]                    ), //o
    .out_TRAP_VAL                           (decode_out_TRAP_VAL[31:0]                     ), //o
    .in_IR                                  (pipelineRegs_IF_1_out_IR[31:0]                ), //i
    .in_TRAP_IS_INTERRUPT                   (pipelineRegs_IF_1_out_TRAP_IS_INTERRUPT       ), //i
    .out_IR                                 (decode_out_IR[31:0]                           ), //o
    .in_TRAP_VAL                            (pipelineRegs_IF_1_out_TRAP_VAL[31:0]          ), //i
    .in_PC                                  (pipelineRegs_IF_1_out_PC[31:0]                ), //i
    .out_PC                                 (decode_out_PC[31:0]                           ), //o
    .in_HAS_TRAPPED                         (pipelineRegs_IF_1_out_HAS_TRAPPED             ), //i
    .in_TRAP_CAUSE                          (pipelineRegs_IF_1_out_TRAP_CAUSE[3:0]         ), //i
    .in_NEXT_PC                             (pipelineRegs_IF_1_out_NEXT_PC[31:0]           ), //i
    .out_NEXT_PC                            (decode_out_NEXT_PC[31:0]                      )  //o
  );
  Stage_EX execute (
    .arbitration_isValid        (execute_arbitration_isValid                  ), //i
    .arbitration_isStalled      (execute_arbitration_isStalled                ), //i
    .arbitration_isReady        (execute_arbitration_isReady                  ), //o
    .arbitration_isDone         (execute_arbitration_isDone                   ), //o
    .arbitration_rs1Needed      (execute_arbitration_rs1Needed                ), //o
    .arbitration_rs2Needed      (execute_arbitration_rs2Needed                ), //o
    .arbitration_jumpRequested  (execute_arbitration_jumpRequested            ), //o
    .arbitration_isAvailable    (execute_arbitration_isAvailable              ), //o
    .out_RD_DATA                (execute_out_RD_DATA[31:0]                    ), //o
    .out_RD_DATA_VALID          (execute_out_RD_DATA_VALID                    ), //o
    .out_ALU_RESULT             (execute_out_ALU_RESULT[31:0]                 ), //o
    .out_NEXT_PC                (execute_out_NEXT_PC[31:0]                    ), //o
    .in_NEXT_PC                 (pipelineRegs_ID_1_out_NEXT_PC[31:0]          ), //i
    .out_HAS_TRAPPED            (execute_out_HAS_TRAPPED                      ), //o
    .out_TRAP_IS_INTERRUPT      (execute_out_TRAP_IS_INTERRUPT                ), //o
    .out_TRAP_CAUSE             (execute_out_TRAP_CAUSE[3:0]                  ), //o
    .out_TRAP_VAL               (execute_out_TRAP_VAL[31:0]                   ), //o
    .in_BU_CONDITION            (pipelineRegs_ID_1_out_BU_CONDITION[2:0]      ), //i
    .in_SHIFT_OP                (pipelineRegs_ID_1_out_SHIFT_OP[1:0]          ), //i
    .in_MUL                     (pipelineRegs_ID_1_out_MUL                    ), //i
    .in_EBREAK                  (pipelineRegs_ID_1_out_EBREAK                 ), //i
    .in_RS1_DATA                (execute_in_RS1_DATA[31:0]                    ), //i
    .in_IMM_USED                (pipelineRegs_ID_1_out_IMM_USED               ), //i
    .in_BU_IS_BRANCH            (pipelineRegs_ID_1_out_BU_IS_BRANCH           ), //i
    .in_ALU_OP                  (pipelineRegs_ID_1_out_ALU_OP[2:0]            ), //i
    .in_REM                     (pipelineRegs_ID_1_out_REM                    ), //i
    .in_ALU_COMMIT_RESULT       (pipelineRegs_ID_1_out_ALU_COMMIT_RESULT      ), //i
    .in_BU_WRITE_RET_ADDR_TO_RD (pipelineRegs_ID_1_out_BU_WRITE_RET_ADDR_TO_RD), //i
    .in_PC                      (pipelineRegs_ID_1_out_PC[31:0]               ), //i
    .in_ECALL                   (pipelineRegs_ID_1_out_ECALL                  ), //i
    .in_RS2_DATA                (execute_in_RS2_DATA[31:0]                    ), //i
    .in_ALU_SRC1                (pipelineRegs_ID_1_out_ALU_SRC1               ), //i
    .in_MUL_HIGH                (pipelineRegs_ID_1_out_MUL_HIGH               ), //i
    .in_BU_IGNORE_TARGET_LSB    (pipelineRegs_ID_1_out_BU_IGNORE_TARGET_LSB   ), //i
    .in_DIV                     (pipelineRegs_ID_1_out_DIV                    ), //i
    .in_MRET                    (pipelineRegs_ID_1_out_MRET                   ), //i
    .in_IMM                     (pipelineRegs_ID_1_out_IMM[31:0]              ), //i
    .in_ALU_SRC2                (pipelineRegs_ID_1_out_ALU_SRC2               ), //i
    .in_MULDIV_RS2_SIGNED       (pipelineRegs_ID_1_out_MULDIV_RS2_SIGNED      ), //i
    .in_MULDIV_RS1_SIGNED       (pipelineRegs_ID_1_out_MULDIV_RS1_SIGNED      ), //i
    .in_RD_TYPE                 (pipelineRegs_ID_1_out_RD_TYPE                ), //i
    .out_RD_TYPE                (execute_out_RD_TYPE                          ), //o
    .in_TRAP_IS_INTERRUPT       (pipelineRegs_ID_1_out_TRAP_IS_INTERRUPT      ), //i
    .in_RS2_TYPE                (pipelineRegs_ID_1_out_RS2_TYPE               ), //i
    .out_RS2_TYPE               (execute_out_RS2_TYPE                         ), //o
    .in_RS2                     (pipelineRegs_ID_1_out_RS2[4:0]               ), //i
    .out_RS2                    (execute_out_RS2[4:0]                         ), //o
    .in_IR                      (pipelineRegs_ID_1_out_IR[31:0]               ), //i
    .out_IR                     (execute_out_IR[31:0]                         ), //o
    .out_RS1_DATA               (execute_out_RS1_DATA[31:0]                   ), //o
    .in_RS1                     (pipelineRegs_ID_1_out_RS1[4:0]               ), //i
    .out_RS1                    (execute_out_RS1[4:0]                         ), //o
    .in_LSU_OPERATION_TYPE      (pipelineRegs_ID_1_out_LSU_OPERATION_TYPE[1:0]), //i
    .out_LSU_OPERATION_TYPE     (execute_out_LSU_OPERATION_TYPE[1:0]          ), //o
    .in_TRAP_VAL                (pipelineRegs_ID_1_out_TRAP_VAL[31:0]         ), //i
    .out_PC                     (execute_out_PC[31:0]                         ), //o
    .in_HAS_TRAPPED             (pipelineRegs_ID_1_out_HAS_TRAPPED            ), //i
    .in_TRAP_CAUSE              (pipelineRegs_ID_1_out_TRAP_CAUSE[3:0]        ), //i
    .in_LSU_IS_UNSIGNED         (pipelineRegs_ID_1_out_LSU_IS_UNSIGNED        ), //i
    .out_LSU_IS_UNSIGNED        (execute_out_LSU_IS_UNSIGNED                  ), //o
    .in_CSR_OP                  (pipelineRegs_ID_1_out_CSR_OP[1:0]            ), //i
    .out_CSR_OP                 (execute_out_CSR_OP[1:0]                      ), //o
    .out_RS2_DATA               (execute_out_RS2_DATA[31:0]                   ), //o
    .in_RD                      (pipelineRegs_ID_1_out_RD[4:0]                ), //i
    .out_RD                     (execute_out_RD[4:0]                          ), //o
    .in_CSR_USE_IMM             (pipelineRegs_ID_1_out_CSR_USE_IMM            ), //i
    .out_CSR_USE_IMM            (execute_out_CSR_USE_IMM                      ), //o
    .in_RD_DATA_VALID           (pipelineRegs_ID_1_out_RD_DATA_VALID          ), //i
    .out_MRET                   (execute_out_MRET                             ), //o
    .in_LSU_ACCESS_WIDTH        (pipelineRegs_ID_1_out_LSU_ACCESS_WIDTH[1:0]  ), //i
    .out_LSU_ACCESS_WIDTH       (execute_out_LSU_ACCESS_WIDTH[1:0]            ), //o
    .in_RS1_TYPE                (pipelineRegs_ID_1_out_RS1_TYPE               ), //i
    .out_RS1_TYPE               (execute_out_RS1_TYPE                         ), //o
    .in_LSU_TARGET_VALID        (pipelineRegs_ID_1_out_LSU_TARGET_VALID       ), //i
    .out_LSU_TARGET_VALID       (execute_out_LSU_TARGET_VALID                 ), //o
    .clk                        (clk                                          ), //i
    .reset                      (reset                                        )  //i
  );
  Stage_MEM memory (
    .arbitration_isValid                           (memory_arbitration_isValid                                ), //i
    .arbitration_isStalled                         (memory_arbitration_isStalled                              ), //i
    .arbitration_isReady                           (memory_arbitration_isReady                                ), //o
    .arbitration_isDone                            (memory_arbitration_isDone                                 ), //o
    .arbitration_rs1Needed                         (memory_arbitration_rs1Needed                              ), //o
    .arbitration_rs2Needed                         (memory_arbitration_rs2Needed                              ), //o
    .arbitration_jumpRequested                     (memory_arbitration_jumpRequested                          ), //o
    .arbitration_isAvailable                       (memory_arbitration_isAvailable                            ), //o
    .out_LSU_TARGET_ADDRESS                        (memory_out_LSU_TARGET_ADDRESS[31:0]                       ), //o
    .out_LSU_TARGET_VALID                          (memory_out_LSU_TARGET_VALID                               ), //o
    .StaticMemoryBackbone_dbus_cmd_valid           (memory_StaticMemoryBackbone_dbus_cmd_valid                ), //o
    .StaticMemoryBackbone_dbus_cmd_ready           (dbus_cmd_ready                                            ), //i
    .StaticMemoryBackbone_dbus_cmd_payload_address (memory_StaticMemoryBackbone_dbus_cmd_payload_address[31:0]), //o
    .StaticMemoryBackbone_dbus_cmd_payload_write   (memory_StaticMemoryBackbone_dbus_cmd_payload_write        ), //o
    .StaticMemoryBackbone_dbus_cmd_payload_wdata   (memory_StaticMemoryBackbone_dbus_cmd_payload_wdata[31:0]  ), //o
    .StaticMemoryBackbone_dbus_cmd_payload_wmask   (memory_StaticMemoryBackbone_dbus_cmd_payload_wmask[3:0]   ), //o
    .StaticMemoryBackbone_dbus_rsp_valid           (dbus_rsp_valid                                            ), //i
    .StaticMemoryBackbone_dbus_rsp_ready           (memory_StaticMemoryBackbone_dbus_rsp_ready                ), //o
    .StaticMemoryBackbone_dbus_rsp_payload_rdata   (dbus_rsp_payload_rdata[31:0]                              ), //i
    .out_RD_DATA                                   (memory_out_RD_DATA[31:0]                                  ), //o
    .out_RD_DATA_VALID                             (memory_out_RD_DATA_VALID                                  ), //o
    .out_HAS_TRAPPED                               (memory_out_HAS_TRAPPED                                    ), //o
    .out_TRAP_IS_INTERRUPT                         (memory_out_TRAP_IS_INTERRUPT                              ), //o
    .out_TRAP_CAUSE                                (memory_out_TRAP_CAUSE[3:0]                                ), //o
    .out_TRAP_VAL                                  (memory_out_TRAP_VAL[31:0]                                 ), //o
    .in_LSU_OPERATION_TYPE                         (pipelineRegs_EX_1_out_LSU_OPERATION_TYPE[1:0]             ), //i
    .in_ALU_RESULT                                 (pipelineRegs_EX_1_out_ALU_RESULT[31:0]                    ), //i
    .in_LSU_IS_UNSIGNED                            (pipelineRegs_EX_1_out_LSU_IS_UNSIGNED                     ), //i
    .in_RS2_DATA                                   (memory_in_RS2_DATA[31:0]                                  ), //i
    .in_LSU_ACCESS_WIDTH                           (pipelineRegs_EX_1_out_LSU_ACCESS_WIDTH[1:0]               ), //i
    .in_RD_TYPE                                    (pipelineRegs_EX_1_out_RD_TYPE                             ), //i
    .out_RD_TYPE                                   (memory_out_RD_TYPE                                        ), //o
    .in_TRAP_IS_INTERRUPT                          (pipelineRegs_EX_1_out_TRAP_IS_INTERRUPT                   ), //i
    .in_RS2_TYPE                                   (pipelineRegs_EX_1_out_RS2_TYPE                            ), //i
    .out_RS2_TYPE                                  (memory_out_RS2_TYPE                                       ), //o
    .in_RS2                                        (pipelineRegs_EX_1_out_RS2[4:0]                            ), //i
    .out_RS2                                       (memory_out_RS2[4:0]                                       ), //o
    .in_IR                                         (pipelineRegs_EX_1_out_IR[31:0]                            ), //i
    .out_IR                                        (memory_out_IR[31:0]                                       ), //o
    .in_RS1_DATA                                   (memory_in_RS1_DATA[31:0]                                  ), //i
    .out_RS1_DATA                                  (memory_out_RS1_DATA[31:0]                                 ), //o
    .in_RS1                                        (pipelineRegs_EX_1_out_RS1[4:0]                            ), //i
    .out_RS1                                       (memory_out_RS1[4:0]                                       ), //o
    .in_RD_DATA                                    (pipelineRegs_EX_1_out_RD_DATA[31:0]                       ), //i
    .in_TRAP_VAL                                   (pipelineRegs_EX_1_out_TRAP_VAL[31:0]                      ), //i
    .in_PC                                         (pipelineRegs_EX_1_out_PC[31:0]                            ), //i
    .out_PC                                        (memory_out_PC[31:0]                                       ), //o
    .in_HAS_TRAPPED                                (pipelineRegs_EX_1_out_HAS_TRAPPED                         ), //i
    .in_TRAP_CAUSE                                 (pipelineRegs_EX_1_out_TRAP_CAUSE[3:0]                     ), //i
    .in_CSR_OP                                     (pipelineRegs_EX_1_out_CSR_OP[1:0]                         ), //i
    .out_CSR_OP                                    (memory_out_CSR_OP[1:0]                                    ), //o
    .in_RD                                         (pipelineRegs_EX_1_out_RD[4:0]                             ), //i
    .out_RD                                        (memory_out_RD[4:0]                                        ), //o
    .in_CSR_USE_IMM                                (pipelineRegs_EX_1_out_CSR_USE_IMM                         ), //i
    .out_CSR_USE_IMM                               (memory_out_CSR_USE_IMM                                    ), //o
    .in_RD_DATA_VALID                              (pipelineRegs_EX_1_out_RD_DATA_VALID                       ), //i
    .in_MRET                                       (pipelineRegs_EX_1_out_MRET                                ), //i
    .out_MRET                                      (memory_out_MRET                                           ), //o
    .in_NEXT_PC                                    (pipelineRegs_EX_1_out_NEXT_PC[31:0]                       ), //i
    .out_NEXT_PC                                   (memory_out_NEXT_PC[31:0]                                  ), //o
    .in_RS1_TYPE                                   (pipelineRegs_EX_1_out_RS1_TYPE                            ), //i
    .out_RS1_TYPE                                  (memory_out_RS1_TYPE                                       ), //o
    .in_LSU_TARGET_VALID                           (pipelineRegs_EX_1_out_LSU_TARGET_VALID                    ), //i
    .clk                                           (clk                                                       ), //i
    .reset                                         (reset                                                     )  //i
  );
  Stage_WB writeback (
    .arbitration_isValid                  (writeback_arbitration_isValid                      ), //i
    .arbitration_isStalled                (writeback_arbitration_isStalled                    ), //i
    .arbitration_isReady                  (writeback_arbitration_isReady                      ), //o
    .arbitration_isDone                   (writeback_arbitration_isDone                       ), //o
    .arbitration_rs1Needed                (writeback_arbitration_rs1Needed                    ), //o
    .arbitration_rs2Needed                (writeback_arbitration_rs2Needed                    ), //o
    .arbitration_jumpRequested            (writeback_arbitration_jumpRequested                ), //o
    .arbitration_isAvailable              (writeback_arbitration_isAvailable                  ), //o
    .out_RS1                              (writeback_out_RS1[4:0]                             ), //o
    .out_RS1_TYPE                         (writeback_out_RS1_TYPE                             ), //o
    .out_RS2                              (writeback_out_RS2[4:0]                             ), //o
    .out_RS2_TYPE                         (writeback_out_RS2_TYPE                             ), //o
    .out_RD_DATA_VALID                    (writeback_out_RD_DATA_VALID                        ), //o
    .out_RD                               (writeback_out_RD[4:0]                              ), //o
    .out_RD_TYPE                          (writeback_out_RD_TYPE                              ), //o
    .RegisterFileAccessor_regFileIo_rd    (writeback_RegisterFileAccessor_regFileIo_rd[4:0]   ), //o
    .RegisterFileAccessor_regFileIo_data  (writeback_RegisterFileAccessor_regFileIo_data[31:0]), //o
    .RegisterFileAccessor_regFileIo_write (writeback_RegisterFileAccessor_regFileIo_write     ), //o
    .out_HAS_TRAPPED                      (writeback_out_HAS_TRAPPED                          ), //o
    .CsrFile_csrIo_rid                    (writeback_CsrFile_csrIo_rid[11:0]                  ), //o
    .CsrFile_csrIo_wid                    (writeback_CsrFile_csrIo_wid[11:0]                  ), //o
    .CsrFile_csrIo_rdata                  (CsrFile_io_rdata[31:0]                             ), //i
    .CsrFile_csrIo_wdata                  (writeback_CsrFile_csrIo_wdata[31:0]                ), //o
    .CsrFile_csrIo_read                   (writeback_CsrFile_csrIo_read                       ), //o
    .CsrFile_csrIo_write                  (writeback_CsrFile_csrIo_write                      ), //o
    .CsrFile_csrIo_error                  (CsrFile_io_error                                   ), //i
    .out_RD_DATA                          (writeback_out_RD_DATA[31:0]                        ), //o
    .out_TRAP_IS_INTERRUPT                (writeback_out_TRAP_IS_INTERRUPT                    ), //o
    .out_TRAP_CAUSE                       (writeback_out_TRAP_CAUSE[3:0]                      ), //o
    .out_TRAP_VAL                         (writeback_out_TRAP_VAL[31:0]                       ), //o
    .TrapHandler_mstatus_rdata            (CsrFile_io_768_rdata[31:0]                         ), //i
    .TrapHandler_mstatus_wdata            (writeback_TrapHandler_mstatus_wdata[31:0]          ), //o
    .TrapHandler_mstatus_write            (writeback_TrapHandler_mstatus_write                ), //o
    .TrapHandler_mtvec_rdata              (CsrFile_io_773_rdata[31:0]                         ), //i
    .TrapHandler_mtvec_wdata              (writeback_TrapHandler_mtvec_wdata[31:0]            ), //o
    .TrapHandler_mtvec_write              (writeback_TrapHandler_mtvec_write                  ), //o
    .TrapHandler_mcause_rdata             (CsrFile_io_834_rdata[31:0]                         ), //i
    .TrapHandler_mcause_wdata             (writeback_TrapHandler_mcause_wdata[31:0]           ), //o
    .TrapHandler_mcause_write             (writeback_TrapHandler_mcause_write                 ), //o
    .TrapHandler_mepc_rdata               (CsrFile_io_833_rdata[31:0]                         ), //i
    .TrapHandler_mepc_wdata               (writeback_TrapHandler_mepc_wdata[31:0]             ), //o
    .TrapHandler_mepc_write               (writeback_TrapHandler_mepc_write                   ), //o
    .TrapHandler_mtval_rdata              (CsrFile_io_835_rdata[31:0]                         ), //i
    .TrapHandler_mtval_wdata              (writeback_TrapHandler_mtval_wdata[31:0]            ), //o
    .TrapHandler_mtval_write              (writeback_TrapHandler_mtval_write                  ), //o
    .out_NEXT_PC                          (writeback_out_NEXT_PC[31:0]                        ), //o
    .Interrupts_mtimer_update             (mtimer_update                                      ), //i
    .Interrupts_mtimer_interruptPending   (mtimer_interruptPending                            ), //i
    .Interrupts_external_update           (external_update                                    ), //i
    .Interrupts_external_interruptPending (external_interruptPending                          ), //i
    .Interrupts_mstatus_rdata             (CsrFile_io_768_rdata_1[31:0]                       ), //i
    .Interrupts_mstatus_wdata             (writeback_Interrupts_mstatus_wdata[31:0]           ), //o
    .Interrupts_mstatus_write             (writeback_Interrupts_mstatus_write                 ), //o
    .Interrupts_mie_rdata                 (CsrFile_io_772_rdata[31:0]                         ), //i
    .Interrupts_mie_wdata                 (writeback_Interrupts_mie_wdata[31:0]               ), //o
    .Interrupts_mie_write                 (writeback_Interrupts_mie_write                     ), //o
    .Interrupts_mip_rdata                 (CsrFile_io_836_rdata[31:0]                         ), //i
    .Interrupts_mip_wdata                 (writeback_Interrupts_mip_wdata[31:0]               ), //o
    .Interrupts_mip_write                 (writeback_Interrupts_mip_write                     ), //o
    .out_PC                               (writeback_out_PC[31:0]                             ), //o
    .out_IR                               (writeback_out_IR[31:0]                             ), //o
    .in_RS1_DATA                          (writeback_in_RS1_DATA[31:0]                        ), //i
    .in_CSR_OP                            (pipelineRegs_MEM_1_out_CSR_OP[1:0]                 ), //i
    .in_CSR_USE_IMM                       (pipelineRegs_MEM_1_out_CSR_USE_IMM                 ), //i
    .in_MRET                              (pipelineRegs_MEM_1_out_MRET                        ), //i
    .in_RD_TYPE                           (pipelineRegs_MEM_1_out_RD_TYPE                     ), //i
    .in_TRAP_IS_INTERRUPT                 (pipelineRegs_MEM_1_out_TRAP_IS_INTERRUPT           ), //i
    .in_RS2_TYPE                          (pipelineRegs_MEM_1_out_RS2_TYPE                    ), //i
    .in_RS2                               (pipelineRegs_MEM_1_out_RS2[4:0]                    ), //i
    .in_IR                                (pipelineRegs_MEM_1_out_IR[31:0]                    ), //i
    .in_RS1                               (pipelineRegs_MEM_1_out_RS1[4:0]                    ), //i
    .in_RD_DATA                           (pipelineRegs_MEM_1_out_RD_DATA[31:0]               ), //i
    .in_TRAP_VAL                          (pipelineRegs_MEM_1_out_TRAP_VAL[31:0]              ), //i
    .in_PC                                (pipelineRegs_MEM_1_out_PC[31:0]                    ), //i
    .in_HAS_TRAPPED                       (pipelineRegs_MEM_1_out_HAS_TRAPPED                 ), //i
    .in_TRAP_CAUSE                        (pipelineRegs_MEM_1_out_TRAP_CAUSE[3:0]             ), //i
    .in_RD                                (pipelineRegs_MEM_1_out_RD[4:0]                     ), //i
    .in_RD_DATA_VALID                     (pipelineRegs_MEM_1_out_RD_DATA_VALID               ), //i
    .in_NEXT_PC                           (pipelineRegs_MEM_1_out_NEXT_PC[31:0]               ), //i
    .in_RS1_TYPE                          (pipelineRegs_MEM_1_out_RS1_TYPE                    )  //i
  );
  PipelineRegs_IF pipelineRegs_IF_1 (
    .shift                   (fetch_arbitration_isDone               ), //i
    .in_TRAP_IS_INTERRUPT    (fetch_out_TRAP_IS_INTERRUPT            ), //i
    .out_TRAP_IS_INTERRUPT   (pipelineRegs_IF_1_out_TRAP_IS_INTERRUPT), //o
    .shift_TRAP_IS_INTERRUPT (1'b0                                   ), //i
    .in_IR                   (fetch_out_IR[31:0]                     ), //i
    .out_IR                  (pipelineRegs_IF_1_out_IR[31:0]         ), //o
    .shift_IR                (1'b0                                   ), //i
    .in_TRAP_VAL             (fetch_out_TRAP_VAL[31:0]               ), //i
    .out_TRAP_VAL            (pipelineRegs_IF_1_out_TRAP_VAL[31:0]   ), //o
    .shift_TRAP_VAL          (1'b0                                   ), //i
    .in_PC                   (fetch_out_PC[31:0]                     ), //i
    .out_PC                  (pipelineRegs_IF_1_out_PC[31:0]         ), //o
    .shift_PC                (1'b0                                   ), //i
    .in_HAS_TRAPPED          (fetch_out_HAS_TRAPPED                  ), //i
    .out_HAS_TRAPPED         (pipelineRegs_IF_1_out_HAS_TRAPPED      ), //o
    .shift_HAS_TRAPPED       (1'b0                                   ), //i
    .in_TRAP_CAUSE           (fetch_out_TRAP_CAUSE[3:0]              ), //i
    .out_TRAP_CAUSE          (pipelineRegs_IF_1_out_TRAP_CAUSE[3:0]  ), //o
    .shift_TRAP_CAUSE        (1'b0                                   ), //i
    .in_NEXT_PC              (fetch_out_NEXT_PC[31:0]                ), //i
    .out_NEXT_PC             (pipelineRegs_IF_1_out_NEXT_PC[31:0]    ), //o
    .shift_NEXT_PC           (1'b0                                   ), //i
    .clk                     (clk                                    ), //i
    .reset                   (reset                                  )  //i
  );
  PipelineRegs_ID pipelineRegs_ID_1 (
    .shift                         (decode_arbitration_isDone                    ), //i
    .in_BU_CONDITION               (decode_out_BU_CONDITION[2:0]                 ), //i
    .out_BU_CONDITION              (pipelineRegs_ID_1_out_BU_CONDITION[2:0]      ), //o
    .shift_BU_CONDITION            (1'b0                                         ), //i
    .in_SHIFT_OP                   (decode_out_SHIFT_OP[1:0]                     ), //i
    .out_SHIFT_OP                  (pipelineRegs_ID_1_out_SHIFT_OP[1:0]          ), //o
    .shift_SHIFT_OP                (1'b0                                         ), //i
    .in_MUL                        (decode_out_MUL                               ), //i
    .out_MUL                       (pipelineRegs_ID_1_out_MUL                    ), //o
    .shift_MUL                     (1'b0                                         ), //i
    .in_EBREAK                     (decode_out_EBREAK                            ), //i
    .out_EBREAK                    (pipelineRegs_ID_1_out_EBREAK                 ), //o
    .shift_EBREAK                  (1'b0                                         ), //i
    .in_RD_TYPE                    (decode_out_RD_TYPE                           ), //i
    .out_RD_TYPE                   (pipelineRegs_ID_1_out_RD_TYPE                ), //o
    .shift_RD_TYPE                 (1'b0                                         ), //i
    .in_TRAP_IS_INTERRUPT          (decode_out_TRAP_IS_INTERRUPT                 ), //i
    .out_TRAP_IS_INTERRUPT         (pipelineRegs_ID_1_out_TRAP_IS_INTERRUPT      ), //o
    .shift_TRAP_IS_INTERRUPT       (1'b0                                         ), //i
    .in_RS2_TYPE                   (decode_out_RS2_TYPE                          ), //i
    .out_RS2_TYPE                  (pipelineRegs_ID_1_out_RS2_TYPE               ), //o
    .shift_RS2_TYPE                (1'b0                                         ), //i
    .in_RS2                        (decode_out_RS2[4:0]                          ), //i
    .out_RS2                       (pipelineRegs_ID_1_out_RS2[4:0]               ), //o
    .shift_RS2                     (1'b0                                         ), //i
    .in_IR                         (decode_out_IR[31:0]                          ), //i
    .out_IR                        (pipelineRegs_ID_1_out_IR[31:0]               ), //o
    .shift_IR                      (1'b0                                         ), //i
    .in_RS1_DATA                   (pipelineRegs_ID_1_in_RS1_DATA[31:0]          ), //i
    .out_RS1_DATA                  (pipelineRegs_ID_1_out_RS1_DATA[31:0]         ), //o
    .shift_RS1_DATA                (pipelineRegs_ID_1_shift_RS1_DATA             ), //i
    .in_RS1                        (decode_out_RS1[4:0]                          ), //i
    .out_RS1                       (pipelineRegs_ID_1_out_RS1[4:0]               ), //o
    .shift_RS1                     (1'b0                                         ), //i
    .in_IMM_USED                   (decode_out_IMM_USED                          ), //i
    .out_IMM_USED                  (pipelineRegs_ID_1_out_IMM_USED               ), //o
    .shift_IMM_USED                (1'b0                                         ), //i
    .in_LSU_OPERATION_TYPE         (decode_out_LSU_OPERATION_TYPE[1:0]           ), //i
    .out_LSU_OPERATION_TYPE        (pipelineRegs_ID_1_out_LSU_OPERATION_TYPE[1:0]), //o
    .shift_LSU_OPERATION_TYPE      (1'b0                                         ), //i
    .in_BU_IS_BRANCH               (decode_out_BU_IS_BRANCH                      ), //i
    .out_BU_IS_BRANCH              (pipelineRegs_ID_1_out_BU_IS_BRANCH           ), //o
    .shift_BU_IS_BRANCH            (1'b0                                         ), //i
    .in_ALU_OP                     (decode_out_ALU_OP[2:0]                       ), //i
    .out_ALU_OP                    (pipelineRegs_ID_1_out_ALU_OP[2:0]            ), //o
    .shift_ALU_OP                  (1'b0                                         ), //i
    .in_REM                        (decode_out_REM                               ), //i
    .out_REM                       (pipelineRegs_ID_1_out_REM                    ), //o
    .shift_REM                     (1'b0                                         ), //i
    .in_ALU_COMMIT_RESULT          (decode_out_ALU_COMMIT_RESULT                 ), //i
    .out_ALU_COMMIT_RESULT         (pipelineRegs_ID_1_out_ALU_COMMIT_RESULT      ), //o
    .shift_ALU_COMMIT_RESULT       (1'b0                                         ), //i
    .in_TRAP_VAL                   (decode_out_TRAP_VAL[31:0]                    ), //i
    .out_TRAP_VAL                  (pipelineRegs_ID_1_out_TRAP_VAL[31:0]         ), //o
    .shift_TRAP_VAL                (1'b0                                         ), //i
    .in_BU_WRITE_RET_ADDR_TO_RD    (decode_out_BU_WRITE_RET_ADDR_TO_RD           ), //i
    .out_BU_WRITE_RET_ADDR_TO_RD   (pipelineRegs_ID_1_out_BU_WRITE_RET_ADDR_TO_RD), //o
    .shift_BU_WRITE_RET_ADDR_TO_RD (1'b0                                         ), //i
    .in_PC                         (decode_out_PC[31:0]                          ), //i
    .out_PC                        (pipelineRegs_ID_1_out_PC[31:0]               ), //o
    .shift_PC                      (1'b0                                         ), //i
    .in_HAS_TRAPPED                (decode_out_HAS_TRAPPED                       ), //i
    .out_HAS_TRAPPED               (pipelineRegs_ID_1_out_HAS_TRAPPED            ), //o
    .shift_HAS_TRAPPED             (1'b0                                         ), //i
    .in_ECALL                      (decode_out_ECALL                             ), //i
    .out_ECALL                     (pipelineRegs_ID_1_out_ECALL                  ), //o
    .shift_ECALL                   (1'b0                                         ), //i
    .in_TRAP_CAUSE                 (decode_out_TRAP_CAUSE[3:0]                   ), //i
    .out_TRAP_CAUSE                (pipelineRegs_ID_1_out_TRAP_CAUSE[3:0]        ), //o
    .shift_TRAP_CAUSE              (1'b0                                         ), //i
    .in_LSU_IS_UNSIGNED            (decode_out_LSU_IS_UNSIGNED                   ), //i
    .out_LSU_IS_UNSIGNED           (pipelineRegs_ID_1_out_LSU_IS_UNSIGNED        ), //o
    .shift_LSU_IS_UNSIGNED         (1'b0                                         ), //i
    .in_CSR_OP                     (decode_out_CSR_OP[1:0]                       ), //i
    .out_CSR_OP                    (pipelineRegs_ID_1_out_CSR_OP[1:0]            ), //o
    .shift_CSR_OP                  (1'b0                                         ), //i
    .in_RS2_DATA                   (pipelineRegs_ID_1_in_RS2_DATA[31:0]          ), //i
    .out_RS2_DATA                  (pipelineRegs_ID_1_out_RS2_DATA[31:0]         ), //o
    .shift_RS2_DATA                (pipelineRegs_ID_1_shift_RS2_DATA             ), //i
    .in_ALU_SRC1                   (decode_out_ALU_SRC1                          ), //i
    .out_ALU_SRC1                  (pipelineRegs_ID_1_out_ALU_SRC1               ), //o
    .shift_ALU_SRC1                (1'b0                                         ), //i
    .in_RD                         (decode_out_RD[4:0]                           ), //i
    .out_RD                        (pipelineRegs_ID_1_out_RD[4:0]                ), //o
    .shift_RD                      (1'b0                                         ), //i
    .in_MUL_HIGH                   (decode_out_MUL_HIGH                          ), //i
    .out_MUL_HIGH                  (pipelineRegs_ID_1_out_MUL_HIGH               ), //o
    .shift_MUL_HIGH                (1'b0                                         ), //i
    .in_CSR_USE_IMM                (decode_out_CSR_USE_IMM                       ), //i
    .out_CSR_USE_IMM               (pipelineRegs_ID_1_out_CSR_USE_IMM            ), //o
    .shift_CSR_USE_IMM             (1'b0                                         ), //i
    .in_BU_IGNORE_TARGET_LSB       (decode_out_BU_IGNORE_TARGET_LSB              ), //i
    .out_BU_IGNORE_TARGET_LSB      (pipelineRegs_ID_1_out_BU_IGNORE_TARGET_LSB   ), //o
    .shift_BU_IGNORE_TARGET_LSB    (1'b0                                         ), //i
    .in_RD_DATA_VALID              (decode_out_RD_DATA_VALID                     ), //i
    .out_RD_DATA_VALID             (pipelineRegs_ID_1_out_RD_DATA_VALID          ), //o
    .shift_RD_DATA_VALID           (1'b0                                         ), //i
    .in_DIV                        (decode_out_DIV                               ), //i
    .out_DIV                       (pipelineRegs_ID_1_out_DIV                    ), //o
    .shift_DIV                     (1'b0                                         ), //i
    .in_MRET                       (decode_out_MRET                              ), //i
    .out_MRET                      (pipelineRegs_ID_1_out_MRET                   ), //o
    .shift_MRET                    (1'b0                                         ), //i
    .in_LSU_ACCESS_WIDTH           (decode_out_LSU_ACCESS_WIDTH[1:0]             ), //i
    .out_LSU_ACCESS_WIDTH          (pipelineRegs_ID_1_out_LSU_ACCESS_WIDTH[1:0]  ), //o
    .shift_LSU_ACCESS_WIDTH        (1'b0                                         ), //i
    .in_NEXT_PC                    (decode_out_NEXT_PC[31:0]                     ), //i
    .out_NEXT_PC                   (pipelineRegs_ID_1_out_NEXT_PC[31:0]          ), //o
    .shift_NEXT_PC                 (1'b0                                         ), //i
    .in_RS1_TYPE                   (decode_out_RS1_TYPE                          ), //i
    .out_RS1_TYPE                  (pipelineRegs_ID_1_out_RS1_TYPE               ), //o
    .shift_RS1_TYPE                (1'b0                                         ), //i
    .in_IMM                        (decode_out_IMM[31:0]                         ), //i
    .out_IMM                       (pipelineRegs_ID_1_out_IMM[31:0]              ), //o
    .shift_IMM                     (1'b0                                         ), //i
    .in_ALU_SRC2                   (decode_out_ALU_SRC2                          ), //i
    .out_ALU_SRC2                  (pipelineRegs_ID_1_out_ALU_SRC2               ), //o
    .shift_ALU_SRC2                (1'b0                                         ), //i
    .in_MULDIV_RS2_SIGNED          (decode_out_MULDIV_RS2_SIGNED                 ), //i
    .out_MULDIV_RS2_SIGNED         (pipelineRegs_ID_1_out_MULDIV_RS2_SIGNED      ), //o
    .shift_MULDIV_RS2_SIGNED       (1'b0                                         ), //i
    .in_LSU_TARGET_VALID           (decode_out_LSU_TARGET_VALID                  ), //i
    .out_LSU_TARGET_VALID          (pipelineRegs_ID_1_out_LSU_TARGET_VALID       ), //o
    .shift_LSU_TARGET_VALID        (1'b0                                         ), //i
    .in_MULDIV_RS1_SIGNED          (decode_out_MULDIV_RS1_SIGNED                 ), //i
    .out_MULDIV_RS1_SIGNED         (pipelineRegs_ID_1_out_MULDIV_RS1_SIGNED      ), //o
    .shift_MULDIV_RS1_SIGNED       (1'b0                                         ), //i
    .clk                           (clk                                          ), //i
    .reset                         (reset                                        )  //i
  );
  PipelineRegs_EX pipelineRegs_EX_1 (
    .shift                    (execute_arbitration_isDone                   ), //i
    .in_RD_TYPE               (execute_out_RD_TYPE                          ), //i
    .out_RD_TYPE              (pipelineRegs_EX_1_out_RD_TYPE                ), //o
    .shift_RD_TYPE            (1'b0                                         ), //i
    .in_TRAP_IS_INTERRUPT     (execute_out_TRAP_IS_INTERRUPT                ), //i
    .out_TRAP_IS_INTERRUPT    (pipelineRegs_EX_1_out_TRAP_IS_INTERRUPT      ), //o
    .shift_TRAP_IS_INTERRUPT  (1'b0                                         ), //i
    .in_RS2_TYPE              (execute_out_RS2_TYPE                         ), //i
    .out_RS2_TYPE             (pipelineRegs_EX_1_out_RS2_TYPE               ), //o
    .shift_RS2_TYPE           (1'b0                                         ), //i
    .in_RS2                   (execute_out_RS2[4:0]                         ), //i
    .out_RS2                  (pipelineRegs_EX_1_out_RS2[4:0]               ), //o
    .shift_RS2                (1'b0                                         ), //i
    .in_IR                    (execute_out_IR[31:0]                         ), //i
    .out_IR                   (pipelineRegs_EX_1_out_IR[31:0]               ), //o
    .shift_IR                 (1'b0                                         ), //i
    .in_RS1_DATA              (pipelineRegs_EX_1_in_RS1_DATA[31:0]          ), //i
    .out_RS1_DATA             (pipelineRegs_EX_1_out_RS1_DATA[31:0]         ), //o
    .shift_RS1_DATA           (pipelineRegs_EX_1_shift_RS1_DATA             ), //i
    .in_RS1                   (execute_out_RS1[4:0]                         ), //i
    .out_RS1                  (pipelineRegs_EX_1_out_RS1[4:0]               ), //o
    .shift_RS1                (1'b0                                         ), //i
    .in_LSU_OPERATION_TYPE    (execute_out_LSU_OPERATION_TYPE[1:0]          ), //i
    .out_LSU_OPERATION_TYPE   (pipelineRegs_EX_1_out_LSU_OPERATION_TYPE[1:0]), //o
    .shift_LSU_OPERATION_TYPE (1'b0                                         ), //i
    .in_RD_DATA               (execute_out_RD_DATA[31:0]                    ), //i
    .out_RD_DATA              (pipelineRegs_EX_1_out_RD_DATA[31:0]          ), //o
    .shift_RD_DATA            (1'b0                                         ), //i
    .in_TRAP_VAL              (execute_out_TRAP_VAL[31:0]                   ), //i
    .out_TRAP_VAL             (pipelineRegs_EX_1_out_TRAP_VAL[31:0]         ), //o
    .shift_TRAP_VAL           (1'b0                                         ), //i
    .in_PC                    (execute_out_PC[31:0]                         ), //i
    .out_PC                   (pipelineRegs_EX_1_out_PC[31:0]               ), //o
    .shift_PC                 (1'b0                                         ), //i
    .in_HAS_TRAPPED           (execute_out_HAS_TRAPPED                      ), //i
    .out_HAS_TRAPPED          (pipelineRegs_EX_1_out_HAS_TRAPPED            ), //o
    .shift_HAS_TRAPPED        (1'b0                                         ), //i
    .in_ALU_RESULT            (execute_out_ALU_RESULT[31:0]                 ), //i
    .out_ALU_RESULT           (pipelineRegs_EX_1_out_ALU_RESULT[31:0]       ), //o
    .shift_ALU_RESULT         (1'b0                                         ), //i
    .in_TRAP_CAUSE            (execute_out_TRAP_CAUSE[3:0]                  ), //i
    .out_TRAP_CAUSE           (pipelineRegs_EX_1_out_TRAP_CAUSE[3:0]        ), //o
    .shift_TRAP_CAUSE         (1'b0                                         ), //i
    .in_LSU_IS_UNSIGNED       (execute_out_LSU_IS_UNSIGNED                  ), //i
    .out_LSU_IS_UNSIGNED      (pipelineRegs_EX_1_out_LSU_IS_UNSIGNED        ), //o
    .shift_LSU_IS_UNSIGNED    (1'b0                                         ), //i
    .in_CSR_OP                (execute_out_CSR_OP[1:0]                      ), //i
    .out_CSR_OP               (pipelineRegs_EX_1_out_CSR_OP[1:0]            ), //o
    .shift_CSR_OP             (1'b0                                         ), //i
    .in_RS2_DATA              (pipelineRegs_EX_1_in_RS2_DATA[31:0]          ), //i
    .out_RS2_DATA             (pipelineRegs_EX_1_out_RS2_DATA[31:0]         ), //o
    .shift_RS2_DATA           (pipelineRegs_EX_1_shift_RS2_DATA             ), //i
    .in_RD                    (execute_out_RD[4:0]                          ), //i
    .out_RD                   (pipelineRegs_EX_1_out_RD[4:0]                ), //o
    .shift_RD                 (1'b0                                         ), //i
    .in_CSR_USE_IMM           (execute_out_CSR_USE_IMM                      ), //i
    .out_CSR_USE_IMM          (pipelineRegs_EX_1_out_CSR_USE_IMM            ), //o
    .shift_CSR_USE_IMM        (1'b0                                         ), //i
    .in_RD_DATA_VALID         (execute_out_RD_DATA_VALID                    ), //i
    .out_RD_DATA_VALID        (pipelineRegs_EX_1_out_RD_DATA_VALID          ), //o
    .shift_RD_DATA_VALID      (1'b0                                         ), //i
    .in_MRET                  (execute_out_MRET                             ), //i
    .out_MRET                 (pipelineRegs_EX_1_out_MRET                   ), //o
    .shift_MRET               (1'b0                                         ), //i
    .in_LSU_ACCESS_WIDTH      (execute_out_LSU_ACCESS_WIDTH[1:0]            ), //i
    .out_LSU_ACCESS_WIDTH     (pipelineRegs_EX_1_out_LSU_ACCESS_WIDTH[1:0]  ), //o
    .shift_LSU_ACCESS_WIDTH   (1'b0                                         ), //i
    .in_NEXT_PC               (execute_out_NEXT_PC[31:0]                    ), //i
    .out_NEXT_PC              (pipelineRegs_EX_1_out_NEXT_PC[31:0]          ), //o
    .shift_NEXT_PC            (1'b0                                         ), //i
    .in_RS1_TYPE              (execute_out_RS1_TYPE                         ), //i
    .out_RS1_TYPE             (pipelineRegs_EX_1_out_RS1_TYPE               ), //o
    .shift_RS1_TYPE           (1'b0                                         ), //i
    .in_LSU_TARGET_VALID      (execute_out_LSU_TARGET_VALID                 ), //i
    .out_LSU_TARGET_VALID     (pipelineRegs_EX_1_out_LSU_TARGET_VALID       ), //o
    .shift_LSU_TARGET_VALID   (1'b0                                         ), //i
    .clk                      (clk                                          ), //i
    .reset                    (reset                                        )  //i
  );
  PipelineRegs_MEM pipelineRegs_MEM_1 (
    .shift                   (memory_arbitration_isDone               ), //i
    .in_RD_TYPE              (memory_out_RD_TYPE                      ), //i
    .out_RD_TYPE             (pipelineRegs_MEM_1_out_RD_TYPE          ), //o
    .shift_RD_TYPE           (1'b0                                    ), //i
    .in_TRAP_IS_INTERRUPT    (memory_out_TRAP_IS_INTERRUPT            ), //i
    .out_TRAP_IS_INTERRUPT   (pipelineRegs_MEM_1_out_TRAP_IS_INTERRUPT), //o
    .shift_TRAP_IS_INTERRUPT (1'b0                                    ), //i
    .in_RS2_TYPE             (memory_out_RS2_TYPE                     ), //i
    .out_RS2_TYPE            (pipelineRegs_MEM_1_out_RS2_TYPE         ), //o
    .shift_RS2_TYPE          (1'b0                                    ), //i
    .in_RS2                  (memory_out_RS2[4:0]                     ), //i
    .out_RS2                 (pipelineRegs_MEM_1_out_RS2[4:0]         ), //o
    .shift_RS2               (1'b0                                    ), //i
    .in_IR                   (memory_out_IR[31:0]                     ), //i
    .out_IR                  (pipelineRegs_MEM_1_out_IR[31:0]         ), //o
    .shift_IR                (1'b0                                    ), //i
    .in_RS1_DATA             (pipelineRegs_MEM_1_in_RS1_DATA[31:0]    ), //i
    .out_RS1_DATA            (pipelineRegs_MEM_1_out_RS1_DATA[31:0]   ), //o
    .shift_RS1_DATA          (pipelineRegs_MEM_1_shift_RS1_DATA       ), //i
    .in_RS1                  (memory_out_RS1[4:0]                     ), //i
    .out_RS1                 (pipelineRegs_MEM_1_out_RS1[4:0]         ), //o
    .shift_RS1               (1'b0                                    ), //i
    .in_RD_DATA              (memory_out_RD_DATA[31:0]                ), //i
    .out_RD_DATA             (pipelineRegs_MEM_1_out_RD_DATA[31:0]    ), //o
    .shift_RD_DATA           (1'b0                                    ), //i
    .in_TRAP_VAL             (memory_out_TRAP_VAL[31:0]               ), //i
    .out_TRAP_VAL            (pipelineRegs_MEM_1_out_TRAP_VAL[31:0]   ), //o
    .shift_TRAP_VAL          (1'b0                                    ), //i
    .in_PC                   (memory_out_PC[31:0]                     ), //i
    .out_PC                  (pipelineRegs_MEM_1_out_PC[31:0]         ), //o
    .shift_PC                (1'b0                                    ), //i
    .in_HAS_TRAPPED          (memory_out_HAS_TRAPPED                  ), //i
    .out_HAS_TRAPPED         (pipelineRegs_MEM_1_out_HAS_TRAPPED      ), //o
    .shift_HAS_TRAPPED       (1'b0                                    ), //i
    .in_TRAP_CAUSE           (memory_out_TRAP_CAUSE[3:0]              ), //i
    .out_TRAP_CAUSE          (pipelineRegs_MEM_1_out_TRAP_CAUSE[3:0]  ), //o
    .shift_TRAP_CAUSE        (1'b0                                    ), //i
    .in_CSR_OP               (memory_out_CSR_OP[1:0]                  ), //i
    .out_CSR_OP              (pipelineRegs_MEM_1_out_CSR_OP[1:0]      ), //o
    .shift_CSR_OP            (1'b0                                    ), //i
    .in_RD                   (memory_out_RD[4:0]                      ), //i
    .out_RD                  (pipelineRegs_MEM_1_out_RD[4:0]          ), //o
    .shift_RD                (1'b0                                    ), //i
    .in_CSR_USE_IMM          (memory_out_CSR_USE_IMM                  ), //i
    .out_CSR_USE_IMM         (pipelineRegs_MEM_1_out_CSR_USE_IMM      ), //o
    .shift_CSR_USE_IMM       (1'b0                                    ), //i
    .in_RD_DATA_VALID        (memory_out_RD_DATA_VALID                ), //i
    .out_RD_DATA_VALID       (pipelineRegs_MEM_1_out_RD_DATA_VALID    ), //o
    .shift_RD_DATA_VALID     (1'b0                                    ), //i
    .in_MRET                 (memory_out_MRET                         ), //i
    .out_MRET                (pipelineRegs_MEM_1_out_MRET             ), //o
    .shift_MRET              (1'b0                                    ), //i
    .in_NEXT_PC              (memory_out_NEXT_PC[31:0]                ), //i
    .out_NEXT_PC             (pipelineRegs_MEM_1_out_NEXT_PC[31:0]    ), //o
    .shift_NEXT_PC           (1'b0                                    ), //i
    .in_RS1_TYPE             (memory_out_RS1_TYPE                     ), //i
    .out_RS1_TYPE            (pipelineRegs_MEM_1_out_RS1_TYPE         ), //o
    .shift_RS1_TYPE          (1'b0                                    ), //i
    .clk                     (clk                                     ), //i
    .reset                   (reset                                   )  //i
  );
  CsrFile CsrFile (
    .io_rid             (writeback_CsrFile_csrIo_rid[11:0]        ), //i
    .io_wid             (writeback_CsrFile_csrIo_wid[11:0]        ), //i
    .io_rdata           (CsrFile_io_rdata[31:0]                   ), //o
    .io_wdata           (writeback_CsrFile_csrIo_wdata[31:0]      ), //i
    .io_read            (writeback_CsrFile_csrIo_read             ), //i
    .io_write           (writeback_CsrFile_csrIo_write            ), //i
    .io_error           (CsrFile_io_error                         ), //o
    .writeNotify_write  (CsrFile_writeNotify_write                ), //o
    .CsrFile_incInstret (writeback_arbitration_isDone             ), //i
    .io_768_rdata       (CsrFile_io_768_rdata[31:0]               ), //o
    .io_768_wdata       (writeback_TrapHandler_mstatus_wdata[31:0]), //i
    .io_768_write       (writeback_TrapHandler_mstatus_write      ), //i
    .io_773_rdata       (CsrFile_io_773_rdata[31:0]               ), //o
    .io_773_wdata       (writeback_TrapHandler_mtvec_wdata[31:0]  ), //i
    .io_773_write       (writeback_TrapHandler_mtvec_write        ), //i
    .io_834_rdata       (CsrFile_io_834_rdata[31:0]               ), //o
    .io_834_wdata       (writeback_TrapHandler_mcause_wdata[31:0] ), //i
    .io_834_write       (writeback_TrapHandler_mcause_write       ), //i
    .io_833_rdata       (CsrFile_io_833_rdata[31:0]               ), //o
    .io_833_wdata       (writeback_TrapHandler_mepc_wdata[31:0]   ), //i
    .io_833_write       (writeback_TrapHandler_mepc_write         ), //i
    .io_835_rdata       (CsrFile_io_835_rdata[31:0]               ), //o
    .io_835_wdata       (writeback_TrapHandler_mtval_wdata[31:0]  ), //i
    .io_835_write       (writeback_TrapHandler_mtval_write        ), //i
    .io_768_rdata_1     (CsrFile_io_768_rdata_1[31:0]             ), //o
    .io_768_wdata_1     (writeback_Interrupts_mstatus_wdata[31:0] ), //i
    .io_768_write_1     (writeback_Interrupts_mstatus_write       ), //i
    .io_772_rdata       (CsrFile_io_772_rdata[31:0]               ), //o
    .io_772_wdata       (writeback_Interrupts_mie_wdata[31:0]     ), //i
    .io_772_write       (writeback_Interrupts_mie_write           ), //i
    .io_836_rdata       (CsrFile_io_836_rdata[31:0]               ), //o
    .io_836_wdata       (writeback_Interrupts_mip_wdata[31:0]     ), //i
    .io_836_write       (writeback_Interrupts_mip_write           ), //i
    .clk                (clk                                      ), //i
    .reset              (reset                                    )  //i
  );
  RegisterFile RegisterFileAccessor (
    .readIo_rs1     (decode_RegisterFileAccessor_regFileIo_rs1[4:0]     ), //i
    .readIo_rs2     (decode_RegisterFileAccessor_regFileIo_rs2[4:0]     ), //i
    .readIo_rs1Data (RegisterFileAccessor_readIo_rs1Data[31:0]          ), //o
    .readIo_rs2Data (RegisterFileAccessor_readIo_rs2Data[31:0]          ), //o
    .writeIo_rd     (writeback_RegisterFileAccessor_regFileIo_rd[4:0]   ), //i
    .writeIo_data   (writeback_RegisterFileAccessor_regFileIo_data[31:0]), //i
    .writeIo_write  (writeback_RegisterFileAccessor_regFileIo_write     ), //i
    .clk            (clk                                                ), //i
    .reset          (reset                                              )  //i
  );
  assign PcManager_pcOverride_valid = 1'b0;
  assign PcManager_pcOverride_payload = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
  always @(*) begin
    fetch_arbitration_isValid = (! reset);
    if(when_TrapHandler_l33) begin
      fetch_arbitration_isValid = 1'b0;
    end
    if(_zz_when) begin
      fetch_arbitration_isValid = 1'b0;
    end else begin
      if(when_PcManager_l129) begin
        fetch_arbitration_isValid = 1'b0;
      end
      if(when_PcManager_l129_1) begin
        fetch_arbitration_isValid = 1'b0;
      end
    end
  end

  assign fetch_arbitration_isStalled = (decode_arbitration_isStalled || (decode_arbitration_isValid && (! decode_arbitration_isReady)));
  assign decode_arbitration_isStalled = (execute_arbitration_isStalled || (execute_arbitration_isValid && (! execute_arbitration_isReady)));
  always @(*) begin
    execute_arbitration_isStalled = (memory_arbitration_isStalled || (memory_arbitration_isValid && (! memory_arbitration_isReady)));
    if(execute_arbitration_isValid) begin
      if(when_DataHazardResolver_l99) begin
        if(when_DataHazardResolver_l113) begin
          if(!pipelineRegs_MEM_1_out_RD_DATA_VALID) begin
            if(execute_arbitration_rs1Needed) begin
              execute_arbitration_isStalled = 1'b1;
            end
          end
        end
        if(when_DataHazardResolver_l113_1) begin
          if(!pipelineRegs_EX_1_out_RD_DATA_VALID) begin
            if(execute_arbitration_rs1Needed) begin
              execute_arbitration_isStalled = 1'b1;
            end
          end
        end
      end
    end
    if(execute_arbitration_isValid) begin
      if(when_DataHazardResolver_l99_1) begin
        if(when_DataHazardResolver_l113_2) begin
          if(!pipelineRegs_MEM_1_out_RD_DATA_VALID) begin
            if(execute_arbitration_rs2Needed) begin
              execute_arbitration_isStalled = 1'b1;
            end
          end
        end
        if(when_DataHazardResolver_l113_3) begin
          if(!pipelineRegs_EX_1_out_RD_DATA_VALID) begin
            if(execute_arbitration_rs2Needed) begin
              execute_arbitration_isStalled = 1'b1;
            end
          end
        end
      end
    end
  end

  always @(*) begin
    memory_arbitration_isStalled = (writeback_arbitration_isStalled || (writeback_arbitration_isValid && (! writeback_arbitration_isReady)));
    if(memory_arbitration_isValid) begin
      if(when_DataHazardResolver_l99_2) begin
        if(when_DataHazardResolver_l113_4) begin
          if(!pipelineRegs_MEM_1_out_RD_DATA_VALID) begin
            if(memory_arbitration_rs1Needed) begin
              memory_arbitration_isStalled = 1'b1;
            end
          end
        end
      end
    end
    if(memory_arbitration_isValid) begin
      if(when_DataHazardResolver_l99_3) begin
        if(when_DataHazardResolver_l113_5) begin
          if(!pipelineRegs_MEM_1_out_RD_DATA_VALID) begin
            if(memory_arbitration_rs2Needed) begin
              memory_arbitration_isStalled = 1'b1;
            end
          end
        end
      end
    end
  end

  assign writeback_arbitration_isStalled = 1'b0;
  always @(*) begin
    decode_arbitration_isValid = _zz_arbitration_isValid;
    if(when_TrapHandler_l33_1) begin
      decode_arbitration_isValid = 1'b0;
    end
    if(_zz_when) begin
      decode_arbitration_isValid = 1'b0;
    end else begin
      if(when_PcManager_l129) begin
        decode_arbitration_isValid = 1'b0;
      end
      if(when_PcManager_l129_1) begin
        decode_arbitration_isValid = 1'b0;
      end
    end
  end

  assign when_Scheduler_l42 = (decode_arbitration_isDone || (! decode_arbitration_isValid));
  always @(*) begin
    execute_arbitration_isValid = _zz_arbitration_isValid_1;
    if(when_TrapHandler_l33_2) begin
      execute_arbitration_isValid = 1'b0;
    end
    if(_zz_when) begin
      execute_arbitration_isValid = 1'b0;
    end else begin
      if(when_PcManager_l129) begin
        execute_arbitration_isValid = 1'b0;
      end
    end
  end

  assign when_Scheduler_l42_1 = (execute_arbitration_isDone || (! execute_arbitration_isValid));
  always @(*) begin
    memory_arbitration_isValid = _zz_arbitration_isValid_2;
    if(when_TrapHandler_l33_3) begin
      memory_arbitration_isValid = 1'b0;
    end
    if(_zz_when) begin
      memory_arbitration_isValid = 1'b0;
    end else begin
      if(when_PcManager_l129) begin
        memory_arbitration_isValid = 1'b0;
      end
    end
  end

  assign when_Scheduler_l42_2 = (memory_arbitration_isDone || (! memory_arbitration_isValid));
  always @(*) begin
    writeback_arbitration_isValid = _zz_arbitration_isValid_3;
    if(_zz_when) begin
      writeback_arbitration_isValid = 1'b0;
    end
  end

  assign when_Scheduler_l42_3 = (writeback_arbitration_isDone || (! writeback_arbitration_isValid));
  assign when_TrapHandler_l33 = (|{(writeback_arbitration_isValid && writeback_out_HAS_TRAPPED),{(memory_arbitration_isValid && memory_out_HAS_TRAPPED),{(execute_arbitration_isValid && execute_out_HAS_TRAPPED),(decode_arbitration_isValid && decode_out_HAS_TRAPPED)}}});
  assign when_TrapHandler_l33_1 = (|{(writeback_arbitration_isValid && writeback_out_HAS_TRAPPED),{(memory_arbitration_isValid && memory_out_HAS_TRAPPED),(execute_arbitration_isValid && execute_out_HAS_TRAPPED)}});
  assign when_TrapHandler_l33_2 = (|{(writeback_arbitration_isValid && writeback_out_HAS_TRAPPED),(memory_arbitration_isValid && memory_out_HAS_TRAPPED)});
  assign when_TrapHandler_l33_3 = (|(writeback_arbitration_isValid && writeback_out_HAS_TRAPPED));
  always @(*) begin
    pipelineRegs_ID_1_shift_RS1_DATA = 1'b0;
    if(when_DataHazardResolver_l150) begin
      if(when_DataHazardResolver_l124) begin
        pipelineRegs_ID_1_shift_RS1_DATA = 1'b1;
      end
    end
  end

  always @(*) begin
    pipelineRegs_ID_1_in_RS1_DATA = decode_out_RS1_DATA;
    if(when_DataHazardResolver_l150) begin
      if(when_DataHazardResolver_l124) begin
        pipelineRegs_ID_1_in_RS1_DATA = _zz_in_RS1_DATA;
      end
    end
  end

  always @(*) begin
    execute_in_RS1_DATA = pipelineRegs_ID_1_out_RS1_DATA;
    if(execute_arbitration_isValid) begin
      if(when_DataHazardResolver_l99) begin
        if(when_DataHazardResolver_l124) begin
          execute_in_RS1_DATA = _zz_in_RS1_DATA;
        end
      end
    end
  end

  always @(*) begin
    pipelineRegs_EX_1_shift_RS1_DATA = 1'b0;
    if(when_DataHazardResolver_l150_1) begin
      if(when_DataHazardResolver_l124_2) begin
        pipelineRegs_EX_1_shift_RS1_DATA = 1'b1;
      end
    end
  end

  always @(*) begin
    pipelineRegs_EX_1_in_RS1_DATA = execute_out_RS1_DATA;
    if(when_DataHazardResolver_l150_1) begin
      if(when_DataHazardResolver_l124_2) begin
        pipelineRegs_EX_1_in_RS1_DATA = _zz_in_RS1_DATA_1;
      end
    end
  end

  always @(*) begin
    memory_in_RS1_DATA = pipelineRegs_EX_1_out_RS1_DATA;
    if(memory_arbitration_isValid) begin
      if(when_DataHazardResolver_l99_2) begin
        if(when_DataHazardResolver_l124_2) begin
          memory_in_RS1_DATA = _zz_in_RS1_DATA_1;
        end
      end
    end
  end

  always @(*) begin
    pipelineRegs_MEM_1_shift_RS1_DATA = 1'b0;
    if(when_DataHazardResolver_l150_2) begin
      if(when_DataHazardResolver_l124_4) begin
        pipelineRegs_MEM_1_shift_RS1_DATA = 1'b1;
      end
    end
  end

  always @(*) begin
    pipelineRegs_MEM_1_in_RS1_DATA = memory_out_RS1_DATA;
    if(when_DataHazardResolver_l150_2) begin
      if(when_DataHazardResolver_l124_4) begin
        pipelineRegs_MEM_1_in_RS1_DATA = _zz_in_RS1_DATA_2;
      end
    end
  end

  always @(*) begin
    writeback_in_RS1_DATA = pipelineRegs_MEM_1_out_RS1_DATA;
    if(writeback_arbitration_isValid) begin
      if(when_DataHazardResolver_l99_4) begin
        if(when_DataHazardResolver_l124_4) begin
          writeback_in_RS1_DATA = _zz_in_RS1_DATA_2;
        end
      end
    end
  end

  always @(*) begin
    pipelineRegs_ID_1_shift_RS2_DATA = 1'b0;
    if(when_DataHazardResolver_l150) begin
      if(when_DataHazardResolver_l124_1) begin
        pipelineRegs_ID_1_shift_RS2_DATA = 1'b1;
      end
    end
  end

  always @(*) begin
    pipelineRegs_ID_1_in_RS2_DATA = decode_out_RS2_DATA;
    if(when_DataHazardResolver_l150) begin
      if(when_DataHazardResolver_l124_1) begin
        pipelineRegs_ID_1_in_RS2_DATA = _zz_in_RS2_DATA;
      end
    end
  end

  always @(*) begin
    execute_in_RS2_DATA = pipelineRegs_ID_1_out_RS2_DATA;
    if(execute_arbitration_isValid) begin
      if(when_DataHazardResolver_l99_1) begin
        if(when_DataHazardResolver_l124_1) begin
          execute_in_RS2_DATA = _zz_in_RS2_DATA;
        end
      end
    end
  end

  always @(*) begin
    pipelineRegs_EX_1_shift_RS2_DATA = 1'b0;
    if(when_DataHazardResolver_l150_1) begin
      if(when_DataHazardResolver_l124_3) begin
        pipelineRegs_EX_1_shift_RS2_DATA = 1'b1;
      end
    end
  end

  always @(*) begin
    pipelineRegs_EX_1_in_RS2_DATA = execute_out_RS2_DATA;
    if(when_DataHazardResolver_l150_1) begin
      if(when_DataHazardResolver_l124_3) begin
        pipelineRegs_EX_1_in_RS2_DATA = _zz_in_RS2_DATA_1;
      end
    end
  end

  always @(*) begin
    memory_in_RS2_DATA = pipelineRegs_EX_1_out_RS2_DATA;
    if(memory_arbitration_isValid) begin
      if(when_DataHazardResolver_l99_3) begin
        if(when_DataHazardResolver_l124_3) begin
          memory_in_RS2_DATA = _zz_in_RS2_DATA_1;
        end
      end
    end
  end

  assign when_DataHazardResolver_l77 = (writeback_arbitration_isDone && (! writeback_out_HAS_TRAPPED));
  always @(*) begin
    when_DataHazardResolver_l124 = 1'b0;
    if(execute_arbitration_isValid) begin
      if(when_DataHazardResolver_l99) begin
        if(when_DataHazardResolver_l100) begin
          when_DataHazardResolver_l124 = 1'b1;
        end
        if(when_DataHazardResolver_l113) begin
          if(pipelineRegs_MEM_1_out_RD_DATA_VALID) begin
            when_DataHazardResolver_l124 = 1'b1;
          end else begin
            if(execute_arbitration_rs1Needed) begin
              when_DataHazardResolver_l124 = 1'b0;
            end
          end
        end
        if(when_DataHazardResolver_l113_1) begin
          if(pipelineRegs_EX_1_out_RD_DATA_VALID) begin
            when_DataHazardResolver_l124 = 1'b1;
          end else begin
            if(execute_arbitration_rs1Needed) begin
              when_DataHazardResolver_l124 = 1'b0;
            end
          end
        end
      end
    end
  end

  always @(*) begin
    _zz_in_RS1_DATA = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(execute_arbitration_isValid) begin
      if(when_DataHazardResolver_l99) begin
        if(when_DataHazardResolver_l100) begin
          _zz_in_RS1_DATA = DataHazardResolver_lastWrittenRd_data;
        end
        if(when_DataHazardResolver_l113) begin
          if(pipelineRegs_MEM_1_out_RD_DATA_VALID) begin
            _zz_in_RS1_DATA = pipelineRegs_MEM_1_out_RD_DATA;
          end
        end
        if(when_DataHazardResolver_l113_1) begin
          if(pipelineRegs_EX_1_out_RD_DATA_VALID) begin
            _zz_in_RS1_DATA = pipelineRegs_EX_1_out_RD_DATA;
          end
        end
      end
    end
  end

  assign when_DataHazardResolver_l99 = ((pipelineRegs_ID_1_out_RS1 != 5'h0) && (pipelineRegs_ID_1_out_RS1_TYPE == RegisterType_GPR));
  assign when_DataHazardResolver_l100 = (DataHazardResolver_lastWrittenRd_valid && (DataHazardResolver_lastWrittenRd_id == pipelineRegs_ID_1_out_RS1));
  assign when_DataHazardResolver_l113 = (((writeback_arbitration_isValid && (! writeback_out_HAS_TRAPPED)) && (pipelineRegs_MEM_1_out_RD_TYPE == RegisterType_GPR)) && (pipelineRegs_MEM_1_out_RD == pipelineRegs_ID_1_out_RS1));
  assign when_DataHazardResolver_l113_1 = (((memory_arbitration_isValid && (! memory_out_HAS_TRAPPED)) && (pipelineRegs_EX_1_out_RD_TYPE == RegisterType_GPR)) && (pipelineRegs_EX_1_out_RD == pipelineRegs_ID_1_out_RS1));
  always @(*) begin
    when_DataHazardResolver_l124_1 = 1'b0;
    if(execute_arbitration_isValid) begin
      if(when_DataHazardResolver_l99_1) begin
        if(when_DataHazardResolver_l100_1) begin
          when_DataHazardResolver_l124_1 = 1'b1;
        end
        if(when_DataHazardResolver_l113_2) begin
          if(pipelineRegs_MEM_1_out_RD_DATA_VALID) begin
            when_DataHazardResolver_l124_1 = 1'b1;
          end else begin
            if(execute_arbitration_rs2Needed) begin
              when_DataHazardResolver_l124_1 = 1'b0;
            end
          end
        end
        if(when_DataHazardResolver_l113_3) begin
          if(pipelineRegs_EX_1_out_RD_DATA_VALID) begin
            when_DataHazardResolver_l124_1 = 1'b1;
          end else begin
            if(execute_arbitration_rs2Needed) begin
              when_DataHazardResolver_l124_1 = 1'b0;
            end
          end
        end
      end
    end
  end

  always @(*) begin
    _zz_in_RS2_DATA = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(execute_arbitration_isValid) begin
      if(when_DataHazardResolver_l99_1) begin
        if(when_DataHazardResolver_l100_1) begin
          _zz_in_RS2_DATA = DataHazardResolver_lastWrittenRd_data;
        end
        if(when_DataHazardResolver_l113_2) begin
          if(pipelineRegs_MEM_1_out_RD_DATA_VALID) begin
            _zz_in_RS2_DATA = pipelineRegs_MEM_1_out_RD_DATA;
          end
        end
        if(when_DataHazardResolver_l113_3) begin
          if(pipelineRegs_EX_1_out_RD_DATA_VALID) begin
            _zz_in_RS2_DATA = pipelineRegs_EX_1_out_RD_DATA;
          end
        end
      end
    end
  end

  assign when_DataHazardResolver_l99_1 = ((pipelineRegs_ID_1_out_RS2 != 5'h0) && (pipelineRegs_ID_1_out_RS2_TYPE == RegisterType_GPR));
  assign when_DataHazardResolver_l100_1 = (DataHazardResolver_lastWrittenRd_valid && (DataHazardResolver_lastWrittenRd_id == pipelineRegs_ID_1_out_RS2));
  assign when_DataHazardResolver_l113_2 = (((writeback_arbitration_isValid && (! writeback_out_HAS_TRAPPED)) && (pipelineRegs_MEM_1_out_RD_TYPE == RegisterType_GPR)) && (pipelineRegs_MEM_1_out_RD == pipelineRegs_ID_1_out_RS2));
  assign when_DataHazardResolver_l113_3 = (((memory_arbitration_isValid && (! memory_out_HAS_TRAPPED)) && (pipelineRegs_EX_1_out_RD_TYPE == RegisterType_GPR)) && (pipelineRegs_EX_1_out_RD == pipelineRegs_ID_1_out_RS2));
  assign when_DataHazardResolver_l150 = (execute_arbitration_isStalled || (! execute_arbitration_isReady));
  always @(*) begin
    when_DataHazardResolver_l124_2 = 1'b0;
    if(memory_arbitration_isValid) begin
      if(when_DataHazardResolver_l99_2) begin
        if(when_DataHazardResolver_l100_2) begin
          when_DataHazardResolver_l124_2 = 1'b1;
        end
        if(when_DataHazardResolver_l113_4) begin
          if(pipelineRegs_MEM_1_out_RD_DATA_VALID) begin
            when_DataHazardResolver_l124_2 = 1'b1;
          end else begin
            if(memory_arbitration_rs1Needed) begin
              when_DataHazardResolver_l124_2 = 1'b0;
            end
          end
        end
      end
    end
  end

  always @(*) begin
    _zz_in_RS1_DATA_1 = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(memory_arbitration_isValid) begin
      if(when_DataHazardResolver_l99_2) begin
        if(when_DataHazardResolver_l100_2) begin
          _zz_in_RS1_DATA_1 = DataHazardResolver_lastWrittenRd_data;
        end
        if(when_DataHazardResolver_l113_4) begin
          if(pipelineRegs_MEM_1_out_RD_DATA_VALID) begin
            _zz_in_RS1_DATA_1 = pipelineRegs_MEM_1_out_RD_DATA;
          end
        end
      end
    end
  end

  assign when_DataHazardResolver_l99_2 = ((pipelineRegs_EX_1_out_RS1 != 5'h0) && (pipelineRegs_EX_1_out_RS1_TYPE == RegisterType_GPR));
  assign when_DataHazardResolver_l100_2 = (DataHazardResolver_lastWrittenRd_valid && (DataHazardResolver_lastWrittenRd_id == pipelineRegs_EX_1_out_RS1));
  assign when_DataHazardResolver_l113_4 = (((writeback_arbitration_isValid && (! writeback_out_HAS_TRAPPED)) && (pipelineRegs_MEM_1_out_RD_TYPE == RegisterType_GPR)) && (pipelineRegs_MEM_1_out_RD == pipelineRegs_EX_1_out_RS1));
  always @(*) begin
    when_DataHazardResolver_l124_3 = 1'b0;
    if(memory_arbitration_isValid) begin
      if(when_DataHazardResolver_l99_3) begin
        if(when_DataHazardResolver_l100_3) begin
          when_DataHazardResolver_l124_3 = 1'b1;
        end
        if(when_DataHazardResolver_l113_5) begin
          if(pipelineRegs_MEM_1_out_RD_DATA_VALID) begin
            when_DataHazardResolver_l124_3 = 1'b1;
          end else begin
            if(memory_arbitration_rs2Needed) begin
              when_DataHazardResolver_l124_3 = 1'b0;
            end
          end
        end
      end
    end
  end

  always @(*) begin
    _zz_in_RS2_DATA_1 = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(memory_arbitration_isValid) begin
      if(when_DataHazardResolver_l99_3) begin
        if(when_DataHazardResolver_l100_3) begin
          _zz_in_RS2_DATA_1 = DataHazardResolver_lastWrittenRd_data;
        end
        if(when_DataHazardResolver_l113_5) begin
          if(pipelineRegs_MEM_1_out_RD_DATA_VALID) begin
            _zz_in_RS2_DATA_1 = pipelineRegs_MEM_1_out_RD_DATA;
          end
        end
      end
    end
  end

  assign when_DataHazardResolver_l99_3 = ((pipelineRegs_EX_1_out_RS2 != 5'h0) && (pipelineRegs_EX_1_out_RS2_TYPE == RegisterType_GPR));
  assign when_DataHazardResolver_l100_3 = (DataHazardResolver_lastWrittenRd_valid && (DataHazardResolver_lastWrittenRd_id == pipelineRegs_EX_1_out_RS2));
  assign when_DataHazardResolver_l113_5 = (((writeback_arbitration_isValid && (! writeback_out_HAS_TRAPPED)) && (pipelineRegs_MEM_1_out_RD_TYPE == RegisterType_GPR)) && (pipelineRegs_MEM_1_out_RD == pipelineRegs_EX_1_out_RS2));
  assign when_DataHazardResolver_l150_1 = (memory_arbitration_isStalled || (! memory_arbitration_isReady));
  always @(*) begin
    when_DataHazardResolver_l124_4 = 1'b0;
    if(writeback_arbitration_isValid) begin
      if(when_DataHazardResolver_l99_4) begin
        if(when_DataHazardResolver_l100_4) begin
          when_DataHazardResolver_l124_4 = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    _zz_in_RS1_DATA_2 = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(writeback_arbitration_isValid) begin
      if(when_DataHazardResolver_l99_4) begin
        if(when_DataHazardResolver_l100_4) begin
          _zz_in_RS1_DATA_2 = DataHazardResolver_lastWrittenRd_data;
        end
      end
    end
  end

  assign when_DataHazardResolver_l99_4 = ((pipelineRegs_MEM_1_out_RS1 != 5'h0) && (pipelineRegs_MEM_1_out_RS1_TYPE == RegisterType_GPR));
  assign when_DataHazardResolver_l100_4 = (DataHazardResolver_lastWrittenRd_valid && (DataHazardResolver_lastWrittenRd_id == pipelineRegs_MEM_1_out_RS1));
  assign when_DataHazardResolver_l150_2 = (writeback_arbitration_isStalled || (! writeback_arbitration_isReady));
  assign ibus_cmd_valid = fetch_Fetcher_ibus_cmd_valid;
  assign ibus_cmd_payload_address = fetch_Fetcher_ibus_cmd_payload_address;
  assign ibus_rsp_ready = fetch_Fetcher_ibus_rsp_ready;
  assign dbus_cmd_valid = memory_StaticMemoryBackbone_dbus_cmd_valid;
  assign dbus_cmd_payload_address = memory_StaticMemoryBackbone_dbus_cmd_payload_address;
  assign dbus_cmd_payload_write = memory_StaticMemoryBackbone_dbus_cmd_payload_write;
  assign dbus_cmd_payload_wdata = memory_StaticMemoryBackbone_dbus_cmd_payload_wdata;
  assign dbus_cmd_payload_wmask = memory_StaticMemoryBackbone_dbus_cmd_payload_wmask;
  assign dbus_rsp_ready = memory_StaticMemoryBackbone_dbus_rsp_ready;
  assign when_PcManager_l129 = (writeback_arbitration_isDone && writeback_arbitration_jumpRequested);
  assign when_PcManager_l129_1 = (execute_arbitration_isDone && execute_arbitration_jumpRequested);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_arbitration_isValid <= 1'b0;
      _zz_arbitration_isValid_1 <= 1'b0;
      _zz_arbitration_isValid_2 <= 1'b0;
      _zz_arbitration_isValid_3 <= 1'b0;
      PcManager_pc <= 32'h80000000;
    end else begin
      if(when_Scheduler_l42) begin
        _zz_arbitration_isValid <= fetch_arbitration_isDone;
      end
      if(when_Scheduler_l42_1) begin
        _zz_arbitration_isValid_1 <= decode_arbitration_isDone;
      end
      if(when_Scheduler_l42_2) begin
        _zz_arbitration_isValid_2 <= execute_arbitration_isDone;
      end
      if(when_Scheduler_l42_3) begin
        _zz_arbitration_isValid_3 <= memory_arbitration_isDone;
      end
      if(fetch_arbitration_isDone) begin
        PcManager_pc <= fetch_out_NEXT_PC;
      end
      if(_zz_when) begin
        PcManager_pc <= 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      end else begin
        if(when_PcManager_l129) begin
          PcManager_pc <= writeback_out_NEXT_PC;
        end
        if(when_PcManager_l129_1) begin
          PcManager_pc <= execute_out_NEXT_PC;
        end
      end
      if(PcManager_pcOverride_valid) begin
        PcManager_pc <= PcManager_pcOverride_payload;
      end
    end
  end

  always @(posedge clk) begin
    if(when_DataHazardResolver_l77) begin
      DataHazardResolver_lastWrittenRd_id <= writeback_out_RD;
      DataHazardResolver_lastWrittenRd_valid <= (writeback_out_RD_DATA_VALID && (writeback_out_RD_TYPE == RegisterType_GPR));
      DataHazardResolver_lastWrittenRd_data <= writeback_out_RD_DATA;
    end
  end


endmodule

//StreamFifoLowLatency replaced by StreamFifoLowLatency_1

module StreamArbiter (
  input  wire          io_inputs_0_valid,
  output wire          io_inputs_0_ready,
  input  wire [31:0]   io_inputs_0_payload_addr,
  input  wire [3:0]    io_inputs_0_payload_id,
  input  wire [7:0]    io_inputs_0_payload_len,
  input  wire [2:0]    io_inputs_0_payload_size,
  input  wire [1:0]    io_inputs_0_payload_burst,
  input  wire          io_inputs_0_payload_write,
  output wire          io_output_valid,
  input  wire          io_output_ready,
  output wire [31:0]   io_output_payload_addr,
  output wire [3:0]    io_output_payload_id,
  output wire [7:0]    io_output_payload_len,
  output wire [2:0]    io_output_payload_size,
  output wire [1:0]    io_output_payload_burst,
  output wire          io_output_payload_write,
  output wire [0:0]    io_chosenOH,
  input  wire          clk,
  input  wire          reset
);

  wire       [1:0]    _zz__zz_maskProposal_0_2;
  wire       [1:0]    _zz__zz_maskProposal_0_2_1;
  wire       [0:0]    _zz__zz_maskProposal_0_2_2;
  wire       [0:0]    _zz_maskProposal_0_3;
  reg                 locked;
  wire                maskProposal_0;
  reg                 maskLocked_0;
  wire                maskRouted_0;
  wire       [0:0]    _zz_maskProposal_0;
  wire       [1:0]    _zz_maskProposal_0_1;
  wire       [1:0]    _zz_maskProposal_0_2;
  wire                io_output_fire;

  assign _zz__zz_maskProposal_0_2 = (_zz_maskProposal_0_1 - _zz__zz_maskProposal_0_2_1);
  assign _zz__zz_maskProposal_0_2_2 = maskLocked_0;
  assign _zz__zz_maskProposal_0_2_1 = {1'd0, _zz__zz_maskProposal_0_2_2};
  assign _zz_maskProposal_0_3 = (_zz_maskProposal_0_2[1 : 1] | _zz_maskProposal_0_2[0 : 0]);
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign _zz_maskProposal_0 = io_inputs_0_valid;
  assign _zz_maskProposal_0_1 = {_zz_maskProposal_0,_zz_maskProposal_0};
  assign _zz_maskProposal_0_2 = (_zz_maskProposal_0_1 & (~ _zz__zz_maskProposal_0_2));
  assign maskProposal_0 = _zz_maskProposal_0_3[0];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_output_valid = (io_inputs_0_valid && maskRouted_0);
  assign io_output_payload_addr = io_inputs_0_payload_addr;
  assign io_output_payload_id = io_inputs_0_payload_id;
  assign io_output_payload_len = io_inputs_0_payload_len;
  assign io_output_payload_size = io_inputs_0_payload_size;
  assign io_output_payload_burst = io_inputs_0_payload_burst;
  assign io_output_payload_write = io_inputs_0_payload_write;
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_chosenOH = maskRouted_0;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b1;
    end else begin
      if(io_output_valid) begin
        maskLocked_0 <= maskRouted_0;
      end
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(io_output_fire) begin
        locked <= 1'b0;
      end
    end
  end


endmodule

module StreamFifoLowLatency_1 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  input  wire          io_flush,
  output wire [2:0]    io_occupancy,
  output wire [2:0]    io_availability,
  input  wire          clk,
  input  wire          reset
);

  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire       [2:0]    fifo_io_occupancy;
  wire       [2:0]    fifo_io_availability;

  StreamFifo_1 fifo (
    .io_push_valid   (io_push_valid            ), //i
    .io_push_ready   (fifo_io_push_ready       ), //o
    .io_pop_valid    (fifo_io_pop_valid        ), //o
    .io_pop_ready    (io_pop_ready             ), //i
    .io_flush        (io_flush                 ), //i
    .io_occupancy    (fifo_io_occupancy[2:0]   ), //o
    .io_availability (fifo_io_availability[2:0]), //o
    .clk             (clk                      ), //i
    .reset           (reset                    )  //i
  );
  assign io_push_ready = fifo_io_push_ready;
  assign io_pop_valid = fifo_io_pop_valid;
  assign io_occupancy = fifo_io_occupancy;
  assign io_availability = fifo_io_availability;

endmodule

module StreamArbiter_1 (
  input  wire          io_inputs_0_valid,
  output wire          io_inputs_0_ready,
  input  wire [23:0]   io_inputs_0_payload_addr,
  input  wire [2:0]    io_inputs_0_payload_id,
  input  wire [7:0]    io_inputs_0_payload_len,
  input  wire [2:0]    io_inputs_0_payload_size,
  input  wire [1:0]    io_inputs_0_payload_burst,
  input  wire          io_inputs_0_payload_write,
  input  wire          io_inputs_1_valid,
  output wire          io_inputs_1_ready,
  input  wire [23:0]   io_inputs_1_payload_addr,
  input  wire [2:0]    io_inputs_1_payload_id,
  input  wire [7:0]    io_inputs_1_payload_len,
  input  wire [2:0]    io_inputs_1_payload_size,
  input  wire [1:0]    io_inputs_1_payload_burst,
  input  wire          io_inputs_1_payload_write,
  output wire          io_output_valid,
  input  wire          io_output_ready,
  output wire [23:0]   io_output_payload_addr,
  output wire [2:0]    io_output_payload_id,
  output wire [7:0]    io_output_payload_len,
  output wire [2:0]    io_output_payload_size,
  output wire [1:0]    io_output_payload_burst,
  output wire          io_output_payload_write,
  output wire [0:0]    io_chosen,
  output wire [1:0]    io_chosenOH,
  input  wire          clk,
  input  wire          reset
);

  wire       [3:0]    _zz__zz_maskProposal_0_2;
  wire       [3:0]    _zz__zz_maskProposal_0_2_1;
  wire       [1:0]    _zz__zz_maskProposal_0_2_2;
  reg                 locked;
  wire                maskProposal_0;
  wire                maskProposal_1;
  reg                 maskLocked_0;
  reg                 maskLocked_1;
  wire                maskRouted_0;
  wire                maskRouted_1;
  wire       [1:0]    _zz_maskProposal_0;
  wire       [3:0]    _zz_maskProposal_0_1;
  wire       [3:0]    _zz_maskProposal_0_2;
  wire       [1:0]    _zz_maskProposal_0_3;
  wire                io_output_fire;
  wire                _zz_io_chosen;

  assign _zz__zz_maskProposal_0_2 = (_zz_maskProposal_0_1 - _zz__zz_maskProposal_0_2_1);
  assign _zz__zz_maskProposal_0_2_2 = {maskLocked_0,maskLocked_1};
  assign _zz__zz_maskProposal_0_2_1 = {2'd0, _zz__zz_maskProposal_0_2_2};
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign _zz_maskProposal_0 = {io_inputs_1_valid,io_inputs_0_valid};
  assign _zz_maskProposal_0_1 = {_zz_maskProposal_0,_zz_maskProposal_0};
  assign _zz_maskProposal_0_2 = (_zz_maskProposal_0_1 & (~ _zz__zz_maskProposal_0_2));
  assign _zz_maskProposal_0_3 = (_zz_maskProposal_0_2[3 : 2] | _zz_maskProposal_0_2[1 : 0]);
  assign maskProposal_0 = _zz_maskProposal_0_3[0];
  assign maskProposal_1 = _zz_maskProposal_0_3[1];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_output_valid = ((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1));
  assign io_output_payload_addr = (maskRouted_0 ? io_inputs_0_payload_addr : io_inputs_1_payload_addr);
  assign io_output_payload_id = (maskRouted_0 ? io_inputs_0_payload_id : io_inputs_1_payload_id);
  assign io_output_payload_len = (maskRouted_0 ? io_inputs_0_payload_len : io_inputs_1_payload_len);
  assign io_output_payload_size = (maskRouted_0 ? io_inputs_0_payload_size : io_inputs_1_payload_size);
  assign io_output_payload_burst = (maskRouted_0 ? io_inputs_0_payload_burst : io_inputs_1_payload_burst);
  assign io_output_payload_write = (maskRouted_0 ? io_inputs_0_payload_write : io_inputs_1_payload_write);
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_chosenOH = {maskRouted_1,maskRouted_0};
  assign _zz_io_chosen = io_chosenOH[1];
  assign io_chosen = _zz_io_chosen;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b0;
      maskLocked_1 <= 1'b1;
    end else begin
      if(io_output_valid) begin
        maskLocked_0 <= maskRouted_0;
        maskLocked_1 <= maskRouted_1;
      end
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(io_output_fire) begin
        locked <= 1'b0;
      end
    end
  end


endmodule

module Axi4SharedErrorSlave (
  input  wire          io_axi_arw_valid,
  output wire          io_axi_arw_ready,
  input  wire [31:0]   io_axi_arw_payload_addr,
  input  wire          io_axi_arw_payload_write,
  input  wire          io_axi_w_valid,
  output wire          io_axi_w_ready,
  input  wire [31:0]   io_axi_w_payload_data,
  input  wire [3:0]    io_axi_w_payload_strb,
  input  wire          io_axi_w_payload_last,
  output wire          io_axi_b_valid,
  input  wire          io_axi_b_ready,
  output wire          io_axi_r_valid,
  input  wire          io_axi_r_ready,
  output wire [31:0]   io_axi_r_payload_data,
  output wire          io_axi_r_payload_last,
  input  wire          clk,
  input  wire          reset
);

  reg                 consumeData;
  reg                 sendReadRsp;
  reg                 sendWriteRsp;
  reg        [7:0]    remaining;
  wire                remainingZero;
  wire                io_axi_arw_fire;
  wire                io_axi_w_fire;
  wire                when_Axi4ErrorSlave_l92;
  wire                io_axi_b_fire;

  assign remainingZero = (remaining == 8'h0);
  assign io_axi_arw_ready = (! ((consumeData || sendWriteRsp) || sendReadRsp));
  assign io_axi_arw_fire = (io_axi_arw_valid && io_axi_arw_ready);
  assign io_axi_w_ready = consumeData;
  assign io_axi_w_fire = (io_axi_w_valid && io_axi_w_ready);
  assign when_Axi4ErrorSlave_l92 = (io_axi_w_fire && io_axi_w_payload_last);
  assign io_axi_b_valid = sendWriteRsp;
  assign io_axi_b_fire = (io_axi_b_valid && io_axi_b_ready);
  assign io_axi_r_valid = sendReadRsp;
  assign io_axi_r_payload_last = remainingZero;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      consumeData <= 1'b0;
      sendReadRsp <= 1'b0;
      sendWriteRsp <= 1'b0;
    end else begin
      if(io_axi_arw_fire) begin
        consumeData <= io_axi_arw_payload_write;
        sendReadRsp <= (! io_axi_arw_payload_write);
      end
      if(when_Axi4ErrorSlave_l92) begin
        consumeData <= 1'b0;
        sendWriteRsp <= 1'b1;
      end
      if(io_axi_b_fire) begin
        sendWriteRsp <= 1'b0;
      end
      if(sendReadRsp) begin
        if(io_axi_r_ready) begin
          if(remainingZero) begin
            sendReadRsp <= 1'b0;
          end
        end
      end
    end
  end

  always @(posedge clk) begin
    if(io_axi_arw_fire) begin
      remaining <= 8'h0;
    end
    if(sendReadRsp) begin
      if(io_axi_r_ready) begin
        remaining <= (remaining - 8'h01);
      end
    end
  end


endmodule

module Axi4ReadOnlyErrorSlave (
  input  wire          io_axi_ar_valid,
  output wire          io_axi_ar_ready,
  input  wire [31:0]   io_axi_ar_payload_addr,
  output wire          io_axi_r_valid,
  input  wire          io_axi_r_ready,
  output wire [31:0]   io_axi_r_payload_data,
  output wire          io_axi_r_payload_last,
  input  wire          clk,
  input  wire          reset
);

  reg                 sendRsp;
  reg        [7:0]    remaining;
  wire                remainingZero;
  wire                io_axi_ar_fire;

  assign remainingZero = (remaining == 8'h0);
  assign io_axi_ar_ready = (! sendRsp);
  assign io_axi_ar_fire = (io_axi_ar_valid && io_axi_ar_ready);
  assign io_axi_r_valid = sendRsp;
  assign io_axi_r_payload_last = remainingZero;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      sendRsp <= 1'b0;
    end else begin
      if(io_axi_ar_fire) begin
        sendRsp <= 1'b1;
      end
      if(sendRsp) begin
        if(io_axi_r_ready) begin
          if(remainingZero) begin
            sendRsp <= 1'b0;
          end
        end
      end
    end
  end

  always @(posedge clk) begin
    if(io_axi_ar_fire) begin
      remaining <= 8'h0;
    end
    if(sendRsp) begin
      if(io_axi_r_ready) begin
        remaining <= (remaining - 8'h01);
      end
    end
  end


endmodule

module RegisterFile (
  input  wire [4:0]    readIo_rs1,
  input  wire [4:0]    readIo_rs2,
  output wire [31:0]   readIo_rs1Data,
  output wire [31:0]   readIo_rs2Data,
  input  wire [4:0]    writeIo_rd,
  input  wire [31:0]   writeIo_data,
  input  wire          writeIo_write,
  input  wire          clk,
  input  wire          reset
);

  wire       [31:0]   regs_spinal_port0;
  wire       [31:0]   regs_spinal_port1;
  wire       [31:0]   regs_spinal_port2;
  wire       [31:0]   regs_spinal_port3;
  wire       [31:0]   regs_spinal_port4;
  wire       [31:0]   regs_spinal_port5;
  wire       [31:0]   regs_spinal_port6;
  wire       [31:0]   regs_spinal_port7;
  wire       [31:0]   regs_spinal_port8;
  wire       [31:0]   regs_spinal_port9;
  wire       [31:0]   regs_spinal_port10;
  wire       [31:0]   regs_spinal_port11;
  wire       [31:0]   regs_spinal_port12;
  wire       [31:0]   regs_spinal_port13;
  wire       [31:0]   regs_spinal_port14;
  wire       [31:0]   regs_spinal_port15;
  wire       [31:0]   regs_spinal_port16;
  wire       [31:0]   regs_spinal_port17;
  wire       [31:0]   regs_spinal_port18;
  wire       [31:0]   regs_spinal_port19;
  wire       [31:0]   regs_spinal_port20;
  wire       [31:0]   regs_spinal_port21;
  wire       [31:0]   regs_spinal_port22;
  wire       [31:0]   regs_spinal_port23;
  wire       [31:0]   regs_spinal_port24;
  wire       [31:0]   regs_spinal_port25;
  wire       [31:0]   regs_spinal_port26;
  wire       [31:0]   regs_spinal_port27;
  wire       [31:0]   regs_spinal_port28;
  wire       [31:0]   regs_spinal_port29;
  wire       [31:0]   regs_spinal_port30;
  wire       [31:0]   regs_spinal_port31;
  wire       [31:0]   regs_spinal_port32;
  wire       [31:0]   regs_spinal_port33;
  wire       [4:0]    _zz_regs_port;
  wire       [4:0]    _zz_x0_zero;
  wire       [4:0]    _zz_regs_port_1;
  wire       [4:0]    _zz_x1_ra_1;
  wire       [4:0]    _zz_regs_port_2;
  wire       [4:0]    _zz_x2_sp_1;
  wire       [4:0]    _zz_regs_port_3;
  wire       [4:0]    _zz_x3_gp_1;
  wire       [4:0]    _zz_regs_port_4;
  wire       [4:0]    _zz_x4_tp_1;
  wire       [4:0]    _zz_regs_port_5;
  wire       [4:0]    _zz_x5_t0_1;
  wire       [4:0]    _zz_regs_port_6;
  wire       [4:0]    _zz_x6_t1_1;
  wire       [4:0]    _zz_regs_port_7;
  wire       [4:0]    _zz_x7_t2_1;
  wire       [4:0]    _zz_regs_port_8;
  wire       [4:0]    _zz_x8_s0_fp_1;
  wire       [4:0]    _zz_regs_port_9;
  wire       [4:0]    _zz_x9_s1_1;
  wire       [4:0]    _zz_regs_port_10;
  wire       [4:0]    _zz_x10_a0_1;
  wire       [4:0]    _zz_regs_port_11;
  wire       [4:0]    _zz_x11_a1_1;
  wire       [4:0]    _zz_regs_port_12;
  wire       [4:0]    _zz_x12_a2_1;
  wire       [4:0]    _zz_regs_port_13;
  wire       [4:0]    _zz_x13_a3_1;
  wire       [4:0]    _zz_regs_port_14;
  wire       [4:0]    _zz_x14_a4_1;
  wire       [4:0]    _zz_regs_port_15;
  wire       [4:0]    _zz_x15_a5_1;
  wire       [4:0]    _zz_regs_port_16;
  wire       [4:0]    _zz_x16_a6;
  wire       [4:0]    _zz_regs_port_17;
  wire       [4:0]    _zz_x17_a7;
  wire       [4:0]    _zz_regs_port_18;
  wire       [4:0]    _zz_x18_s2;
  wire       [4:0]    _zz_regs_port_19;
  wire       [4:0]    _zz_x19_s3;
  wire       [4:0]    _zz_regs_port_20;
  wire       [4:0]    _zz_x20_s4;
  wire       [4:0]    _zz_regs_port_21;
  wire       [4:0]    _zz_x21_s5;
  wire       [4:0]    _zz_regs_port_22;
  wire       [4:0]    _zz_x22_s6;
  wire       [4:0]    _zz_regs_port_23;
  wire       [4:0]    _zz_x23_s7;
  wire       [4:0]    _zz_regs_port_24;
  wire       [4:0]    _zz_x24_s8;
  wire       [4:0]    _zz_regs_port_25;
  wire       [4:0]    _zz_x25_s9;
  wire       [4:0]    _zz_regs_port_26;
  wire       [4:0]    _zz_x26_s10;
  wire       [4:0]    _zz_regs_port_27;
  wire       [4:0]    _zz_x27_s11;
  wire       [4:0]    _zz_regs_port_28;
  wire       [4:0]    _zz_x28_t3;
  wire       [4:0]    _zz_regs_port_29;
  wire       [4:0]    _zz_x29_t4;
  wire       [4:0]    _zz_regs_port_30;
  wire       [4:0]    _zz_x30_t5;
  wire       [4:0]    _zz_regs_port_31;
  wire       [4:0]    _zz_x31_t6;
  wire       [31:0]   _zz_regs_port_32;
  reg                 _zz_1;
  wire       [31:0]   x0_zero;
  wire       [31:0]   x1_ra;
  wire       [0:0]    _zz_x1_ra;
  wire       [31:0]   x2_sp;
  wire       [1:0]    _zz_x2_sp;
  wire       [31:0]   x3_gp;
  wire       [1:0]    _zz_x3_gp;
  wire       [31:0]   x4_tp;
  wire       [2:0]    _zz_x4_tp;
  wire       [31:0]   x5_t0;
  wire       [2:0]    _zz_x5_t0;
  wire       [31:0]   x6_t1;
  wire       [2:0]    _zz_x6_t1;
  wire       [31:0]   x7_t2;
  wire       [2:0]    _zz_x7_t2;
  wire       [31:0]   x8_s0_fp;
  wire       [3:0]    _zz_x8_s0_fp;
  wire       [31:0]   x9_s1;
  wire       [3:0]    _zz_x9_s1;
  wire       [31:0]   x10_a0;
  wire       [3:0]    _zz_x10_a0;
  wire       [31:0]   x11_a1;
  wire       [3:0]    _zz_x11_a1;
  wire       [31:0]   x12_a2;
  wire       [3:0]    _zz_x12_a2;
  wire       [31:0]   x13_a3;
  wire       [3:0]    _zz_x13_a3;
  wire       [31:0]   x14_a4;
  wire       [3:0]    _zz_x14_a4;
  wire       [31:0]   x15_a5;
  wire       [3:0]    _zz_x15_a5;
  wire       [31:0]   x16_a6;
  wire       [31:0]   x17_a7;
  wire       [31:0]   x18_s2;
  wire       [31:0]   x19_s3;
  wire       [31:0]   x20_s4;
  wire       [31:0]   x21_s5;
  wire       [31:0]   x22_s6;
  wire       [31:0]   x23_s7;
  wire       [31:0]   x24_s8;
  wire       [31:0]   x25_s9;
  wire       [31:0]   x26_s10;
  wire       [31:0]   x27_s11;
  wire       [31:0]   x28_t3;
  wire       [31:0]   x29_t4;
  wire       [31:0]   x30_t5;
  wire       [31:0]   x31_t6;
  reg        [31:0]   _zz_readIo_rs1Data;
  reg        [31:0]   _zz_readIo_rs2Data;
  wire                when_RegisterFile_l92;
  (* ram_style = "distributed" *) reg [31:0] regs [0:31];

  assign _zz_x1_ra_1 = {4'd0, _zz_x1_ra};
  assign _zz_x2_sp_1 = {3'd0, _zz_x2_sp};
  assign _zz_x3_gp_1 = {3'd0, _zz_x3_gp};
  assign _zz_x4_tp_1 = {2'd0, _zz_x4_tp};
  assign _zz_x5_t0_1 = {2'd0, _zz_x5_t0};
  assign _zz_x6_t1_1 = {2'd0, _zz_x6_t1};
  assign _zz_x7_t2_1 = {2'd0, _zz_x7_t2};
  assign _zz_x8_s0_fp_1 = {1'd0, _zz_x8_s0_fp};
  assign _zz_x9_s1_1 = {1'd0, _zz_x9_s1};
  assign _zz_x10_a0_1 = {1'd0, _zz_x10_a0};
  assign _zz_x11_a1_1 = {1'd0, _zz_x11_a1};
  assign _zz_x12_a2_1 = {1'd0, _zz_x12_a2};
  assign _zz_x13_a3_1 = {1'd0, _zz_x13_a3};
  assign _zz_x14_a4_1 = {1'd0, _zz_x14_a4};
  assign _zz_x15_a5_1 = {1'd0, _zz_x15_a5};
  assign _zz_x0_zero = 5'h0;
  assign _zz_x16_a6 = 5'h10;
  assign _zz_x17_a7 = 5'h11;
  assign _zz_x18_s2 = 5'h12;
  assign _zz_x19_s3 = 5'h13;
  assign _zz_x20_s4 = 5'h14;
  assign _zz_x21_s5 = 5'h15;
  assign _zz_x22_s6 = 5'h16;
  assign _zz_x23_s7 = 5'h17;
  assign _zz_x24_s8 = 5'h18;
  assign _zz_x25_s9 = 5'h19;
  assign _zz_x26_s10 = 5'h1a;
  assign _zz_x27_s11 = 5'h1b;
  assign _zz_x28_t3 = 5'h1c;
  assign _zz_x29_t4 = 5'h1d;
  assign _zz_x30_t5 = 5'h1e;
  assign _zz_x31_t6 = 5'h1f;
  assign _zz_regs_port_32 = writeIo_data;
  assign regs_spinal_port0 = regs[_zz_x0_zero];
  assign regs_spinal_port1 = regs[_zz_x1_ra_1];
  assign regs_spinal_port2 = regs[_zz_x2_sp_1];
  assign regs_spinal_port3 = regs[_zz_x3_gp_1];
  assign regs_spinal_port4 = regs[_zz_x4_tp_1];
  assign regs_spinal_port5 = regs[_zz_x5_t0_1];
  assign regs_spinal_port6 = regs[_zz_x6_t1_1];
  assign regs_spinal_port7 = regs[_zz_x7_t2_1];
  assign regs_spinal_port8 = regs[_zz_x8_s0_fp_1];
  assign regs_spinal_port9 = regs[_zz_x9_s1_1];
  assign regs_spinal_port10 = regs[_zz_x10_a0_1];
  assign regs_spinal_port11 = regs[_zz_x11_a1_1];
  assign regs_spinal_port12 = regs[_zz_x12_a2_1];
  assign regs_spinal_port13 = regs[_zz_x13_a3_1];
  assign regs_spinal_port14 = regs[_zz_x14_a4_1];
  assign regs_spinal_port15 = regs[_zz_x15_a5_1];
  assign regs_spinal_port16 = regs[_zz_x16_a6];
  assign regs_spinal_port17 = regs[_zz_x17_a7];
  assign regs_spinal_port18 = regs[_zz_x18_s2];
  assign regs_spinal_port19 = regs[_zz_x19_s3];
  assign regs_spinal_port20 = regs[_zz_x20_s4];
  assign regs_spinal_port21 = regs[_zz_x21_s5];
  assign regs_spinal_port22 = regs[_zz_x22_s6];
  assign regs_spinal_port23 = regs[_zz_x23_s7];
  assign regs_spinal_port24 = regs[_zz_x24_s8];
  assign regs_spinal_port25 = regs[_zz_x25_s9];
  assign regs_spinal_port26 = regs[_zz_x26_s10];
  assign regs_spinal_port27 = regs[_zz_x27_s11];
  assign regs_spinal_port28 = regs[_zz_x28_t3];
  assign regs_spinal_port29 = regs[_zz_x29_t4];
  assign regs_spinal_port30 = regs[_zz_x30_t5];
  assign regs_spinal_port31 = regs[_zz_x31_t6];
  assign regs_spinal_port32 = regs[readIo_rs1];
  assign regs_spinal_port33 = regs[readIo_rs2];
  always @(posedge clk) begin
    if(_zz_1) begin
      regs[writeIo_rd] <= _zz_regs_port_32;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(when_RegisterFile_l92) begin
      _zz_1 = 1'b1;
    end
  end

  assign x0_zero = regs_spinal_port0;
  assign _zz_x1_ra = 1'b1;
  assign x1_ra = regs_spinal_port1;
  assign _zz_x2_sp = 2'b10;
  assign x2_sp = regs_spinal_port2;
  assign _zz_x3_gp = 2'b11;
  assign x3_gp = regs_spinal_port3;
  assign _zz_x4_tp = 3'b100;
  assign x4_tp = regs_spinal_port4;
  assign _zz_x5_t0 = 3'b101;
  assign x5_t0 = regs_spinal_port5;
  assign _zz_x6_t1 = 3'b110;
  assign x6_t1 = regs_spinal_port6;
  assign _zz_x7_t2 = 3'b111;
  assign x7_t2 = regs_spinal_port7;
  assign _zz_x8_s0_fp = 4'b1000;
  assign x8_s0_fp = regs_spinal_port8;
  assign _zz_x9_s1 = 4'b1001;
  assign x9_s1 = regs_spinal_port9;
  assign _zz_x10_a0 = 4'b1010;
  assign x10_a0 = regs_spinal_port10;
  assign _zz_x11_a1 = 4'b1011;
  assign x11_a1 = regs_spinal_port11;
  assign _zz_x12_a2 = 4'b1100;
  assign x12_a2 = regs_spinal_port12;
  assign _zz_x13_a3 = 4'b1101;
  assign x13_a3 = regs_spinal_port13;
  assign _zz_x14_a4 = 4'b1110;
  assign x14_a4 = regs_spinal_port14;
  assign _zz_x15_a5 = 4'b1111;
  assign x15_a5 = regs_spinal_port15;
  assign x16_a6 = regs_spinal_port16;
  assign x17_a7 = regs_spinal_port17;
  assign x18_s2 = regs_spinal_port18;
  assign x19_s3 = regs_spinal_port19;
  assign x20_s4 = regs_spinal_port20;
  assign x21_s5 = regs_spinal_port21;
  assign x22_s6 = regs_spinal_port22;
  assign x23_s7 = regs_spinal_port23;
  assign x24_s8 = regs_spinal_port24;
  assign x25_s9 = regs_spinal_port25;
  assign x26_s10 = regs_spinal_port26;
  assign x27_s11 = regs_spinal_port27;
  assign x28_t3 = regs_spinal_port28;
  assign x29_t4 = regs_spinal_port29;
  assign x30_t5 = regs_spinal_port30;
  assign x31_t6 = regs_spinal_port31;
  always @(*) begin
    case(readIo_rs1)
      5'h0 : begin
        _zz_readIo_rs1Data = 32'h0;
      end
      default : begin
        _zz_readIo_rs1Data = regs_spinal_port32;
      end
    endcase
  end

  assign readIo_rs1Data = _zz_readIo_rs1Data;
  always @(*) begin
    case(readIo_rs2)
      5'h0 : begin
        _zz_readIo_rs2Data = 32'h0;
      end
      default : begin
        _zz_readIo_rs2Data = regs_spinal_port33;
      end
    endcase
  end

  assign readIo_rs2Data = _zz_readIo_rs2Data;
  assign when_RegisterFile_l92 = (writeIo_write && (writeIo_rd != 5'h0));

endmodule

module CsrFile (
  input  wire [11:0]   io_rid,
  input  wire [11:0]   io_wid,
  output reg  [31:0]   io_rdata,
  input  wire [31:0]   io_wdata,
  input  wire          io_read,
  input  wire          io_write,
  output reg           io_error,
  output reg           writeNotify_write,
  input  wire          CsrFile_incInstret,
  output wire [31:0]   io_768_rdata,
  input  wire [31:0]   io_768_wdata,
  input  wire          io_768_write,
  output wire [31:0]   io_773_rdata,
  input  wire [31:0]   io_773_wdata,
  input  wire          io_773_write,
  output wire [31:0]   io_834_rdata,
  input  wire [31:0]   io_834_wdata,
  input  wire          io_834_write,
  output wire [31:0]   io_833_rdata,
  input  wire [31:0]   io_833_wdata,
  input  wire          io_833_write,
  output wire [31:0]   io_835_rdata,
  input  wire [31:0]   io_835_wdata,
  input  wire          io_835_write,
  output wire [31:0]   io_768_rdata_1,
  input  wire [31:0]   io_768_wdata_1,
  input  wire          io_768_write_1,
  output wire [31:0]   io_772_rdata,
  input  wire [31:0]   io_772_wdata,
  input  wire          io_772_write,
  output wire [31:0]   io_836_rdata,
  input  wire [31:0]   io_836_wdata,
  input  wire          io_836_write,
  input  wire          clk,
  input  wire          reset
);

  wire       [18:0]   _zz_CsrFile_mstatus;
  wire       [20:0]   _zz_CsrFile_mie_1;
  wire       [0:0]    _zz_CsrFile_mie_1_1;
  wire       [20:0]   _zz_CsrFile_mip;
  wire       [0:0]    _zz_CsrFile_mip_1;
  wire       [0:0]    _zz_CsrFile_mie;
  wire       [0:0]    _zz_CsrFile_mpie;
  wire       [0:0]    _zz_CsrFile_mie_2;
  wire       [0:0]    _zz_CsrFile_mpie_1;
  wire       [0:0]    _zz_CsrFile_mie_3;
  wire       [0:0]    _zz_CsrFile_mpie_2;
  reg        [63:0]   CsrFile_cycle;
  reg        [63:0]   CsrFile_instret;
  wire                CsrFile_uie;
  wire                CsrFile_sie;
  reg                 CsrFile_mie;
  wire                CsrFile_upie;
  wire                CsrFile_spie;
  reg                 CsrFile_mpie;
  wire                CsrFile_spp;
  wire       [1:0]    CsrFile_mpp;
  wire       [1:0]    CsrFile_fs;
  wire       [1:0]    CsrFile_xs;
  wire                CsrFile_mprv;
  wire                CsrFile_sum;
  wire                CsrFile_mxr;
  wire                CsrFile_tvm;
  wire                CsrFile_tw;
  wire                CsrFile_tsr;
  wire                CsrFile_sd;
  wire       [31:0]   CsrFile_mstatus;
  wire       [1:0]    CsrFile_mxl;
  reg        [25:0]   CsrFile_extensions;
  wire       [3:0]    CsrFile_filling;
  wire       [31:0]   CsrFile_misa;
  reg        [31:0]   CsrFile_mtvec;
  wire       [31:0]   CsrFile_base;
  wire       [1:0]    CsrFile_mode;
  reg        [31:0]   CsrFile_scratch;
  reg        [29:0]   CsrFile_epc;
  reg                 CsrFile_interrupt;
  reg        [3:0]    CsrFile_cause;
  reg        [26:0]   _zz_CsrFile_mcause;
  wire       [31:0]   CsrFile_mcause;
  reg        [31:0]   CsrFile_tval;
  wire                CsrFile_usie;
  wire                CsrFile_ssie;
  wire                CsrFile_msie;
  wire                CsrFile_utie;
  wire                CsrFile_stie;
  reg                 CsrFile_mtie;
  wire                CsrFile_ueie;
  wire                CsrFile_seie;
  reg                 CsrFile_meie;
  wire       [31:0]   CsrFile_mie_1;
  wire                CsrFile_usip;
  wire                CsrFile_ssip;
  wire                CsrFile_msip;
  wire                CsrFile_utip;
  wire                CsrFile_stip;
  reg                 CsrFile_mtip;
  wire                CsrFile_ueip;
  wire                CsrFile_seip;
  reg                 CsrFile_meip;
  wire       [31:0]   CsrFile_mip;
  function [25:0] zz_CsrFile_extensions(input dummy);
    begin
      zz_CsrFile_extensions = 26'h0;
      zz_CsrFile_extensions[8] = 1'b1;
      zz_CsrFile_extensions[12] = 1'b1;
    end
  endfunction
  wire [25:0] _zz_1;
  function [26:0] zz__zz_CsrFile_mcause(input dummy);
    begin
      zz__zz_CsrFile_mcause[26] = 1'b0;
      zz__zz_CsrFile_mcause[25] = 1'b0;
      zz__zz_CsrFile_mcause[24] = 1'b0;
      zz__zz_CsrFile_mcause[23] = 1'b0;
      zz__zz_CsrFile_mcause[22] = 1'b0;
      zz__zz_CsrFile_mcause[21] = 1'b0;
      zz__zz_CsrFile_mcause[20] = 1'b0;
      zz__zz_CsrFile_mcause[19] = 1'b0;
      zz__zz_CsrFile_mcause[18] = 1'b0;
      zz__zz_CsrFile_mcause[17] = 1'b0;
      zz__zz_CsrFile_mcause[16] = 1'b0;
      zz__zz_CsrFile_mcause[15] = 1'b0;
      zz__zz_CsrFile_mcause[14] = 1'b0;
      zz__zz_CsrFile_mcause[13] = 1'b0;
      zz__zz_CsrFile_mcause[12] = 1'b0;
      zz__zz_CsrFile_mcause[11] = 1'b0;
      zz__zz_CsrFile_mcause[10] = 1'b0;
      zz__zz_CsrFile_mcause[9] = 1'b0;
      zz__zz_CsrFile_mcause[8] = 1'b0;
      zz__zz_CsrFile_mcause[7] = 1'b0;
      zz__zz_CsrFile_mcause[6] = 1'b0;
      zz__zz_CsrFile_mcause[5] = 1'b0;
      zz__zz_CsrFile_mcause[4] = 1'b0;
      zz__zz_CsrFile_mcause[3] = 1'b0;
      zz__zz_CsrFile_mcause[2] = 1'b0;
      zz__zz_CsrFile_mcause[1] = 1'b0;
      zz__zz_CsrFile_mcause[0] = 1'b0;
    end
  endfunction
  wire [26:0] _zz_2;

  assign _zz_CsrFile_mie = io_wdata[3 : 3];
  assign _zz_CsrFile_mpie = io_wdata[7 : 7];
  assign _zz_CsrFile_mie_2 = io_768_wdata[3 : 3];
  assign _zz_CsrFile_mpie_1 = io_768_wdata[7 : 7];
  assign _zz_CsrFile_mie_3 = io_768_wdata_1[3 : 3];
  assign _zz_CsrFile_mpie_2 = io_768_wdata_1[7 : 7];
  assign _zz_CsrFile_mstatus = {{{{{{{{{CsrFile_sd,8'h0},CsrFile_tsr},CsrFile_tw},CsrFile_tvm},CsrFile_mxr},CsrFile_sum},CsrFile_mprv},CsrFile_xs},CsrFile_fs};
  assign _zz_CsrFile_mie_1 = {20'h0,CsrFile_meie};
  assign _zz_CsrFile_mie_1_1 = 1'b0;
  assign _zz_CsrFile_mip = {20'h0,CsrFile_meip};
  assign _zz_CsrFile_mip_1 = 1'b0;
  assign CsrFile_uie = 1'b0;
  assign CsrFile_sie = 1'b0;
  assign CsrFile_upie = 1'b0;
  assign CsrFile_spie = 1'b0;
  assign CsrFile_spp = 1'b0;
  assign CsrFile_mpp = 2'b11;
  assign CsrFile_fs = 2'b00;
  assign CsrFile_xs = 2'b00;
  assign CsrFile_mprv = 1'b0;
  assign CsrFile_sum = 1'b0;
  assign CsrFile_mxr = 1'b0;
  assign CsrFile_tvm = 1'b0;
  assign CsrFile_tw = 1'b0;
  assign CsrFile_tsr = 1'b0;
  assign CsrFile_sd = 1'b0;
  assign CsrFile_mstatus = {{{{{{{{{{{_zz_CsrFile_mstatus,CsrFile_mpp},2'b00},CsrFile_spp},CsrFile_mpie},1'b0},CsrFile_spie},CsrFile_upie},CsrFile_mie},1'b0},CsrFile_sie},CsrFile_uie};
  assign CsrFile_mxl = 2'b01;
  assign _zz_1 = zz_CsrFile_extensions(1'b0);
  always @(*) CsrFile_extensions = _zz_1;
  assign CsrFile_filling = 4'b0000;
  assign CsrFile_misa = {{CsrFile_mxl,CsrFile_filling},CsrFile_extensions};
  assign CsrFile_base = ({2'd0,CsrFile_mtvec[31 : 2]} <<< 2'd2);
  assign CsrFile_mode = CsrFile_mtvec[1 : 0];
  assign _zz_2 = zz__zz_CsrFile_mcause(1'b0);
  always @(*) _zz_CsrFile_mcause = _zz_2;
  assign CsrFile_mcause = {CsrFile_interrupt,{_zz_CsrFile_mcause,CsrFile_cause}};
  assign CsrFile_usie = 1'b0;
  assign CsrFile_ssie = 1'b0;
  assign CsrFile_msie = 1'b0;
  assign CsrFile_utie = 1'b0;
  assign CsrFile_stie = 1'b0;
  assign CsrFile_ueie = 1'b0;
  assign CsrFile_seie = 1'b0;
  assign CsrFile_mie_1 = {{{{{{{{{{{_zz_CsrFile_mie_1,_zz_CsrFile_mie_1_1},CsrFile_seie},CsrFile_ueie},CsrFile_mtie},1'b0},CsrFile_stie},CsrFile_utie},CsrFile_msie},1'b0},CsrFile_ssie},CsrFile_usie};
  assign CsrFile_usip = 1'b0;
  assign CsrFile_ssip = 1'b0;
  assign CsrFile_msip = 1'b0;
  assign CsrFile_utip = 1'b0;
  assign CsrFile_stip = 1'b0;
  assign CsrFile_ueip = 1'b0;
  assign CsrFile_seip = 1'b0;
  assign CsrFile_mip = {{{{{{{{{{{_zz_CsrFile_mip,_zz_CsrFile_mip_1},CsrFile_seip},CsrFile_ueip},CsrFile_mtip},1'b0},CsrFile_stip},CsrFile_utip},CsrFile_msip},1'b0},CsrFile_ssip},CsrFile_usip};
  always @(*) begin
    io_rdata = 32'h0;
    if(io_read) begin
      case(io_rid)
        12'h300 : begin
          io_rdata = CsrFile_mstatus;
        end
        12'hc82 : begin
          io_rdata = CsrFile_instret[63 : 32];
        end
        12'hf11 : begin
          io_rdata = 32'h0;
        end
        12'hf14 : begin
          io_rdata = 32'h0;
        end
        12'hc01 : begin
          io_rdata = CsrFile_cycle[31 : 0];
        end
        12'h341 : begin
          io_rdata = ({2'd0,CsrFile_epc} <<< 2'd2);
        end
        12'h344 : begin
          io_rdata = CsrFile_mip;
        end
        12'h305 : begin
          io_rdata = CsrFile_mtvec;
        end
        12'hc81 : begin
          io_rdata = CsrFile_cycle[63 : 32];
        end
        12'hf13 : begin
          io_rdata = 32'h0;
        end
        12'h343 : begin
          io_rdata = CsrFile_tval;
        end
        12'hc00 : begin
          io_rdata = CsrFile_cycle[31 : 0];
        end
        12'h340 : begin
          io_rdata = CsrFile_scratch;
        end
        12'h301 : begin
          io_rdata = CsrFile_misa;
        end
        12'h304 : begin
          io_rdata = CsrFile_mie_1;
        end
        12'hf12 : begin
          io_rdata = 32'h00000020;
        end
        12'hc02 : begin
          io_rdata = CsrFile_instret[31 : 0];
        end
        12'hc80 : begin
          io_rdata = CsrFile_cycle[63 : 32];
        end
        12'h342 : begin
          io_rdata = CsrFile_mcause;
        end
        default : begin
        end
      endcase
    end
  end

  always @(*) begin
    io_error = 1'b0;
    if(io_read) begin
      case(io_rid)
        12'h300 : begin
        end
        12'hc82 : begin
        end
        12'hf11 : begin
        end
        12'hf14 : begin
        end
        12'hc01 : begin
        end
        12'h341 : begin
        end
        12'h344 : begin
        end
        12'h305 : begin
        end
        12'hc81 : begin
        end
        12'hf13 : begin
        end
        12'h343 : begin
        end
        12'hc00 : begin
        end
        12'h340 : begin
        end
        12'h301 : begin
        end
        12'h304 : begin
        end
        12'hf12 : begin
        end
        12'hc02 : begin
        end
        12'hc80 : begin
        end
        12'h342 : begin
        end
        default : begin
          io_error = 1'b1;
        end
      endcase
    end
    if(io_write) begin
      case(io_wid)
        12'h300 : begin
        end
        12'hc82 : begin
          io_error = 1'b1;
        end
        12'hf11 : begin
          io_error = 1'b1;
        end
        12'hf14 : begin
          io_error = 1'b1;
        end
        12'hc01 : begin
          io_error = 1'b1;
        end
        12'h341 : begin
        end
        12'h344 : begin
        end
        12'h305 : begin
        end
        12'hc81 : begin
          io_error = 1'b1;
        end
        12'hf13 : begin
          io_error = 1'b1;
        end
        12'h343 : begin
        end
        12'hc00 : begin
          io_error = 1'b1;
        end
        12'h340 : begin
        end
        12'h301 : begin
        end
        12'h304 : begin
        end
        12'hf12 : begin
          io_error = 1'b1;
        end
        12'hc02 : begin
          io_error = 1'b1;
        end
        12'hc80 : begin
          io_error = 1'b1;
        end
        12'h342 : begin
        end
        default : begin
          io_error = 1'b1;
        end
      endcase
    end
  end

  always @(*) begin
    writeNotify_write = 1'b0;
    if(io_write) begin
      case(io_wid)
        12'h300 : begin
          writeNotify_write = 1'b1;
        end
        12'hc82 : begin
        end
        12'hf11 : begin
        end
        12'hf14 : begin
        end
        12'hc01 : begin
        end
        12'h341 : begin
          writeNotify_write = 1'b1;
        end
        12'h344 : begin
          writeNotify_write = 1'b1;
        end
        12'h305 : begin
          writeNotify_write = 1'b1;
        end
        12'hc81 : begin
        end
        12'hf13 : begin
        end
        12'h343 : begin
          writeNotify_write = 1'b1;
        end
        12'hc00 : begin
        end
        12'h340 : begin
          writeNotify_write = 1'b1;
        end
        12'h301 : begin
          writeNotify_write = 1'b1;
        end
        12'h304 : begin
          writeNotify_write = 1'b1;
        end
        12'hf12 : begin
        end
        12'hc02 : begin
        end
        12'hc80 : begin
        end
        12'h342 : begin
          writeNotify_write = 1'b1;
        end
        default : begin
        end
      endcase
    end
  end

  assign io_768_rdata = CsrFile_mstatus;
  assign io_773_rdata = CsrFile_mtvec;
  assign io_834_rdata = CsrFile_mcause;
  assign io_833_rdata = ({2'd0,CsrFile_epc} <<< 2'd2);
  assign io_835_rdata = CsrFile_tval;
  assign io_768_rdata_1 = CsrFile_mstatus;
  assign io_772_rdata = CsrFile_mie_1;
  assign io_836_rdata = CsrFile_mip;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      CsrFile_cycle <= 64'h0;
      CsrFile_instret <= 64'h0;
      CsrFile_mie <= 1'b0;
      CsrFile_mpie <= 1'b0;
      CsrFile_interrupt <= 1'b0;
      CsrFile_cause <= 4'b0000;
      CsrFile_mtie <= 1'b0;
      CsrFile_meie <= 1'b0;
      CsrFile_mtip <= 1'b0;
      CsrFile_meip <= 1'b0;
    end else begin
      CsrFile_cycle <= (CsrFile_cycle + 64'h0000000000000001);
      if(CsrFile_incInstret) begin
        CsrFile_instret <= (CsrFile_instret + 64'h0000000000000001);
      end
      if(io_write) begin
        case(io_wid)
          12'h300 : begin
            CsrFile_mie <= _zz_CsrFile_mie[0];
            CsrFile_mpie <= _zz_CsrFile_mpie[0];
          end
          12'hc82 : begin
          end
          12'hf11 : begin
          end
          12'hf14 : begin
          end
          12'hc01 : begin
          end
          12'h341 : begin
          end
          12'h344 : begin
          end
          12'h305 : begin
          end
          12'hc81 : begin
          end
          12'hf13 : begin
          end
          12'h343 : begin
          end
          12'hc00 : begin
          end
          12'h340 : begin
          end
          12'h301 : begin
          end
          12'h304 : begin
            CsrFile_mtie <= io_wdata[7];
            CsrFile_meie <= io_wdata[11];
          end
          12'hf12 : begin
          end
          12'hc02 : begin
          end
          12'hc80 : begin
          end
          12'h342 : begin
            CsrFile_interrupt <= io_wdata[31];
            CsrFile_cause <= io_wdata[3 : 0];
          end
          default : begin
          end
        endcase
      end
      if(io_768_write) begin
        CsrFile_mie <= _zz_CsrFile_mie_2[0];
        CsrFile_mpie <= _zz_CsrFile_mpie_1[0];
      end
      if(io_834_write) begin
        CsrFile_interrupt <= io_834_wdata[31];
        CsrFile_cause <= io_834_wdata[3 : 0];
      end
      if(io_768_write_1) begin
        CsrFile_mie <= _zz_CsrFile_mie_3[0];
        CsrFile_mpie <= _zz_CsrFile_mpie_2[0];
      end
      if(io_772_write) begin
        CsrFile_mtie <= io_772_wdata[7];
        CsrFile_meie <= io_772_wdata[11];
      end
      if(io_836_write) begin
        CsrFile_mtip <= io_836_wdata[7];
        CsrFile_meip <= io_836_wdata[11];
      end
    end
  end

  always @(posedge clk) begin
    if(io_write) begin
      case(io_wid)
        12'h300 : begin
        end
        12'hc82 : begin
        end
        12'hf11 : begin
        end
        12'hf14 : begin
        end
        12'hc01 : begin
        end
        12'h341 : begin
          CsrFile_epc <= (io_wdata >>> 2'd2);
        end
        12'h344 : begin
        end
        12'h305 : begin
          CsrFile_mtvec <= io_wdata;
        end
        12'hc81 : begin
        end
        12'hf13 : begin
        end
        12'h343 : begin
          CsrFile_tval <= io_wdata;
        end
        12'hc00 : begin
        end
        12'h340 : begin
          CsrFile_scratch <= io_wdata;
        end
        12'h301 : begin
        end
        12'h304 : begin
        end
        12'hf12 : begin
        end
        12'hc02 : begin
        end
        12'hc80 : begin
        end
        12'h342 : begin
        end
        default : begin
        end
      endcase
    end
    if(io_773_write) begin
      CsrFile_mtvec <= io_773_wdata;
    end
    if(io_833_write) begin
      CsrFile_epc <= (io_833_wdata >>> 2'd2);
    end
    if(io_835_write) begin
      CsrFile_tval <= io_835_wdata;
    end
  end


endmodule

module PipelineRegs_MEM (
  input  wire          shift,
  input  wire [0:0]    in_RD_TYPE,
  output wire [0:0]    out_RD_TYPE,
  input  wire          shift_RD_TYPE,
  input  wire          in_TRAP_IS_INTERRUPT,
  output wire          out_TRAP_IS_INTERRUPT,
  input  wire          shift_TRAP_IS_INTERRUPT,
  input  wire [0:0]    in_RS2_TYPE,
  output wire [0:0]    out_RS2_TYPE,
  input  wire          shift_RS2_TYPE,
  input  wire [4:0]    in_RS2,
  output wire [4:0]    out_RS2,
  input  wire          shift_RS2,
  input  wire [31:0]   in_IR,
  output wire [31:0]   out_IR,
  input  wire          shift_IR,
  input  wire [31:0]   in_RS1_DATA,
  output wire [31:0]   out_RS1_DATA,
  input  wire          shift_RS1_DATA,
  input  wire [4:0]    in_RS1,
  output wire [4:0]    out_RS1,
  input  wire          shift_RS1,
  input  wire [31:0]   in_RD_DATA,
  output wire [31:0]   out_RD_DATA,
  input  wire          shift_RD_DATA,
  input  wire [31:0]   in_TRAP_VAL,
  output wire [31:0]   out_TRAP_VAL,
  input  wire          shift_TRAP_VAL,
  input  wire [31:0]   in_PC,
  output wire [31:0]   out_PC,
  input  wire          shift_PC,
  input  wire          in_HAS_TRAPPED,
  output wire          out_HAS_TRAPPED,
  input  wire          shift_HAS_TRAPPED,
  input  wire [3:0]    in_TRAP_CAUSE,
  output wire [3:0]    out_TRAP_CAUSE,
  input  wire          shift_TRAP_CAUSE,
  input  wire [1:0]    in_CSR_OP,
  output wire [1:0]    out_CSR_OP,
  input  wire          shift_CSR_OP,
  input  wire [4:0]    in_RD,
  output wire [4:0]    out_RD,
  input  wire          shift_RD,
  input  wire          in_CSR_USE_IMM,
  output wire          out_CSR_USE_IMM,
  input  wire          shift_CSR_USE_IMM,
  input  wire          in_RD_DATA_VALID,
  output wire          out_RD_DATA_VALID,
  input  wire          shift_RD_DATA_VALID,
  input  wire          in_MRET,
  output wire          out_MRET,
  input  wire          shift_MRET,
  input  wire [31:0]   in_NEXT_PC,
  output wire [31:0]   out_NEXT_PC,
  input  wire          shift_NEXT_PC,
  input  wire [0:0]    in_RS1_TYPE,
  output wire [0:0]    out_RS1_TYPE,
  input  wire          shift_RS1_TYPE,
  input  wire          clk,
  input  wire          reset
);
  localparam RegisterType_NONE = 1'd0;
  localparam RegisterType_GPR = 1'd1;
  localparam CsrOp_NONE = 2'd0;
  localparam CsrOp_RW = 2'd1;
  localparam CsrOp_RS = 2'd2;
  localparam CsrOp_RC = 2'd3;

  wire                when_PipelineRegs_l19;
  reg        [0:0]    reg_RD_TYPE;
  wire       [0:0]    _zz_reg_RD_TYPE;
  wire       [0:0]    _zz_reg_RD_TYPE_1;
  wire                when_PipelineRegs_l19_1;
  reg                 reg_TRAP_IS_INTERRUPT;
  wire                when_PipelineRegs_l19_2;
  reg        [0:0]    reg_RS2_TYPE;
  wire       [0:0]    _zz_reg_RS2_TYPE;
  wire       [0:0]    _zz_reg_RS2_TYPE_1;
  wire                when_PipelineRegs_l19_3;
  reg        [4:0]    reg_RS2;
  wire                when_PipelineRegs_l19_4;
  reg        [31:0]   reg_IR;
  wire                when_PipelineRegs_l19_5;
  reg        [31:0]   reg_RS1_DATA;
  wire                when_PipelineRegs_l19_6;
  reg        [4:0]    reg_RS1;
  wire                when_PipelineRegs_l19_7;
  reg        [31:0]   reg_RD_DATA;
  wire                when_PipelineRegs_l19_8;
  reg        [31:0]   reg_TRAP_VAL;
  wire                when_PipelineRegs_l19_9;
  reg        [31:0]   reg_PC;
  wire                when_PipelineRegs_l19_10;
  reg                 reg_HAS_TRAPPED;
  wire                when_PipelineRegs_l19_11;
  reg        [3:0]    reg_TRAP_CAUSE;
  wire                when_PipelineRegs_l19_12;
  reg        [1:0]    reg_CSR_OP;
  wire       [1:0]    _zz_reg_CSR_OP;
  wire       [1:0]    _zz_reg_CSR_OP_1;
  wire                when_PipelineRegs_l19_13;
  reg        [4:0]    reg_RD;
  wire                when_PipelineRegs_l19_14;
  reg                 reg_CSR_USE_IMM;
  wire                when_PipelineRegs_l19_15;
  reg                 reg_RD_DATA_VALID;
  wire                when_PipelineRegs_l19_16;
  reg                 reg_MRET;
  wire                when_PipelineRegs_l19_17;
  reg        [31:0]   reg_NEXT_PC;
  wire                when_PipelineRegs_l19_18;
  reg        [0:0]    reg_RS1_TYPE;
  wire       [0:0]    _zz_reg_RS1_TYPE;
  wire       [0:0]    _zz_reg_RS1_TYPE_1;
  `ifndef SYNTHESIS
  reg [31:0] in_RD_TYPE_string;
  reg [31:0] out_RD_TYPE_string;
  reg [31:0] reg_RD_TYPE_string;
  reg [31:0] _zz_reg_RD_TYPE_string;
  reg [31:0] _zz_reg_RD_TYPE_1_string;
  reg [31:0] in_RS2_TYPE_string;
  reg [31:0] out_RS2_TYPE_string;
  reg [31:0] reg_RS2_TYPE_string;
  reg [31:0] _zz_reg_RS2_TYPE_string;
  reg [31:0] _zz_reg_RS2_TYPE_1_string;
  reg [31:0] in_CSR_OP_string;
  reg [31:0] out_CSR_OP_string;
  reg [31:0] reg_CSR_OP_string;
  reg [31:0] _zz_reg_CSR_OP_string;
  reg [31:0] _zz_reg_CSR_OP_1_string;
  reg [31:0] in_RS1_TYPE_string;
  reg [31:0] out_RS1_TYPE_string;
  reg [31:0] reg_RS1_TYPE_string;
  reg [31:0] _zz_reg_RS1_TYPE_string;
  reg [31:0] _zz_reg_RS1_TYPE_1_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(in_RD_TYPE)
      RegisterType_NONE : in_RD_TYPE_string = "NONE";
      RegisterType_GPR : in_RD_TYPE_string = "GPR ";
      default : in_RD_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(out_RD_TYPE)
      RegisterType_NONE : out_RD_TYPE_string = "NONE";
      RegisterType_GPR : out_RD_TYPE_string = "GPR ";
      default : out_RD_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(reg_RD_TYPE)
      RegisterType_NONE : reg_RD_TYPE_string = "NONE";
      RegisterType_GPR : reg_RD_TYPE_string = "GPR ";
      default : reg_RD_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_RD_TYPE)
      RegisterType_NONE : _zz_reg_RD_TYPE_string = "NONE";
      RegisterType_GPR : _zz_reg_RD_TYPE_string = "GPR ";
      default : _zz_reg_RD_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_RD_TYPE_1)
      RegisterType_NONE : _zz_reg_RD_TYPE_1_string = "NONE";
      RegisterType_GPR : _zz_reg_RD_TYPE_1_string = "GPR ";
      default : _zz_reg_RD_TYPE_1_string = "????";
    endcase
  end
  always @(*) begin
    case(in_RS2_TYPE)
      RegisterType_NONE : in_RS2_TYPE_string = "NONE";
      RegisterType_GPR : in_RS2_TYPE_string = "GPR ";
      default : in_RS2_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(out_RS2_TYPE)
      RegisterType_NONE : out_RS2_TYPE_string = "NONE";
      RegisterType_GPR : out_RS2_TYPE_string = "GPR ";
      default : out_RS2_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(reg_RS2_TYPE)
      RegisterType_NONE : reg_RS2_TYPE_string = "NONE";
      RegisterType_GPR : reg_RS2_TYPE_string = "GPR ";
      default : reg_RS2_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_RS2_TYPE)
      RegisterType_NONE : _zz_reg_RS2_TYPE_string = "NONE";
      RegisterType_GPR : _zz_reg_RS2_TYPE_string = "GPR ";
      default : _zz_reg_RS2_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_RS2_TYPE_1)
      RegisterType_NONE : _zz_reg_RS2_TYPE_1_string = "NONE";
      RegisterType_GPR : _zz_reg_RS2_TYPE_1_string = "GPR ";
      default : _zz_reg_RS2_TYPE_1_string = "????";
    endcase
  end
  always @(*) begin
    case(in_CSR_OP)
      CsrOp_NONE : in_CSR_OP_string = "NONE";
      CsrOp_RW : in_CSR_OP_string = "RW  ";
      CsrOp_RS : in_CSR_OP_string = "RS  ";
      CsrOp_RC : in_CSR_OP_string = "RC  ";
      default : in_CSR_OP_string = "????";
    endcase
  end
  always @(*) begin
    case(out_CSR_OP)
      CsrOp_NONE : out_CSR_OP_string = "NONE";
      CsrOp_RW : out_CSR_OP_string = "RW  ";
      CsrOp_RS : out_CSR_OP_string = "RS  ";
      CsrOp_RC : out_CSR_OP_string = "RC  ";
      default : out_CSR_OP_string = "????";
    endcase
  end
  always @(*) begin
    case(reg_CSR_OP)
      CsrOp_NONE : reg_CSR_OP_string = "NONE";
      CsrOp_RW : reg_CSR_OP_string = "RW  ";
      CsrOp_RS : reg_CSR_OP_string = "RS  ";
      CsrOp_RC : reg_CSR_OP_string = "RC  ";
      default : reg_CSR_OP_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_CSR_OP)
      CsrOp_NONE : _zz_reg_CSR_OP_string = "NONE";
      CsrOp_RW : _zz_reg_CSR_OP_string = "RW  ";
      CsrOp_RS : _zz_reg_CSR_OP_string = "RS  ";
      CsrOp_RC : _zz_reg_CSR_OP_string = "RC  ";
      default : _zz_reg_CSR_OP_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_CSR_OP_1)
      CsrOp_NONE : _zz_reg_CSR_OP_1_string = "NONE";
      CsrOp_RW : _zz_reg_CSR_OP_1_string = "RW  ";
      CsrOp_RS : _zz_reg_CSR_OP_1_string = "RS  ";
      CsrOp_RC : _zz_reg_CSR_OP_1_string = "RC  ";
      default : _zz_reg_CSR_OP_1_string = "????";
    endcase
  end
  always @(*) begin
    case(in_RS1_TYPE)
      RegisterType_NONE : in_RS1_TYPE_string = "NONE";
      RegisterType_GPR : in_RS1_TYPE_string = "GPR ";
      default : in_RS1_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(out_RS1_TYPE)
      RegisterType_NONE : out_RS1_TYPE_string = "NONE";
      RegisterType_GPR : out_RS1_TYPE_string = "GPR ";
      default : out_RS1_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(reg_RS1_TYPE)
      RegisterType_NONE : reg_RS1_TYPE_string = "NONE";
      RegisterType_GPR : reg_RS1_TYPE_string = "GPR ";
      default : reg_RS1_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_RS1_TYPE)
      RegisterType_NONE : _zz_reg_RS1_TYPE_string = "NONE";
      RegisterType_GPR : _zz_reg_RS1_TYPE_string = "GPR ";
      default : _zz_reg_RS1_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_RS1_TYPE_1)
      RegisterType_NONE : _zz_reg_RS1_TYPE_1_string = "NONE";
      RegisterType_GPR : _zz_reg_RS1_TYPE_1_string = "GPR ";
      default : _zz_reg_RS1_TYPE_1_string = "????";
    endcase
  end
  `endif

  assign when_PipelineRegs_l19 = (shift || shift_RD_TYPE);
  assign _zz_reg_RD_TYPE_1 = 1'b0;
  assign _zz_reg_RD_TYPE = _zz_reg_RD_TYPE_1;
  assign out_RD_TYPE = reg_RD_TYPE;
  assign when_PipelineRegs_l19_1 = (shift || shift_TRAP_IS_INTERRUPT);
  assign out_TRAP_IS_INTERRUPT = reg_TRAP_IS_INTERRUPT;
  assign when_PipelineRegs_l19_2 = (shift || shift_RS2_TYPE);
  assign _zz_reg_RS2_TYPE_1 = 1'b0;
  assign _zz_reg_RS2_TYPE = _zz_reg_RS2_TYPE_1;
  assign out_RS2_TYPE = reg_RS2_TYPE;
  assign when_PipelineRegs_l19_3 = (shift || shift_RS2);
  assign out_RS2 = reg_RS2;
  assign when_PipelineRegs_l19_4 = (shift || shift_IR);
  assign out_IR = reg_IR;
  assign when_PipelineRegs_l19_5 = (shift || shift_RS1_DATA);
  assign out_RS1_DATA = reg_RS1_DATA;
  assign when_PipelineRegs_l19_6 = (shift || shift_RS1);
  assign out_RS1 = reg_RS1;
  assign when_PipelineRegs_l19_7 = (shift || shift_RD_DATA);
  assign out_RD_DATA = reg_RD_DATA;
  assign when_PipelineRegs_l19_8 = (shift || shift_TRAP_VAL);
  assign out_TRAP_VAL = reg_TRAP_VAL;
  assign when_PipelineRegs_l19_9 = (shift || shift_PC);
  assign out_PC = reg_PC;
  assign when_PipelineRegs_l19_10 = (shift || shift_HAS_TRAPPED);
  assign out_HAS_TRAPPED = reg_HAS_TRAPPED;
  assign when_PipelineRegs_l19_11 = (shift || shift_TRAP_CAUSE);
  assign out_TRAP_CAUSE = reg_TRAP_CAUSE;
  assign when_PipelineRegs_l19_12 = (shift || shift_CSR_OP);
  assign _zz_reg_CSR_OP_1 = 2'b00;
  assign _zz_reg_CSR_OP = _zz_reg_CSR_OP_1;
  assign out_CSR_OP = reg_CSR_OP;
  assign when_PipelineRegs_l19_13 = (shift || shift_RD);
  assign out_RD = reg_RD;
  assign when_PipelineRegs_l19_14 = (shift || shift_CSR_USE_IMM);
  assign out_CSR_USE_IMM = reg_CSR_USE_IMM;
  assign when_PipelineRegs_l19_15 = (shift || shift_RD_DATA_VALID);
  assign out_RD_DATA_VALID = reg_RD_DATA_VALID;
  assign when_PipelineRegs_l19_16 = (shift || shift_MRET);
  assign out_MRET = reg_MRET;
  assign when_PipelineRegs_l19_17 = (shift || shift_NEXT_PC);
  assign out_NEXT_PC = reg_NEXT_PC;
  assign when_PipelineRegs_l19_18 = (shift || shift_RS1_TYPE);
  assign _zz_reg_RS1_TYPE_1 = 1'b0;
  assign _zz_reg_RS1_TYPE = _zz_reg_RS1_TYPE_1;
  assign out_RS1_TYPE = reg_RS1_TYPE;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      reg_RD_TYPE <= _zz_reg_RD_TYPE;
      reg_TRAP_IS_INTERRUPT <= 1'b0;
      reg_RS2_TYPE <= _zz_reg_RS2_TYPE;
      reg_RS2 <= 5'h0;
      reg_IR <= 32'h0;
      reg_RS1_DATA <= 32'h0;
      reg_RS1 <= 5'h0;
      reg_RD_DATA <= 32'h0;
      reg_TRAP_VAL <= 32'h0;
      reg_PC <= 32'h0;
      reg_HAS_TRAPPED <= 1'b0;
      reg_TRAP_CAUSE <= 4'b0000;
      reg_CSR_OP <= _zz_reg_CSR_OP;
      reg_RD <= 5'h0;
      reg_CSR_USE_IMM <= 1'b0;
      reg_RD_DATA_VALID <= 1'b0;
      reg_MRET <= 1'b0;
      reg_NEXT_PC <= 32'h0;
      reg_RS1_TYPE <= _zz_reg_RS1_TYPE;
    end else begin
      if(when_PipelineRegs_l19) begin
        reg_RD_TYPE <= in_RD_TYPE;
      end
      if(when_PipelineRegs_l19_1) begin
        reg_TRAP_IS_INTERRUPT <= in_TRAP_IS_INTERRUPT;
      end
      if(when_PipelineRegs_l19_2) begin
        reg_RS2_TYPE <= in_RS2_TYPE;
      end
      if(when_PipelineRegs_l19_3) begin
        reg_RS2 <= in_RS2;
      end
      if(when_PipelineRegs_l19_4) begin
        reg_IR <= in_IR;
      end
      if(when_PipelineRegs_l19_5) begin
        reg_RS1_DATA <= in_RS1_DATA;
      end
      if(when_PipelineRegs_l19_6) begin
        reg_RS1 <= in_RS1;
      end
      if(when_PipelineRegs_l19_7) begin
        reg_RD_DATA <= in_RD_DATA;
      end
      if(when_PipelineRegs_l19_8) begin
        reg_TRAP_VAL <= in_TRAP_VAL;
      end
      if(when_PipelineRegs_l19_9) begin
        reg_PC <= in_PC;
      end
      if(when_PipelineRegs_l19_10) begin
        reg_HAS_TRAPPED <= in_HAS_TRAPPED;
      end
      if(when_PipelineRegs_l19_11) begin
        reg_TRAP_CAUSE <= in_TRAP_CAUSE;
      end
      if(when_PipelineRegs_l19_12) begin
        reg_CSR_OP <= in_CSR_OP;
      end
      if(when_PipelineRegs_l19_13) begin
        reg_RD <= in_RD;
      end
      if(when_PipelineRegs_l19_14) begin
        reg_CSR_USE_IMM <= in_CSR_USE_IMM;
      end
      if(when_PipelineRegs_l19_15) begin
        reg_RD_DATA_VALID <= in_RD_DATA_VALID;
      end
      if(when_PipelineRegs_l19_16) begin
        reg_MRET <= in_MRET;
      end
      if(when_PipelineRegs_l19_17) begin
        reg_NEXT_PC <= in_NEXT_PC;
      end
      if(when_PipelineRegs_l19_18) begin
        reg_RS1_TYPE <= in_RS1_TYPE;
      end
    end
  end


endmodule

module PipelineRegs_EX (
  input  wire          shift,
  input  wire [0:0]    in_RD_TYPE,
  output wire [0:0]    out_RD_TYPE,
  input  wire          shift_RD_TYPE,
  input  wire          in_TRAP_IS_INTERRUPT,
  output wire          out_TRAP_IS_INTERRUPT,
  input  wire          shift_TRAP_IS_INTERRUPT,
  input  wire [0:0]    in_RS2_TYPE,
  output wire [0:0]    out_RS2_TYPE,
  input  wire          shift_RS2_TYPE,
  input  wire [4:0]    in_RS2,
  output wire [4:0]    out_RS2,
  input  wire          shift_RS2,
  input  wire [31:0]   in_IR,
  output wire [31:0]   out_IR,
  input  wire          shift_IR,
  input  wire [31:0]   in_RS1_DATA,
  output wire [31:0]   out_RS1_DATA,
  input  wire          shift_RS1_DATA,
  input  wire [4:0]    in_RS1,
  output wire [4:0]    out_RS1,
  input  wire          shift_RS1,
  input  wire [1:0]    in_LSU_OPERATION_TYPE,
  output wire [1:0]    out_LSU_OPERATION_TYPE,
  input  wire          shift_LSU_OPERATION_TYPE,
  input  wire [31:0]   in_RD_DATA,
  output wire [31:0]   out_RD_DATA,
  input  wire          shift_RD_DATA,
  input  wire [31:0]   in_TRAP_VAL,
  output wire [31:0]   out_TRAP_VAL,
  input  wire          shift_TRAP_VAL,
  input  wire [31:0]   in_PC,
  output wire [31:0]   out_PC,
  input  wire          shift_PC,
  input  wire          in_HAS_TRAPPED,
  output wire          out_HAS_TRAPPED,
  input  wire          shift_HAS_TRAPPED,
  input  wire [31:0]   in_ALU_RESULT,
  output wire [31:0]   out_ALU_RESULT,
  input  wire          shift_ALU_RESULT,
  input  wire [3:0]    in_TRAP_CAUSE,
  output wire [3:0]    out_TRAP_CAUSE,
  input  wire          shift_TRAP_CAUSE,
  input  wire          in_LSU_IS_UNSIGNED,
  output wire          out_LSU_IS_UNSIGNED,
  input  wire          shift_LSU_IS_UNSIGNED,
  input  wire [1:0]    in_CSR_OP,
  output wire [1:0]    out_CSR_OP,
  input  wire          shift_CSR_OP,
  input  wire [31:0]   in_RS2_DATA,
  output wire [31:0]   out_RS2_DATA,
  input  wire          shift_RS2_DATA,
  input  wire [4:0]    in_RD,
  output wire [4:0]    out_RD,
  input  wire          shift_RD,
  input  wire          in_CSR_USE_IMM,
  output wire          out_CSR_USE_IMM,
  input  wire          shift_CSR_USE_IMM,
  input  wire          in_RD_DATA_VALID,
  output wire          out_RD_DATA_VALID,
  input  wire          shift_RD_DATA_VALID,
  input  wire          in_MRET,
  output wire          out_MRET,
  input  wire          shift_MRET,
  input  wire [1:0]    in_LSU_ACCESS_WIDTH,
  output wire [1:0]    out_LSU_ACCESS_WIDTH,
  input  wire          shift_LSU_ACCESS_WIDTH,
  input  wire [31:0]   in_NEXT_PC,
  output wire [31:0]   out_NEXT_PC,
  input  wire          shift_NEXT_PC,
  input  wire [0:0]    in_RS1_TYPE,
  output wire [0:0]    out_RS1_TYPE,
  input  wire          shift_RS1_TYPE,
  input  wire          in_LSU_TARGET_VALID,
  output wire          out_LSU_TARGET_VALID,
  input  wire          shift_LSU_TARGET_VALID,
  input  wire          clk,
  input  wire          reset
);
  localparam RegisterType_NONE = 1'd0;
  localparam RegisterType_GPR = 1'd1;
  localparam LsuOperationType_NONE = 2'd0;
  localparam LsuOperationType_LOAD = 2'd1;
  localparam LsuOperationType_STORE = 2'd2;
  localparam CsrOp_NONE = 2'd0;
  localparam CsrOp_RW = 2'd1;
  localparam CsrOp_RS = 2'd2;
  localparam CsrOp_RC = 2'd3;
  localparam LsuAccessWidth_B = 2'd0;
  localparam LsuAccessWidth_H = 2'd1;
  localparam LsuAccessWidth_W = 2'd2;

  wire                when_PipelineRegs_l19;
  reg        [0:0]    reg_RD_TYPE;
  wire       [0:0]    _zz_reg_RD_TYPE;
  wire       [0:0]    _zz_reg_RD_TYPE_1;
  wire                when_PipelineRegs_l19_1;
  reg                 reg_TRAP_IS_INTERRUPT;
  wire                when_PipelineRegs_l19_2;
  reg        [0:0]    reg_RS2_TYPE;
  wire       [0:0]    _zz_reg_RS2_TYPE;
  wire       [0:0]    _zz_reg_RS2_TYPE_1;
  wire                when_PipelineRegs_l19_3;
  reg        [4:0]    reg_RS2;
  wire                when_PipelineRegs_l19_4;
  reg        [31:0]   reg_IR;
  wire                when_PipelineRegs_l19_5;
  reg        [31:0]   reg_RS1_DATA;
  wire                when_PipelineRegs_l19_6;
  reg        [4:0]    reg_RS1;
  wire                when_PipelineRegs_l19_7;
  reg        [1:0]    reg_LSU_OPERATION_TYPE;
  wire       [1:0]    _zz_reg_LSU_OPERATION_TYPE;
  wire       [1:0]    _zz_reg_LSU_OPERATION_TYPE_1;
  wire                when_PipelineRegs_l19_8;
  reg        [31:0]   reg_RD_DATA;
  wire                when_PipelineRegs_l19_9;
  reg        [31:0]   reg_TRAP_VAL;
  wire                when_PipelineRegs_l19_10;
  reg        [31:0]   reg_PC;
  wire                when_PipelineRegs_l19_11;
  reg                 reg_HAS_TRAPPED;
  wire                when_PipelineRegs_l19_12;
  reg        [31:0]   reg_ALU_RESULT;
  wire                when_PipelineRegs_l19_13;
  reg        [3:0]    reg_TRAP_CAUSE;
  wire                when_PipelineRegs_l19_14;
  reg                 reg_LSU_IS_UNSIGNED;
  wire                when_PipelineRegs_l19_15;
  reg        [1:0]    reg_CSR_OP;
  wire       [1:0]    _zz_reg_CSR_OP;
  wire       [1:0]    _zz_reg_CSR_OP_1;
  wire                when_PipelineRegs_l19_16;
  reg        [31:0]   reg_RS2_DATA;
  wire                when_PipelineRegs_l19_17;
  reg        [4:0]    reg_RD;
  wire                when_PipelineRegs_l19_18;
  reg                 reg_CSR_USE_IMM;
  wire                when_PipelineRegs_l19_19;
  reg                 reg_RD_DATA_VALID;
  wire                when_PipelineRegs_l19_20;
  reg                 reg_MRET;
  wire                when_PipelineRegs_l19_21;
  reg        [1:0]    reg_LSU_ACCESS_WIDTH;
  wire       [1:0]    _zz_reg_LSU_ACCESS_WIDTH;
  wire       [1:0]    _zz_reg_LSU_ACCESS_WIDTH_1;
  wire                when_PipelineRegs_l19_22;
  reg        [31:0]   reg_NEXT_PC;
  wire                when_PipelineRegs_l19_23;
  reg        [0:0]    reg_RS1_TYPE;
  wire       [0:0]    _zz_reg_RS1_TYPE;
  wire       [0:0]    _zz_reg_RS1_TYPE_1;
  wire                when_PipelineRegs_l19_24;
  reg                 reg_LSU_TARGET_VALID;
  `ifndef SYNTHESIS
  reg [31:0] in_RD_TYPE_string;
  reg [31:0] out_RD_TYPE_string;
  reg [31:0] reg_RD_TYPE_string;
  reg [31:0] _zz_reg_RD_TYPE_string;
  reg [31:0] _zz_reg_RD_TYPE_1_string;
  reg [31:0] in_RS2_TYPE_string;
  reg [31:0] out_RS2_TYPE_string;
  reg [31:0] reg_RS2_TYPE_string;
  reg [31:0] _zz_reg_RS2_TYPE_string;
  reg [31:0] _zz_reg_RS2_TYPE_1_string;
  reg [39:0] in_LSU_OPERATION_TYPE_string;
  reg [39:0] out_LSU_OPERATION_TYPE_string;
  reg [39:0] reg_LSU_OPERATION_TYPE_string;
  reg [39:0] _zz_reg_LSU_OPERATION_TYPE_string;
  reg [39:0] _zz_reg_LSU_OPERATION_TYPE_1_string;
  reg [31:0] in_CSR_OP_string;
  reg [31:0] out_CSR_OP_string;
  reg [31:0] reg_CSR_OP_string;
  reg [31:0] _zz_reg_CSR_OP_string;
  reg [31:0] _zz_reg_CSR_OP_1_string;
  reg [7:0] in_LSU_ACCESS_WIDTH_string;
  reg [7:0] out_LSU_ACCESS_WIDTH_string;
  reg [7:0] reg_LSU_ACCESS_WIDTH_string;
  reg [7:0] _zz_reg_LSU_ACCESS_WIDTH_string;
  reg [7:0] _zz_reg_LSU_ACCESS_WIDTH_1_string;
  reg [31:0] in_RS1_TYPE_string;
  reg [31:0] out_RS1_TYPE_string;
  reg [31:0] reg_RS1_TYPE_string;
  reg [31:0] _zz_reg_RS1_TYPE_string;
  reg [31:0] _zz_reg_RS1_TYPE_1_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(in_RD_TYPE)
      RegisterType_NONE : in_RD_TYPE_string = "NONE";
      RegisterType_GPR : in_RD_TYPE_string = "GPR ";
      default : in_RD_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(out_RD_TYPE)
      RegisterType_NONE : out_RD_TYPE_string = "NONE";
      RegisterType_GPR : out_RD_TYPE_string = "GPR ";
      default : out_RD_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(reg_RD_TYPE)
      RegisterType_NONE : reg_RD_TYPE_string = "NONE";
      RegisterType_GPR : reg_RD_TYPE_string = "GPR ";
      default : reg_RD_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_RD_TYPE)
      RegisterType_NONE : _zz_reg_RD_TYPE_string = "NONE";
      RegisterType_GPR : _zz_reg_RD_TYPE_string = "GPR ";
      default : _zz_reg_RD_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_RD_TYPE_1)
      RegisterType_NONE : _zz_reg_RD_TYPE_1_string = "NONE";
      RegisterType_GPR : _zz_reg_RD_TYPE_1_string = "GPR ";
      default : _zz_reg_RD_TYPE_1_string = "????";
    endcase
  end
  always @(*) begin
    case(in_RS2_TYPE)
      RegisterType_NONE : in_RS2_TYPE_string = "NONE";
      RegisterType_GPR : in_RS2_TYPE_string = "GPR ";
      default : in_RS2_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(out_RS2_TYPE)
      RegisterType_NONE : out_RS2_TYPE_string = "NONE";
      RegisterType_GPR : out_RS2_TYPE_string = "GPR ";
      default : out_RS2_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(reg_RS2_TYPE)
      RegisterType_NONE : reg_RS2_TYPE_string = "NONE";
      RegisterType_GPR : reg_RS2_TYPE_string = "GPR ";
      default : reg_RS2_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_RS2_TYPE)
      RegisterType_NONE : _zz_reg_RS2_TYPE_string = "NONE";
      RegisterType_GPR : _zz_reg_RS2_TYPE_string = "GPR ";
      default : _zz_reg_RS2_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_RS2_TYPE_1)
      RegisterType_NONE : _zz_reg_RS2_TYPE_1_string = "NONE";
      RegisterType_GPR : _zz_reg_RS2_TYPE_1_string = "GPR ";
      default : _zz_reg_RS2_TYPE_1_string = "????";
    endcase
  end
  always @(*) begin
    case(in_LSU_OPERATION_TYPE)
      LsuOperationType_NONE : in_LSU_OPERATION_TYPE_string = "NONE ";
      LsuOperationType_LOAD : in_LSU_OPERATION_TYPE_string = "LOAD ";
      LsuOperationType_STORE : in_LSU_OPERATION_TYPE_string = "STORE";
      default : in_LSU_OPERATION_TYPE_string = "?????";
    endcase
  end
  always @(*) begin
    case(out_LSU_OPERATION_TYPE)
      LsuOperationType_NONE : out_LSU_OPERATION_TYPE_string = "NONE ";
      LsuOperationType_LOAD : out_LSU_OPERATION_TYPE_string = "LOAD ";
      LsuOperationType_STORE : out_LSU_OPERATION_TYPE_string = "STORE";
      default : out_LSU_OPERATION_TYPE_string = "?????";
    endcase
  end
  always @(*) begin
    case(reg_LSU_OPERATION_TYPE)
      LsuOperationType_NONE : reg_LSU_OPERATION_TYPE_string = "NONE ";
      LsuOperationType_LOAD : reg_LSU_OPERATION_TYPE_string = "LOAD ";
      LsuOperationType_STORE : reg_LSU_OPERATION_TYPE_string = "STORE";
      default : reg_LSU_OPERATION_TYPE_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_LSU_OPERATION_TYPE)
      LsuOperationType_NONE : _zz_reg_LSU_OPERATION_TYPE_string = "NONE ";
      LsuOperationType_LOAD : _zz_reg_LSU_OPERATION_TYPE_string = "LOAD ";
      LsuOperationType_STORE : _zz_reg_LSU_OPERATION_TYPE_string = "STORE";
      default : _zz_reg_LSU_OPERATION_TYPE_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_LSU_OPERATION_TYPE_1)
      LsuOperationType_NONE : _zz_reg_LSU_OPERATION_TYPE_1_string = "NONE ";
      LsuOperationType_LOAD : _zz_reg_LSU_OPERATION_TYPE_1_string = "LOAD ";
      LsuOperationType_STORE : _zz_reg_LSU_OPERATION_TYPE_1_string = "STORE";
      default : _zz_reg_LSU_OPERATION_TYPE_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(in_CSR_OP)
      CsrOp_NONE : in_CSR_OP_string = "NONE";
      CsrOp_RW : in_CSR_OP_string = "RW  ";
      CsrOp_RS : in_CSR_OP_string = "RS  ";
      CsrOp_RC : in_CSR_OP_string = "RC  ";
      default : in_CSR_OP_string = "????";
    endcase
  end
  always @(*) begin
    case(out_CSR_OP)
      CsrOp_NONE : out_CSR_OP_string = "NONE";
      CsrOp_RW : out_CSR_OP_string = "RW  ";
      CsrOp_RS : out_CSR_OP_string = "RS  ";
      CsrOp_RC : out_CSR_OP_string = "RC  ";
      default : out_CSR_OP_string = "????";
    endcase
  end
  always @(*) begin
    case(reg_CSR_OP)
      CsrOp_NONE : reg_CSR_OP_string = "NONE";
      CsrOp_RW : reg_CSR_OP_string = "RW  ";
      CsrOp_RS : reg_CSR_OP_string = "RS  ";
      CsrOp_RC : reg_CSR_OP_string = "RC  ";
      default : reg_CSR_OP_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_CSR_OP)
      CsrOp_NONE : _zz_reg_CSR_OP_string = "NONE";
      CsrOp_RW : _zz_reg_CSR_OP_string = "RW  ";
      CsrOp_RS : _zz_reg_CSR_OP_string = "RS  ";
      CsrOp_RC : _zz_reg_CSR_OP_string = "RC  ";
      default : _zz_reg_CSR_OP_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_CSR_OP_1)
      CsrOp_NONE : _zz_reg_CSR_OP_1_string = "NONE";
      CsrOp_RW : _zz_reg_CSR_OP_1_string = "RW  ";
      CsrOp_RS : _zz_reg_CSR_OP_1_string = "RS  ";
      CsrOp_RC : _zz_reg_CSR_OP_1_string = "RC  ";
      default : _zz_reg_CSR_OP_1_string = "????";
    endcase
  end
  always @(*) begin
    case(in_LSU_ACCESS_WIDTH)
      LsuAccessWidth_B : in_LSU_ACCESS_WIDTH_string = "B";
      LsuAccessWidth_H : in_LSU_ACCESS_WIDTH_string = "H";
      LsuAccessWidth_W : in_LSU_ACCESS_WIDTH_string = "W";
      default : in_LSU_ACCESS_WIDTH_string = "?";
    endcase
  end
  always @(*) begin
    case(out_LSU_ACCESS_WIDTH)
      LsuAccessWidth_B : out_LSU_ACCESS_WIDTH_string = "B";
      LsuAccessWidth_H : out_LSU_ACCESS_WIDTH_string = "H";
      LsuAccessWidth_W : out_LSU_ACCESS_WIDTH_string = "W";
      default : out_LSU_ACCESS_WIDTH_string = "?";
    endcase
  end
  always @(*) begin
    case(reg_LSU_ACCESS_WIDTH)
      LsuAccessWidth_B : reg_LSU_ACCESS_WIDTH_string = "B";
      LsuAccessWidth_H : reg_LSU_ACCESS_WIDTH_string = "H";
      LsuAccessWidth_W : reg_LSU_ACCESS_WIDTH_string = "W";
      default : reg_LSU_ACCESS_WIDTH_string = "?";
    endcase
  end
  always @(*) begin
    case(_zz_reg_LSU_ACCESS_WIDTH)
      LsuAccessWidth_B : _zz_reg_LSU_ACCESS_WIDTH_string = "B";
      LsuAccessWidth_H : _zz_reg_LSU_ACCESS_WIDTH_string = "H";
      LsuAccessWidth_W : _zz_reg_LSU_ACCESS_WIDTH_string = "W";
      default : _zz_reg_LSU_ACCESS_WIDTH_string = "?";
    endcase
  end
  always @(*) begin
    case(_zz_reg_LSU_ACCESS_WIDTH_1)
      LsuAccessWidth_B : _zz_reg_LSU_ACCESS_WIDTH_1_string = "B";
      LsuAccessWidth_H : _zz_reg_LSU_ACCESS_WIDTH_1_string = "H";
      LsuAccessWidth_W : _zz_reg_LSU_ACCESS_WIDTH_1_string = "W";
      default : _zz_reg_LSU_ACCESS_WIDTH_1_string = "?";
    endcase
  end
  always @(*) begin
    case(in_RS1_TYPE)
      RegisterType_NONE : in_RS1_TYPE_string = "NONE";
      RegisterType_GPR : in_RS1_TYPE_string = "GPR ";
      default : in_RS1_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(out_RS1_TYPE)
      RegisterType_NONE : out_RS1_TYPE_string = "NONE";
      RegisterType_GPR : out_RS1_TYPE_string = "GPR ";
      default : out_RS1_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(reg_RS1_TYPE)
      RegisterType_NONE : reg_RS1_TYPE_string = "NONE";
      RegisterType_GPR : reg_RS1_TYPE_string = "GPR ";
      default : reg_RS1_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_RS1_TYPE)
      RegisterType_NONE : _zz_reg_RS1_TYPE_string = "NONE";
      RegisterType_GPR : _zz_reg_RS1_TYPE_string = "GPR ";
      default : _zz_reg_RS1_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_RS1_TYPE_1)
      RegisterType_NONE : _zz_reg_RS1_TYPE_1_string = "NONE";
      RegisterType_GPR : _zz_reg_RS1_TYPE_1_string = "GPR ";
      default : _zz_reg_RS1_TYPE_1_string = "????";
    endcase
  end
  `endif

  assign when_PipelineRegs_l19 = (shift || shift_RD_TYPE);
  assign _zz_reg_RD_TYPE_1 = 1'b0;
  assign _zz_reg_RD_TYPE = _zz_reg_RD_TYPE_1;
  assign out_RD_TYPE = reg_RD_TYPE;
  assign when_PipelineRegs_l19_1 = (shift || shift_TRAP_IS_INTERRUPT);
  assign out_TRAP_IS_INTERRUPT = reg_TRAP_IS_INTERRUPT;
  assign when_PipelineRegs_l19_2 = (shift || shift_RS2_TYPE);
  assign _zz_reg_RS2_TYPE_1 = 1'b0;
  assign _zz_reg_RS2_TYPE = _zz_reg_RS2_TYPE_1;
  assign out_RS2_TYPE = reg_RS2_TYPE;
  assign when_PipelineRegs_l19_3 = (shift || shift_RS2);
  assign out_RS2 = reg_RS2;
  assign when_PipelineRegs_l19_4 = (shift || shift_IR);
  assign out_IR = reg_IR;
  assign when_PipelineRegs_l19_5 = (shift || shift_RS1_DATA);
  assign out_RS1_DATA = reg_RS1_DATA;
  assign when_PipelineRegs_l19_6 = (shift || shift_RS1);
  assign out_RS1 = reg_RS1;
  assign when_PipelineRegs_l19_7 = (shift || shift_LSU_OPERATION_TYPE);
  assign _zz_reg_LSU_OPERATION_TYPE_1 = 2'b00;
  assign _zz_reg_LSU_OPERATION_TYPE = _zz_reg_LSU_OPERATION_TYPE_1;
  assign out_LSU_OPERATION_TYPE = reg_LSU_OPERATION_TYPE;
  assign when_PipelineRegs_l19_8 = (shift || shift_RD_DATA);
  assign out_RD_DATA = reg_RD_DATA;
  assign when_PipelineRegs_l19_9 = (shift || shift_TRAP_VAL);
  assign out_TRAP_VAL = reg_TRAP_VAL;
  assign when_PipelineRegs_l19_10 = (shift || shift_PC);
  assign out_PC = reg_PC;
  assign when_PipelineRegs_l19_11 = (shift || shift_HAS_TRAPPED);
  assign out_HAS_TRAPPED = reg_HAS_TRAPPED;
  assign when_PipelineRegs_l19_12 = (shift || shift_ALU_RESULT);
  assign out_ALU_RESULT = reg_ALU_RESULT;
  assign when_PipelineRegs_l19_13 = (shift || shift_TRAP_CAUSE);
  assign out_TRAP_CAUSE = reg_TRAP_CAUSE;
  assign when_PipelineRegs_l19_14 = (shift || shift_LSU_IS_UNSIGNED);
  assign out_LSU_IS_UNSIGNED = reg_LSU_IS_UNSIGNED;
  assign when_PipelineRegs_l19_15 = (shift || shift_CSR_OP);
  assign _zz_reg_CSR_OP_1 = 2'b00;
  assign _zz_reg_CSR_OP = _zz_reg_CSR_OP_1;
  assign out_CSR_OP = reg_CSR_OP;
  assign when_PipelineRegs_l19_16 = (shift || shift_RS2_DATA);
  assign out_RS2_DATA = reg_RS2_DATA;
  assign when_PipelineRegs_l19_17 = (shift || shift_RD);
  assign out_RD = reg_RD;
  assign when_PipelineRegs_l19_18 = (shift || shift_CSR_USE_IMM);
  assign out_CSR_USE_IMM = reg_CSR_USE_IMM;
  assign when_PipelineRegs_l19_19 = (shift || shift_RD_DATA_VALID);
  assign out_RD_DATA_VALID = reg_RD_DATA_VALID;
  assign when_PipelineRegs_l19_20 = (shift || shift_MRET);
  assign out_MRET = reg_MRET;
  assign when_PipelineRegs_l19_21 = (shift || shift_LSU_ACCESS_WIDTH);
  assign _zz_reg_LSU_ACCESS_WIDTH_1 = 2'b00;
  assign _zz_reg_LSU_ACCESS_WIDTH = _zz_reg_LSU_ACCESS_WIDTH_1;
  assign out_LSU_ACCESS_WIDTH = reg_LSU_ACCESS_WIDTH;
  assign when_PipelineRegs_l19_22 = (shift || shift_NEXT_PC);
  assign out_NEXT_PC = reg_NEXT_PC;
  assign when_PipelineRegs_l19_23 = (shift || shift_RS1_TYPE);
  assign _zz_reg_RS1_TYPE_1 = 1'b0;
  assign _zz_reg_RS1_TYPE = _zz_reg_RS1_TYPE_1;
  assign out_RS1_TYPE = reg_RS1_TYPE;
  assign when_PipelineRegs_l19_24 = (shift || shift_LSU_TARGET_VALID);
  assign out_LSU_TARGET_VALID = reg_LSU_TARGET_VALID;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      reg_RD_TYPE <= _zz_reg_RD_TYPE;
      reg_TRAP_IS_INTERRUPT <= 1'b0;
      reg_RS2_TYPE <= _zz_reg_RS2_TYPE;
      reg_RS2 <= 5'h0;
      reg_IR <= 32'h0;
      reg_RS1_DATA <= 32'h0;
      reg_RS1 <= 5'h0;
      reg_LSU_OPERATION_TYPE <= _zz_reg_LSU_OPERATION_TYPE;
      reg_RD_DATA <= 32'h0;
      reg_TRAP_VAL <= 32'h0;
      reg_PC <= 32'h0;
      reg_HAS_TRAPPED <= 1'b0;
      reg_ALU_RESULT <= 32'h0;
      reg_TRAP_CAUSE <= 4'b0000;
      reg_LSU_IS_UNSIGNED <= 1'b0;
      reg_CSR_OP <= _zz_reg_CSR_OP;
      reg_RS2_DATA <= 32'h0;
      reg_RD <= 5'h0;
      reg_CSR_USE_IMM <= 1'b0;
      reg_RD_DATA_VALID <= 1'b0;
      reg_MRET <= 1'b0;
      reg_LSU_ACCESS_WIDTH <= _zz_reg_LSU_ACCESS_WIDTH;
      reg_NEXT_PC <= 32'h0;
      reg_RS1_TYPE <= _zz_reg_RS1_TYPE;
      reg_LSU_TARGET_VALID <= 1'b0;
    end else begin
      if(when_PipelineRegs_l19) begin
        reg_RD_TYPE <= in_RD_TYPE;
      end
      if(when_PipelineRegs_l19_1) begin
        reg_TRAP_IS_INTERRUPT <= in_TRAP_IS_INTERRUPT;
      end
      if(when_PipelineRegs_l19_2) begin
        reg_RS2_TYPE <= in_RS2_TYPE;
      end
      if(when_PipelineRegs_l19_3) begin
        reg_RS2 <= in_RS2;
      end
      if(when_PipelineRegs_l19_4) begin
        reg_IR <= in_IR;
      end
      if(when_PipelineRegs_l19_5) begin
        reg_RS1_DATA <= in_RS1_DATA;
      end
      if(when_PipelineRegs_l19_6) begin
        reg_RS1 <= in_RS1;
      end
      if(when_PipelineRegs_l19_7) begin
        reg_LSU_OPERATION_TYPE <= in_LSU_OPERATION_TYPE;
      end
      if(when_PipelineRegs_l19_8) begin
        reg_RD_DATA <= in_RD_DATA;
      end
      if(when_PipelineRegs_l19_9) begin
        reg_TRAP_VAL <= in_TRAP_VAL;
      end
      if(when_PipelineRegs_l19_10) begin
        reg_PC <= in_PC;
      end
      if(when_PipelineRegs_l19_11) begin
        reg_HAS_TRAPPED <= in_HAS_TRAPPED;
      end
      if(when_PipelineRegs_l19_12) begin
        reg_ALU_RESULT <= in_ALU_RESULT;
      end
      if(when_PipelineRegs_l19_13) begin
        reg_TRAP_CAUSE <= in_TRAP_CAUSE;
      end
      if(when_PipelineRegs_l19_14) begin
        reg_LSU_IS_UNSIGNED <= in_LSU_IS_UNSIGNED;
      end
      if(when_PipelineRegs_l19_15) begin
        reg_CSR_OP <= in_CSR_OP;
      end
      if(when_PipelineRegs_l19_16) begin
        reg_RS2_DATA <= in_RS2_DATA;
      end
      if(when_PipelineRegs_l19_17) begin
        reg_RD <= in_RD;
      end
      if(when_PipelineRegs_l19_18) begin
        reg_CSR_USE_IMM <= in_CSR_USE_IMM;
      end
      if(when_PipelineRegs_l19_19) begin
        reg_RD_DATA_VALID <= in_RD_DATA_VALID;
      end
      if(when_PipelineRegs_l19_20) begin
        reg_MRET <= in_MRET;
      end
      if(when_PipelineRegs_l19_21) begin
        reg_LSU_ACCESS_WIDTH <= in_LSU_ACCESS_WIDTH;
      end
      if(when_PipelineRegs_l19_22) begin
        reg_NEXT_PC <= in_NEXT_PC;
      end
      if(when_PipelineRegs_l19_23) begin
        reg_RS1_TYPE <= in_RS1_TYPE;
      end
      if(when_PipelineRegs_l19_24) begin
        reg_LSU_TARGET_VALID <= in_LSU_TARGET_VALID;
      end
    end
  end


endmodule

module PipelineRegs_ID (
  input  wire          shift,
  input  wire [2:0]    in_BU_CONDITION,
  output wire [2:0]    out_BU_CONDITION,
  input  wire          shift_BU_CONDITION,
  input  wire [1:0]    in_SHIFT_OP,
  output wire [1:0]    out_SHIFT_OP,
  input  wire          shift_SHIFT_OP,
  input  wire          in_MUL,
  output wire          out_MUL,
  input  wire          shift_MUL,
  input  wire          in_EBREAK,
  output wire          out_EBREAK,
  input  wire          shift_EBREAK,
  input  wire [0:0]    in_RD_TYPE,
  output wire [0:0]    out_RD_TYPE,
  input  wire          shift_RD_TYPE,
  input  wire          in_TRAP_IS_INTERRUPT,
  output wire          out_TRAP_IS_INTERRUPT,
  input  wire          shift_TRAP_IS_INTERRUPT,
  input  wire [0:0]    in_RS2_TYPE,
  output wire [0:0]    out_RS2_TYPE,
  input  wire          shift_RS2_TYPE,
  input  wire [4:0]    in_RS2,
  output wire [4:0]    out_RS2,
  input  wire          shift_RS2,
  input  wire [31:0]   in_IR,
  output wire [31:0]   out_IR,
  input  wire          shift_IR,
  input  wire [31:0]   in_RS1_DATA,
  output wire [31:0]   out_RS1_DATA,
  input  wire          shift_RS1_DATA,
  input  wire [4:0]    in_RS1,
  output wire [4:0]    out_RS1,
  input  wire          shift_RS1,
  input  wire          in_IMM_USED,
  output wire          out_IMM_USED,
  input  wire          shift_IMM_USED,
  input  wire [1:0]    in_LSU_OPERATION_TYPE,
  output wire [1:0]    out_LSU_OPERATION_TYPE,
  input  wire          shift_LSU_OPERATION_TYPE,
  input  wire          in_BU_IS_BRANCH,
  output wire          out_BU_IS_BRANCH,
  input  wire          shift_BU_IS_BRANCH,
  input  wire [2:0]    in_ALU_OP,
  output wire [2:0]    out_ALU_OP,
  input  wire          shift_ALU_OP,
  input  wire          in_REM,
  output wire          out_REM,
  input  wire          shift_REM,
  input  wire          in_ALU_COMMIT_RESULT,
  output wire          out_ALU_COMMIT_RESULT,
  input  wire          shift_ALU_COMMIT_RESULT,
  input  wire [31:0]   in_TRAP_VAL,
  output wire [31:0]   out_TRAP_VAL,
  input  wire          shift_TRAP_VAL,
  input  wire          in_BU_WRITE_RET_ADDR_TO_RD,
  output wire          out_BU_WRITE_RET_ADDR_TO_RD,
  input  wire          shift_BU_WRITE_RET_ADDR_TO_RD,
  input  wire [31:0]   in_PC,
  output wire [31:0]   out_PC,
  input  wire          shift_PC,
  input  wire          in_HAS_TRAPPED,
  output wire          out_HAS_TRAPPED,
  input  wire          shift_HAS_TRAPPED,
  input  wire          in_ECALL,
  output wire          out_ECALL,
  input  wire          shift_ECALL,
  input  wire [3:0]    in_TRAP_CAUSE,
  output wire [3:0]    out_TRAP_CAUSE,
  input  wire          shift_TRAP_CAUSE,
  input  wire          in_LSU_IS_UNSIGNED,
  output wire          out_LSU_IS_UNSIGNED,
  input  wire          shift_LSU_IS_UNSIGNED,
  input  wire [1:0]    in_CSR_OP,
  output wire [1:0]    out_CSR_OP,
  input  wire          shift_CSR_OP,
  input  wire [31:0]   in_RS2_DATA,
  output wire [31:0]   out_RS2_DATA,
  input  wire          shift_RS2_DATA,
  input  wire [0:0]    in_ALU_SRC1,
  output wire [0:0]    out_ALU_SRC1,
  input  wire          shift_ALU_SRC1,
  input  wire [4:0]    in_RD,
  output wire [4:0]    out_RD,
  input  wire          shift_RD,
  input  wire          in_MUL_HIGH,
  output wire          out_MUL_HIGH,
  input  wire          shift_MUL_HIGH,
  input  wire          in_CSR_USE_IMM,
  output wire          out_CSR_USE_IMM,
  input  wire          shift_CSR_USE_IMM,
  input  wire          in_BU_IGNORE_TARGET_LSB,
  output wire          out_BU_IGNORE_TARGET_LSB,
  input  wire          shift_BU_IGNORE_TARGET_LSB,
  input  wire          in_RD_DATA_VALID,
  output wire          out_RD_DATA_VALID,
  input  wire          shift_RD_DATA_VALID,
  input  wire          in_DIV,
  output wire          out_DIV,
  input  wire          shift_DIV,
  input  wire          in_MRET,
  output wire          out_MRET,
  input  wire          shift_MRET,
  input  wire [1:0]    in_LSU_ACCESS_WIDTH,
  output wire [1:0]    out_LSU_ACCESS_WIDTH,
  input  wire          shift_LSU_ACCESS_WIDTH,
  input  wire [31:0]   in_NEXT_PC,
  output wire [31:0]   out_NEXT_PC,
  input  wire          shift_NEXT_PC,
  input  wire [0:0]    in_RS1_TYPE,
  output wire [0:0]    out_RS1_TYPE,
  input  wire          shift_RS1_TYPE,
  input  wire [31:0]   in_IMM,
  output wire [31:0]   out_IMM,
  input  wire          shift_IMM,
  input  wire [0:0]    in_ALU_SRC2,
  output wire [0:0]    out_ALU_SRC2,
  input  wire          shift_ALU_SRC2,
  input  wire          in_MULDIV_RS2_SIGNED,
  output wire          out_MULDIV_RS2_SIGNED,
  input  wire          shift_MULDIV_RS2_SIGNED,
  input  wire          in_LSU_TARGET_VALID,
  output wire          out_LSU_TARGET_VALID,
  input  wire          shift_LSU_TARGET_VALID,
  input  wire          in_MULDIV_RS1_SIGNED,
  output wire          out_MULDIV_RS1_SIGNED,
  input  wire          shift_MULDIV_RS1_SIGNED,
  input  wire          clk,
  input  wire          reset
);
  localparam BranchCondition_NONE = 3'd0;
  localparam BranchCondition_EQ = 3'd1;
  localparam BranchCondition_NE = 3'd2;
  localparam BranchCondition_LT = 3'd3;
  localparam BranchCondition_GE = 3'd4;
  localparam BranchCondition_LTU = 3'd5;
  localparam BranchCondition_GEU = 3'd6;
  localparam ShiftOp_NONE = 2'd0;
  localparam ShiftOp_SLL_1 = 2'd1;
  localparam ShiftOp_SRL_1 = 2'd2;
  localparam ShiftOp_SRA_1 = 2'd3;
  localparam RegisterType_NONE = 1'd0;
  localparam RegisterType_GPR = 1'd1;
  localparam LsuOperationType_NONE = 2'd0;
  localparam LsuOperationType_LOAD = 2'd1;
  localparam LsuOperationType_STORE = 2'd2;
  localparam AluOp_ADD = 3'd0;
  localparam AluOp_SUB = 3'd1;
  localparam AluOp_SLT = 3'd2;
  localparam AluOp_SLTU = 3'd3;
  localparam AluOp_XOR_1 = 3'd4;
  localparam AluOp_OR_1 = 3'd5;
  localparam AluOp_AND_1 = 3'd6;
  localparam AluOp_SRC2 = 3'd7;
  localparam CsrOp_NONE = 2'd0;
  localparam CsrOp_RW = 2'd1;
  localparam CsrOp_RS = 2'd2;
  localparam CsrOp_RC = 2'd3;
  localparam Src1Select_RS1 = 1'd0;
  localparam Src1Select_PC = 1'd1;
  localparam LsuAccessWidth_B = 2'd0;
  localparam LsuAccessWidth_H = 2'd1;
  localparam LsuAccessWidth_W = 2'd2;
  localparam Src2Select_RS2 = 1'd0;
  localparam Src2Select_IMM = 1'd1;

  wire                when_PipelineRegs_l19;
  reg        [2:0]    reg_BU_CONDITION;
  wire       [2:0]    _zz_reg_BU_CONDITION;
  wire       [2:0]    _zz_reg_BU_CONDITION_1;
  wire                when_PipelineRegs_l19_1;
  reg        [1:0]    reg_SHIFT_OP;
  wire       [1:0]    _zz_reg_SHIFT_OP;
  wire       [1:0]    _zz_reg_SHIFT_OP_1;
  wire                when_PipelineRegs_l19_2;
  reg                 reg_MUL;
  wire                when_PipelineRegs_l19_3;
  reg                 reg_EBREAK;
  wire                when_PipelineRegs_l19_4;
  reg        [0:0]    reg_RD_TYPE;
  wire       [0:0]    _zz_reg_RD_TYPE;
  wire       [0:0]    _zz_reg_RD_TYPE_1;
  wire                when_PipelineRegs_l19_5;
  reg                 reg_TRAP_IS_INTERRUPT;
  wire                when_PipelineRegs_l19_6;
  reg        [0:0]    reg_RS2_TYPE;
  wire       [0:0]    _zz_reg_RS2_TYPE;
  wire       [0:0]    _zz_reg_RS2_TYPE_1;
  wire                when_PipelineRegs_l19_7;
  reg        [4:0]    reg_RS2;
  wire                when_PipelineRegs_l19_8;
  reg        [31:0]   reg_IR;
  wire                when_PipelineRegs_l19_9;
  reg        [31:0]   reg_RS1_DATA;
  wire                when_PipelineRegs_l19_10;
  reg        [4:0]    reg_RS1;
  wire                when_PipelineRegs_l19_11;
  reg                 reg_IMM_USED;
  wire                when_PipelineRegs_l19_12;
  reg        [1:0]    reg_LSU_OPERATION_TYPE;
  wire       [1:0]    _zz_reg_LSU_OPERATION_TYPE;
  wire       [1:0]    _zz_reg_LSU_OPERATION_TYPE_1;
  wire                when_PipelineRegs_l19_13;
  reg                 reg_BU_IS_BRANCH;
  wire                when_PipelineRegs_l19_14;
  reg        [2:0]    reg_ALU_OP;
  wire       [2:0]    _zz_reg_ALU_OP;
  wire       [2:0]    _zz_reg_ALU_OP_1;
  wire                when_PipelineRegs_l19_15;
  reg                 reg_REM;
  wire                when_PipelineRegs_l19_16;
  reg                 reg_ALU_COMMIT_RESULT;
  wire                when_PipelineRegs_l19_17;
  reg        [31:0]   reg_TRAP_VAL;
  wire                when_PipelineRegs_l19_18;
  reg                 reg_BU_WRITE_RET_ADDR_TO_RD;
  wire                when_PipelineRegs_l19_19;
  reg        [31:0]   reg_PC;
  wire                when_PipelineRegs_l19_20;
  reg                 reg_HAS_TRAPPED;
  wire                when_PipelineRegs_l19_21;
  reg                 reg_ECALL;
  wire                when_PipelineRegs_l19_22;
  reg        [3:0]    reg_TRAP_CAUSE;
  wire                when_PipelineRegs_l19_23;
  reg                 reg_LSU_IS_UNSIGNED;
  wire                when_PipelineRegs_l19_24;
  reg        [1:0]    reg_CSR_OP;
  wire       [1:0]    _zz_reg_CSR_OP;
  wire       [1:0]    _zz_reg_CSR_OP_1;
  wire                when_PipelineRegs_l19_25;
  reg        [31:0]   reg_RS2_DATA;
  wire                when_PipelineRegs_l19_26;
  reg        [0:0]    reg_ALU_SRC1;
  wire       [0:0]    _zz_reg_ALU_SRC1;
  wire       [0:0]    _zz_reg_ALU_SRC1_1;
  wire                when_PipelineRegs_l19_27;
  reg        [4:0]    reg_RD;
  wire                when_PipelineRegs_l19_28;
  reg                 reg_MUL_HIGH;
  wire                when_PipelineRegs_l19_29;
  reg                 reg_CSR_USE_IMM;
  wire                when_PipelineRegs_l19_30;
  reg                 reg_BU_IGNORE_TARGET_LSB;
  wire                when_PipelineRegs_l19_31;
  reg                 reg_RD_DATA_VALID;
  wire                when_PipelineRegs_l19_32;
  reg                 reg_DIV;
  wire                when_PipelineRegs_l19_33;
  reg                 reg_MRET;
  wire                when_PipelineRegs_l19_34;
  reg        [1:0]    reg_LSU_ACCESS_WIDTH;
  wire       [1:0]    _zz_reg_LSU_ACCESS_WIDTH;
  wire       [1:0]    _zz_reg_LSU_ACCESS_WIDTH_1;
  wire                when_PipelineRegs_l19_35;
  reg        [31:0]   reg_NEXT_PC;
  wire                when_PipelineRegs_l19_36;
  reg        [0:0]    reg_RS1_TYPE;
  wire       [0:0]    _zz_reg_RS1_TYPE;
  wire       [0:0]    _zz_reg_RS1_TYPE_1;
  wire                when_PipelineRegs_l19_37;
  reg        [31:0]   reg_IMM;
  wire                when_PipelineRegs_l19_38;
  reg        [0:0]    reg_ALU_SRC2;
  wire       [0:0]    _zz_reg_ALU_SRC2;
  wire       [0:0]    _zz_reg_ALU_SRC2_1;
  wire                when_PipelineRegs_l19_39;
  reg                 reg_MULDIV_RS2_SIGNED;
  wire                when_PipelineRegs_l19_40;
  reg                 reg_LSU_TARGET_VALID;
  wire                when_PipelineRegs_l19_41;
  reg                 reg_MULDIV_RS1_SIGNED;
  `ifndef SYNTHESIS
  reg [31:0] in_BU_CONDITION_string;
  reg [31:0] out_BU_CONDITION_string;
  reg [31:0] reg_BU_CONDITION_string;
  reg [31:0] _zz_reg_BU_CONDITION_string;
  reg [31:0] _zz_reg_BU_CONDITION_1_string;
  reg [39:0] in_SHIFT_OP_string;
  reg [39:0] out_SHIFT_OP_string;
  reg [39:0] reg_SHIFT_OP_string;
  reg [39:0] _zz_reg_SHIFT_OP_string;
  reg [39:0] _zz_reg_SHIFT_OP_1_string;
  reg [31:0] in_RD_TYPE_string;
  reg [31:0] out_RD_TYPE_string;
  reg [31:0] reg_RD_TYPE_string;
  reg [31:0] _zz_reg_RD_TYPE_string;
  reg [31:0] _zz_reg_RD_TYPE_1_string;
  reg [31:0] in_RS2_TYPE_string;
  reg [31:0] out_RS2_TYPE_string;
  reg [31:0] reg_RS2_TYPE_string;
  reg [31:0] _zz_reg_RS2_TYPE_string;
  reg [31:0] _zz_reg_RS2_TYPE_1_string;
  reg [39:0] in_LSU_OPERATION_TYPE_string;
  reg [39:0] out_LSU_OPERATION_TYPE_string;
  reg [39:0] reg_LSU_OPERATION_TYPE_string;
  reg [39:0] _zz_reg_LSU_OPERATION_TYPE_string;
  reg [39:0] _zz_reg_LSU_OPERATION_TYPE_1_string;
  reg [39:0] in_ALU_OP_string;
  reg [39:0] out_ALU_OP_string;
  reg [39:0] reg_ALU_OP_string;
  reg [39:0] _zz_reg_ALU_OP_string;
  reg [39:0] _zz_reg_ALU_OP_1_string;
  reg [31:0] in_CSR_OP_string;
  reg [31:0] out_CSR_OP_string;
  reg [31:0] reg_CSR_OP_string;
  reg [31:0] _zz_reg_CSR_OP_string;
  reg [31:0] _zz_reg_CSR_OP_1_string;
  reg [23:0] in_ALU_SRC1_string;
  reg [23:0] out_ALU_SRC1_string;
  reg [23:0] reg_ALU_SRC1_string;
  reg [23:0] _zz_reg_ALU_SRC1_string;
  reg [23:0] _zz_reg_ALU_SRC1_1_string;
  reg [7:0] in_LSU_ACCESS_WIDTH_string;
  reg [7:0] out_LSU_ACCESS_WIDTH_string;
  reg [7:0] reg_LSU_ACCESS_WIDTH_string;
  reg [7:0] _zz_reg_LSU_ACCESS_WIDTH_string;
  reg [7:0] _zz_reg_LSU_ACCESS_WIDTH_1_string;
  reg [31:0] in_RS1_TYPE_string;
  reg [31:0] out_RS1_TYPE_string;
  reg [31:0] reg_RS1_TYPE_string;
  reg [31:0] _zz_reg_RS1_TYPE_string;
  reg [31:0] _zz_reg_RS1_TYPE_1_string;
  reg [23:0] in_ALU_SRC2_string;
  reg [23:0] out_ALU_SRC2_string;
  reg [23:0] reg_ALU_SRC2_string;
  reg [23:0] _zz_reg_ALU_SRC2_string;
  reg [23:0] _zz_reg_ALU_SRC2_1_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(in_BU_CONDITION)
      BranchCondition_NONE : in_BU_CONDITION_string = "NONE";
      BranchCondition_EQ : in_BU_CONDITION_string = "EQ  ";
      BranchCondition_NE : in_BU_CONDITION_string = "NE  ";
      BranchCondition_LT : in_BU_CONDITION_string = "LT  ";
      BranchCondition_GE : in_BU_CONDITION_string = "GE  ";
      BranchCondition_LTU : in_BU_CONDITION_string = "LTU ";
      BranchCondition_GEU : in_BU_CONDITION_string = "GEU ";
      default : in_BU_CONDITION_string = "????";
    endcase
  end
  always @(*) begin
    case(out_BU_CONDITION)
      BranchCondition_NONE : out_BU_CONDITION_string = "NONE";
      BranchCondition_EQ : out_BU_CONDITION_string = "EQ  ";
      BranchCondition_NE : out_BU_CONDITION_string = "NE  ";
      BranchCondition_LT : out_BU_CONDITION_string = "LT  ";
      BranchCondition_GE : out_BU_CONDITION_string = "GE  ";
      BranchCondition_LTU : out_BU_CONDITION_string = "LTU ";
      BranchCondition_GEU : out_BU_CONDITION_string = "GEU ";
      default : out_BU_CONDITION_string = "????";
    endcase
  end
  always @(*) begin
    case(reg_BU_CONDITION)
      BranchCondition_NONE : reg_BU_CONDITION_string = "NONE";
      BranchCondition_EQ : reg_BU_CONDITION_string = "EQ  ";
      BranchCondition_NE : reg_BU_CONDITION_string = "NE  ";
      BranchCondition_LT : reg_BU_CONDITION_string = "LT  ";
      BranchCondition_GE : reg_BU_CONDITION_string = "GE  ";
      BranchCondition_LTU : reg_BU_CONDITION_string = "LTU ";
      BranchCondition_GEU : reg_BU_CONDITION_string = "GEU ";
      default : reg_BU_CONDITION_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_BU_CONDITION)
      BranchCondition_NONE : _zz_reg_BU_CONDITION_string = "NONE";
      BranchCondition_EQ : _zz_reg_BU_CONDITION_string = "EQ  ";
      BranchCondition_NE : _zz_reg_BU_CONDITION_string = "NE  ";
      BranchCondition_LT : _zz_reg_BU_CONDITION_string = "LT  ";
      BranchCondition_GE : _zz_reg_BU_CONDITION_string = "GE  ";
      BranchCondition_LTU : _zz_reg_BU_CONDITION_string = "LTU ";
      BranchCondition_GEU : _zz_reg_BU_CONDITION_string = "GEU ";
      default : _zz_reg_BU_CONDITION_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_BU_CONDITION_1)
      BranchCondition_NONE : _zz_reg_BU_CONDITION_1_string = "NONE";
      BranchCondition_EQ : _zz_reg_BU_CONDITION_1_string = "EQ  ";
      BranchCondition_NE : _zz_reg_BU_CONDITION_1_string = "NE  ";
      BranchCondition_LT : _zz_reg_BU_CONDITION_1_string = "LT  ";
      BranchCondition_GE : _zz_reg_BU_CONDITION_1_string = "GE  ";
      BranchCondition_LTU : _zz_reg_BU_CONDITION_1_string = "LTU ";
      BranchCondition_GEU : _zz_reg_BU_CONDITION_1_string = "GEU ";
      default : _zz_reg_BU_CONDITION_1_string = "????";
    endcase
  end
  always @(*) begin
    case(in_SHIFT_OP)
      ShiftOp_NONE : in_SHIFT_OP_string = "NONE ";
      ShiftOp_SLL_1 : in_SHIFT_OP_string = "SLL_1";
      ShiftOp_SRL_1 : in_SHIFT_OP_string = "SRL_1";
      ShiftOp_SRA_1 : in_SHIFT_OP_string = "SRA_1";
      default : in_SHIFT_OP_string = "?????";
    endcase
  end
  always @(*) begin
    case(out_SHIFT_OP)
      ShiftOp_NONE : out_SHIFT_OP_string = "NONE ";
      ShiftOp_SLL_1 : out_SHIFT_OP_string = "SLL_1";
      ShiftOp_SRL_1 : out_SHIFT_OP_string = "SRL_1";
      ShiftOp_SRA_1 : out_SHIFT_OP_string = "SRA_1";
      default : out_SHIFT_OP_string = "?????";
    endcase
  end
  always @(*) begin
    case(reg_SHIFT_OP)
      ShiftOp_NONE : reg_SHIFT_OP_string = "NONE ";
      ShiftOp_SLL_1 : reg_SHIFT_OP_string = "SLL_1";
      ShiftOp_SRL_1 : reg_SHIFT_OP_string = "SRL_1";
      ShiftOp_SRA_1 : reg_SHIFT_OP_string = "SRA_1";
      default : reg_SHIFT_OP_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_SHIFT_OP)
      ShiftOp_NONE : _zz_reg_SHIFT_OP_string = "NONE ";
      ShiftOp_SLL_1 : _zz_reg_SHIFT_OP_string = "SLL_1";
      ShiftOp_SRL_1 : _zz_reg_SHIFT_OP_string = "SRL_1";
      ShiftOp_SRA_1 : _zz_reg_SHIFT_OP_string = "SRA_1";
      default : _zz_reg_SHIFT_OP_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_SHIFT_OP_1)
      ShiftOp_NONE : _zz_reg_SHIFT_OP_1_string = "NONE ";
      ShiftOp_SLL_1 : _zz_reg_SHIFT_OP_1_string = "SLL_1";
      ShiftOp_SRL_1 : _zz_reg_SHIFT_OP_1_string = "SRL_1";
      ShiftOp_SRA_1 : _zz_reg_SHIFT_OP_1_string = "SRA_1";
      default : _zz_reg_SHIFT_OP_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(in_RD_TYPE)
      RegisterType_NONE : in_RD_TYPE_string = "NONE";
      RegisterType_GPR : in_RD_TYPE_string = "GPR ";
      default : in_RD_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(out_RD_TYPE)
      RegisterType_NONE : out_RD_TYPE_string = "NONE";
      RegisterType_GPR : out_RD_TYPE_string = "GPR ";
      default : out_RD_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(reg_RD_TYPE)
      RegisterType_NONE : reg_RD_TYPE_string = "NONE";
      RegisterType_GPR : reg_RD_TYPE_string = "GPR ";
      default : reg_RD_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_RD_TYPE)
      RegisterType_NONE : _zz_reg_RD_TYPE_string = "NONE";
      RegisterType_GPR : _zz_reg_RD_TYPE_string = "GPR ";
      default : _zz_reg_RD_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_RD_TYPE_1)
      RegisterType_NONE : _zz_reg_RD_TYPE_1_string = "NONE";
      RegisterType_GPR : _zz_reg_RD_TYPE_1_string = "GPR ";
      default : _zz_reg_RD_TYPE_1_string = "????";
    endcase
  end
  always @(*) begin
    case(in_RS2_TYPE)
      RegisterType_NONE : in_RS2_TYPE_string = "NONE";
      RegisterType_GPR : in_RS2_TYPE_string = "GPR ";
      default : in_RS2_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(out_RS2_TYPE)
      RegisterType_NONE : out_RS2_TYPE_string = "NONE";
      RegisterType_GPR : out_RS2_TYPE_string = "GPR ";
      default : out_RS2_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(reg_RS2_TYPE)
      RegisterType_NONE : reg_RS2_TYPE_string = "NONE";
      RegisterType_GPR : reg_RS2_TYPE_string = "GPR ";
      default : reg_RS2_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_RS2_TYPE)
      RegisterType_NONE : _zz_reg_RS2_TYPE_string = "NONE";
      RegisterType_GPR : _zz_reg_RS2_TYPE_string = "GPR ";
      default : _zz_reg_RS2_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_RS2_TYPE_1)
      RegisterType_NONE : _zz_reg_RS2_TYPE_1_string = "NONE";
      RegisterType_GPR : _zz_reg_RS2_TYPE_1_string = "GPR ";
      default : _zz_reg_RS2_TYPE_1_string = "????";
    endcase
  end
  always @(*) begin
    case(in_LSU_OPERATION_TYPE)
      LsuOperationType_NONE : in_LSU_OPERATION_TYPE_string = "NONE ";
      LsuOperationType_LOAD : in_LSU_OPERATION_TYPE_string = "LOAD ";
      LsuOperationType_STORE : in_LSU_OPERATION_TYPE_string = "STORE";
      default : in_LSU_OPERATION_TYPE_string = "?????";
    endcase
  end
  always @(*) begin
    case(out_LSU_OPERATION_TYPE)
      LsuOperationType_NONE : out_LSU_OPERATION_TYPE_string = "NONE ";
      LsuOperationType_LOAD : out_LSU_OPERATION_TYPE_string = "LOAD ";
      LsuOperationType_STORE : out_LSU_OPERATION_TYPE_string = "STORE";
      default : out_LSU_OPERATION_TYPE_string = "?????";
    endcase
  end
  always @(*) begin
    case(reg_LSU_OPERATION_TYPE)
      LsuOperationType_NONE : reg_LSU_OPERATION_TYPE_string = "NONE ";
      LsuOperationType_LOAD : reg_LSU_OPERATION_TYPE_string = "LOAD ";
      LsuOperationType_STORE : reg_LSU_OPERATION_TYPE_string = "STORE";
      default : reg_LSU_OPERATION_TYPE_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_LSU_OPERATION_TYPE)
      LsuOperationType_NONE : _zz_reg_LSU_OPERATION_TYPE_string = "NONE ";
      LsuOperationType_LOAD : _zz_reg_LSU_OPERATION_TYPE_string = "LOAD ";
      LsuOperationType_STORE : _zz_reg_LSU_OPERATION_TYPE_string = "STORE";
      default : _zz_reg_LSU_OPERATION_TYPE_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_LSU_OPERATION_TYPE_1)
      LsuOperationType_NONE : _zz_reg_LSU_OPERATION_TYPE_1_string = "NONE ";
      LsuOperationType_LOAD : _zz_reg_LSU_OPERATION_TYPE_1_string = "LOAD ";
      LsuOperationType_STORE : _zz_reg_LSU_OPERATION_TYPE_1_string = "STORE";
      default : _zz_reg_LSU_OPERATION_TYPE_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(in_ALU_OP)
      AluOp_ADD : in_ALU_OP_string = "ADD  ";
      AluOp_SUB : in_ALU_OP_string = "SUB  ";
      AluOp_SLT : in_ALU_OP_string = "SLT  ";
      AluOp_SLTU : in_ALU_OP_string = "SLTU ";
      AluOp_XOR_1 : in_ALU_OP_string = "XOR_1";
      AluOp_OR_1 : in_ALU_OP_string = "OR_1 ";
      AluOp_AND_1 : in_ALU_OP_string = "AND_1";
      AluOp_SRC2 : in_ALU_OP_string = "SRC2 ";
      default : in_ALU_OP_string = "?????";
    endcase
  end
  always @(*) begin
    case(out_ALU_OP)
      AluOp_ADD : out_ALU_OP_string = "ADD  ";
      AluOp_SUB : out_ALU_OP_string = "SUB  ";
      AluOp_SLT : out_ALU_OP_string = "SLT  ";
      AluOp_SLTU : out_ALU_OP_string = "SLTU ";
      AluOp_XOR_1 : out_ALU_OP_string = "XOR_1";
      AluOp_OR_1 : out_ALU_OP_string = "OR_1 ";
      AluOp_AND_1 : out_ALU_OP_string = "AND_1";
      AluOp_SRC2 : out_ALU_OP_string = "SRC2 ";
      default : out_ALU_OP_string = "?????";
    endcase
  end
  always @(*) begin
    case(reg_ALU_OP)
      AluOp_ADD : reg_ALU_OP_string = "ADD  ";
      AluOp_SUB : reg_ALU_OP_string = "SUB  ";
      AluOp_SLT : reg_ALU_OP_string = "SLT  ";
      AluOp_SLTU : reg_ALU_OP_string = "SLTU ";
      AluOp_XOR_1 : reg_ALU_OP_string = "XOR_1";
      AluOp_OR_1 : reg_ALU_OP_string = "OR_1 ";
      AluOp_AND_1 : reg_ALU_OP_string = "AND_1";
      AluOp_SRC2 : reg_ALU_OP_string = "SRC2 ";
      default : reg_ALU_OP_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_ALU_OP)
      AluOp_ADD : _zz_reg_ALU_OP_string = "ADD  ";
      AluOp_SUB : _zz_reg_ALU_OP_string = "SUB  ";
      AluOp_SLT : _zz_reg_ALU_OP_string = "SLT  ";
      AluOp_SLTU : _zz_reg_ALU_OP_string = "SLTU ";
      AluOp_XOR_1 : _zz_reg_ALU_OP_string = "XOR_1";
      AluOp_OR_1 : _zz_reg_ALU_OP_string = "OR_1 ";
      AluOp_AND_1 : _zz_reg_ALU_OP_string = "AND_1";
      AluOp_SRC2 : _zz_reg_ALU_OP_string = "SRC2 ";
      default : _zz_reg_ALU_OP_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_ALU_OP_1)
      AluOp_ADD : _zz_reg_ALU_OP_1_string = "ADD  ";
      AluOp_SUB : _zz_reg_ALU_OP_1_string = "SUB  ";
      AluOp_SLT : _zz_reg_ALU_OP_1_string = "SLT  ";
      AluOp_SLTU : _zz_reg_ALU_OP_1_string = "SLTU ";
      AluOp_XOR_1 : _zz_reg_ALU_OP_1_string = "XOR_1";
      AluOp_OR_1 : _zz_reg_ALU_OP_1_string = "OR_1 ";
      AluOp_AND_1 : _zz_reg_ALU_OP_1_string = "AND_1";
      AluOp_SRC2 : _zz_reg_ALU_OP_1_string = "SRC2 ";
      default : _zz_reg_ALU_OP_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(in_CSR_OP)
      CsrOp_NONE : in_CSR_OP_string = "NONE";
      CsrOp_RW : in_CSR_OP_string = "RW  ";
      CsrOp_RS : in_CSR_OP_string = "RS  ";
      CsrOp_RC : in_CSR_OP_string = "RC  ";
      default : in_CSR_OP_string = "????";
    endcase
  end
  always @(*) begin
    case(out_CSR_OP)
      CsrOp_NONE : out_CSR_OP_string = "NONE";
      CsrOp_RW : out_CSR_OP_string = "RW  ";
      CsrOp_RS : out_CSR_OP_string = "RS  ";
      CsrOp_RC : out_CSR_OP_string = "RC  ";
      default : out_CSR_OP_string = "????";
    endcase
  end
  always @(*) begin
    case(reg_CSR_OP)
      CsrOp_NONE : reg_CSR_OP_string = "NONE";
      CsrOp_RW : reg_CSR_OP_string = "RW  ";
      CsrOp_RS : reg_CSR_OP_string = "RS  ";
      CsrOp_RC : reg_CSR_OP_string = "RC  ";
      default : reg_CSR_OP_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_CSR_OP)
      CsrOp_NONE : _zz_reg_CSR_OP_string = "NONE";
      CsrOp_RW : _zz_reg_CSR_OP_string = "RW  ";
      CsrOp_RS : _zz_reg_CSR_OP_string = "RS  ";
      CsrOp_RC : _zz_reg_CSR_OP_string = "RC  ";
      default : _zz_reg_CSR_OP_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_CSR_OP_1)
      CsrOp_NONE : _zz_reg_CSR_OP_1_string = "NONE";
      CsrOp_RW : _zz_reg_CSR_OP_1_string = "RW  ";
      CsrOp_RS : _zz_reg_CSR_OP_1_string = "RS  ";
      CsrOp_RC : _zz_reg_CSR_OP_1_string = "RC  ";
      default : _zz_reg_CSR_OP_1_string = "????";
    endcase
  end
  always @(*) begin
    case(in_ALU_SRC1)
      Src1Select_RS1 : in_ALU_SRC1_string = "RS1";
      Src1Select_PC : in_ALU_SRC1_string = "PC ";
      default : in_ALU_SRC1_string = "???";
    endcase
  end
  always @(*) begin
    case(out_ALU_SRC1)
      Src1Select_RS1 : out_ALU_SRC1_string = "RS1";
      Src1Select_PC : out_ALU_SRC1_string = "PC ";
      default : out_ALU_SRC1_string = "???";
    endcase
  end
  always @(*) begin
    case(reg_ALU_SRC1)
      Src1Select_RS1 : reg_ALU_SRC1_string = "RS1";
      Src1Select_PC : reg_ALU_SRC1_string = "PC ";
      default : reg_ALU_SRC1_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_reg_ALU_SRC1)
      Src1Select_RS1 : _zz_reg_ALU_SRC1_string = "RS1";
      Src1Select_PC : _zz_reg_ALU_SRC1_string = "PC ";
      default : _zz_reg_ALU_SRC1_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_reg_ALU_SRC1_1)
      Src1Select_RS1 : _zz_reg_ALU_SRC1_1_string = "RS1";
      Src1Select_PC : _zz_reg_ALU_SRC1_1_string = "PC ";
      default : _zz_reg_ALU_SRC1_1_string = "???";
    endcase
  end
  always @(*) begin
    case(in_LSU_ACCESS_WIDTH)
      LsuAccessWidth_B : in_LSU_ACCESS_WIDTH_string = "B";
      LsuAccessWidth_H : in_LSU_ACCESS_WIDTH_string = "H";
      LsuAccessWidth_W : in_LSU_ACCESS_WIDTH_string = "W";
      default : in_LSU_ACCESS_WIDTH_string = "?";
    endcase
  end
  always @(*) begin
    case(out_LSU_ACCESS_WIDTH)
      LsuAccessWidth_B : out_LSU_ACCESS_WIDTH_string = "B";
      LsuAccessWidth_H : out_LSU_ACCESS_WIDTH_string = "H";
      LsuAccessWidth_W : out_LSU_ACCESS_WIDTH_string = "W";
      default : out_LSU_ACCESS_WIDTH_string = "?";
    endcase
  end
  always @(*) begin
    case(reg_LSU_ACCESS_WIDTH)
      LsuAccessWidth_B : reg_LSU_ACCESS_WIDTH_string = "B";
      LsuAccessWidth_H : reg_LSU_ACCESS_WIDTH_string = "H";
      LsuAccessWidth_W : reg_LSU_ACCESS_WIDTH_string = "W";
      default : reg_LSU_ACCESS_WIDTH_string = "?";
    endcase
  end
  always @(*) begin
    case(_zz_reg_LSU_ACCESS_WIDTH)
      LsuAccessWidth_B : _zz_reg_LSU_ACCESS_WIDTH_string = "B";
      LsuAccessWidth_H : _zz_reg_LSU_ACCESS_WIDTH_string = "H";
      LsuAccessWidth_W : _zz_reg_LSU_ACCESS_WIDTH_string = "W";
      default : _zz_reg_LSU_ACCESS_WIDTH_string = "?";
    endcase
  end
  always @(*) begin
    case(_zz_reg_LSU_ACCESS_WIDTH_1)
      LsuAccessWidth_B : _zz_reg_LSU_ACCESS_WIDTH_1_string = "B";
      LsuAccessWidth_H : _zz_reg_LSU_ACCESS_WIDTH_1_string = "H";
      LsuAccessWidth_W : _zz_reg_LSU_ACCESS_WIDTH_1_string = "W";
      default : _zz_reg_LSU_ACCESS_WIDTH_1_string = "?";
    endcase
  end
  always @(*) begin
    case(in_RS1_TYPE)
      RegisterType_NONE : in_RS1_TYPE_string = "NONE";
      RegisterType_GPR : in_RS1_TYPE_string = "GPR ";
      default : in_RS1_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(out_RS1_TYPE)
      RegisterType_NONE : out_RS1_TYPE_string = "NONE";
      RegisterType_GPR : out_RS1_TYPE_string = "GPR ";
      default : out_RS1_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(reg_RS1_TYPE)
      RegisterType_NONE : reg_RS1_TYPE_string = "NONE";
      RegisterType_GPR : reg_RS1_TYPE_string = "GPR ";
      default : reg_RS1_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_RS1_TYPE)
      RegisterType_NONE : _zz_reg_RS1_TYPE_string = "NONE";
      RegisterType_GPR : _zz_reg_RS1_TYPE_string = "GPR ";
      default : _zz_reg_RS1_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_reg_RS1_TYPE_1)
      RegisterType_NONE : _zz_reg_RS1_TYPE_1_string = "NONE";
      RegisterType_GPR : _zz_reg_RS1_TYPE_1_string = "GPR ";
      default : _zz_reg_RS1_TYPE_1_string = "????";
    endcase
  end
  always @(*) begin
    case(in_ALU_SRC2)
      Src2Select_RS2 : in_ALU_SRC2_string = "RS2";
      Src2Select_IMM : in_ALU_SRC2_string = "IMM";
      default : in_ALU_SRC2_string = "???";
    endcase
  end
  always @(*) begin
    case(out_ALU_SRC2)
      Src2Select_RS2 : out_ALU_SRC2_string = "RS2";
      Src2Select_IMM : out_ALU_SRC2_string = "IMM";
      default : out_ALU_SRC2_string = "???";
    endcase
  end
  always @(*) begin
    case(reg_ALU_SRC2)
      Src2Select_RS2 : reg_ALU_SRC2_string = "RS2";
      Src2Select_IMM : reg_ALU_SRC2_string = "IMM";
      default : reg_ALU_SRC2_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_reg_ALU_SRC2)
      Src2Select_RS2 : _zz_reg_ALU_SRC2_string = "RS2";
      Src2Select_IMM : _zz_reg_ALU_SRC2_string = "IMM";
      default : _zz_reg_ALU_SRC2_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_reg_ALU_SRC2_1)
      Src2Select_RS2 : _zz_reg_ALU_SRC2_1_string = "RS2";
      Src2Select_IMM : _zz_reg_ALU_SRC2_1_string = "IMM";
      default : _zz_reg_ALU_SRC2_1_string = "???";
    endcase
  end
  `endif

  assign when_PipelineRegs_l19 = (shift || shift_BU_CONDITION);
  assign _zz_reg_BU_CONDITION_1 = 3'b000;
  assign _zz_reg_BU_CONDITION = _zz_reg_BU_CONDITION_1;
  assign out_BU_CONDITION = reg_BU_CONDITION;
  assign when_PipelineRegs_l19_1 = (shift || shift_SHIFT_OP);
  assign _zz_reg_SHIFT_OP_1 = 2'b00;
  assign _zz_reg_SHIFT_OP = _zz_reg_SHIFT_OP_1;
  assign out_SHIFT_OP = reg_SHIFT_OP;
  assign when_PipelineRegs_l19_2 = (shift || shift_MUL);
  assign out_MUL = reg_MUL;
  assign when_PipelineRegs_l19_3 = (shift || shift_EBREAK);
  assign out_EBREAK = reg_EBREAK;
  assign when_PipelineRegs_l19_4 = (shift || shift_RD_TYPE);
  assign _zz_reg_RD_TYPE_1 = 1'b0;
  assign _zz_reg_RD_TYPE = _zz_reg_RD_TYPE_1;
  assign out_RD_TYPE = reg_RD_TYPE;
  assign when_PipelineRegs_l19_5 = (shift || shift_TRAP_IS_INTERRUPT);
  assign out_TRAP_IS_INTERRUPT = reg_TRAP_IS_INTERRUPT;
  assign when_PipelineRegs_l19_6 = (shift || shift_RS2_TYPE);
  assign _zz_reg_RS2_TYPE_1 = 1'b0;
  assign _zz_reg_RS2_TYPE = _zz_reg_RS2_TYPE_1;
  assign out_RS2_TYPE = reg_RS2_TYPE;
  assign when_PipelineRegs_l19_7 = (shift || shift_RS2);
  assign out_RS2 = reg_RS2;
  assign when_PipelineRegs_l19_8 = (shift || shift_IR);
  assign out_IR = reg_IR;
  assign when_PipelineRegs_l19_9 = (shift || shift_RS1_DATA);
  assign out_RS1_DATA = reg_RS1_DATA;
  assign when_PipelineRegs_l19_10 = (shift || shift_RS1);
  assign out_RS1 = reg_RS1;
  assign when_PipelineRegs_l19_11 = (shift || shift_IMM_USED);
  assign out_IMM_USED = reg_IMM_USED;
  assign when_PipelineRegs_l19_12 = (shift || shift_LSU_OPERATION_TYPE);
  assign _zz_reg_LSU_OPERATION_TYPE_1 = 2'b00;
  assign _zz_reg_LSU_OPERATION_TYPE = _zz_reg_LSU_OPERATION_TYPE_1;
  assign out_LSU_OPERATION_TYPE = reg_LSU_OPERATION_TYPE;
  assign when_PipelineRegs_l19_13 = (shift || shift_BU_IS_BRANCH);
  assign out_BU_IS_BRANCH = reg_BU_IS_BRANCH;
  assign when_PipelineRegs_l19_14 = (shift || shift_ALU_OP);
  assign _zz_reg_ALU_OP_1 = 3'b000;
  assign _zz_reg_ALU_OP = _zz_reg_ALU_OP_1;
  assign out_ALU_OP = reg_ALU_OP;
  assign when_PipelineRegs_l19_15 = (shift || shift_REM);
  assign out_REM = reg_REM;
  assign when_PipelineRegs_l19_16 = (shift || shift_ALU_COMMIT_RESULT);
  assign out_ALU_COMMIT_RESULT = reg_ALU_COMMIT_RESULT;
  assign when_PipelineRegs_l19_17 = (shift || shift_TRAP_VAL);
  assign out_TRAP_VAL = reg_TRAP_VAL;
  assign when_PipelineRegs_l19_18 = (shift || shift_BU_WRITE_RET_ADDR_TO_RD);
  assign out_BU_WRITE_RET_ADDR_TO_RD = reg_BU_WRITE_RET_ADDR_TO_RD;
  assign when_PipelineRegs_l19_19 = (shift || shift_PC);
  assign out_PC = reg_PC;
  assign when_PipelineRegs_l19_20 = (shift || shift_HAS_TRAPPED);
  assign out_HAS_TRAPPED = reg_HAS_TRAPPED;
  assign when_PipelineRegs_l19_21 = (shift || shift_ECALL);
  assign out_ECALL = reg_ECALL;
  assign when_PipelineRegs_l19_22 = (shift || shift_TRAP_CAUSE);
  assign out_TRAP_CAUSE = reg_TRAP_CAUSE;
  assign when_PipelineRegs_l19_23 = (shift || shift_LSU_IS_UNSIGNED);
  assign out_LSU_IS_UNSIGNED = reg_LSU_IS_UNSIGNED;
  assign when_PipelineRegs_l19_24 = (shift || shift_CSR_OP);
  assign _zz_reg_CSR_OP_1 = 2'b00;
  assign _zz_reg_CSR_OP = _zz_reg_CSR_OP_1;
  assign out_CSR_OP = reg_CSR_OP;
  assign when_PipelineRegs_l19_25 = (shift || shift_RS2_DATA);
  assign out_RS2_DATA = reg_RS2_DATA;
  assign when_PipelineRegs_l19_26 = (shift || shift_ALU_SRC1);
  assign _zz_reg_ALU_SRC1_1 = 1'b0;
  assign _zz_reg_ALU_SRC1 = _zz_reg_ALU_SRC1_1;
  assign out_ALU_SRC1 = reg_ALU_SRC1;
  assign when_PipelineRegs_l19_27 = (shift || shift_RD);
  assign out_RD = reg_RD;
  assign when_PipelineRegs_l19_28 = (shift || shift_MUL_HIGH);
  assign out_MUL_HIGH = reg_MUL_HIGH;
  assign when_PipelineRegs_l19_29 = (shift || shift_CSR_USE_IMM);
  assign out_CSR_USE_IMM = reg_CSR_USE_IMM;
  assign when_PipelineRegs_l19_30 = (shift || shift_BU_IGNORE_TARGET_LSB);
  assign out_BU_IGNORE_TARGET_LSB = reg_BU_IGNORE_TARGET_LSB;
  assign when_PipelineRegs_l19_31 = (shift || shift_RD_DATA_VALID);
  assign out_RD_DATA_VALID = reg_RD_DATA_VALID;
  assign when_PipelineRegs_l19_32 = (shift || shift_DIV);
  assign out_DIV = reg_DIV;
  assign when_PipelineRegs_l19_33 = (shift || shift_MRET);
  assign out_MRET = reg_MRET;
  assign when_PipelineRegs_l19_34 = (shift || shift_LSU_ACCESS_WIDTH);
  assign _zz_reg_LSU_ACCESS_WIDTH_1 = 2'b00;
  assign _zz_reg_LSU_ACCESS_WIDTH = _zz_reg_LSU_ACCESS_WIDTH_1;
  assign out_LSU_ACCESS_WIDTH = reg_LSU_ACCESS_WIDTH;
  assign when_PipelineRegs_l19_35 = (shift || shift_NEXT_PC);
  assign out_NEXT_PC = reg_NEXT_PC;
  assign when_PipelineRegs_l19_36 = (shift || shift_RS1_TYPE);
  assign _zz_reg_RS1_TYPE_1 = 1'b0;
  assign _zz_reg_RS1_TYPE = _zz_reg_RS1_TYPE_1;
  assign out_RS1_TYPE = reg_RS1_TYPE;
  assign when_PipelineRegs_l19_37 = (shift || shift_IMM);
  assign out_IMM = reg_IMM;
  assign when_PipelineRegs_l19_38 = (shift || shift_ALU_SRC2);
  assign _zz_reg_ALU_SRC2_1 = 1'b0;
  assign _zz_reg_ALU_SRC2 = _zz_reg_ALU_SRC2_1;
  assign out_ALU_SRC2 = reg_ALU_SRC2;
  assign when_PipelineRegs_l19_39 = (shift || shift_MULDIV_RS2_SIGNED);
  assign out_MULDIV_RS2_SIGNED = reg_MULDIV_RS2_SIGNED;
  assign when_PipelineRegs_l19_40 = (shift || shift_LSU_TARGET_VALID);
  assign out_LSU_TARGET_VALID = reg_LSU_TARGET_VALID;
  assign when_PipelineRegs_l19_41 = (shift || shift_MULDIV_RS1_SIGNED);
  assign out_MULDIV_RS1_SIGNED = reg_MULDIV_RS1_SIGNED;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      reg_BU_CONDITION <= _zz_reg_BU_CONDITION;
      reg_SHIFT_OP <= _zz_reg_SHIFT_OP;
      reg_MUL <= 1'b0;
      reg_EBREAK <= 1'b0;
      reg_RD_TYPE <= _zz_reg_RD_TYPE;
      reg_TRAP_IS_INTERRUPT <= 1'b0;
      reg_RS2_TYPE <= _zz_reg_RS2_TYPE;
      reg_RS2 <= 5'h0;
      reg_IR <= 32'h0;
      reg_RS1_DATA <= 32'h0;
      reg_RS1 <= 5'h0;
      reg_IMM_USED <= 1'b0;
      reg_LSU_OPERATION_TYPE <= _zz_reg_LSU_OPERATION_TYPE;
      reg_BU_IS_BRANCH <= 1'b0;
      reg_ALU_OP <= _zz_reg_ALU_OP;
      reg_REM <= 1'b0;
      reg_ALU_COMMIT_RESULT <= 1'b0;
      reg_TRAP_VAL <= 32'h0;
      reg_BU_WRITE_RET_ADDR_TO_RD <= 1'b0;
      reg_PC <= 32'h0;
      reg_HAS_TRAPPED <= 1'b0;
      reg_ECALL <= 1'b0;
      reg_TRAP_CAUSE <= 4'b0000;
      reg_LSU_IS_UNSIGNED <= 1'b0;
      reg_CSR_OP <= _zz_reg_CSR_OP;
      reg_RS2_DATA <= 32'h0;
      reg_ALU_SRC1 <= _zz_reg_ALU_SRC1;
      reg_RD <= 5'h0;
      reg_MUL_HIGH <= 1'b0;
      reg_CSR_USE_IMM <= 1'b0;
      reg_BU_IGNORE_TARGET_LSB <= 1'b0;
      reg_RD_DATA_VALID <= 1'b0;
      reg_DIV <= 1'b0;
      reg_MRET <= 1'b0;
      reg_LSU_ACCESS_WIDTH <= _zz_reg_LSU_ACCESS_WIDTH;
      reg_NEXT_PC <= 32'h0;
      reg_RS1_TYPE <= _zz_reg_RS1_TYPE;
      reg_IMM <= 32'h0;
      reg_ALU_SRC2 <= _zz_reg_ALU_SRC2;
      reg_MULDIV_RS2_SIGNED <= 1'b0;
      reg_LSU_TARGET_VALID <= 1'b0;
      reg_MULDIV_RS1_SIGNED <= 1'b0;
    end else begin
      if(when_PipelineRegs_l19) begin
        reg_BU_CONDITION <= in_BU_CONDITION;
      end
      if(when_PipelineRegs_l19_1) begin
        reg_SHIFT_OP <= in_SHIFT_OP;
      end
      if(when_PipelineRegs_l19_2) begin
        reg_MUL <= in_MUL;
      end
      if(when_PipelineRegs_l19_3) begin
        reg_EBREAK <= in_EBREAK;
      end
      if(when_PipelineRegs_l19_4) begin
        reg_RD_TYPE <= in_RD_TYPE;
      end
      if(when_PipelineRegs_l19_5) begin
        reg_TRAP_IS_INTERRUPT <= in_TRAP_IS_INTERRUPT;
      end
      if(when_PipelineRegs_l19_6) begin
        reg_RS2_TYPE <= in_RS2_TYPE;
      end
      if(when_PipelineRegs_l19_7) begin
        reg_RS2 <= in_RS2;
      end
      if(when_PipelineRegs_l19_8) begin
        reg_IR <= in_IR;
      end
      if(when_PipelineRegs_l19_9) begin
        reg_RS1_DATA <= in_RS1_DATA;
      end
      if(when_PipelineRegs_l19_10) begin
        reg_RS1 <= in_RS1;
      end
      if(when_PipelineRegs_l19_11) begin
        reg_IMM_USED <= in_IMM_USED;
      end
      if(when_PipelineRegs_l19_12) begin
        reg_LSU_OPERATION_TYPE <= in_LSU_OPERATION_TYPE;
      end
      if(when_PipelineRegs_l19_13) begin
        reg_BU_IS_BRANCH <= in_BU_IS_BRANCH;
      end
      if(when_PipelineRegs_l19_14) begin
        reg_ALU_OP <= in_ALU_OP;
      end
      if(when_PipelineRegs_l19_15) begin
        reg_REM <= in_REM;
      end
      if(when_PipelineRegs_l19_16) begin
        reg_ALU_COMMIT_RESULT <= in_ALU_COMMIT_RESULT;
      end
      if(when_PipelineRegs_l19_17) begin
        reg_TRAP_VAL <= in_TRAP_VAL;
      end
      if(when_PipelineRegs_l19_18) begin
        reg_BU_WRITE_RET_ADDR_TO_RD <= in_BU_WRITE_RET_ADDR_TO_RD;
      end
      if(when_PipelineRegs_l19_19) begin
        reg_PC <= in_PC;
      end
      if(when_PipelineRegs_l19_20) begin
        reg_HAS_TRAPPED <= in_HAS_TRAPPED;
      end
      if(when_PipelineRegs_l19_21) begin
        reg_ECALL <= in_ECALL;
      end
      if(when_PipelineRegs_l19_22) begin
        reg_TRAP_CAUSE <= in_TRAP_CAUSE;
      end
      if(when_PipelineRegs_l19_23) begin
        reg_LSU_IS_UNSIGNED <= in_LSU_IS_UNSIGNED;
      end
      if(when_PipelineRegs_l19_24) begin
        reg_CSR_OP <= in_CSR_OP;
      end
      if(when_PipelineRegs_l19_25) begin
        reg_RS2_DATA <= in_RS2_DATA;
      end
      if(when_PipelineRegs_l19_26) begin
        reg_ALU_SRC1 <= in_ALU_SRC1;
      end
      if(when_PipelineRegs_l19_27) begin
        reg_RD <= in_RD;
      end
      if(when_PipelineRegs_l19_28) begin
        reg_MUL_HIGH <= in_MUL_HIGH;
      end
      if(when_PipelineRegs_l19_29) begin
        reg_CSR_USE_IMM <= in_CSR_USE_IMM;
      end
      if(when_PipelineRegs_l19_30) begin
        reg_BU_IGNORE_TARGET_LSB <= in_BU_IGNORE_TARGET_LSB;
      end
      if(when_PipelineRegs_l19_31) begin
        reg_RD_DATA_VALID <= in_RD_DATA_VALID;
      end
      if(when_PipelineRegs_l19_32) begin
        reg_DIV <= in_DIV;
      end
      if(when_PipelineRegs_l19_33) begin
        reg_MRET <= in_MRET;
      end
      if(when_PipelineRegs_l19_34) begin
        reg_LSU_ACCESS_WIDTH <= in_LSU_ACCESS_WIDTH;
      end
      if(when_PipelineRegs_l19_35) begin
        reg_NEXT_PC <= in_NEXT_PC;
      end
      if(when_PipelineRegs_l19_36) begin
        reg_RS1_TYPE <= in_RS1_TYPE;
      end
      if(when_PipelineRegs_l19_37) begin
        reg_IMM <= in_IMM;
      end
      if(when_PipelineRegs_l19_38) begin
        reg_ALU_SRC2 <= in_ALU_SRC2;
      end
      if(when_PipelineRegs_l19_39) begin
        reg_MULDIV_RS2_SIGNED <= in_MULDIV_RS2_SIGNED;
      end
      if(when_PipelineRegs_l19_40) begin
        reg_LSU_TARGET_VALID <= in_LSU_TARGET_VALID;
      end
      if(when_PipelineRegs_l19_41) begin
        reg_MULDIV_RS1_SIGNED <= in_MULDIV_RS1_SIGNED;
      end
    end
  end


endmodule

module PipelineRegs_IF (
  input  wire          shift,
  input  wire          in_TRAP_IS_INTERRUPT,
  output wire          out_TRAP_IS_INTERRUPT,
  input  wire          shift_TRAP_IS_INTERRUPT,
  input  wire [31:0]   in_IR,
  output wire [31:0]   out_IR,
  input  wire          shift_IR,
  input  wire [31:0]   in_TRAP_VAL,
  output wire [31:0]   out_TRAP_VAL,
  input  wire          shift_TRAP_VAL,
  input  wire [31:0]   in_PC,
  output wire [31:0]   out_PC,
  input  wire          shift_PC,
  input  wire          in_HAS_TRAPPED,
  output wire          out_HAS_TRAPPED,
  input  wire          shift_HAS_TRAPPED,
  input  wire [3:0]    in_TRAP_CAUSE,
  output wire [3:0]    out_TRAP_CAUSE,
  input  wire          shift_TRAP_CAUSE,
  input  wire [31:0]   in_NEXT_PC,
  output wire [31:0]   out_NEXT_PC,
  input  wire          shift_NEXT_PC,
  input  wire          clk,
  input  wire          reset
);

  wire                when_PipelineRegs_l19;
  reg                 reg_TRAP_IS_INTERRUPT;
  wire                when_PipelineRegs_l19_1;
  reg        [31:0]   reg_IR;
  wire                when_PipelineRegs_l19_2;
  reg        [31:0]   reg_TRAP_VAL;
  wire                when_PipelineRegs_l19_3;
  reg        [31:0]   reg_PC;
  wire                when_PipelineRegs_l19_4;
  reg                 reg_HAS_TRAPPED;
  wire                when_PipelineRegs_l19_5;
  reg        [3:0]    reg_TRAP_CAUSE;
  wire                when_PipelineRegs_l19_6;
  reg        [31:0]   reg_NEXT_PC;

  assign when_PipelineRegs_l19 = (shift || shift_TRAP_IS_INTERRUPT);
  assign out_TRAP_IS_INTERRUPT = reg_TRAP_IS_INTERRUPT;
  assign when_PipelineRegs_l19_1 = (shift || shift_IR);
  assign out_IR = reg_IR;
  assign when_PipelineRegs_l19_2 = (shift || shift_TRAP_VAL);
  assign out_TRAP_VAL = reg_TRAP_VAL;
  assign when_PipelineRegs_l19_3 = (shift || shift_PC);
  assign out_PC = reg_PC;
  assign when_PipelineRegs_l19_4 = (shift || shift_HAS_TRAPPED);
  assign out_HAS_TRAPPED = reg_HAS_TRAPPED;
  assign when_PipelineRegs_l19_5 = (shift || shift_TRAP_CAUSE);
  assign out_TRAP_CAUSE = reg_TRAP_CAUSE;
  assign when_PipelineRegs_l19_6 = (shift || shift_NEXT_PC);
  assign out_NEXT_PC = reg_NEXT_PC;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      reg_TRAP_IS_INTERRUPT <= 1'b0;
      reg_IR <= 32'h0;
      reg_TRAP_VAL <= 32'h0;
      reg_PC <= 32'h0;
      reg_HAS_TRAPPED <= 1'b0;
      reg_TRAP_CAUSE <= 4'b0000;
      reg_NEXT_PC <= 32'h0;
    end else begin
      if(when_PipelineRegs_l19) begin
        reg_TRAP_IS_INTERRUPT <= in_TRAP_IS_INTERRUPT;
      end
      if(when_PipelineRegs_l19_1) begin
        reg_IR <= in_IR;
      end
      if(when_PipelineRegs_l19_2) begin
        reg_TRAP_VAL <= in_TRAP_VAL;
      end
      if(when_PipelineRegs_l19_3) begin
        reg_PC <= in_PC;
      end
      if(when_PipelineRegs_l19_4) begin
        reg_HAS_TRAPPED <= in_HAS_TRAPPED;
      end
      if(when_PipelineRegs_l19_5) begin
        reg_TRAP_CAUSE <= in_TRAP_CAUSE;
      end
      if(when_PipelineRegs_l19_6) begin
        reg_NEXT_PC <= in_NEXT_PC;
      end
    end
  end


endmodule

module Stage_WB (
  input  wire          arbitration_isValid,
  input  wire          arbitration_isStalled,
  output wire          arbitration_isReady,
  output wire          arbitration_isDone,
  output reg           arbitration_rs1Needed,
  output wire          arbitration_rs2Needed,
  output reg           arbitration_jumpRequested,
  output wire          arbitration_isAvailable,
  output wire [4:0]    out_RS1,
  output wire [0:0]    out_RS1_TYPE,
  output wire [4:0]    out_RS2,
  output wire [0:0]    out_RS2_TYPE,
  output reg           out_RD_DATA_VALID,
  output wire [4:0]    out_RD,
  output wire [0:0]    out_RD_TYPE,
  output wire [4:0]    RegisterFileAccessor_regFileIo_rd,
  output wire [31:0]   RegisterFileAccessor_regFileIo_data,
  output wire          RegisterFileAccessor_regFileIo_write,
  output reg           out_HAS_TRAPPED,
  output reg  [11:0]   CsrFile_csrIo_rid,
  output reg  [11:0]   CsrFile_csrIo_wid,
  input  wire [31:0]   CsrFile_csrIo_rdata,
  output reg  [31:0]   CsrFile_csrIo_wdata,
  output reg           CsrFile_csrIo_read,
  output reg           CsrFile_csrIo_write,
  input  wire          CsrFile_csrIo_error,
  output reg  [31:0]   out_RD_DATA,
  output reg           out_TRAP_IS_INTERRUPT,
  output reg  [3:0]    out_TRAP_CAUSE,
  output reg  [31:0]   out_TRAP_VAL,
  input  wire [31:0]   TrapHandler_mstatus_rdata,
  output reg  [31:0]   TrapHandler_mstatus_wdata,
  output reg           TrapHandler_mstatus_write,
  input  wire [31:0]   TrapHandler_mtvec_rdata,
  output wire [31:0]   TrapHandler_mtvec_wdata,
  output wire          TrapHandler_mtvec_write,
  input  wire [31:0]   TrapHandler_mcause_rdata,
  output reg  [31:0]   TrapHandler_mcause_wdata,
  output reg           TrapHandler_mcause_write,
  input  wire [31:0]   TrapHandler_mepc_rdata,
  output reg  [31:0]   TrapHandler_mepc_wdata,
  output reg           TrapHandler_mepc_write,
  input  wire [31:0]   TrapHandler_mtval_rdata,
  output reg  [31:0]   TrapHandler_mtval_wdata,
  output reg           TrapHandler_mtval_write,
  output reg  [31:0]   out_NEXT_PC,
  input  wire          Interrupts_mtimer_update,
  input  wire          Interrupts_mtimer_interruptPending,
  input  wire          Interrupts_external_update,
  input  wire          Interrupts_external_interruptPending,
  input  wire [31:0]   Interrupts_mstatus_rdata,
  output wire [31:0]   Interrupts_mstatus_wdata,
  output wire          Interrupts_mstatus_write,
  input  wire [31:0]   Interrupts_mie_rdata,
  output wire [31:0]   Interrupts_mie_wdata,
  output wire          Interrupts_mie_write,
  input  wire [31:0]   Interrupts_mip_rdata,
  output reg  [31:0]   Interrupts_mip_wdata,
  output reg           Interrupts_mip_write,
  output wire [31:0]   out_PC,
  output wire [31:0]   out_IR,
  input  wire [31:0]   in_RS1_DATA,
  input  wire [1:0]    in_CSR_OP,
  input  wire          in_CSR_USE_IMM,
  input  wire          in_MRET,
  input  wire [0:0]    in_RD_TYPE,
  input  wire          in_TRAP_IS_INTERRUPT,
  input  wire [0:0]    in_RS2_TYPE,
  input  wire [4:0]    in_RS2,
  input  wire [31:0]   in_IR,
  input  wire [4:0]    in_RS1,
  input  wire [31:0]   in_RD_DATA,
  input  wire [31:0]   in_TRAP_VAL,
  input  wire [31:0]   in_PC,
  input  wire          in_HAS_TRAPPED,
  input  wire [3:0]    in_TRAP_CAUSE,
  input  wire [4:0]    in_RD,
  input  wire          in_RD_DATA_VALID,
  input  wire [31:0]   in_NEXT_PC,
  input  wire [0:0]    in_RS1_TYPE
);
  localparam RegisterType_NONE = 1'd0;
  localparam RegisterType_GPR = 1'd1;
  localparam CsrOp_NONE = 2'd0;
  localparam CsrOp_RW = 2'd1;
  localparam CsrOp_RS = 2'd2;
  localparam CsrOp_RC = 2'd3;

  reg        [31:0]   _out_default_NEXT_PC;
  reg        [31:0]   _out_default_TRAP_VAL;
  reg        [3:0]    _out_default_TRAP_CAUSE;
  reg                 _out_default_TRAP_IS_INTERRUPT;
  reg        [31:0]   _out_default_RD_DATA;
  reg                 _out_default_HAS_TRAPPED;
  reg                 TrapHandler_interruptSignals_hasTrapped;
  reg        [3:0]    TrapHandler_interruptSignals_trapCause;
  reg        [31:0]   TrapHandler_interruptSignals_trapVal;
  reg                 TrapHandler_exceptionSignals_hasTrapped;
  reg        [3:0]    TrapHandler_exceptionSignals_trapCause;
  reg        [31:0]   TrapHandler_exceptionSignals_trapVal;
  reg        [4:0]    _out_default_RS1;
  reg        [0:0]    _out_default_RS1_TYPE;
  reg        [4:0]    _out_default_RS2;
  reg        [0:0]    _out_default_RS2_TYPE;
  reg                 _out_default_RD_DATA_VALID;
  reg        [4:0]    _out_default_RD;
  reg        [0:0]    _out_default_RD_TYPE;
  wire       [4:0]    value_RD;
  wire       [31:0]   value_RD_DATA;
  wire       [0:0]    value_RD_TYPE;
  wire       [1:0]    value_CSR_OP;
  wire                value_CSR_USE_IMM;
  wire       [4:0]    value_RS1;
  wire       [31:0]   value_IR;
  wire       [11:0]   CsrFile_csrId;
  wire                CsrFile_ignoreRead;
  reg                 CsrFile_ignoreWrite;
  reg        [31:0]   CsrFile_src;
  reg        [26:0]   _zz_CsrFile_src;
  wire       [31:0]   value_RS1_DATA;
  wire                when_CsrFile_l205;
  wire                when_CsrFile_l208;
  wire                when_CsrFile_l219;
  wire                when_CsrFile_l228;
  reg                 TrapHandler_trapSignals_hasTrapped;
  reg        [3:0]    TrapHandler_trapSignals_trapCause;
  reg        [31:0]   TrapHandler_trapSignals_trapVal;
  reg                 TrapHandler_isInterrupt;
  wire                value_HAS_TRAPPED;
  wire                when_TrapHandler_l140;
  reg        [31:0]   _zz_TrapHandler_mstatus_wdata;
  reg        [31:0]   _zz_TrapHandler_mcause_wdata;
  wire                value_TRAP_IS_INTERRUPT;
  wire       [3:0]    value_TRAP_CAUSE;
  wire       [31:0]   value_PC;
  wire       [31:0]   value_TRAP_VAL;
  wire                value_MRET;
  wire                when_TrapHandler_l164;
  reg        [31:0]   _zz_TrapHandler_mstatus_wdata_1;
  wire                when_Interrupts_l90;
  reg        [31:0]   _zz_Interrupts_mip_wdata;
  wire                Interrupts_gie;
  wire                Interrupts_mtie;
  wire                Interrupts_mtip;
  wire                Interrupts_meie;
  wire                Interrupts_meip;
  wire                when_Interrupts_l112;
  wire                when_Interrupts_l116;
  reg        [31:0]   _out_default_PC;
  reg        [31:0]   _out_default_IR;
  `ifndef SYNTHESIS
  reg [31:0] out_RS1_TYPE_string;
  reg [31:0] _out_default_RS1_TYPE_string;
  reg [31:0] out_RS2_TYPE_string;
  reg [31:0] _out_default_RS2_TYPE_string;
  reg [31:0] out_RD_TYPE_string;
  reg [31:0] _out_default_RD_TYPE_string;
  reg [31:0] value_RD_TYPE_string;
  reg [31:0] value_CSR_OP_string;
  reg [31:0] in_CSR_OP_string;
  reg [31:0] in_RD_TYPE_string;
  reg [31:0] in_RS2_TYPE_string;
  reg [31:0] in_RS1_TYPE_string;
  `endif

  function [26:0] zz__zz_CsrFile_src(input dummy);
    begin
      zz__zz_CsrFile_src[26] = 1'b0;
      zz__zz_CsrFile_src[25] = 1'b0;
      zz__zz_CsrFile_src[24] = 1'b0;
      zz__zz_CsrFile_src[23] = 1'b0;
      zz__zz_CsrFile_src[22] = 1'b0;
      zz__zz_CsrFile_src[21] = 1'b0;
      zz__zz_CsrFile_src[20] = 1'b0;
      zz__zz_CsrFile_src[19] = 1'b0;
      zz__zz_CsrFile_src[18] = 1'b0;
      zz__zz_CsrFile_src[17] = 1'b0;
      zz__zz_CsrFile_src[16] = 1'b0;
      zz__zz_CsrFile_src[15] = 1'b0;
      zz__zz_CsrFile_src[14] = 1'b0;
      zz__zz_CsrFile_src[13] = 1'b0;
      zz__zz_CsrFile_src[12] = 1'b0;
      zz__zz_CsrFile_src[11] = 1'b0;
      zz__zz_CsrFile_src[10] = 1'b0;
      zz__zz_CsrFile_src[9] = 1'b0;
      zz__zz_CsrFile_src[8] = 1'b0;
      zz__zz_CsrFile_src[7] = 1'b0;
      zz__zz_CsrFile_src[6] = 1'b0;
      zz__zz_CsrFile_src[5] = 1'b0;
      zz__zz_CsrFile_src[4] = 1'b0;
      zz__zz_CsrFile_src[3] = 1'b0;
      zz__zz_CsrFile_src[2] = 1'b0;
      zz__zz_CsrFile_src[1] = 1'b0;
      zz__zz_CsrFile_src[0] = 1'b0;
    end
  endfunction
  wire [26:0] _zz_1;

  `ifndef SYNTHESIS
  always @(*) begin
    case(out_RS1_TYPE)
      RegisterType_NONE : out_RS1_TYPE_string = "NONE";
      RegisterType_GPR : out_RS1_TYPE_string = "GPR ";
      default : out_RS1_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_out_default_RS1_TYPE)
      RegisterType_NONE : _out_default_RS1_TYPE_string = "NONE";
      RegisterType_GPR : _out_default_RS1_TYPE_string = "GPR ";
      default : _out_default_RS1_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(out_RS2_TYPE)
      RegisterType_NONE : out_RS2_TYPE_string = "NONE";
      RegisterType_GPR : out_RS2_TYPE_string = "GPR ";
      default : out_RS2_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_out_default_RS2_TYPE)
      RegisterType_NONE : _out_default_RS2_TYPE_string = "NONE";
      RegisterType_GPR : _out_default_RS2_TYPE_string = "GPR ";
      default : _out_default_RS2_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(out_RD_TYPE)
      RegisterType_NONE : out_RD_TYPE_string = "NONE";
      RegisterType_GPR : out_RD_TYPE_string = "GPR ";
      default : out_RD_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_out_default_RD_TYPE)
      RegisterType_NONE : _out_default_RD_TYPE_string = "NONE";
      RegisterType_GPR : _out_default_RD_TYPE_string = "GPR ";
      default : _out_default_RD_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(value_RD_TYPE)
      RegisterType_NONE : value_RD_TYPE_string = "NONE";
      RegisterType_GPR : value_RD_TYPE_string = "GPR ";
      default : value_RD_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(value_CSR_OP)
      CsrOp_NONE : value_CSR_OP_string = "NONE";
      CsrOp_RW : value_CSR_OP_string = "RW  ";
      CsrOp_RS : value_CSR_OP_string = "RS  ";
      CsrOp_RC : value_CSR_OP_string = "RC  ";
      default : value_CSR_OP_string = "????";
    endcase
  end
  always @(*) begin
    case(in_CSR_OP)
      CsrOp_NONE : in_CSR_OP_string = "NONE";
      CsrOp_RW : in_CSR_OP_string = "RW  ";
      CsrOp_RS : in_CSR_OP_string = "RS  ";
      CsrOp_RC : in_CSR_OP_string = "RC  ";
      default : in_CSR_OP_string = "????";
    endcase
  end
  always @(*) begin
    case(in_RD_TYPE)
      RegisterType_NONE : in_RD_TYPE_string = "NONE";
      RegisterType_GPR : in_RD_TYPE_string = "GPR ";
      default : in_RD_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(in_RS2_TYPE)
      RegisterType_NONE : in_RS2_TYPE_string = "NONE";
      RegisterType_GPR : in_RS2_TYPE_string = "GPR ";
      default : in_RS2_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(in_RS1_TYPE)
      RegisterType_NONE : in_RS1_TYPE_string = "NONE";
      RegisterType_GPR : in_RS1_TYPE_string = "GPR ";
      default : in_RS1_TYPE_string = "????";
    endcase
  end
  `endif

  always @(*) begin
    _out_default_NEXT_PC = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    _out_default_NEXT_PC = in_NEXT_PC;
  end

  always @(*) begin
    out_NEXT_PC = _out_default_NEXT_PC;
    if(when_TrapHandler_l140) begin
      out_NEXT_PC = ({2'd0,TrapHandler_mtvec_rdata[31 : 2]} <<< 2'd2);
    end
    if(when_TrapHandler_l164) begin
      out_NEXT_PC = TrapHandler_mepc_rdata;
    end
  end

  always @(*) begin
    _out_default_TRAP_VAL = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    _out_default_TRAP_VAL = in_TRAP_VAL;
  end

  always @(*) begin
    out_TRAP_VAL = _out_default_TRAP_VAL;
    if(TrapHandler_trapSignals_hasTrapped) begin
      out_TRAP_VAL = TrapHandler_trapSignals_trapVal;
    end
  end

  always @(*) begin
    _out_default_TRAP_CAUSE = 4'bxxxx;
    _out_default_TRAP_CAUSE = in_TRAP_CAUSE;
  end

  always @(*) begin
    out_TRAP_CAUSE = _out_default_TRAP_CAUSE;
    if(TrapHandler_trapSignals_hasTrapped) begin
      out_TRAP_CAUSE = TrapHandler_trapSignals_trapCause;
    end
  end

  always @(*) begin
    _out_default_TRAP_IS_INTERRUPT = 1'bx;
    _out_default_TRAP_IS_INTERRUPT = in_TRAP_IS_INTERRUPT;
  end

  always @(*) begin
    out_TRAP_IS_INTERRUPT = _out_default_TRAP_IS_INTERRUPT;
    if(TrapHandler_trapSignals_hasTrapped) begin
      out_TRAP_IS_INTERRUPT = TrapHandler_isInterrupt;
    end
  end

  always @(*) begin
    _out_default_RD_DATA = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    _out_default_RD_DATA = in_RD_DATA;
  end

  always @(*) begin
    out_RD_DATA = _out_default_RD_DATA;
    if(when_CsrFile_l205) begin
      case(value_CSR_OP)
        CsrOp_RW : begin
          if(when_CsrFile_l208) begin
            out_RD_DATA = CsrFile_csrIo_rdata;
          end
        end
        CsrOp_RS : begin
          out_RD_DATA = CsrFile_csrIo_rdata;
        end
        CsrOp_RC : begin
          out_RD_DATA = CsrFile_csrIo_rdata;
        end
        default : begin
        end
      endcase
    end
  end

  always @(*) begin
    _out_default_HAS_TRAPPED = 1'bx;
    _out_default_HAS_TRAPPED = in_HAS_TRAPPED;
  end

  always @(*) begin
    out_HAS_TRAPPED = _out_default_HAS_TRAPPED;
    if(TrapHandler_trapSignals_hasTrapped) begin
      out_HAS_TRAPPED = 1'b1;
    end
  end

  assign arbitration_isAvailable = ((! arbitration_isValid) || arbitration_isDone);
  assign arbitration_isReady = 1'b1;
  always @(*) begin
    arbitration_rs1Needed = 1'b0;
    if(!value_CSR_USE_IMM) begin
      arbitration_rs1Needed = 1'b1;
    end
  end

  assign arbitration_rs2Needed = 1'b0;
  always @(*) begin
    arbitration_jumpRequested = 1'b0;
    if(when_TrapHandler_l140) begin
      arbitration_jumpRequested = 1'b1;
    end
    if(when_TrapHandler_l164) begin
      arbitration_jumpRequested = 1'b1;
    end
  end

  assign arbitration_isDone = ((arbitration_isValid && arbitration_isReady) && (! arbitration_isStalled));
  always @(*) begin
    TrapHandler_interruptSignals_hasTrapped = 1'b0;
    if(Interrupts_gie) begin
      if(when_Interrupts_l112) begin
        TrapHandler_interruptSignals_hasTrapped = 1'b1;
      end
      if(when_Interrupts_l116) begin
        TrapHandler_interruptSignals_hasTrapped = 1'b1;
      end
    end
  end

  always @(*) begin
    TrapHandler_interruptSignals_trapCause = 4'bxxxx;
    if(Interrupts_gie) begin
      if(when_Interrupts_l112) begin
        TrapHandler_interruptSignals_trapCause = 4'b0111;
      end
      if(when_Interrupts_l116) begin
        TrapHandler_interruptSignals_trapCause = 4'b1011;
      end
    end
  end

  always @(*) begin
    TrapHandler_interruptSignals_trapVal = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(Interrupts_gie) begin
      if(when_Interrupts_l112) begin
        TrapHandler_interruptSignals_trapVal = 32'h0;
      end
      if(when_Interrupts_l116) begin
        TrapHandler_interruptSignals_trapVal = 32'h0;
      end
    end
  end

  always @(*) begin
    TrapHandler_exceptionSignals_hasTrapped = 1'b0;
    if(when_CsrFile_l205) begin
      if(CsrFile_csrIo_error) begin
        TrapHandler_exceptionSignals_hasTrapped = 1'b1;
      end
    end
  end

  always @(*) begin
    TrapHandler_exceptionSignals_trapCause = 4'bxxxx;
    if(when_CsrFile_l205) begin
      if(CsrFile_csrIo_error) begin
        TrapHandler_exceptionSignals_trapCause = 4'b0010;
      end
    end
  end

  always @(*) begin
    TrapHandler_exceptionSignals_trapVal = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(when_CsrFile_l205) begin
      if(CsrFile_csrIo_error) begin
        TrapHandler_exceptionSignals_trapVal = value_IR;
      end
    end
  end

  always @(*) begin
    _out_default_RS1 = 5'bxxxxx;
    _out_default_RS1 = in_RS1;
  end

  assign out_RS1 = _out_default_RS1;
  always @(*) begin
    _out_default_RS1_TYPE = (1'bx);
    _out_default_RS1_TYPE = in_RS1_TYPE;
  end

  assign out_RS1_TYPE = _out_default_RS1_TYPE;
  always @(*) begin
    _out_default_RS2 = 5'bxxxxx;
    _out_default_RS2 = in_RS2;
  end

  assign out_RS2 = _out_default_RS2;
  always @(*) begin
    _out_default_RS2_TYPE = (1'bx);
    _out_default_RS2_TYPE = in_RS2_TYPE;
  end

  assign out_RS2_TYPE = _out_default_RS2_TYPE;
  always @(*) begin
    _out_default_RD_DATA_VALID = 1'bx;
    _out_default_RD_DATA_VALID = in_RD_DATA_VALID;
  end

  always @(*) begin
    out_RD_DATA_VALID = _out_default_RD_DATA_VALID;
    if(when_CsrFile_l205) begin
      case(value_CSR_OP)
        CsrOp_RW : begin
          if(when_CsrFile_l208) begin
            out_RD_DATA_VALID = 1'b1;
          end
        end
        CsrOp_RS : begin
          out_RD_DATA_VALID = 1'b1;
        end
        CsrOp_RC : begin
          out_RD_DATA_VALID = 1'b1;
        end
        default : begin
        end
      endcase
    end
  end

  always @(*) begin
    _out_default_RD = 5'bxxxxx;
    _out_default_RD = in_RD;
  end

  assign out_RD = _out_default_RD;
  always @(*) begin
    _out_default_RD_TYPE = (1'bx);
    _out_default_RD_TYPE = in_RD_TYPE;
  end

  assign out_RD_TYPE = _out_default_RD_TYPE;
  assign RegisterFileAccessor_regFileIo_rd = value_RD;
  assign RegisterFileAccessor_regFileIo_data = value_RD_DATA;
  assign RegisterFileAccessor_regFileIo_write = (((value_RD_TYPE == RegisterType_GPR) && arbitration_isDone) && (! out_HAS_TRAPPED));
  always @(*) begin
    CsrFile_csrIo_rid = 12'h0;
    if(when_CsrFile_l205) begin
      case(value_CSR_OP)
        CsrOp_RW : begin
          if(when_CsrFile_l208) begin
            CsrFile_csrIo_rid = CsrFile_csrId;
          end
        end
        CsrOp_RS : begin
          CsrFile_csrIo_rid = CsrFile_csrId;
        end
        CsrOp_RC : begin
          CsrFile_csrIo_rid = CsrFile_csrId;
        end
        default : begin
        end
      endcase
    end
  end

  always @(*) begin
    CsrFile_csrIo_wid = 12'h0;
    if(when_CsrFile_l205) begin
      case(value_CSR_OP)
        CsrOp_RW : begin
          CsrFile_csrIo_wid = CsrFile_csrId;
        end
        CsrOp_RS : begin
          if(when_CsrFile_l219) begin
            CsrFile_csrIo_wid = CsrFile_csrId;
          end
        end
        CsrOp_RC : begin
          if(when_CsrFile_l228) begin
            CsrFile_csrIo_wid = CsrFile_csrId;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(*) begin
    CsrFile_csrIo_read = 1'b0;
    if(when_CsrFile_l205) begin
      case(value_CSR_OP)
        CsrOp_RW : begin
          if(when_CsrFile_l208) begin
            CsrFile_csrIo_read = 1'b1;
          end
        end
        CsrOp_RS : begin
          CsrFile_csrIo_read = 1'b1;
        end
        CsrOp_RC : begin
          CsrFile_csrIo_read = 1'b1;
        end
        default : begin
        end
      endcase
    end
  end

  always @(*) begin
    CsrFile_csrIo_write = 1'b0;
    if(when_CsrFile_l205) begin
      case(value_CSR_OP)
        CsrOp_RW : begin
          CsrFile_csrIo_write = 1'b1;
        end
        CsrOp_RS : begin
          if(when_CsrFile_l219) begin
            CsrFile_csrIo_write = 1'b1;
          end
        end
        CsrOp_RC : begin
          if(when_CsrFile_l228) begin
            CsrFile_csrIo_write = 1'b1;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(*) begin
    CsrFile_csrIo_wdata = 32'h0;
    if(when_CsrFile_l205) begin
      case(value_CSR_OP)
        CsrOp_RW : begin
          CsrFile_csrIo_wdata = CsrFile_src;
        end
        CsrOp_RS : begin
          if(when_CsrFile_l219) begin
            CsrFile_csrIo_wdata = (CsrFile_csrIo_rdata | CsrFile_src);
          end
        end
        CsrOp_RC : begin
          if(when_CsrFile_l228) begin
            CsrFile_csrIo_wdata = (CsrFile_csrIo_rdata & (~ CsrFile_src));
          end
        end
        default : begin
        end
      endcase
    end
  end

  assign CsrFile_csrId = value_IR[31 : 20];
  assign CsrFile_ignoreRead = (value_RD == 5'h0);
  always @(*) begin
    CsrFile_ignoreWrite = 1'b0;
    if(!value_CSR_USE_IMM) begin
      CsrFile_ignoreWrite = (value_RS1 == 5'h0);
    end
  end

  assign _zz_1 = zz__zz_CsrFile_src(1'b0);
  always @(*) _zz_CsrFile_src = _zz_1;
  always @(*) begin
    if(value_CSR_USE_IMM) begin
      CsrFile_src = {_zz_CsrFile_src,value_RS1};
    end else begin
      CsrFile_src = value_RS1_DATA;
    end
  end

  assign when_CsrFile_l205 = (arbitration_isValid && (value_CSR_OP != CsrOp_NONE));
  assign when_CsrFile_l208 = (! CsrFile_ignoreRead);
  assign when_CsrFile_l219 = (! CsrFile_ignoreWrite);
  assign when_CsrFile_l228 = (! CsrFile_ignoreWrite);
  always @(*) begin
    TrapHandler_trapSignals_hasTrapped = 1'b0;
    if(TrapHandler_interruptSignals_hasTrapped) begin
      TrapHandler_trapSignals_hasTrapped = TrapHandler_interruptSignals_hasTrapped;
    end else begin
      TrapHandler_trapSignals_hasTrapped = TrapHandler_exceptionSignals_hasTrapped;
    end
  end

  always @(*) begin
    TrapHandler_trapSignals_trapCause = 4'bxxxx;
    if(TrapHandler_interruptSignals_hasTrapped) begin
      TrapHandler_trapSignals_trapCause = TrapHandler_interruptSignals_trapCause;
    end else begin
      TrapHandler_trapSignals_trapCause = TrapHandler_exceptionSignals_trapCause;
    end
  end

  always @(*) begin
    TrapHandler_trapSignals_trapVal = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(TrapHandler_interruptSignals_hasTrapped) begin
      TrapHandler_trapSignals_trapVal = TrapHandler_interruptSignals_trapVal;
    end else begin
      TrapHandler_trapSignals_trapVal = TrapHandler_exceptionSignals_trapVal;
    end
  end

  always @(*) begin
    TrapHandler_isInterrupt = 1'b0;
    if(TrapHandler_interruptSignals_hasTrapped) begin
      TrapHandler_isInterrupt = 1'b1;
    end
  end

  always @(*) begin
    TrapHandler_mstatus_write = 1'b0;
    if(when_TrapHandler_l140) begin
      TrapHandler_mstatus_write = 1'b1;
    end
    if(when_TrapHandler_l164) begin
      TrapHandler_mstatus_write = 1'b1;
    end
  end

  always @(*) begin
    TrapHandler_mstatus_wdata = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(when_TrapHandler_l140) begin
      TrapHandler_mstatus_wdata = _zz_TrapHandler_mstatus_wdata;
    end
    if(when_TrapHandler_l164) begin
      TrapHandler_mstatus_wdata = _zz_TrapHandler_mstatus_wdata_1;
    end
  end

  assign TrapHandler_mtvec_write = 1'b0;
  assign TrapHandler_mtvec_wdata = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
  always @(*) begin
    TrapHandler_mcause_write = 1'b0;
    if(when_TrapHandler_l140) begin
      TrapHandler_mcause_write = 1'b1;
    end
  end

  always @(*) begin
    TrapHandler_mcause_wdata = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(when_TrapHandler_l140) begin
      TrapHandler_mcause_wdata = _zz_TrapHandler_mcause_wdata;
    end
  end

  always @(*) begin
    TrapHandler_mepc_write = 1'b0;
    if(when_TrapHandler_l140) begin
      TrapHandler_mepc_write = 1'b1;
    end
  end

  always @(*) begin
    TrapHandler_mepc_wdata = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(when_TrapHandler_l140) begin
      TrapHandler_mepc_wdata = value_PC;
    end
  end

  always @(*) begin
    TrapHandler_mtval_write = 1'b0;
    if(when_TrapHandler_l140) begin
      TrapHandler_mtval_write = 1'b1;
    end
  end

  always @(*) begin
    TrapHandler_mtval_wdata = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(when_TrapHandler_l140) begin
      TrapHandler_mtval_wdata = value_TRAP_VAL;
    end
  end

  assign when_TrapHandler_l140 = (arbitration_isValid && value_HAS_TRAPPED);
  always @(*) begin
    _zz_TrapHandler_mstatus_wdata = TrapHandler_mstatus_rdata;
    _zz_TrapHandler_mstatus_wdata[3] = 1'b0;
    _zz_TrapHandler_mstatus_wdata[7] = TrapHandler_mstatus_rdata[3];
  end

  always @(*) begin
    _zz_TrapHandler_mcause_wdata = 32'h0;
    _zz_TrapHandler_mcause_wdata[31] = value_TRAP_IS_INTERRUPT;
    _zz_TrapHandler_mcause_wdata[3 : 0] = value_TRAP_CAUSE;
  end

  assign when_TrapHandler_l164 = (arbitration_isValid && value_MRET);
  always @(*) begin
    _zz_TrapHandler_mstatus_wdata_1 = TrapHandler_mstatus_rdata;
    _zz_TrapHandler_mstatus_wdata_1[3] = TrapHandler_mstatus_rdata[7];
    _zz_TrapHandler_mstatus_wdata_1[7] = 1'b1;
  end

  assign Interrupts_mstatus_write = 1'b0;
  assign Interrupts_mstatus_wdata = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
  assign Interrupts_mie_write = 1'b0;
  assign Interrupts_mie_wdata = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
  always @(*) begin
    Interrupts_mip_write = 1'b0;
    if(when_Interrupts_l90) begin
      Interrupts_mip_write = 1'b1;
    end
  end

  always @(*) begin
    Interrupts_mip_wdata = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(when_Interrupts_l90) begin
      Interrupts_mip_wdata = _zz_Interrupts_mip_wdata;
    end
  end

  assign when_Interrupts_l90 = (Interrupts_mtimer_update || Interrupts_external_update);
  always @(*) begin
    _zz_Interrupts_mip_wdata = Interrupts_mip_rdata;
    if(Interrupts_mtimer_update) begin
      _zz_Interrupts_mip_wdata[7] = Interrupts_mtimer_interruptPending;
    end
    if(Interrupts_external_update) begin
      _zz_Interrupts_mip_wdata[11] = Interrupts_external_interruptPending;
    end
  end

  assign Interrupts_gie = Interrupts_mstatus_rdata[3];
  assign Interrupts_mtie = Interrupts_mie_rdata[7];
  assign Interrupts_mtip = Interrupts_mip_rdata[7];
  assign Interrupts_meie = Interrupts_mie_rdata[11];
  assign Interrupts_meip = Interrupts_mip_rdata[11];
  assign when_Interrupts_l112 = (Interrupts_mtie && Interrupts_mtip);
  assign when_Interrupts_l116 = (Interrupts_meie && Interrupts_meip);
  always @(*) begin
    _out_default_PC = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    _out_default_PC = in_PC;
  end

  assign out_PC = _out_default_PC;
  always @(*) begin
    _out_default_IR = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    _out_default_IR = in_IR;
  end

  assign out_IR = _out_default_IR;
  assign value_RD_TYPE = out_RD_TYPE;
  assign value_TRAP_IS_INTERRUPT = out_TRAP_IS_INTERRUPT;
  assign value_RS1 = out_RS1;
  assign value_IR = out_IR;
  assign value_RS1_DATA = in_RS1_DATA;
  assign value_RD_DATA = out_RD_DATA;
  assign value_TRAP_VAL = out_TRAP_VAL;
  assign value_PC = out_PC;
  assign value_HAS_TRAPPED = out_HAS_TRAPPED;
  assign value_TRAP_CAUSE = out_TRAP_CAUSE;
  assign value_CSR_OP = in_CSR_OP;
  assign value_RD = out_RD;
  assign value_CSR_USE_IMM = in_CSR_USE_IMM;
  assign value_MRET = in_MRET;

endmodule

module Stage_MEM (
  input  wire          arbitration_isValid,
  input  wire          arbitration_isStalled,
  output reg           arbitration_isReady,
  output wire          arbitration_isDone,
  output wire          arbitration_rs1Needed,
  output reg           arbitration_rs2Needed,
  output wire          arbitration_jumpRequested,
  output wire          arbitration_isAvailable,
  output reg  [31:0]   out_LSU_TARGET_ADDRESS,
  output reg           out_LSU_TARGET_VALID,
  output reg           StaticMemoryBackbone_dbus_cmd_valid,
  input  wire          StaticMemoryBackbone_dbus_cmd_ready,
  output reg  [31:0]   StaticMemoryBackbone_dbus_cmd_payload_address,
  output reg           StaticMemoryBackbone_dbus_cmd_payload_write,
  output reg  [31:0]   StaticMemoryBackbone_dbus_cmd_payload_wdata,
  output reg  [3:0]    StaticMemoryBackbone_dbus_cmd_payload_wmask,
  input  wire          StaticMemoryBackbone_dbus_rsp_valid,
  output wire          StaticMemoryBackbone_dbus_rsp_ready,
  input  wire [31:0]   StaticMemoryBackbone_dbus_rsp_payload_rdata,
  output reg  [31:0]   out_RD_DATA,
  output reg           out_RD_DATA_VALID,
  output reg           out_HAS_TRAPPED,
  output reg           out_TRAP_IS_INTERRUPT,
  output reg  [3:0]    out_TRAP_CAUSE,
  output reg  [31:0]   out_TRAP_VAL,
  input  wire [1:0]    in_LSU_OPERATION_TYPE,
  input  wire [31:0]   in_ALU_RESULT,
  input  wire          in_LSU_IS_UNSIGNED,
  input  wire [31:0]   in_RS2_DATA,
  input  wire [1:0]    in_LSU_ACCESS_WIDTH,
  input  wire [0:0]    in_RD_TYPE,
  output wire [0:0]    out_RD_TYPE,
  input  wire          in_TRAP_IS_INTERRUPT,
  input  wire [0:0]    in_RS2_TYPE,
  output wire [0:0]    out_RS2_TYPE,
  input  wire [4:0]    in_RS2,
  output wire [4:0]    out_RS2,
  input  wire [31:0]   in_IR,
  output wire [31:0]   out_IR,
  input  wire [31:0]   in_RS1_DATA,
  output wire [31:0]   out_RS1_DATA,
  input  wire [4:0]    in_RS1,
  output wire [4:0]    out_RS1,
  input  wire [31:0]   in_RD_DATA,
  input  wire [31:0]   in_TRAP_VAL,
  input  wire [31:0]   in_PC,
  output wire [31:0]   out_PC,
  input  wire          in_HAS_TRAPPED,
  input  wire [3:0]    in_TRAP_CAUSE,
  input  wire [1:0]    in_CSR_OP,
  output wire [1:0]    out_CSR_OP,
  input  wire [4:0]    in_RD,
  output wire [4:0]    out_RD,
  input  wire          in_CSR_USE_IMM,
  output wire          out_CSR_USE_IMM,
  input  wire          in_RD_DATA_VALID,
  input  wire          in_MRET,
  output wire          out_MRET,
  input  wire [31:0]   in_NEXT_PC,
  output wire [31:0]   out_NEXT_PC,
  input  wire [0:0]    in_RS1_TYPE,
  output wire [0:0]    out_RS1_TYPE,
  input  wire          in_LSU_TARGET_VALID,
  input  wire          clk,
  input  wire          reset
);
  localparam LsuOperationType_NONE = 2'd0;
  localparam LsuOperationType_LOAD = 2'd1;
  localparam LsuOperationType_STORE = 2'd2;
  localparam LsuAccessWidth_B = 2'd0;
  localparam LsuAccessWidth_H = 2'd1;
  localparam LsuAccessWidth_W = 2'd2;
  localparam RegisterType_NONE = 1'd0;
  localparam RegisterType_GPR = 1'd1;
  localparam CsrOp_NONE = 2'd0;
  localparam CsrOp_RW = 2'd1;
  localparam CsrOp_RS = 2'd2;
  localparam CsrOp_RC = 2'd3;

  wire       [15:0]   _zz__zz_StaticMemoryBackbone_dbus_cmd_payload_wdata;
  wire       [23:0]   _zz__zz_StaticMemoryBackbone_dbus_cmd_payload_wdata_1;
  reg        [31:0]   _out_default_TRAP_VAL;
  reg        [3:0]    _out_default_TRAP_CAUSE;
  reg                 _out_default_TRAP_IS_INTERRUPT;
  reg                 _out_default_HAS_TRAPPED;
  reg                 _out_default_RD_DATA_VALID;
  reg        [31:0]   _out_default_RD_DATA;
  reg                 _out_default_LSU_TARGET_VALID;
  wire       [31:0]   _out_default_LSU_TARGET_ADDRESS;
  wire       [31:0]   Lsu_externalAddress;
  wire                TrapHandler_interruptSignals_hasTrapped;
  wire       [3:0]    TrapHandler_interruptSignals_trapCause;
  wire       [31:0]   TrapHandler_interruptSignals_trapVal;
  reg                 TrapHandler_exceptionSignals_hasTrapped;
  reg        [3:0]    TrapHandler_exceptionSignals_trapCause;
  reg        [31:0]   TrapHandler_exceptionSignals_trapVal;
  wire       [1:0]    value_LSU_OPERATION_TYPE;
  wire       [1:0]    value_LSU_ACCESS_WIDTH;
  wire                value_LSU_IS_UNSIGNED;
  wire       [31:0]   value_ALU_RESULT;
  wire                when_Lsu_l223;
  wire       [31:0]   value_LSU_TARGET_ADDRESS;
  wire                value_LSU_TARGET_VALID;
  reg                 Lsu_dbusCtrl_currentCmd_valid;
  reg                 Lsu_dbusCtrl_currentCmd_ready;
  reg        [31:0]   Lsu_dbusCtrl_currentCmd_cmd_address;
  reg                 Lsu_dbusCtrl_currentCmd_cmd_write;
  reg        [31:0]   Lsu_dbusCtrl_currentCmd_cmd_wdata;
  reg        [3:0]    Lsu_dbusCtrl_currentCmd_cmd_wmask;
  wire                when_MemBus_l166;
  wire                Lsu_isActive;
  reg                 Lsu_misaligned;
  reg        [3:0]    Lsu_baseMask;
  wire       [3:0]    Lsu_mask;
  reg                 Lsu_busReady;
  reg                 Lsu_loadActive;
  wire                when_Lsu_l300;
  wire                when_Lsu_l308;
  wire       [31:0]   _zz_StaticMemoryBackbone_dbus_cmd_payload_address;
  reg                 when_Lsu_l323;
  reg        [31:0]   _zz_out_RD_DATA;
  wire                when_Lsu_l318;
  reg                 _zz_when_Lsu_l323;
  reg        [31:0]   _zz_out_RD_DATA_1;
  reg                 _zz_when_MemBus_l233;
  reg                 _zz_when_MemBus_l233_1;
  wire                when_MemBus_l222;
  wire                when_MemBus_l225;
  wire                when_MemBus_l233;
  reg        [31:0]   _zz_out_RD_DATA_2;
  wire       [15:0]   _zz_out_RD_DATA_3;
  reg        [15:0]   _zz_out_RD_DATA_4;
  wire                _zz_out_RD_DATA_5;
  reg        [15:0]   _zz_out_RD_DATA_6;
  wire       [7:0]    _zz_out_RD_DATA_7;
  reg        [23:0]   _zz_out_RD_DATA_8;
  wire                _zz_out_RD_DATA_9;
  reg        [23:0]   _zz_out_RD_DATA_10;
  wire       [31:0]   Lsu_busAddress;
  wire                Lsu_isActive_1;
  reg                 Lsu_misaligned_1;
  reg        [3:0]    Lsu_baseMask_1;
  wire       [3:0]    Lsu_mask_1;
  wire                when_Lsu_l386;
  wire                when_Lsu_l394;
  reg        [31:0]   _zz_StaticMemoryBackbone_dbus_cmd_payload_wdata;
  wire       [15:0]   _zz_StaticMemoryBackbone_dbus_cmd_payload_wdata_1;
  wire                when_Lsu_l405;
  wire       [7:0]    _zz_StaticMemoryBackbone_dbus_cmd_payload_wdata_2;
  wire       [1:0]    switch_Lsu_l414;
  reg                 _zz_arbitration_isReady;
  reg                 _zz_when_MemBus_l260;
  reg                 _zz_when_MemBus_l260_1;
  wire                when_MemBus_l249;
  wire                when_MemBus_l252;
  wire                when_MemBus_l260;
  wire       [31:0]   value_RS2_DATA;
  reg                 TrapHandler_trapSignals_hasTrapped;
  reg        [3:0]    TrapHandler_trapSignals_trapCause;
  reg        [31:0]   TrapHandler_trapSignals_trapVal;
  reg                 TrapHandler_isInterrupt;
  reg        [0:0]    _out_default_RD_TYPE;
  reg        [0:0]    _out_default_RS2_TYPE;
  reg        [4:0]    _out_default_RS2;
  reg        [31:0]   _out_default_IR;
  reg        [31:0]   _out_default_RS1_DATA;
  reg        [4:0]    _out_default_RS1;
  reg        [31:0]   _out_default_PC;
  reg        [1:0]    _out_default_CSR_OP;
  reg        [4:0]    _out_default_RD;
  reg                 _out_default_CSR_USE_IMM;
  reg                 _out_default_MRET;
  reg        [31:0]   _out_default_NEXT_PC;
  reg        [0:0]    _out_default_RS1_TYPE;
  `ifndef SYNTHESIS
  reg [39:0] value_LSU_OPERATION_TYPE_string;
  reg [7:0] value_LSU_ACCESS_WIDTH_string;
  reg [39:0] in_LSU_OPERATION_TYPE_string;
  reg [7:0] in_LSU_ACCESS_WIDTH_string;
  reg [31:0] in_RD_TYPE_string;
  reg [31:0] out_RD_TYPE_string;
  reg [31:0] _out_default_RD_TYPE_string;
  reg [31:0] in_RS2_TYPE_string;
  reg [31:0] out_RS2_TYPE_string;
  reg [31:0] _out_default_RS2_TYPE_string;
  reg [31:0] in_CSR_OP_string;
  reg [31:0] out_CSR_OP_string;
  reg [31:0] _out_default_CSR_OP_string;
  reg [31:0] in_RS1_TYPE_string;
  reg [31:0] out_RS1_TYPE_string;
  reg [31:0] _out_default_RS1_TYPE_string;
  `endif

  function [15:0] zz__zz_out_RD_DATA_4(input dummy);
    begin
      zz__zz_out_RD_DATA_4[15] = 1'b0;
      zz__zz_out_RD_DATA_4[14] = 1'b0;
      zz__zz_out_RD_DATA_4[13] = 1'b0;
      zz__zz_out_RD_DATA_4[12] = 1'b0;
      zz__zz_out_RD_DATA_4[11] = 1'b0;
      zz__zz_out_RD_DATA_4[10] = 1'b0;
      zz__zz_out_RD_DATA_4[9] = 1'b0;
      zz__zz_out_RD_DATA_4[8] = 1'b0;
      zz__zz_out_RD_DATA_4[7] = 1'b0;
      zz__zz_out_RD_DATA_4[6] = 1'b0;
      zz__zz_out_RD_DATA_4[5] = 1'b0;
      zz__zz_out_RD_DATA_4[4] = 1'b0;
      zz__zz_out_RD_DATA_4[3] = 1'b0;
      zz__zz_out_RD_DATA_4[2] = 1'b0;
      zz__zz_out_RD_DATA_4[1] = 1'b0;
      zz__zz_out_RD_DATA_4[0] = 1'b0;
    end
  endfunction
  wire [15:0] _zz_1;
  function [23:0] zz__zz_out_RD_DATA_8(input dummy);
    begin
      zz__zz_out_RD_DATA_8[23] = 1'b0;
      zz__zz_out_RD_DATA_8[22] = 1'b0;
      zz__zz_out_RD_DATA_8[21] = 1'b0;
      zz__zz_out_RD_DATA_8[20] = 1'b0;
      zz__zz_out_RD_DATA_8[19] = 1'b0;
      zz__zz_out_RD_DATA_8[18] = 1'b0;
      zz__zz_out_RD_DATA_8[17] = 1'b0;
      zz__zz_out_RD_DATA_8[16] = 1'b0;
      zz__zz_out_RD_DATA_8[15] = 1'b0;
      zz__zz_out_RD_DATA_8[14] = 1'b0;
      zz__zz_out_RD_DATA_8[13] = 1'b0;
      zz__zz_out_RD_DATA_8[12] = 1'b0;
      zz__zz_out_RD_DATA_8[11] = 1'b0;
      zz__zz_out_RD_DATA_8[10] = 1'b0;
      zz__zz_out_RD_DATA_8[9] = 1'b0;
      zz__zz_out_RD_DATA_8[8] = 1'b0;
      zz__zz_out_RD_DATA_8[7] = 1'b0;
      zz__zz_out_RD_DATA_8[6] = 1'b0;
      zz__zz_out_RD_DATA_8[5] = 1'b0;
      zz__zz_out_RD_DATA_8[4] = 1'b0;
      zz__zz_out_RD_DATA_8[3] = 1'b0;
      zz__zz_out_RD_DATA_8[2] = 1'b0;
      zz__zz_out_RD_DATA_8[1] = 1'b0;
      zz__zz_out_RD_DATA_8[0] = 1'b0;
    end
  endfunction
  wire [23:0] _zz_2;

  assign _zz__zz_StaticMemoryBackbone_dbus_cmd_payload_wdata = ({8'd0,_zz_StaticMemoryBackbone_dbus_cmd_payload_wdata_2} <<< 4'd8);
  assign _zz__zz_StaticMemoryBackbone_dbus_cmd_payload_wdata_1 = ({16'd0,_zz_StaticMemoryBackbone_dbus_cmd_payload_wdata_2} <<< 5'd16);
  `ifndef SYNTHESIS
  always @(*) begin
    case(value_LSU_OPERATION_TYPE)
      LsuOperationType_NONE : value_LSU_OPERATION_TYPE_string = "NONE ";
      LsuOperationType_LOAD : value_LSU_OPERATION_TYPE_string = "LOAD ";
      LsuOperationType_STORE : value_LSU_OPERATION_TYPE_string = "STORE";
      default : value_LSU_OPERATION_TYPE_string = "?????";
    endcase
  end
  always @(*) begin
    case(value_LSU_ACCESS_WIDTH)
      LsuAccessWidth_B : value_LSU_ACCESS_WIDTH_string = "B";
      LsuAccessWidth_H : value_LSU_ACCESS_WIDTH_string = "H";
      LsuAccessWidth_W : value_LSU_ACCESS_WIDTH_string = "W";
      default : value_LSU_ACCESS_WIDTH_string = "?";
    endcase
  end
  always @(*) begin
    case(in_LSU_OPERATION_TYPE)
      LsuOperationType_NONE : in_LSU_OPERATION_TYPE_string = "NONE ";
      LsuOperationType_LOAD : in_LSU_OPERATION_TYPE_string = "LOAD ";
      LsuOperationType_STORE : in_LSU_OPERATION_TYPE_string = "STORE";
      default : in_LSU_OPERATION_TYPE_string = "?????";
    endcase
  end
  always @(*) begin
    case(in_LSU_ACCESS_WIDTH)
      LsuAccessWidth_B : in_LSU_ACCESS_WIDTH_string = "B";
      LsuAccessWidth_H : in_LSU_ACCESS_WIDTH_string = "H";
      LsuAccessWidth_W : in_LSU_ACCESS_WIDTH_string = "W";
      default : in_LSU_ACCESS_WIDTH_string = "?";
    endcase
  end
  always @(*) begin
    case(in_RD_TYPE)
      RegisterType_NONE : in_RD_TYPE_string = "NONE";
      RegisterType_GPR : in_RD_TYPE_string = "GPR ";
      default : in_RD_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(out_RD_TYPE)
      RegisterType_NONE : out_RD_TYPE_string = "NONE";
      RegisterType_GPR : out_RD_TYPE_string = "GPR ";
      default : out_RD_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_out_default_RD_TYPE)
      RegisterType_NONE : _out_default_RD_TYPE_string = "NONE";
      RegisterType_GPR : _out_default_RD_TYPE_string = "GPR ";
      default : _out_default_RD_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(in_RS2_TYPE)
      RegisterType_NONE : in_RS2_TYPE_string = "NONE";
      RegisterType_GPR : in_RS2_TYPE_string = "GPR ";
      default : in_RS2_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(out_RS2_TYPE)
      RegisterType_NONE : out_RS2_TYPE_string = "NONE";
      RegisterType_GPR : out_RS2_TYPE_string = "GPR ";
      default : out_RS2_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_out_default_RS2_TYPE)
      RegisterType_NONE : _out_default_RS2_TYPE_string = "NONE";
      RegisterType_GPR : _out_default_RS2_TYPE_string = "GPR ";
      default : _out_default_RS2_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(in_CSR_OP)
      CsrOp_NONE : in_CSR_OP_string = "NONE";
      CsrOp_RW : in_CSR_OP_string = "RW  ";
      CsrOp_RS : in_CSR_OP_string = "RS  ";
      CsrOp_RC : in_CSR_OP_string = "RC  ";
      default : in_CSR_OP_string = "????";
    endcase
  end
  always @(*) begin
    case(out_CSR_OP)
      CsrOp_NONE : out_CSR_OP_string = "NONE";
      CsrOp_RW : out_CSR_OP_string = "RW  ";
      CsrOp_RS : out_CSR_OP_string = "RS  ";
      CsrOp_RC : out_CSR_OP_string = "RC  ";
      default : out_CSR_OP_string = "????";
    endcase
  end
  always @(*) begin
    case(_out_default_CSR_OP)
      CsrOp_NONE : _out_default_CSR_OP_string = "NONE";
      CsrOp_RW : _out_default_CSR_OP_string = "RW  ";
      CsrOp_RS : _out_default_CSR_OP_string = "RS  ";
      CsrOp_RC : _out_default_CSR_OP_string = "RC  ";
      default : _out_default_CSR_OP_string = "????";
    endcase
  end
  always @(*) begin
    case(in_RS1_TYPE)
      RegisterType_NONE : in_RS1_TYPE_string = "NONE";
      RegisterType_GPR : in_RS1_TYPE_string = "GPR ";
      default : in_RS1_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(out_RS1_TYPE)
      RegisterType_NONE : out_RS1_TYPE_string = "NONE";
      RegisterType_GPR : out_RS1_TYPE_string = "GPR ";
      default : out_RS1_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_out_default_RS1_TYPE)
      RegisterType_NONE : _out_default_RS1_TYPE_string = "NONE";
      RegisterType_GPR : _out_default_RS1_TYPE_string = "GPR ";
      default : _out_default_RS1_TYPE_string = "????";
    endcase
  end
  `endif

  always @(*) begin
    _out_default_TRAP_VAL = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    _out_default_TRAP_VAL = in_TRAP_VAL;
  end

  always @(*) begin
    out_TRAP_VAL = _out_default_TRAP_VAL;
    if(TrapHandler_trapSignals_hasTrapped) begin
      out_TRAP_VAL = TrapHandler_trapSignals_trapVal;
    end
  end

  always @(*) begin
    _out_default_TRAP_CAUSE = 4'bxxxx;
    _out_default_TRAP_CAUSE = in_TRAP_CAUSE;
  end

  always @(*) begin
    out_TRAP_CAUSE = _out_default_TRAP_CAUSE;
    if(TrapHandler_trapSignals_hasTrapped) begin
      out_TRAP_CAUSE = TrapHandler_trapSignals_trapCause;
    end
  end

  always @(*) begin
    _out_default_TRAP_IS_INTERRUPT = 1'bx;
    _out_default_TRAP_IS_INTERRUPT = in_TRAP_IS_INTERRUPT;
  end

  always @(*) begin
    out_TRAP_IS_INTERRUPT = _out_default_TRAP_IS_INTERRUPT;
    if(TrapHandler_trapSignals_hasTrapped) begin
      out_TRAP_IS_INTERRUPT = TrapHandler_isInterrupt;
    end
  end

  always @(*) begin
    _out_default_HAS_TRAPPED = 1'bx;
    _out_default_HAS_TRAPPED = in_HAS_TRAPPED;
  end

  always @(*) begin
    out_HAS_TRAPPED = _out_default_HAS_TRAPPED;
    if(TrapHandler_trapSignals_hasTrapped) begin
      out_HAS_TRAPPED = 1'b1;
    end
  end

  always @(*) begin
    _out_default_RD_DATA_VALID = 1'bx;
    _out_default_RD_DATA_VALID = in_RD_DATA_VALID;
  end

  always @(*) begin
    out_RD_DATA_VALID = _out_default_RD_DATA_VALID;
    if(when_Lsu_l308) begin
      if(Lsu_isActive) begin
        out_RD_DATA_VALID = 1'b1;
      end
    end
  end

  always @(*) begin
    _out_default_RD_DATA = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    _out_default_RD_DATA = in_RD_DATA;
  end

  always @(*) begin
    out_RD_DATA = _out_default_RD_DATA;
    if(when_Lsu_l308) begin
      if(Lsu_isActive) begin
        out_RD_DATA = _zz_out_RD_DATA_2;
      end
    end
  end

  always @(*) begin
    _out_default_LSU_TARGET_VALID = 1'bx;
    _out_default_LSU_TARGET_VALID = in_LSU_TARGET_VALID;
  end

  always @(*) begin
    out_LSU_TARGET_VALID = _out_default_LSU_TARGET_VALID;
    if(when_Lsu_l223) begin
      out_LSU_TARGET_VALID = 1'b1;
    end
  end

  assign _out_default_LSU_TARGET_ADDRESS = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
  always @(*) begin
    out_LSU_TARGET_ADDRESS = _out_default_LSU_TARGET_ADDRESS;
    out_LSU_TARGET_ADDRESS = value_ALU_RESULT;
  end

  assign arbitration_isAvailable = ((! arbitration_isValid) || arbitration_isDone);
  always @(*) begin
    arbitration_isReady = 1'b1;
    if(when_Lsu_l308) begin
      if(Lsu_isActive) begin
        arbitration_isReady = when_Lsu_l323;
      end
    end
    if(when_Lsu_l394) begin
      if(Lsu_isActive_1) begin
        arbitration_isReady = _zz_arbitration_isReady;
      end
    end
  end

  assign arbitration_rs1Needed = 1'b0;
  always @(*) begin
    arbitration_rs2Needed = 1'b0;
    if(when_Lsu_l394) begin
      if(Lsu_isActive_1) begin
        arbitration_rs2Needed = 1'b1;
      end
    end
  end

  assign arbitration_jumpRequested = 1'b0;
  assign arbitration_isDone = ((arbitration_isValid && arbitration_isReady) && (! arbitration_isStalled));
  assign Lsu_externalAddress = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
  assign TrapHandler_interruptSignals_hasTrapped = 1'b0;
  assign TrapHandler_interruptSignals_trapCause = 4'bxxxx;
  assign TrapHandler_interruptSignals_trapVal = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
  always @(*) begin
    TrapHandler_exceptionSignals_hasTrapped = 1'b0;
    if(when_Lsu_l300) begin
      TrapHandler_exceptionSignals_hasTrapped = 1'b1;
    end
    if(when_Lsu_l386) begin
      TrapHandler_exceptionSignals_hasTrapped = 1'b1;
    end
  end

  always @(*) begin
    TrapHandler_exceptionSignals_trapCause = 4'bxxxx;
    if(when_Lsu_l300) begin
      TrapHandler_exceptionSignals_trapCause = 4'b0100;
    end
    if(when_Lsu_l386) begin
      TrapHandler_exceptionSignals_trapCause = 4'b0110;
    end
  end

  always @(*) begin
    TrapHandler_exceptionSignals_trapVal = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(when_Lsu_l300) begin
      TrapHandler_exceptionSignals_trapVal = value_LSU_TARGET_ADDRESS;
    end
    if(when_Lsu_l386) begin
      TrapHandler_exceptionSignals_trapVal = value_LSU_TARGET_ADDRESS;
    end
  end

  assign when_Lsu_l223 = ((value_LSU_OPERATION_TYPE == LsuOperationType_LOAD) || (value_LSU_OPERATION_TYPE == LsuOperationType_STORE));
  always @(*) begin
    StaticMemoryBackbone_dbus_cmd_valid = Lsu_dbusCtrl_currentCmd_valid;
    if(when_Lsu_l308) begin
      if(Lsu_isActive) begin
        if(when_Lsu_l318) begin
          if(when_MemBus_l222) begin
            StaticMemoryBackbone_dbus_cmd_valid = 1'b1;
          end
        end
      end
    end
    if(when_Lsu_l394) begin
      if(Lsu_isActive_1) begin
        if(when_MemBus_l249) begin
          StaticMemoryBackbone_dbus_cmd_valid = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    StaticMemoryBackbone_dbus_cmd_payload_address = Lsu_dbusCtrl_currentCmd_cmd_address;
    if(when_Lsu_l308) begin
      if(Lsu_isActive) begin
        if(when_Lsu_l318) begin
          if(when_MemBus_l222) begin
            StaticMemoryBackbone_dbus_cmd_payload_address = _zz_StaticMemoryBackbone_dbus_cmd_payload_address;
          end
        end
      end
    end
    if(when_Lsu_l394) begin
      if(Lsu_isActive_1) begin
        if(when_MemBus_l249) begin
          StaticMemoryBackbone_dbus_cmd_payload_address = Lsu_busAddress;
        end
      end
    end
  end

  always @(*) begin
    StaticMemoryBackbone_dbus_cmd_payload_write = Lsu_dbusCtrl_currentCmd_cmd_write;
    if(when_Lsu_l308) begin
      if(Lsu_isActive) begin
        if(when_Lsu_l318) begin
          if(when_MemBus_l222) begin
            StaticMemoryBackbone_dbus_cmd_payload_write = 1'b0;
          end
        end
      end
    end
    if(when_Lsu_l394) begin
      if(Lsu_isActive_1) begin
        if(when_MemBus_l249) begin
          StaticMemoryBackbone_dbus_cmd_payload_write = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    StaticMemoryBackbone_dbus_cmd_payload_wdata = Lsu_dbusCtrl_currentCmd_cmd_wdata;
    if(when_Lsu_l394) begin
      if(Lsu_isActive_1) begin
        if(when_MemBus_l249) begin
          StaticMemoryBackbone_dbus_cmd_payload_wdata = _zz_StaticMemoryBackbone_dbus_cmd_payload_wdata;
        end
      end
    end
  end

  always @(*) begin
    StaticMemoryBackbone_dbus_cmd_payload_wmask = Lsu_dbusCtrl_currentCmd_cmd_wmask;
    if(when_Lsu_l394) begin
      if(Lsu_isActive_1) begin
        if(when_MemBus_l249) begin
          StaticMemoryBackbone_dbus_cmd_payload_wmask = Lsu_mask_1;
        end
      end
    end
  end

  assign StaticMemoryBackbone_dbus_rsp_ready = 1'b1;
  assign when_MemBus_l166 = (StaticMemoryBackbone_dbus_cmd_valid && StaticMemoryBackbone_dbus_cmd_ready);
  assign Lsu_isActive = (value_LSU_OPERATION_TYPE == LsuOperationType_LOAD);
  always @(*) begin
    case(value_LSU_ACCESS_WIDTH)
      LsuAccessWidth_B : begin
        Lsu_misaligned = 1'b0;
      end
      LsuAccessWidth_H : begin
        Lsu_misaligned = ((value_LSU_TARGET_ADDRESS & 32'h00000001) != 32'h0);
      end
      default : begin
        Lsu_misaligned = ((value_LSU_TARGET_ADDRESS & 32'h00000003) != 32'h0);
      end
    endcase
  end

  always @(*) begin
    case(value_LSU_ACCESS_WIDTH)
      LsuAccessWidth_B : begin
        Lsu_baseMask = 4'b0001;
      end
      LsuAccessWidth_H : begin
        Lsu_baseMask = 4'b0011;
      end
      default : begin
        Lsu_baseMask = 4'b1111;
      end
    endcase
  end

  assign Lsu_mask = (Lsu_baseMask <<< value_LSU_TARGET_ADDRESS[1 : 0]);
  always @(*) begin
    Lsu_busReady = 1'b0;
    if(when_Lsu_l308) begin
      if(Lsu_isActive) begin
        Lsu_busReady = (! (Lsu_dbusCtrl_currentCmd_valid || Lsu_dbusCtrl_currentCmd_ready));
      end
    end
  end

  assign when_Lsu_l300 = (Lsu_isActive && Lsu_misaligned);
  assign when_Lsu_l308 = (arbitration_isValid && (! Lsu_misaligned));
  assign _zz_StaticMemoryBackbone_dbus_cmd_payload_address = (value_LSU_TARGET_ADDRESS & 32'hfffffffc);
  always @(*) begin
    when_Lsu_l323 = 1'b0;
    if(when_Lsu_l318) begin
      when_Lsu_l323 = _zz_when_Lsu_l323;
    end
  end

  always @(*) begin
    _zz_out_RD_DATA = 32'h0;
    if(when_Lsu_l318) begin
      _zz_out_RD_DATA = _zz_out_RD_DATA_1;
    end
  end

  assign when_Lsu_l318 = (Lsu_busReady || Lsu_loadActive);
  always @(*) begin
    _zz_when_Lsu_l323 = 1'b0;
    if(StaticMemoryBackbone_dbus_rsp_valid) begin
      if(when_MemBus_l233) begin
        _zz_when_Lsu_l323 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_out_RD_DATA_1 = 32'h0;
    if(StaticMemoryBackbone_dbus_rsp_valid) begin
      if(when_MemBus_l233) begin
        _zz_out_RD_DATA_1 = StaticMemoryBackbone_dbus_rsp_payload_rdata;
      end
    end
  end

  always @(*) begin
    _zz_when_MemBus_l233 = 1'b0;
    if(!when_MemBus_l222) begin
      if(when_MemBus_l225) begin
        _zz_when_MemBus_l233 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_when_MemBus_l233_1 = 1'b0;
    if(when_MemBus_l222) begin
      _zz_when_MemBus_l233_1 = 1'b1;
    end
  end

  assign when_MemBus_l222 = (! (Lsu_dbusCtrl_currentCmd_valid || Lsu_dbusCtrl_currentCmd_ready));
  assign when_MemBus_l225 = (Lsu_dbusCtrl_currentCmd_cmd_address != _zz_StaticMemoryBackbone_dbus_cmd_payload_address);
  assign when_MemBus_l233 = (_zz_when_MemBus_l233_1 || ((! _zz_when_MemBus_l233) && (! Lsu_dbusCtrl_currentCmd_cmd_write)));
  always @(*) begin
    _zz_out_RD_DATA_2 = _zz_out_RD_DATA;
    case(value_LSU_ACCESS_WIDTH)
      LsuAccessWidth_H : begin
        if(value_LSU_IS_UNSIGNED) begin
          _zz_out_RD_DATA_2 = {_zz_out_RD_DATA_4,_zz_out_RD_DATA_3};
        end else begin
          _zz_out_RD_DATA_2 = {_zz_out_RD_DATA_6,_zz_out_RD_DATA_3};
        end
      end
      LsuAccessWidth_B : begin
        if(value_LSU_IS_UNSIGNED) begin
          _zz_out_RD_DATA_2 = {_zz_out_RD_DATA_8,_zz_out_RD_DATA_7};
        end else begin
          _zz_out_RD_DATA_2 = {_zz_out_RD_DATA_10,_zz_out_RD_DATA_7};
        end
      end
      default : begin
      end
    endcase
  end

  assign _zz_out_RD_DATA_3 = _zz_out_RD_DATA[{value_LSU_TARGET_ADDRESS[1],4'b0000} +: 16];
  assign _zz_1 = zz__zz_out_RD_DATA_4(1'b0);
  always @(*) _zz_out_RD_DATA_4 = _zz_1;
  assign _zz_out_RD_DATA_5 = _zz_out_RD_DATA_3[15];
  always @(*) begin
    _zz_out_RD_DATA_6[15] = _zz_out_RD_DATA_5;
    _zz_out_RD_DATA_6[14] = _zz_out_RD_DATA_5;
    _zz_out_RD_DATA_6[13] = _zz_out_RD_DATA_5;
    _zz_out_RD_DATA_6[12] = _zz_out_RD_DATA_5;
    _zz_out_RD_DATA_6[11] = _zz_out_RD_DATA_5;
    _zz_out_RD_DATA_6[10] = _zz_out_RD_DATA_5;
    _zz_out_RD_DATA_6[9] = _zz_out_RD_DATA_5;
    _zz_out_RD_DATA_6[8] = _zz_out_RD_DATA_5;
    _zz_out_RD_DATA_6[7] = _zz_out_RD_DATA_5;
    _zz_out_RD_DATA_6[6] = _zz_out_RD_DATA_5;
    _zz_out_RD_DATA_6[5] = _zz_out_RD_DATA_5;
    _zz_out_RD_DATA_6[4] = _zz_out_RD_DATA_5;
    _zz_out_RD_DATA_6[3] = _zz_out_RD_DATA_5;
    _zz_out_RD_DATA_6[2] = _zz_out_RD_DATA_5;
    _zz_out_RD_DATA_6[1] = _zz_out_RD_DATA_5;
    _zz_out_RD_DATA_6[0] = _zz_out_RD_DATA_5;
  end

  assign _zz_out_RD_DATA_7 = _zz_out_RD_DATA[{value_LSU_TARGET_ADDRESS[1 : 0],3'b000} +: 8];
  assign _zz_2 = zz__zz_out_RD_DATA_8(1'b0);
  always @(*) _zz_out_RD_DATA_8 = _zz_2;
  assign _zz_out_RD_DATA_9 = _zz_out_RD_DATA_7[7];
  always @(*) begin
    _zz_out_RD_DATA_10[23] = _zz_out_RD_DATA_9;
    _zz_out_RD_DATA_10[22] = _zz_out_RD_DATA_9;
    _zz_out_RD_DATA_10[21] = _zz_out_RD_DATA_9;
    _zz_out_RD_DATA_10[20] = _zz_out_RD_DATA_9;
    _zz_out_RD_DATA_10[19] = _zz_out_RD_DATA_9;
    _zz_out_RD_DATA_10[18] = _zz_out_RD_DATA_9;
    _zz_out_RD_DATA_10[17] = _zz_out_RD_DATA_9;
    _zz_out_RD_DATA_10[16] = _zz_out_RD_DATA_9;
    _zz_out_RD_DATA_10[15] = _zz_out_RD_DATA_9;
    _zz_out_RD_DATA_10[14] = _zz_out_RD_DATA_9;
    _zz_out_RD_DATA_10[13] = _zz_out_RD_DATA_9;
    _zz_out_RD_DATA_10[12] = _zz_out_RD_DATA_9;
    _zz_out_RD_DATA_10[11] = _zz_out_RD_DATA_9;
    _zz_out_RD_DATA_10[10] = _zz_out_RD_DATA_9;
    _zz_out_RD_DATA_10[9] = _zz_out_RD_DATA_9;
    _zz_out_RD_DATA_10[8] = _zz_out_RD_DATA_9;
    _zz_out_RD_DATA_10[7] = _zz_out_RD_DATA_9;
    _zz_out_RD_DATA_10[6] = _zz_out_RD_DATA_9;
    _zz_out_RD_DATA_10[5] = _zz_out_RD_DATA_9;
    _zz_out_RD_DATA_10[4] = _zz_out_RD_DATA_9;
    _zz_out_RD_DATA_10[3] = _zz_out_RD_DATA_9;
    _zz_out_RD_DATA_10[2] = _zz_out_RD_DATA_9;
    _zz_out_RD_DATA_10[1] = _zz_out_RD_DATA_9;
    _zz_out_RD_DATA_10[0] = _zz_out_RD_DATA_9;
  end

  assign Lsu_busAddress = (value_LSU_TARGET_ADDRESS & 32'hfffffffc);
  assign Lsu_isActive_1 = (value_LSU_OPERATION_TYPE == LsuOperationType_STORE);
  always @(*) begin
    case(value_LSU_ACCESS_WIDTH)
      LsuAccessWidth_B : begin
        Lsu_misaligned_1 = 1'b0;
      end
      LsuAccessWidth_H : begin
        Lsu_misaligned_1 = ((value_LSU_TARGET_ADDRESS & 32'h00000001) != 32'h0);
      end
      default : begin
        Lsu_misaligned_1 = ((value_LSU_TARGET_ADDRESS & 32'h00000003) != 32'h0);
      end
    endcase
  end

  always @(*) begin
    case(value_LSU_ACCESS_WIDTH)
      LsuAccessWidth_B : begin
        Lsu_baseMask_1 = 4'b0001;
      end
      LsuAccessWidth_H : begin
        Lsu_baseMask_1 = 4'b0011;
      end
      default : begin
        Lsu_baseMask_1 = 4'b1111;
      end
    endcase
  end

  assign Lsu_mask_1 = (Lsu_baseMask_1 <<< value_LSU_TARGET_ADDRESS[1 : 0]);
  assign when_Lsu_l386 = (Lsu_isActive_1 && Lsu_misaligned_1);
  assign when_Lsu_l394 = (arbitration_isValid && (! Lsu_misaligned_1));
  always @(*) begin
    _zz_StaticMemoryBackbone_dbus_cmd_payload_wdata = value_RS2_DATA;
    case(value_LSU_ACCESS_WIDTH)
      LsuAccessWidth_H : begin
        if(when_Lsu_l405) begin
          _zz_StaticMemoryBackbone_dbus_cmd_payload_wdata = ({16'd0,_zz_StaticMemoryBackbone_dbus_cmd_payload_wdata_1} <<< 5'd16);
        end else begin
          _zz_StaticMemoryBackbone_dbus_cmd_payload_wdata = {16'd0, _zz_StaticMemoryBackbone_dbus_cmd_payload_wdata_1};
        end
      end
      LsuAccessWidth_B : begin
        case(switch_Lsu_l414)
          2'b00 : begin
            _zz_StaticMemoryBackbone_dbus_cmd_payload_wdata = {24'd0, _zz_StaticMemoryBackbone_dbus_cmd_payload_wdata_2};
          end
          2'b01 : begin
            _zz_StaticMemoryBackbone_dbus_cmd_payload_wdata = {16'd0, _zz__zz_StaticMemoryBackbone_dbus_cmd_payload_wdata};
          end
          2'b10 : begin
            _zz_StaticMemoryBackbone_dbus_cmd_payload_wdata = {8'd0, _zz__zz_StaticMemoryBackbone_dbus_cmd_payload_wdata_1};
          end
          default : begin
            _zz_StaticMemoryBackbone_dbus_cmd_payload_wdata = ({24'd0,_zz_StaticMemoryBackbone_dbus_cmd_payload_wdata_2} <<< 5'd24);
          end
        endcase
      end
      default : begin
      end
    endcase
  end

  assign _zz_StaticMemoryBackbone_dbus_cmd_payload_wdata_1 = value_RS2_DATA[15 : 0];
  assign when_Lsu_l405 = value_LSU_TARGET_ADDRESS[1];
  assign _zz_StaticMemoryBackbone_dbus_cmd_payload_wdata_2 = value_RS2_DATA[7 : 0];
  assign switch_Lsu_l414 = value_LSU_TARGET_ADDRESS[1 : 0];
  always @(*) begin
    _zz_arbitration_isReady = 1'b0;
    if(StaticMemoryBackbone_dbus_cmd_ready) begin
      if(when_MemBus_l260) begin
        _zz_arbitration_isReady = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_when_MemBus_l260 = 1'b0;
    if(!when_MemBus_l249) begin
      if(when_MemBus_l252) begin
        _zz_when_MemBus_l260 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_when_MemBus_l260_1 = 1'b0;
    if(when_MemBus_l249) begin
      _zz_when_MemBus_l260_1 = 1'b1;
    end
  end

  assign when_MemBus_l249 = (! (Lsu_dbusCtrl_currentCmd_valid || Lsu_dbusCtrl_currentCmd_ready));
  assign when_MemBus_l252 = (Lsu_dbusCtrl_currentCmd_cmd_address != Lsu_busAddress);
  assign when_MemBus_l260 = (_zz_when_MemBus_l260_1 || ((! _zz_when_MemBus_l260) && Lsu_dbusCtrl_currentCmd_cmd_write));
  always @(*) begin
    TrapHandler_trapSignals_hasTrapped = 1'b0;
    if(TrapHandler_interruptSignals_hasTrapped) begin
      TrapHandler_trapSignals_hasTrapped = TrapHandler_interruptSignals_hasTrapped;
    end else begin
      TrapHandler_trapSignals_hasTrapped = TrapHandler_exceptionSignals_hasTrapped;
    end
  end

  always @(*) begin
    TrapHandler_trapSignals_trapCause = 4'bxxxx;
    if(TrapHandler_interruptSignals_hasTrapped) begin
      TrapHandler_trapSignals_trapCause = TrapHandler_interruptSignals_trapCause;
    end else begin
      TrapHandler_trapSignals_trapCause = TrapHandler_exceptionSignals_trapCause;
    end
  end

  always @(*) begin
    TrapHandler_trapSignals_trapVal = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(TrapHandler_interruptSignals_hasTrapped) begin
      TrapHandler_trapSignals_trapVal = TrapHandler_interruptSignals_trapVal;
    end else begin
      TrapHandler_trapSignals_trapVal = TrapHandler_exceptionSignals_trapVal;
    end
  end

  always @(*) begin
    TrapHandler_isInterrupt = 1'b0;
    if(TrapHandler_interruptSignals_hasTrapped) begin
      TrapHandler_isInterrupt = 1'b1;
    end
  end

  always @(*) begin
    _out_default_RD_TYPE = (1'bx);
    _out_default_RD_TYPE = in_RD_TYPE;
  end

  assign out_RD_TYPE = _out_default_RD_TYPE;
  always @(*) begin
    _out_default_RS2_TYPE = (1'bx);
    _out_default_RS2_TYPE = in_RS2_TYPE;
  end

  assign out_RS2_TYPE = _out_default_RS2_TYPE;
  always @(*) begin
    _out_default_RS2 = 5'bxxxxx;
    _out_default_RS2 = in_RS2;
  end

  assign out_RS2 = _out_default_RS2;
  always @(*) begin
    _out_default_IR = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    _out_default_IR = in_IR;
  end

  assign out_IR = _out_default_IR;
  always @(*) begin
    _out_default_RS1_DATA = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    _out_default_RS1_DATA = in_RS1_DATA;
  end

  assign out_RS1_DATA = _out_default_RS1_DATA;
  always @(*) begin
    _out_default_RS1 = 5'bxxxxx;
    _out_default_RS1 = in_RS1;
  end

  assign out_RS1 = _out_default_RS1;
  always @(*) begin
    _out_default_PC = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    _out_default_PC = in_PC;
  end

  assign out_PC = _out_default_PC;
  always @(*) begin
    _out_default_CSR_OP = (2'bxx);
    _out_default_CSR_OP = in_CSR_OP;
  end

  assign out_CSR_OP = _out_default_CSR_OP;
  always @(*) begin
    _out_default_RD = 5'bxxxxx;
    _out_default_RD = in_RD;
  end

  assign out_RD = _out_default_RD;
  always @(*) begin
    _out_default_CSR_USE_IMM = 1'bx;
    _out_default_CSR_USE_IMM = in_CSR_USE_IMM;
  end

  assign out_CSR_USE_IMM = _out_default_CSR_USE_IMM;
  always @(*) begin
    _out_default_MRET = 1'bx;
    _out_default_MRET = in_MRET;
  end

  assign out_MRET = _out_default_MRET;
  always @(*) begin
    _out_default_NEXT_PC = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    _out_default_NEXT_PC = in_NEXT_PC;
  end

  assign out_NEXT_PC = _out_default_NEXT_PC;
  always @(*) begin
    _out_default_RS1_TYPE = (1'bx);
    _out_default_RS1_TYPE = in_RS1_TYPE;
  end

  assign out_RS1_TYPE = _out_default_RS1_TYPE;
  assign value_LSU_OPERATION_TYPE = in_LSU_OPERATION_TYPE;
  assign value_LSU_TARGET_ADDRESS = out_LSU_TARGET_ADDRESS;
  assign value_ALU_RESULT = in_ALU_RESULT;
  assign value_LSU_IS_UNSIGNED = in_LSU_IS_UNSIGNED;
  assign value_RS2_DATA = in_RS2_DATA;
  assign value_LSU_ACCESS_WIDTH = in_LSU_ACCESS_WIDTH;
  assign value_LSU_TARGET_VALID = out_LSU_TARGET_VALID;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      Lsu_dbusCtrl_currentCmd_valid <= 1'b0;
      Lsu_dbusCtrl_currentCmd_ready <= 1'b0;
      Lsu_loadActive <= 1'b0;
    end else begin
      if(when_MemBus_l166) begin
        Lsu_dbusCtrl_currentCmd_ready <= 1'b1;
        Lsu_dbusCtrl_currentCmd_valid <= 1'b0;
      end
      if(StaticMemoryBackbone_dbus_rsp_valid) begin
        Lsu_dbusCtrl_currentCmd_ready <= 1'b0;
        Lsu_dbusCtrl_currentCmd_valid <= 1'b0;
      end
      if(when_Lsu_l308) begin
        if(Lsu_isActive) begin
          if(Lsu_busReady) begin
            Lsu_loadActive <= 1'b1;
          end
          if(when_Lsu_l318) begin
            if(when_MemBus_l222) begin
              if(StaticMemoryBackbone_dbus_cmd_ready) begin
                Lsu_dbusCtrl_currentCmd_valid <= 1'b0;
                Lsu_dbusCtrl_currentCmd_ready <= 1'b1;
              end else begin
                Lsu_dbusCtrl_currentCmd_valid <= 1'b1;
                Lsu_dbusCtrl_currentCmd_ready <= 1'b0;
              end
            end
            if(StaticMemoryBackbone_dbus_rsp_valid) begin
              Lsu_dbusCtrl_currentCmd_valid <= 1'b0;
              Lsu_dbusCtrl_currentCmd_ready <= 1'b0;
            end
          end
          if(when_Lsu_l323) begin
            Lsu_loadActive <= 1'b0;
          end
        end
      end else begin
        Lsu_loadActive <= 1'b0;
        Lsu_dbusCtrl_currentCmd_valid <= 1'b0;
        Lsu_dbusCtrl_currentCmd_ready <= 1'b0;
      end
      if(when_Lsu_l394) begin
        if(Lsu_isActive_1) begin
          if(when_MemBus_l249) begin
            if(StaticMemoryBackbone_dbus_cmd_ready) begin
              Lsu_dbusCtrl_currentCmd_valid <= 1'b0;
              Lsu_dbusCtrl_currentCmd_ready <= 1'b1;
            end else begin
              Lsu_dbusCtrl_currentCmd_valid <= 1'b1;
              Lsu_dbusCtrl_currentCmd_ready <= 1'b0;
            end
          end
          if(StaticMemoryBackbone_dbus_cmd_ready) begin
            Lsu_dbusCtrl_currentCmd_valid <= 1'b0;
            Lsu_dbusCtrl_currentCmd_ready <= 1'b0;
          end
        end
      end
    end
  end

  always @(posedge clk) begin
    if(when_Lsu_l308) begin
      if(Lsu_isActive) begin
        if(when_Lsu_l318) begin
          if(when_MemBus_l222) begin
            Lsu_dbusCtrl_currentCmd_cmd_address <= _zz_StaticMemoryBackbone_dbus_cmd_payload_address;
            Lsu_dbusCtrl_currentCmd_cmd_write <= 1'b0;
          end
        end
      end
    end
    if(when_Lsu_l394) begin
      if(Lsu_isActive_1) begin
        if(when_MemBus_l249) begin
          Lsu_dbusCtrl_currentCmd_cmd_address <= Lsu_busAddress;
          Lsu_dbusCtrl_currentCmd_cmd_write <= 1'b1;
          Lsu_dbusCtrl_currentCmd_cmd_wdata <= _zz_StaticMemoryBackbone_dbus_cmd_payload_wdata;
          Lsu_dbusCtrl_currentCmd_cmd_wmask <= Lsu_mask_1;
        end
      end
    end
  end


endmodule

module Stage_EX (
  input  wire          arbitration_isValid,
  input  wire          arbitration_isStalled,
  output reg           arbitration_isReady,
  output wire          arbitration_isDone,
  output reg           arbitration_rs1Needed,
  output reg           arbitration_rs2Needed,
  output reg           arbitration_jumpRequested,
  output wire          arbitration_isAvailable,
  output reg  [31:0]   out_RD_DATA,
  output reg           out_RD_DATA_VALID,
  output reg  [31:0]   out_ALU_RESULT,
  output reg  [31:0]   out_NEXT_PC,
  input  wire [31:0]   in_NEXT_PC,
  output reg           out_HAS_TRAPPED,
  output reg           out_TRAP_IS_INTERRUPT,
  output reg  [3:0]    out_TRAP_CAUSE,
  output reg  [31:0]   out_TRAP_VAL,
  input  wire [2:0]    in_BU_CONDITION,
  input  wire [1:0]    in_SHIFT_OP,
  input  wire          in_MUL,
  input  wire          in_EBREAK,
  input  wire [31:0]   in_RS1_DATA,
  input  wire          in_IMM_USED,
  input  wire          in_BU_IS_BRANCH,
  input  wire [2:0]    in_ALU_OP,
  input  wire          in_REM,
  input  wire          in_ALU_COMMIT_RESULT,
  input  wire          in_BU_WRITE_RET_ADDR_TO_RD,
  input  wire [31:0]   in_PC,
  input  wire          in_ECALL,
  input  wire [31:0]   in_RS2_DATA,
  input  wire [0:0]    in_ALU_SRC1,
  input  wire          in_MUL_HIGH,
  input  wire          in_BU_IGNORE_TARGET_LSB,
  input  wire          in_DIV,
  input  wire          in_MRET,
  input  wire [31:0]   in_IMM,
  input  wire [0:0]    in_ALU_SRC2,
  input  wire          in_MULDIV_RS2_SIGNED,
  input  wire          in_MULDIV_RS1_SIGNED,
  input  wire [0:0]    in_RD_TYPE,
  output wire [0:0]    out_RD_TYPE,
  input  wire          in_TRAP_IS_INTERRUPT,
  input  wire [0:0]    in_RS2_TYPE,
  output wire [0:0]    out_RS2_TYPE,
  input  wire [4:0]    in_RS2,
  output wire [4:0]    out_RS2,
  input  wire [31:0]   in_IR,
  output wire [31:0]   out_IR,
  output wire [31:0]   out_RS1_DATA,
  input  wire [4:0]    in_RS1,
  output wire [4:0]    out_RS1,
  input  wire [1:0]    in_LSU_OPERATION_TYPE,
  output wire [1:0]    out_LSU_OPERATION_TYPE,
  input  wire [31:0]   in_TRAP_VAL,
  output wire [31:0]   out_PC,
  input  wire          in_HAS_TRAPPED,
  input  wire [3:0]    in_TRAP_CAUSE,
  input  wire          in_LSU_IS_UNSIGNED,
  output wire          out_LSU_IS_UNSIGNED,
  input  wire [1:0]    in_CSR_OP,
  output wire [1:0]    out_CSR_OP,
  output wire [31:0]   out_RS2_DATA,
  input  wire [4:0]    in_RD,
  output wire [4:0]    out_RD,
  input  wire          in_CSR_USE_IMM,
  output wire          out_CSR_USE_IMM,
  input  wire          in_RD_DATA_VALID,
  output wire          out_MRET,
  input  wire [1:0]    in_LSU_ACCESS_WIDTH,
  output wire [1:0]    out_LSU_ACCESS_WIDTH,
  input  wire [0:0]    in_RS1_TYPE,
  output wire [0:0]    out_RS1_TYPE,
  input  wire          in_LSU_TARGET_VALID,
  output wire          out_LSU_TARGET_VALID,
  input  wire          clk,
  input  wire          reset
);
  localparam AluOp_ADD = 3'd0;
  localparam AluOp_SUB = 3'd1;
  localparam AluOp_SLT = 3'd2;
  localparam AluOp_SLTU = 3'd3;
  localparam AluOp_XOR_1 = 3'd4;
  localparam AluOp_OR_1 = 3'd5;
  localparam AluOp_AND_1 = 3'd6;
  localparam AluOp_SRC2 = 3'd7;
  localparam Src1Select_RS1 = 1'd0;
  localparam Src1Select_PC = 1'd1;
  localparam Src2Select_RS2 = 1'd0;
  localparam Src2Select_IMM = 1'd1;
  localparam ShiftOp_NONE = 2'd0;
  localparam ShiftOp_SLL_1 = 2'd1;
  localparam ShiftOp_SRL_1 = 2'd2;
  localparam ShiftOp_SRA_1 = 2'd3;
  localparam BranchCondition_NONE = 3'd0;
  localparam BranchCondition_EQ = 3'd1;
  localparam BranchCondition_NE = 3'd2;
  localparam BranchCondition_LT = 3'd3;
  localparam BranchCondition_GE = 3'd4;
  localparam BranchCondition_LTU = 3'd5;
  localparam BranchCondition_GEU = 3'd6;
  localparam RegisterType_NONE = 1'd0;
  localparam RegisterType_GPR = 1'd1;
  localparam LsuOperationType_NONE = 2'd0;
  localparam LsuOperationType_LOAD = 2'd1;
  localparam LsuOperationType_STORE = 2'd2;
  localparam CsrOp_NONE = 2'd0;
  localparam CsrOp_RW = 2'd1;
  localparam CsrOp_RS = 2'd2;
  localparam CsrOp_RC = 2'd3;
  localparam LsuAccessWidth_B = 2'd0;
  localparam LsuAccessWidth_H = 2'd1;
  localparam LsuAccessWidth_W = 2'd2;

  wire       [0:0]    _zz_IntAlu_result;
  wire       [31:0]   _zz_IntAlu_result_1;
  wire       [31:0]   _zz_IntAlu_result_2;
  wire       [0:0]    _zz_IntAlu_result_3;
  wire       [31:0]   _zz_Shifter_result;
  wire       [31:0]   _zz_Shifter_result_1;
  wire       [31:0]   _zz_BranchUnit_lt;
  wire       [31:0]   _zz_BranchUnit_lt_1;
  wire       [5:0]    _zz_MulDiv_step_valueNext;
  wire       [0:0]    _zz_MulDiv_step_valueNext_1;
  wire       [31:0]   _zz_when_MulDiv_l119;
  wire       [5:0]    _zz_MulDiv_step_valueNext_1_1;
  wire       [0:0]    _zz_MulDiv_step_valueNext_1_2;
  wire       [31:0]   _zz_when_MulDiv_l220;
  wire       [31:0]   _zz__zz_when_MulDiv_l216;
  wire       [31:0]   _zz__zz_MulDiv_remainder;
  wire       [31:0]   _zz_MulDiv_quotient_1;
  reg        [31:0]   _out_default_TRAP_VAL;
  reg        [3:0]    _out_default_TRAP_CAUSE;
  reg                 _out_default_TRAP_IS_INTERRUPT;
  reg                 _out_default_HAS_TRAPPED;
  reg        [31:0]   _out_default_NEXT_PC;
  wire       [31:0]   _out_default_ALU_RESULT;
  reg                 _out_default_RD_DATA_VALID;
  wire       [31:0]   _out_default_RD_DATA;
  wire                TrapHandler_interruptSignals_hasTrapped;
  wire       [3:0]    TrapHandler_interruptSignals_trapCause;
  wire       [31:0]   TrapHandler_interruptSignals_trapVal;
  reg                 TrapHandler_exceptionSignals_hasTrapped;
  reg        [3:0]    TrapHandler_exceptionSignals_trapCause;
  reg        [31:0]   TrapHandler_exceptionSignals_trapVal;
  wire       [2:0]    value_ALU_OP;
  reg        [31:0]   IntAlu_src1;
  reg        [31:0]   IntAlu_src2;
  wire       [0:0]    value_ALU_SRC1;
  wire       [31:0]   value_RS1_DATA;
  wire       [31:0]   value_PC;
  wire       [0:0]    value_ALU_SRC2;
  wire       [31:0]   value_RS2_DATA;
  wire       [31:0]   value_IMM;
  reg        [31:0]   IntAlu_result;
  wire                value_ALU_COMMIT_RESULT;
  wire       [31:0]   Shifter_src;
  reg        [4:0]    Shifter_shamt;
  wire                value_IMM_USED;
  wire       [1:0]    value_SHIFT_OP;
  reg        [31:0]   Shifter_result;
  wire                when_Shifter_l73;
  reg        [31:0]   BranchUnit_target;
  wire       [31:0]   value_ALU_RESULT;
  wire                value_BU_IGNORE_TARGET_LSB;
  wire                BranchUnit_misaligned;
  wire       [31:0]   BranchUnit_src1;
  wire       [31:0]   BranchUnit_src2;
  wire                BranchUnit_eq;
  wire                BranchUnit_ne;
  wire                BranchUnit_lt;
  wire                BranchUnit_ltu;
  wire                BranchUnit_ge;
  wire                BranchUnit_geu;
  wire       [2:0]    value_BU_CONDITION;
  reg                 BranchUnit_branchTaken;
  wire                value_BU_IS_BRANCH;
  wire                when_BranchUnit_l126;
  wire                when_BranchUnit_l127;
  wire                when_BranchUnit_l132;
  wire                when_PcManager_l49;
  wire                value_BU_WRITE_RET_ADDR_TO_RD;
  wire                value_ECALL;
  wire                value_EBREAK;
  reg                 TrapHandler_trapSignals_hasTrapped;
  reg        [3:0]    TrapHandler_trapSignals_trapCause;
  reg        [31:0]   TrapHandler_trapSignals_trapVal;
  reg                 TrapHandler_isInterrupt;
  wire                value_HAS_TRAPPED;
  wire                value_TRAP_IS_INTERRUPT;
  wire       [3:0]    value_TRAP_CAUSE;
  wire       [31:0]   value_TRAP_VAL;
  wire                value_MRET;
  reg        [63:0]   MulDiv_product;
  wire       [31:0]   MulDiv_productH;
  wire       [31:0]   MulDiv_productL;
  reg                 MulDiv_initMul;
  reg                 MulDiv_step_willIncrement;
  reg                 MulDiv_step_willClear;
  reg        [5:0]    MulDiv_step_valueNext;
  reg        [5:0]    MulDiv_step_value;
  wire                MulDiv_step_willOverflowIfInc;
  wire                MulDiv_step_willOverflow;
  reg        [32:0]   MulDiv_multiplicand;
  reg        [31:0]   MulDiv_multiplier;
  wire                value_MUL;
  wire                when_MulDiv_l104;
  wire                when_MulDiv_l108;
  wire                when_MulDiv_l113;
  wire                when_MulDiv_l119;
  wire       [31:0]   _zz_MulDiv_multiplicand;
  wire       [0:0]    _zz_MulDiv_multiplicand_1;
  wire       [0:0]    _zz_MulDiv_multiplicand_2;
  wire       [0:0]    _zz_MulDiv_multiplicand_3;
  reg        [32:0]   _zz_MulDiv_product;
  wire                when_MulDiv_l151;
  wire       [0:0]    _zz_MulDiv_product_1;
  wire       [0:0]    _zz_MulDiv_product_2;
  reg        [32:0]   _zz_MulDiv_product_3;
  wire                when_MulDiv_l159;
  wire                value_MULDIV_RS2_SIGNED;
  wire                value_MULDIV_RS1_SIGNED;
  wire                value_MUL_HIGH;
  reg        [31:0]   MulDiv_quotient;
  reg        [31:0]   MulDiv_remainder;
  reg                 MulDiv_initDiv;
  reg                 MulDiv_step_willIncrement_1;
  reg                 MulDiv_step_willClear_1;
  reg        [5:0]    MulDiv_step_valueNext_1;
  reg        [5:0]    MulDiv_step_value_1;
  wire                MulDiv_step_willOverflowIfInc_1;
  wire                MulDiv_step_willOverflow_1;
  wire                value_DIV;
  wire                when_MulDiv_l181;
  wire                when_MulDiv_l185;
  wire                when_MulDiv_l190;
  wire                when_MulDiv_l220;
  wire                _zz_when_MulDiv_l216;
  wire       [31:0]   _zz_MulDiv_remainder;
  wire                when_MulDiv_l201;
  reg        [31:0]   _zz_out_RD_DATA;
  reg        [31:0]   _zz_out_RD_DATA_1;
  wire                when_MulDiv_l216;
  wire       [31:0]   _zz_MulDiv_remainder_1;
  reg                 _zz_MulDiv_quotient;
  wire                when_MulDiv_l234;
  wire                value_REM;
  reg        [0:0]    _out_default_RD_TYPE;
  reg        [0:0]    _out_default_RS2_TYPE;
  reg        [4:0]    _out_default_RS2;
  reg        [31:0]   _out_default_IR;
  reg        [31:0]   _out_default_RS1_DATA;
  reg        [4:0]    _out_default_RS1;
  reg        [1:0]    _out_default_LSU_OPERATION_TYPE;
  reg        [31:0]   _out_default_PC;
  reg                 _out_default_LSU_IS_UNSIGNED;
  reg        [1:0]    _out_default_CSR_OP;
  reg        [31:0]   _out_default_RS2_DATA;
  reg        [4:0]    _out_default_RD;
  reg                 _out_default_CSR_USE_IMM;
  reg                 _out_default_MRET;
  reg        [1:0]    _out_default_LSU_ACCESS_WIDTH;
  reg        [0:0]    _out_default_RS1_TYPE;
  reg                 _out_default_LSU_TARGET_VALID;
  `ifndef SYNTHESIS
  reg [39:0] value_ALU_OP_string;
  reg [23:0] value_ALU_SRC1_string;
  reg [23:0] value_ALU_SRC2_string;
  reg [39:0] value_SHIFT_OP_string;
  reg [31:0] value_BU_CONDITION_string;
  reg [31:0] in_BU_CONDITION_string;
  reg [39:0] in_SHIFT_OP_string;
  reg [39:0] in_ALU_OP_string;
  reg [23:0] in_ALU_SRC1_string;
  reg [23:0] in_ALU_SRC2_string;
  reg [31:0] in_RD_TYPE_string;
  reg [31:0] out_RD_TYPE_string;
  reg [31:0] _out_default_RD_TYPE_string;
  reg [31:0] in_RS2_TYPE_string;
  reg [31:0] out_RS2_TYPE_string;
  reg [31:0] _out_default_RS2_TYPE_string;
  reg [39:0] in_LSU_OPERATION_TYPE_string;
  reg [39:0] out_LSU_OPERATION_TYPE_string;
  reg [39:0] _out_default_LSU_OPERATION_TYPE_string;
  reg [31:0] in_CSR_OP_string;
  reg [31:0] out_CSR_OP_string;
  reg [31:0] _out_default_CSR_OP_string;
  reg [7:0] in_LSU_ACCESS_WIDTH_string;
  reg [7:0] out_LSU_ACCESS_WIDTH_string;
  reg [7:0] _out_default_LSU_ACCESS_WIDTH_string;
  reg [31:0] in_RS1_TYPE_string;
  reg [31:0] out_RS1_TYPE_string;
  reg [31:0] _out_default_RS1_TYPE_string;
  `endif


  assign _zz_IntAlu_result = ($signed(_zz_IntAlu_result_1) < $signed(_zz_IntAlu_result_2));
  assign _zz_IntAlu_result_1 = IntAlu_src1;
  assign _zz_IntAlu_result_2 = IntAlu_src2;
  assign _zz_IntAlu_result_3 = (IntAlu_src1 < IntAlu_src2);
  assign _zz_Shifter_result = ($signed(_zz_Shifter_result_1) >>> Shifter_shamt);
  assign _zz_Shifter_result_1 = Shifter_src;
  assign _zz_BranchUnit_lt = BranchUnit_src1;
  assign _zz_BranchUnit_lt_1 = BranchUnit_src2;
  assign _zz_MulDiv_step_valueNext_1 = MulDiv_step_willIncrement;
  assign _zz_MulDiv_step_valueNext = {5'd0, _zz_MulDiv_step_valueNext_1};
  assign _zz_when_MulDiv_l119 = value_RS2_DATA;
  assign _zz_MulDiv_step_valueNext_1_2 = MulDiv_step_willIncrement_1;
  assign _zz_MulDiv_step_valueNext_1_1 = {5'd0, _zz_MulDiv_step_valueNext_1_2};
  assign _zz_when_MulDiv_l220 = value_RS1_DATA;
  assign _zz__zz_when_MulDiv_l216 = value_RS2_DATA;
  assign _zz__zz_MulDiv_remainder = ((~ value_RS2_DATA) + 32'h00000001);
  assign _zz_MulDiv_quotient_1 = ((~ value_RS1_DATA) + 32'h00000001);
  `ifndef SYNTHESIS
  always @(*) begin
    case(value_ALU_OP)
      AluOp_ADD : value_ALU_OP_string = "ADD  ";
      AluOp_SUB : value_ALU_OP_string = "SUB  ";
      AluOp_SLT : value_ALU_OP_string = "SLT  ";
      AluOp_SLTU : value_ALU_OP_string = "SLTU ";
      AluOp_XOR_1 : value_ALU_OP_string = "XOR_1";
      AluOp_OR_1 : value_ALU_OP_string = "OR_1 ";
      AluOp_AND_1 : value_ALU_OP_string = "AND_1";
      AluOp_SRC2 : value_ALU_OP_string = "SRC2 ";
      default : value_ALU_OP_string = "?????";
    endcase
  end
  always @(*) begin
    case(value_ALU_SRC1)
      Src1Select_RS1 : value_ALU_SRC1_string = "RS1";
      Src1Select_PC : value_ALU_SRC1_string = "PC ";
      default : value_ALU_SRC1_string = "???";
    endcase
  end
  always @(*) begin
    case(value_ALU_SRC2)
      Src2Select_RS2 : value_ALU_SRC2_string = "RS2";
      Src2Select_IMM : value_ALU_SRC2_string = "IMM";
      default : value_ALU_SRC2_string = "???";
    endcase
  end
  always @(*) begin
    case(value_SHIFT_OP)
      ShiftOp_NONE : value_SHIFT_OP_string = "NONE ";
      ShiftOp_SLL_1 : value_SHIFT_OP_string = "SLL_1";
      ShiftOp_SRL_1 : value_SHIFT_OP_string = "SRL_1";
      ShiftOp_SRA_1 : value_SHIFT_OP_string = "SRA_1";
      default : value_SHIFT_OP_string = "?????";
    endcase
  end
  always @(*) begin
    case(value_BU_CONDITION)
      BranchCondition_NONE : value_BU_CONDITION_string = "NONE";
      BranchCondition_EQ : value_BU_CONDITION_string = "EQ  ";
      BranchCondition_NE : value_BU_CONDITION_string = "NE  ";
      BranchCondition_LT : value_BU_CONDITION_string = "LT  ";
      BranchCondition_GE : value_BU_CONDITION_string = "GE  ";
      BranchCondition_LTU : value_BU_CONDITION_string = "LTU ";
      BranchCondition_GEU : value_BU_CONDITION_string = "GEU ";
      default : value_BU_CONDITION_string = "????";
    endcase
  end
  always @(*) begin
    case(in_BU_CONDITION)
      BranchCondition_NONE : in_BU_CONDITION_string = "NONE";
      BranchCondition_EQ : in_BU_CONDITION_string = "EQ  ";
      BranchCondition_NE : in_BU_CONDITION_string = "NE  ";
      BranchCondition_LT : in_BU_CONDITION_string = "LT  ";
      BranchCondition_GE : in_BU_CONDITION_string = "GE  ";
      BranchCondition_LTU : in_BU_CONDITION_string = "LTU ";
      BranchCondition_GEU : in_BU_CONDITION_string = "GEU ";
      default : in_BU_CONDITION_string = "????";
    endcase
  end
  always @(*) begin
    case(in_SHIFT_OP)
      ShiftOp_NONE : in_SHIFT_OP_string = "NONE ";
      ShiftOp_SLL_1 : in_SHIFT_OP_string = "SLL_1";
      ShiftOp_SRL_1 : in_SHIFT_OP_string = "SRL_1";
      ShiftOp_SRA_1 : in_SHIFT_OP_string = "SRA_1";
      default : in_SHIFT_OP_string = "?????";
    endcase
  end
  always @(*) begin
    case(in_ALU_OP)
      AluOp_ADD : in_ALU_OP_string = "ADD  ";
      AluOp_SUB : in_ALU_OP_string = "SUB  ";
      AluOp_SLT : in_ALU_OP_string = "SLT  ";
      AluOp_SLTU : in_ALU_OP_string = "SLTU ";
      AluOp_XOR_1 : in_ALU_OP_string = "XOR_1";
      AluOp_OR_1 : in_ALU_OP_string = "OR_1 ";
      AluOp_AND_1 : in_ALU_OP_string = "AND_1";
      AluOp_SRC2 : in_ALU_OP_string = "SRC2 ";
      default : in_ALU_OP_string = "?????";
    endcase
  end
  always @(*) begin
    case(in_ALU_SRC1)
      Src1Select_RS1 : in_ALU_SRC1_string = "RS1";
      Src1Select_PC : in_ALU_SRC1_string = "PC ";
      default : in_ALU_SRC1_string = "???";
    endcase
  end
  always @(*) begin
    case(in_ALU_SRC2)
      Src2Select_RS2 : in_ALU_SRC2_string = "RS2";
      Src2Select_IMM : in_ALU_SRC2_string = "IMM";
      default : in_ALU_SRC2_string = "???";
    endcase
  end
  always @(*) begin
    case(in_RD_TYPE)
      RegisterType_NONE : in_RD_TYPE_string = "NONE";
      RegisterType_GPR : in_RD_TYPE_string = "GPR ";
      default : in_RD_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(out_RD_TYPE)
      RegisterType_NONE : out_RD_TYPE_string = "NONE";
      RegisterType_GPR : out_RD_TYPE_string = "GPR ";
      default : out_RD_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_out_default_RD_TYPE)
      RegisterType_NONE : _out_default_RD_TYPE_string = "NONE";
      RegisterType_GPR : _out_default_RD_TYPE_string = "GPR ";
      default : _out_default_RD_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(in_RS2_TYPE)
      RegisterType_NONE : in_RS2_TYPE_string = "NONE";
      RegisterType_GPR : in_RS2_TYPE_string = "GPR ";
      default : in_RS2_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(out_RS2_TYPE)
      RegisterType_NONE : out_RS2_TYPE_string = "NONE";
      RegisterType_GPR : out_RS2_TYPE_string = "GPR ";
      default : out_RS2_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_out_default_RS2_TYPE)
      RegisterType_NONE : _out_default_RS2_TYPE_string = "NONE";
      RegisterType_GPR : _out_default_RS2_TYPE_string = "GPR ";
      default : _out_default_RS2_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(in_LSU_OPERATION_TYPE)
      LsuOperationType_NONE : in_LSU_OPERATION_TYPE_string = "NONE ";
      LsuOperationType_LOAD : in_LSU_OPERATION_TYPE_string = "LOAD ";
      LsuOperationType_STORE : in_LSU_OPERATION_TYPE_string = "STORE";
      default : in_LSU_OPERATION_TYPE_string = "?????";
    endcase
  end
  always @(*) begin
    case(out_LSU_OPERATION_TYPE)
      LsuOperationType_NONE : out_LSU_OPERATION_TYPE_string = "NONE ";
      LsuOperationType_LOAD : out_LSU_OPERATION_TYPE_string = "LOAD ";
      LsuOperationType_STORE : out_LSU_OPERATION_TYPE_string = "STORE";
      default : out_LSU_OPERATION_TYPE_string = "?????";
    endcase
  end
  always @(*) begin
    case(_out_default_LSU_OPERATION_TYPE)
      LsuOperationType_NONE : _out_default_LSU_OPERATION_TYPE_string = "NONE ";
      LsuOperationType_LOAD : _out_default_LSU_OPERATION_TYPE_string = "LOAD ";
      LsuOperationType_STORE : _out_default_LSU_OPERATION_TYPE_string = "STORE";
      default : _out_default_LSU_OPERATION_TYPE_string = "?????";
    endcase
  end
  always @(*) begin
    case(in_CSR_OP)
      CsrOp_NONE : in_CSR_OP_string = "NONE";
      CsrOp_RW : in_CSR_OP_string = "RW  ";
      CsrOp_RS : in_CSR_OP_string = "RS  ";
      CsrOp_RC : in_CSR_OP_string = "RC  ";
      default : in_CSR_OP_string = "????";
    endcase
  end
  always @(*) begin
    case(out_CSR_OP)
      CsrOp_NONE : out_CSR_OP_string = "NONE";
      CsrOp_RW : out_CSR_OP_string = "RW  ";
      CsrOp_RS : out_CSR_OP_string = "RS  ";
      CsrOp_RC : out_CSR_OP_string = "RC  ";
      default : out_CSR_OP_string = "????";
    endcase
  end
  always @(*) begin
    case(_out_default_CSR_OP)
      CsrOp_NONE : _out_default_CSR_OP_string = "NONE";
      CsrOp_RW : _out_default_CSR_OP_string = "RW  ";
      CsrOp_RS : _out_default_CSR_OP_string = "RS  ";
      CsrOp_RC : _out_default_CSR_OP_string = "RC  ";
      default : _out_default_CSR_OP_string = "????";
    endcase
  end
  always @(*) begin
    case(in_LSU_ACCESS_WIDTH)
      LsuAccessWidth_B : in_LSU_ACCESS_WIDTH_string = "B";
      LsuAccessWidth_H : in_LSU_ACCESS_WIDTH_string = "H";
      LsuAccessWidth_W : in_LSU_ACCESS_WIDTH_string = "W";
      default : in_LSU_ACCESS_WIDTH_string = "?";
    endcase
  end
  always @(*) begin
    case(out_LSU_ACCESS_WIDTH)
      LsuAccessWidth_B : out_LSU_ACCESS_WIDTH_string = "B";
      LsuAccessWidth_H : out_LSU_ACCESS_WIDTH_string = "H";
      LsuAccessWidth_W : out_LSU_ACCESS_WIDTH_string = "W";
      default : out_LSU_ACCESS_WIDTH_string = "?";
    endcase
  end
  always @(*) begin
    case(_out_default_LSU_ACCESS_WIDTH)
      LsuAccessWidth_B : _out_default_LSU_ACCESS_WIDTH_string = "B";
      LsuAccessWidth_H : _out_default_LSU_ACCESS_WIDTH_string = "H";
      LsuAccessWidth_W : _out_default_LSU_ACCESS_WIDTH_string = "W";
      default : _out_default_LSU_ACCESS_WIDTH_string = "?";
    endcase
  end
  always @(*) begin
    case(in_RS1_TYPE)
      RegisterType_NONE : in_RS1_TYPE_string = "NONE";
      RegisterType_GPR : in_RS1_TYPE_string = "GPR ";
      default : in_RS1_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(out_RS1_TYPE)
      RegisterType_NONE : out_RS1_TYPE_string = "NONE";
      RegisterType_GPR : out_RS1_TYPE_string = "GPR ";
      default : out_RS1_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_out_default_RS1_TYPE)
      RegisterType_NONE : _out_default_RS1_TYPE_string = "NONE";
      RegisterType_GPR : _out_default_RS1_TYPE_string = "GPR ";
      default : _out_default_RS1_TYPE_string = "????";
    endcase
  end
  `endif

  always @(*) begin
    _out_default_TRAP_VAL = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    _out_default_TRAP_VAL = in_TRAP_VAL;
  end

  always @(*) begin
    out_TRAP_VAL = _out_default_TRAP_VAL;
    if(TrapHandler_trapSignals_hasTrapped) begin
      out_TRAP_VAL = TrapHandler_trapSignals_trapVal;
    end
  end

  always @(*) begin
    _out_default_TRAP_CAUSE = 4'bxxxx;
    _out_default_TRAP_CAUSE = in_TRAP_CAUSE;
  end

  always @(*) begin
    out_TRAP_CAUSE = _out_default_TRAP_CAUSE;
    if(TrapHandler_trapSignals_hasTrapped) begin
      out_TRAP_CAUSE = TrapHandler_trapSignals_trapCause;
    end
  end

  always @(*) begin
    _out_default_TRAP_IS_INTERRUPT = 1'bx;
    _out_default_TRAP_IS_INTERRUPT = in_TRAP_IS_INTERRUPT;
  end

  always @(*) begin
    out_TRAP_IS_INTERRUPT = _out_default_TRAP_IS_INTERRUPT;
    if(TrapHandler_trapSignals_hasTrapped) begin
      out_TRAP_IS_INTERRUPT = TrapHandler_isInterrupt;
    end
  end

  always @(*) begin
    _out_default_HAS_TRAPPED = 1'bx;
    _out_default_HAS_TRAPPED = in_HAS_TRAPPED;
  end

  always @(*) begin
    out_HAS_TRAPPED = _out_default_HAS_TRAPPED;
    if(TrapHandler_trapSignals_hasTrapped) begin
      out_HAS_TRAPPED = 1'b1;
    end
  end

  always @(*) begin
    _out_default_NEXT_PC = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    _out_default_NEXT_PC = in_NEXT_PC;
  end

  always @(*) begin
    out_NEXT_PC = _out_default_NEXT_PC;
    if(when_BranchUnit_l126) begin
      if(when_BranchUnit_l132) begin
        if(!when_PcManager_l49) begin
          out_NEXT_PC = BranchUnit_target;
        end
      end
    end
  end

  assign _out_default_ALU_RESULT = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
  always @(*) begin
    out_ALU_RESULT = _out_default_ALU_RESULT;
    if(!value_ALU_COMMIT_RESULT) begin
      out_ALU_RESULT = IntAlu_result;
    end
  end

  always @(*) begin
    _out_default_RD_DATA_VALID = 1'bx;
    _out_default_RD_DATA_VALID = in_RD_DATA_VALID;
  end

  always @(*) begin
    out_RD_DATA_VALID = _out_default_RD_DATA_VALID;
    if(value_ALU_COMMIT_RESULT) begin
      out_RD_DATA_VALID = 1'b1;
    end
    if(when_Shifter_l73) begin
      out_RD_DATA_VALID = 1'b1;
    end
    if(when_BranchUnit_l126) begin
      if(when_BranchUnit_l132) begin
        if(value_BU_WRITE_RET_ADDR_TO_RD) begin
          out_RD_DATA_VALID = 1'b1;
        end
      end
    end
    if(when_MulDiv_l113) begin
      if(!MulDiv_initMul) begin
        if(MulDiv_step_willOverflowIfInc) begin
          out_RD_DATA_VALID = 1'b1;
        end
      end
    end
    if(when_MulDiv_l190) begin
      if(when_MulDiv_l201) begin
        out_RD_DATA_VALID = 1'b1;
      end else begin
        if(!MulDiv_initDiv) begin
          if(MulDiv_step_willOverflowIfInc_1) begin
            out_RD_DATA_VALID = 1'b1;
          end
        end
      end
    end
  end

  assign _out_default_RD_DATA = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
  always @(*) begin
    out_RD_DATA = _out_default_RD_DATA;
    if(value_ALU_COMMIT_RESULT) begin
      out_RD_DATA = IntAlu_result;
    end
    if(when_Shifter_l73) begin
      out_RD_DATA = Shifter_result;
    end
    if(when_BranchUnit_l126) begin
      if(when_BranchUnit_l132) begin
        if(value_BU_WRITE_RET_ADDR_TO_RD) begin
          out_RD_DATA = in_NEXT_PC;
        end
      end
    end
    if(when_MulDiv_l113) begin
      if(!MulDiv_initMul) begin
        if(MulDiv_step_willOverflowIfInc) begin
          out_RD_DATA = (value_MUL_HIGH ? MulDiv_productH : MulDiv_productL);
        end
      end
    end
    if(when_MulDiv_l190) begin
      if(when_MulDiv_l201) begin
        out_RD_DATA = (value_REM ? value_RS1_DATA : 32'hffffffff);
      end else begin
        if(!MulDiv_initDiv) begin
          if(MulDiv_step_willOverflowIfInc_1) begin
            out_RD_DATA = (value_REM ? _zz_out_RD_DATA_1 : _zz_out_RD_DATA);
          end
        end
      end
    end
  end

  assign arbitration_isAvailable = ((! arbitration_isValid) || arbitration_isDone);
  always @(*) begin
    arbitration_isReady = 1'b1;
    if(when_MulDiv_l113) begin
      arbitration_isReady = 1'b0;
      if(!MulDiv_initMul) begin
        if(MulDiv_step_willOverflowIfInc) begin
          arbitration_isReady = 1'b1;
        end
      end
    end
    if(when_MulDiv_l190) begin
      arbitration_isReady = 1'b0;
      if(when_MulDiv_l201) begin
        arbitration_isReady = 1'b1;
      end else begin
        if(!MulDiv_initDiv) begin
          if(MulDiv_step_willOverflowIfInc_1) begin
            arbitration_isReady = 1'b1;
          end
        end
      end
    end
  end

  always @(*) begin
    arbitration_rs1Needed = 1'b0;
    case(value_ALU_SRC1)
      Src1Select_RS1 : begin
        arbitration_rs1Needed = 1'b1;
      end
      default : begin
      end
    endcase
    if(when_Shifter_l73) begin
      arbitration_rs1Needed = 1'b1;
    end
    if(when_BranchUnit_l126) begin
      if(when_BranchUnit_l127) begin
        arbitration_rs1Needed = 1'b1;
      end
    end
    if(when_MulDiv_l108) begin
      arbitration_rs1Needed = 1'b1;
    end
    if(when_MulDiv_l185) begin
      arbitration_rs1Needed = 1'b1;
    end
  end

  always @(*) begin
    arbitration_rs2Needed = 1'b0;
    case(value_ALU_SRC2)
      Src2Select_RS2 : begin
        arbitration_rs2Needed = 1'b1;
      end
      default : begin
      end
    endcase
    if(when_Shifter_l73) begin
      arbitration_rs2Needed = (! value_IMM_USED);
    end
    if(when_BranchUnit_l126) begin
      if(when_BranchUnit_l127) begin
        arbitration_rs2Needed = 1'b1;
      end
    end
    if(when_MulDiv_l108) begin
      arbitration_rs2Needed = 1'b1;
    end
    if(when_MulDiv_l185) begin
      arbitration_rs2Needed = 1'b1;
    end
  end

  always @(*) begin
    arbitration_jumpRequested = 1'b0;
    if(when_BranchUnit_l126) begin
      if(when_BranchUnit_l132) begin
        if(!when_PcManager_l49) begin
          arbitration_jumpRequested = 1'b1;
        end
      end
    end
  end

  assign arbitration_isDone = ((arbitration_isValid && arbitration_isReady) && (! arbitration_isStalled));
  assign TrapHandler_interruptSignals_hasTrapped = 1'b0;
  assign TrapHandler_interruptSignals_trapCause = 4'bxxxx;
  assign TrapHandler_interruptSignals_trapVal = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
  always @(*) begin
    TrapHandler_exceptionSignals_hasTrapped = 1'b0;
    if(when_BranchUnit_l126) begin
      if(when_BranchUnit_l132) begin
        if(when_PcManager_l49) begin
          TrapHandler_exceptionSignals_hasTrapped = 1'b1;
        end
      end
    end
    if(arbitration_isValid) begin
      if(value_ECALL) begin
        TrapHandler_exceptionSignals_hasTrapped = 1'b1;
      end else begin
        if(value_EBREAK) begin
          TrapHandler_exceptionSignals_hasTrapped = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    TrapHandler_exceptionSignals_trapCause = 4'bxxxx;
    if(when_BranchUnit_l126) begin
      if(when_BranchUnit_l132) begin
        if(when_PcManager_l49) begin
          TrapHandler_exceptionSignals_trapCause = 4'b0000;
        end
      end
    end
    if(arbitration_isValid) begin
      if(value_ECALL) begin
        TrapHandler_exceptionSignals_trapCause = 4'b1011;
      end else begin
        if(value_EBREAK) begin
          TrapHandler_exceptionSignals_trapCause = 4'b0011;
        end
      end
    end
  end

  always @(*) begin
    TrapHandler_exceptionSignals_trapVal = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(when_BranchUnit_l126) begin
      if(when_BranchUnit_l132) begin
        if(when_PcManager_l49) begin
          TrapHandler_exceptionSignals_trapVal = BranchUnit_target;
        end
      end
    end
    if(arbitration_isValid) begin
      if(value_ECALL) begin
        TrapHandler_exceptionSignals_trapVal = 32'h0;
      end else begin
        if(value_EBREAK) begin
          TrapHandler_exceptionSignals_trapVal = 32'h0;
        end
      end
    end
  end

  always @(*) begin
    case(value_ALU_SRC1)
      Src1Select_RS1 : begin
        IntAlu_src1 = value_RS1_DATA;
      end
      default : begin
        IntAlu_src1 = value_PC;
      end
    endcase
  end

  always @(*) begin
    case(value_ALU_SRC2)
      Src2Select_RS2 : begin
        IntAlu_src2 = value_RS2_DATA;
      end
      default : begin
        IntAlu_src2 = value_IMM;
      end
    endcase
  end

  always @(*) begin
    case(value_ALU_OP)
      AluOp_ADD : begin
        IntAlu_result = (IntAlu_src1 + IntAlu_src2);
      end
      AluOp_SUB : begin
        IntAlu_result = (IntAlu_src1 - IntAlu_src2);
      end
      AluOp_SLT : begin
        IntAlu_result = {31'd0, _zz_IntAlu_result};
      end
      AluOp_SLTU : begin
        IntAlu_result = {31'd0, _zz_IntAlu_result_3};
      end
      AluOp_XOR_1 : begin
        IntAlu_result = (IntAlu_src1 ^ IntAlu_src2);
      end
      AluOp_OR_1 : begin
        IntAlu_result = (IntAlu_src1 | IntAlu_src2);
      end
      AluOp_AND_1 : begin
        IntAlu_result = (IntAlu_src1 & IntAlu_src2);
      end
      default : begin
        IntAlu_result = IntAlu_src2;
      end
    endcase
  end

  assign Shifter_src = value_RS1_DATA;
  always @(*) begin
    if(value_IMM_USED) begin
      Shifter_shamt = value_IMM[4 : 0];
    end else begin
      Shifter_shamt = value_RS2_DATA[4 : 0];
    end
  end

  always @(*) begin
    case(value_SHIFT_OP)
      ShiftOp_NONE : begin
        Shifter_result = 32'h0;
      end
      ShiftOp_SLL_1 : begin
        Shifter_result = (Shifter_src <<< Shifter_shamt);
      end
      ShiftOp_SRL_1 : begin
        Shifter_result = (Shifter_src >>> Shifter_shamt);
      end
      default : begin
        Shifter_result = _zz_Shifter_result;
      end
    endcase
  end

  assign when_Shifter_l73 = (arbitration_isValid && (value_SHIFT_OP != ShiftOp_NONE));
  always @(*) begin
    BranchUnit_target = value_ALU_RESULT;
    if(value_BU_IGNORE_TARGET_LSB) begin
      BranchUnit_target[0] = 1'b0;
    end
  end

  assign BranchUnit_misaligned = (|BranchUnit_target[1 : 0]);
  assign BranchUnit_src1 = value_RS1_DATA;
  assign BranchUnit_src2 = value_RS2_DATA;
  assign BranchUnit_eq = (BranchUnit_src1 == BranchUnit_src2);
  assign BranchUnit_ne = (! BranchUnit_eq);
  assign BranchUnit_lt = ($signed(_zz_BranchUnit_lt) < $signed(_zz_BranchUnit_lt_1));
  assign BranchUnit_ltu = (BranchUnit_src1 < BranchUnit_src2);
  assign BranchUnit_ge = (! BranchUnit_lt);
  assign BranchUnit_geu = (! BranchUnit_ltu);
  always @(*) begin
    case(value_BU_CONDITION)
      BranchCondition_NONE : begin
        BranchUnit_branchTaken = 1'b1;
      end
      BranchCondition_EQ : begin
        BranchUnit_branchTaken = BranchUnit_eq;
      end
      BranchCondition_NE : begin
        BranchUnit_branchTaken = BranchUnit_ne;
      end
      BranchCondition_LT : begin
        BranchUnit_branchTaken = BranchUnit_lt;
      end
      BranchCondition_GE : begin
        BranchUnit_branchTaken = BranchUnit_ge;
      end
      BranchCondition_LTU : begin
        BranchUnit_branchTaken = BranchUnit_ltu;
      end
      default : begin
        BranchUnit_branchTaken = BranchUnit_geu;
      end
    endcase
  end

  assign when_BranchUnit_l126 = (arbitration_isValid && value_BU_IS_BRANCH);
  assign when_BranchUnit_l127 = (value_BU_CONDITION != BranchCondition_NONE);
  assign when_BranchUnit_l132 = (BranchUnit_branchTaken && (! arbitration_isStalled));
  assign when_PcManager_l49 = (BranchUnit_target[1 : 0] != 2'b00);
  always @(*) begin
    TrapHandler_trapSignals_hasTrapped = 1'b0;
    if(TrapHandler_interruptSignals_hasTrapped) begin
      TrapHandler_trapSignals_hasTrapped = TrapHandler_interruptSignals_hasTrapped;
    end else begin
      TrapHandler_trapSignals_hasTrapped = TrapHandler_exceptionSignals_hasTrapped;
    end
  end

  always @(*) begin
    TrapHandler_trapSignals_trapCause = 4'bxxxx;
    if(TrapHandler_interruptSignals_hasTrapped) begin
      TrapHandler_trapSignals_trapCause = TrapHandler_interruptSignals_trapCause;
    end else begin
      TrapHandler_trapSignals_trapCause = TrapHandler_exceptionSignals_trapCause;
    end
  end

  always @(*) begin
    TrapHandler_trapSignals_trapVal = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(TrapHandler_interruptSignals_hasTrapped) begin
      TrapHandler_trapSignals_trapVal = TrapHandler_interruptSignals_trapVal;
    end else begin
      TrapHandler_trapSignals_trapVal = TrapHandler_exceptionSignals_trapVal;
    end
  end

  always @(*) begin
    TrapHandler_isInterrupt = 1'b0;
    if(TrapHandler_interruptSignals_hasTrapped) begin
      TrapHandler_isInterrupt = 1'b1;
    end
  end

  assign MulDiv_productH = MulDiv_product[63 : 32];
  assign MulDiv_productL = MulDiv_product[31 : 0];
  always @(*) begin
    MulDiv_step_willIncrement = 1'b0;
    if(when_MulDiv_l113) begin
      if(!MulDiv_initMul) begin
        if(MulDiv_step_willOverflowIfInc) begin
          MulDiv_step_willIncrement = 1'b1;
        end else begin
          MulDiv_step_willIncrement = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    MulDiv_step_willClear = 1'b0;
    if(when_MulDiv_l113) begin
      if(MulDiv_initMul) begin
        MulDiv_step_willClear = 1'b1;
      end
    end
  end

  assign MulDiv_step_willOverflowIfInc = (MulDiv_step_value == 6'h20);
  assign MulDiv_step_willOverflow = (MulDiv_step_willOverflowIfInc && MulDiv_step_willIncrement);
  always @(*) begin
    if(MulDiv_step_willOverflow) begin
      MulDiv_step_valueNext = 6'h0;
    end else begin
      MulDiv_step_valueNext = (MulDiv_step_value + _zz_MulDiv_step_valueNext);
    end
    if(MulDiv_step_willClear) begin
      MulDiv_step_valueNext = 6'h0;
    end
  end

  always @(*) begin
    MulDiv_multiplicand = 33'h0;
    if(when_MulDiv_l113) begin
      if(when_MulDiv_l119) begin
        MulDiv_multiplicand = {_zz_MulDiv_multiplicand_1,_zz_MulDiv_multiplicand};
      end else begin
        if(value_MULDIV_RS1_SIGNED) begin
          MulDiv_multiplicand = {_zz_MulDiv_multiplicand_2,value_RS1_DATA};
        end else begin
          MulDiv_multiplicand = {_zz_MulDiv_multiplicand_3,value_RS1_DATA};
        end
      end
    end
  end

  always @(*) begin
    MulDiv_multiplier = 32'h0;
    if(when_MulDiv_l113) begin
      if(when_MulDiv_l119) begin
        MulDiv_multiplier = ((~ value_RS2_DATA) + 32'h00000001);
      end else begin
        MulDiv_multiplier = value_RS2_DATA;
      end
    end
  end

  assign when_MulDiv_l104 = ((! arbitration_isValid) || arbitration_isStalled);
  assign when_MulDiv_l108 = (arbitration_isValid && value_MUL);
  assign when_MulDiv_l113 = ((! ((! arbitration_isValid) || arbitration_isStalled)) && value_MUL);
  assign when_MulDiv_l119 = (value_MULDIV_RS2_SIGNED && ($signed(_zz_when_MulDiv_l119) < $signed(32'h0)));
  assign _zz_MulDiv_multiplicand = ((~ value_RS1_DATA) + 32'h00000001);
  assign _zz_MulDiv_multiplicand_1[0] = _zz_MulDiv_multiplicand[31];
  assign _zz_MulDiv_multiplicand_2[0] = value_RS1_DATA[31];
  assign _zz_MulDiv_multiplicand_3[0] = 1'b0;
  assign when_MulDiv_l151 = (value_MULDIV_RS1_SIGNED || value_MULDIV_RS2_SIGNED);
  assign _zz_MulDiv_product_1[0] = MulDiv_productH[31];
  always @(*) begin
    if(when_MulDiv_l151) begin
      _zz_MulDiv_product = {_zz_MulDiv_product_1,MulDiv_productH};
    end else begin
      _zz_MulDiv_product = {_zz_MulDiv_product_2,MulDiv_productH};
    end
  end

  assign _zz_MulDiv_product_2[0] = 1'b0;
  assign when_MulDiv_l159 = MulDiv_product[0];
  always @(*) begin
    if(when_MulDiv_l159) begin
      _zz_MulDiv_product_3 = (_zz_MulDiv_product + MulDiv_multiplicand);
    end else begin
      _zz_MulDiv_product_3 = _zz_MulDiv_product;
    end
  end

  always @(*) begin
    MulDiv_step_willIncrement_1 = 1'b0;
    if(when_MulDiv_l190) begin
      if(!when_MulDiv_l201) begin
        if(!MulDiv_initDiv) begin
          if(MulDiv_step_willOverflowIfInc_1) begin
            MulDiv_step_willIncrement_1 = 1'b1;
          end else begin
            MulDiv_step_willIncrement_1 = 1'b1;
          end
        end
      end
    end
  end

  always @(*) begin
    MulDiv_step_willClear_1 = 1'b0;
    if(when_MulDiv_l190) begin
      if(!when_MulDiv_l201) begin
        if(MulDiv_initDiv) begin
          MulDiv_step_willClear_1 = 1'b1;
        end
      end
    end
  end

  assign MulDiv_step_willOverflowIfInc_1 = (MulDiv_step_value_1 == 6'h20);
  assign MulDiv_step_willOverflow_1 = (MulDiv_step_willOverflowIfInc_1 && MulDiv_step_willIncrement_1);
  always @(*) begin
    if(MulDiv_step_willOverflow_1) begin
      MulDiv_step_valueNext_1 = 6'h0;
    end else begin
      MulDiv_step_valueNext_1 = (MulDiv_step_value_1 + _zz_MulDiv_step_valueNext_1_1);
    end
    if(MulDiv_step_willClear_1) begin
      MulDiv_step_valueNext_1 = 6'h0;
    end
  end

  assign when_MulDiv_l181 = ((! arbitration_isValid) || arbitration_isStalled);
  assign when_MulDiv_l185 = (arbitration_isValid && value_DIV);
  assign when_MulDiv_l190 = ((! ((! arbitration_isValid) || arbitration_isStalled)) && value_DIV);
  assign when_MulDiv_l220 = (value_MULDIV_RS1_SIGNED && ($signed(_zz_when_MulDiv_l220) < $signed(32'h0)));
  assign _zz_when_MulDiv_l216 = (value_MULDIV_RS1_SIGNED && ($signed(_zz__zz_when_MulDiv_l216) < $signed(32'h0)));
  assign _zz_MulDiv_remainder = (_zz_when_MulDiv_l216 ? _zz__zz_MulDiv_remainder : value_RS2_DATA);
  assign when_MulDiv_l201 = (_zz_MulDiv_remainder == 32'h0);
  always @(*) begin
    _zz_out_RD_DATA = MulDiv_quotient;
    if(when_MulDiv_l216) begin
      _zz_out_RD_DATA = ((~ MulDiv_quotient) + 32'h00000001);
    end
  end

  always @(*) begin
    _zz_out_RD_DATA_1 = MulDiv_remainder;
    if(when_MulDiv_l220) begin
      _zz_out_RD_DATA_1 = ((~ MulDiv_remainder) + 32'h00000001);
    end
  end

  assign when_MulDiv_l216 = (when_MulDiv_l220 != _zz_when_MulDiv_l216);
  assign _zz_MulDiv_remainder_1 = {MulDiv_remainder[30 : 0],MulDiv_quotient[31]};
  assign when_MulDiv_l234 = (_zz_MulDiv_remainder <= _zz_MulDiv_remainder_1);
  always @(*) begin
    if(when_MulDiv_l234) begin
      _zz_MulDiv_quotient = 1'b1;
    end else begin
      _zz_MulDiv_quotient = 1'b0;
    end
  end

  always @(*) begin
    _out_default_RD_TYPE = (1'bx);
    _out_default_RD_TYPE = in_RD_TYPE;
  end

  assign out_RD_TYPE = _out_default_RD_TYPE;
  always @(*) begin
    _out_default_RS2_TYPE = (1'bx);
    _out_default_RS2_TYPE = in_RS2_TYPE;
  end

  assign out_RS2_TYPE = _out_default_RS2_TYPE;
  always @(*) begin
    _out_default_RS2 = 5'bxxxxx;
    _out_default_RS2 = in_RS2;
  end

  assign out_RS2 = _out_default_RS2;
  always @(*) begin
    _out_default_IR = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    _out_default_IR = in_IR;
  end

  assign out_IR = _out_default_IR;
  always @(*) begin
    _out_default_RS1_DATA = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    _out_default_RS1_DATA = in_RS1_DATA;
  end

  assign out_RS1_DATA = _out_default_RS1_DATA;
  always @(*) begin
    _out_default_RS1 = 5'bxxxxx;
    _out_default_RS1 = in_RS1;
  end

  assign out_RS1 = _out_default_RS1;
  always @(*) begin
    _out_default_LSU_OPERATION_TYPE = (2'bxx);
    _out_default_LSU_OPERATION_TYPE = in_LSU_OPERATION_TYPE;
  end

  assign out_LSU_OPERATION_TYPE = _out_default_LSU_OPERATION_TYPE;
  always @(*) begin
    _out_default_PC = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    _out_default_PC = in_PC;
  end

  assign out_PC = _out_default_PC;
  always @(*) begin
    _out_default_LSU_IS_UNSIGNED = 1'bx;
    _out_default_LSU_IS_UNSIGNED = in_LSU_IS_UNSIGNED;
  end

  assign out_LSU_IS_UNSIGNED = _out_default_LSU_IS_UNSIGNED;
  always @(*) begin
    _out_default_CSR_OP = (2'bxx);
    _out_default_CSR_OP = in_CSR_OP;
  end

  assign out_CSR_OP = _out_default_CSR_OP;
  always @(*) begin
    _out_default_RS2_DATA = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    _out_default_RS2_DATA = in_RS2_DATA;
  end

  assign out_RS2_DATA = _out_default_RS2_DATA;
  always @(*) begin
    _out_default_RD = 5'bxxxxx;
    _out_default_RD = in_RD;
  end

  assign out_RD = _out_default_RD;
  always @(*) begin
    _out_default_CSR_USE_IMM = 1'bx;
    _out_default_CSR_USE_IMM = in_CSR_USE_IMM;
  end

  assign out_CSR_USE_IMM = _out_default_CSR_USE_IMM;
  always @(*) begin
    _out_default_MRET = 1'bx;
    _out_default_MRET = in_MRET;
  end

  assign out_MRET = _out_default_MRET;
  always @(*) begin
    _out_default_LSU_ACCESS_WIDTH = (2'bxx);
    _out_default_LSU_ACCESS_WIDTH = in_LSU_ACCESS_WIDTH;
  end

  assign out_LSU_ACCESS_WIDTH = _out_default_LSU_ACCESS_WIDTH;
  always @(*) begin
    _out_default_RS1_TYPE = (1'bx);
    _out_default_RS1_TYPE = in_RS1_TYPE;
  end

  assign out_RS1_TYPE = _out_default_RS1_TYPE;
  always @(*) begin
    _out_default_LSU_TARGET_VALID = 1'bx;
    _out_default_LSU_TARGET_VALID = in_LSU_TARGET_VALID;
  end

  assign out_LSU_TARGET_VALID = _out_default_LSU_TARGET_VALID;
  assign value_BU_CONDITION = in_BU_CONDITION;
  assign value_SHIFT_OP = in_SHIFT_OP;
  assign value_MUL = in_MUL;
  assign value_EBREAK = in_EBREAK;
  assign value_TRAP_IS_INTERRUPT = out_TRAP_IS_INTERRUPT;
  assign value_RS1_DATA = out_RS1_DATA;
  assign value_IMM_USED = in_IMM_USED;
  assign value_BU_IS_BRANCH = in_BU_IS_BRANCH;
  assign value_ALU_OP = in_ALU_OP;
  assign value_REM = in_REM;
  assign value_ALU_COMMIT_RESULT = in_ALU_COMMIT_RESULT;
  assign value_BU_WRITE_RET_ADDR_TO_RD = in_BU_WRITE_RET_ADDR_TO_RD;
  assign value_TRAP_VAL = out_TRAP_VAL;
  assign value_PC = out_PC;
  assign value_ECALL = in_ECALL;
  assign value_HAS_TRAPPED = out_HAS_TRAPPED;
  assign value_ALU_RESULT = out_ALU_RESULT;
  assign value_TRAP_CAUSE = out_TRAP_CAUSE;
  assign value_RS2_DATA = out_RS2_DATA;
  assign value_ALU_SRC1 = in_ALU_SRC1;
  assign value_MUL_HIGH = in_MUL_HIGH;
  assign value_BU_IGNORE_TARGET_LSB = in_BU_IGNORE_TARGET_LSB;
  assign value_DIV = in_DIV;
  assign value_MRET = out_MRET;
  assign value_IMM = in_IMM;
  assign value_ALU_SRC2 = in_ALU_SRC2;
  assign value_MULDIV_RS2_SIGNED = in_MULDIV_RS2_SIGNED;
  assign value_MULDIV_RS1_SIGNED = in_MULDIV_RS1_SIGNED;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      MulDiv_initMul <= 1'b1;
      MulDiv_step_value <= 6'h0;
      MulDiv_quotient <= 32'h0;
      MulDiv_remainder <= 32'h0;
      MulDiv_initDiv <= 1'b1;
      MulDiv_step_value_1 <= 6'h0;
    end else begin
      MulDiv_step_value <= MulDiv_step_valueNext;
      if(when_MulDiv_l104) begin
        MulDiv_initMul <= 1'b1;
      end
      if(when_MulDiv_l113) begin
        if(MulDiv_initMul) begin
          MulDiv_initMul <= 1'b0;
        end else begin
          if(MulDiv_step_willOverflowIfInc) begin
            MulDiv_initMul <= 1'b1;
          end
        end
      end
      MulDiv_step_value_1 <= MulDiv_step_valueNext_1;
      if(when_MulDiv_l181) begin
        MulDiv_initDiv <= 1'b1;
      end
      if(when_MulDiv_l190) begin
        if(!when_MulDiv_l201) begin
          if(MulDiv_initDiv) begin
            MulDiv_quotient <= (when_MulDiv_l220 ? _zz_MulDiv_quotient_1 : value_RS1_DATA);
            MulDiv_remainder <= 32'h0;
            MulDiv_initDiv <= 1'b0;
          end else begin
            if(MulDiv_step_willOverflowIfInc_1) begin
              MulDiv_initDiv <= 1'b1;
            end else begin
              if(when_MulDiv_l234) begin
                MulDiv_remainder <= (_zz_MulDiv_remainder_1 - _zz_MulDiv_remainder);
              end else begin
                MulDiv_remainder <= _zz_MulDiv_remainder_1;
              end
              MulDiv_quotient <= {MulDiv_quotient[30 : 0],_zz_MulDiv_quotient};
            end
          end
        end
      end
    end
  end

  always @(posedge clk) begin
    if(when_MulDiv_l113) begin
      if(MulDiv_initMul) begin
        MulDiv_product[63 : 32] <= 32'h0;
        MulDiv_product[31 : 0] <= MulDiv_multiplier;
      end else begin
        if(!MulDiv_step_willOverflowIfInc) begin
          MulDiv_product <= {_zz_MulDiv_product_3,MulDiv_product[31 : 1]};
        end
      end
    end
  end


endmodule

module Stage_ID (
  input  wire          arbitration_isValid,
  input  wire          arbitration_isStalled,
  output wire          arbitration_isReady,
  output wire          arbitration_isDone,
  output wire          arbitration_rs1Needed,
  output wire          arbitration_rs2Needed,
  output wire          arbitration_jumpRequested,
  output wire          arbitration_isAvailable,
  output reg  [2:0]    out_BU_CONDITION,
  output reg  [1:0]    out_LSU_OPERATION_TYPE,
  output reg  [1:0]    out_CSR_OP,
  output reg  [1:0]    out_SHIFT_OP,
  output reg           out_ECALL,
  output reg           out_LSU_IS_EXTERNAL_OP,
  output reg           out_REM,
  output reg           out_MUL_HIGH,
  output reg           out_BU_WRITE_RET_ADDR_TO_RD,
  output reg           out_LSU_IS_UNSIGNED,
  output reg           out_EBREAK,
  output reg           out_MUL,
  output reg           out_DIV,
  output reg           out_MULDIV_RS2_SIGNED,
  output reg           out_RD_DATA_VALID,
  output reg           out_BU_IGNORE_TARGET_LSB,
  output reg           out_MRET,
  output reg           out_CSR_USE_IMM,
  output reg           out_BU_IS_BRANCH,
  output reg           out_MULDIV_RS1_SIGNED,
  output reg  [31:0]   out_IMM,
  output reg  [0:0]    out_ALU_SRC1,
  output reg           out_ALU_COMMIT_RESULT,
  output reg  [4:0]    out_RS1,
  output reg  [4:0]    out_RS2,
  output reg  [4:0]    out_RD,
  output reg           out_IMM_USED,
  output reg  [0:0]    out_RS1_TYPE,
  output reg  [0:0]    out_RS2_TYPE,
  output reg  [0:0]    out_RD_TYPE,
  output reg  [2:0]    out_ALU_OP,
  output reg  [0:0]    out_ALU_SRC2,
  output reg  [1:0]    out_LSU_ACCESS_WIDTH,
  output reg           out_LSU_TARGET_VALID,
  output wire [4:0]    RegisterFileAccessor_regFileIo_rs1,
  output wire [4:0]    RegisterFileAccessor_regFileIo_rs2,
  input  wire [31:0]   RegisterFileAccessor_regFileIo_rs1Data,
  input  wire [31:0]   RegisterFileAccessor_regFileIo_rs2Data,
  output reg  [31:0]   out_RS1_DATA,
  output reg  [31:0]   out_RS2_DATA,
  output reg           out_HAS_TRAPPED,
  output reg           out_TRAP_IS_INTERRUPT,
  output reg  [3:0]    out_TRAP_CAUSE,
  output reg  [31:0]   out_TRAP_VAL,
  input  wire [31:0]   in_IR,
  input  wire          in_TRAP_IS_INTERRUPT,
  output wire [31:0]   out_IR,
  input  wire [31:0]   in_TRAP_VAL,
  input  wire [31:0]   in_PC,
  output wire [31:0]   out_PC,
  input  wire          in_HAS_TRAPPED,
  input  wire [3:0]    in_TRAP_CAUSE,
  input  wire [31:0]   in_NEXT_PC,
  output wire [31:0]   out_NEXT_PC
);
  localparam LsuAccessWidth_B = 2'd0;
  localparam LsuAccessWidth_H = 2'd1;
  localparam LsuAccessWidth_W = 2'd2;
  localparam Src2Select_RS2 = 1'd0;
  localparam Src2Select_IMM = 1'd1;
  localparam AluOp_ADD = 3'd0;
  localparam AluOp_SUB = 3'd1;
  localparam AluOp_SLT = 3'd2;
  localparam AluOp_SLTU = 3'd3;
  localparam AluOp_XOR_1 = 3'd4;
  localparam AluOp_OR_1 = 3'd5;
  localparam AluOp_AND_1 = 3'd6;
  localparam AluOp_SRC2 = 3'd7;
  localparam RegisterType_NONE = 1'd0;
  localparam RegisterType_GPR = 1'd1;
  localparam Src1Select_RS1 = 1'd0;
  localparam Src1Select_PC = 1'd1;
  localparam ShiftOp_NONE = 2'd0;
  localparam ShiftOp_SLL_1 = 2'd1;
  localparam ShiftOp_SRL_1 = 2'd2;
  localparam ShiftOp_SRA_1 = 2'd3;
  localparam CsrOp_NONE = 2'd0;
  localparam CsrOp_RW = 2'd1;
  localparam CsrOp_RS = 2'd2;
  localparam CsrOp_RC = 2'd3;
  localparam LsuOperationType_NONE = 2'd0;
  localparam LsuOperationType_LOAD = 2'd1;
  localparam LsuOperationType_STORE = 2'd2;
  localparam BranchCondition_NONE = 3'd0;
  localparam BranchCondition_EQ = 3'd1;
  localparam BranchCondition_NE = 3'd2;
  localparam BranchCondition_LT = 3'd3;
  localparam BranchCondition_GE = 3'd4;
  localparam BranchCondition_LTU = 3'd5;
  localparam BranchCondition_GEU = 3'd6;

  wire       [31:0]   _zz_out_IMM_103;
  wire       [31:0]   _zz_out_IMM_104;
  reg        [31:0]   _out_default_TRAP_VAL;
  reg        [3:0]    _out_default_TRAP_CAUSE;
  reg                 _out_default_TRAP_IS_INTERRUPT;
  reg                 _out_default_HAS_TRAPPED;
  wire       [31:0]   _out_default_RS2_DATA;
  wire       [31:0]   _out_default_RS1_DATA;
  wire                _out_default_LSU_TARGET_VALID;
  wire       [1:0]    _out_default_LSU_ACCESS_WIDTH;
  wire       [0:0]    _out_default_ALU_SRC2;
  wire       [2:0]    _out_default_ALU_OP;
  wire       [0:0]    _out_default_RD_TYPE;
  wire       [0:0]    _out_default_RS2_TYPE;
  wire       [0:0]    _out_default_RS1_TYPE;
  wire                _out_default_IMM_USED;
  wire       [4:0]    _out_default_RD;
  wire       [4:0]    _out_default_RS2;
  wire       [4:0]    _out_default_RS1;
  wire                _out_default_ALU_COMMIT_RESULT;
  wire       [0:0]    _out_default_ALU_SRC1;
  wire       [31:0]   _out_default_IMM;
  wire                _out_default_MULDIV_RS1_SIGNED;
  wire                _out_default_BU_IS_BRANCH;
  wire                _out_default_CSR_USE_IMM;
  wire                _out_default_MRET;
  wire                _out_default_BU_IGNORE_TARGET_LSB;
  wire                _out_default_RD_DATA_VALID;
  wire                _out_default_MULDIV_RS2_SIGNED;
  wire                _out_default_DIV;
  wire                _out_default_MUL;
  wire                _out_default_EBREAK;
  wire                _out_default_LSU_IS_UNSIGNED;
  wire                _out_default_BU_WRITE_RET_ADDR_TO_RD;
  wire                _out_default_MUL_HIGH;
  wire                _out_default_REM;
  wire                _out_default_LSU_IS_EXTERNAL_OP;
  wire                _out_default_ECALL;
  wire       [1:0]    _out_default_SHIFT_OP;
  wire       [1:0]    _out_default_CSR_OP;
  wire       [1:0]    _out_default_LSU_OPERATION_TYPE;
  wire       [2:0]    _out_default_BU_CONDITION;
  wire                TrapHandler_interruptSignals_hasTrapped;
  wire       [3:0]    TrapHandler_interruptSignals_trapCause;
  wire       [31:0]   TrapHandler_interruptSignals_trapVal;
  reg                 TrapHandler_exceptionSignals_hasTrapped;
  reg        [3:0]    TrapHandler_exceptionSignals_trapCause;
  reg        [31:0]   TrapHandler_exceptionSignals_trapVal;
  wire       [31:0]   value_IR;
  wire       [31:0]   _zz_out_IMM;
  wire       [11:0]   _zz_out_IMM_1;
  wire                _zz_out_IMM_2;
  reg        [19:0]   _zz_out_IMM_3;
  wire       [11:0]   _zz_out_IMM_4;
  wire                _zz_out_IMM_5;
  reg        [19:0]   _zz_out_IMM_6;
  wire       [11:0]   _zz_out_IMM_7;
  wire                _zz_out_IMM_8;
  reg        [19:0]   _zz_out_IMM_9;
  wire       [11:0]   _zz_out_IMM_10;
  wire                _zz_out_IMM_11;
  reg        [19:0]   _zz_out_IMM_12;
  wire       [12:0]   _zz_out_IMM_13;
  wire                _zz_out_IMM_14;
  reg        [18:0]   _zz_out_IMM_15;
  wire       [11:0]   _zz_out_IMM_16;
  wire                _zz_out_IMM_17;
  reg        [19:0]   _zz_out_IMM_18;
  wire       [11:0]   _zz_out_IMM_19;
  wire                _zz_out_IMM_20;
  reg        [19:0]   _zz_out_IMM_21;
  wire       [12:0]   _zz_out_IMM_22;
  wire                _zz_out_IMM_23;
  reg        [18:0]   _zz_out_IMM_24;
  wire       [11:0]   _zz_out_IMM_25;
  wire                _zz_out_IMM_26;
  reg        [19:0]   _zz_out_IMM_27;
  wire       [11:0]   _zz_out_IMM_28;
  wire                _zz_out_IMM_29;
  reg        [19:0]   _zz_out_IMM_30;
  wire       [11:0]   _zz_out_IMM_31;
  wire                _zz_out_IMM_32;
  reg        [19:0]   _zz_out_IMM_33;
  wire       [11:0]   _zz_out_IMM_34;
  wire                _zz_out_IMM_35;
  reg        [19:0]   _zz_out_IMM_36;
  wire       [11:0]   _zz_out_IMM_37;
  wire                _zz_out_IMM_38;
  reg        [19:0]   _zz_out_IMM_39;
  wire       [12:0]   _zz_out_IMM_40;
  wire                _zz_out_IMM_41;
  reg        [18:0]   _zz_out_IMM_42;
  wire       [11:0]   _zz_out_IMM_43;
  wire                _zz_out_IMM_44;
  reg        [19:0]   _zz_out_IMM_45;
  wire       [11:0]   _zz_out_IMM_46;
  wire                _zz_out_IMM_47;
  reg        [19:0]   _zz_out_IMM_48;
  wire       [11:0]   _zz_out_IMM_49;
  wire                _zz_out_IMM_50;
  reg        [19:0]   _zz_out_IMM_51;
  wire       [12:0]   _zz_out_IMM_52;
  wire                _zz_out_IMM_53;
  reg        [18:0]   _zz_out_IMM_54;
  wire       [20:0]   _zz_out_IMM_55;
  wire                _zz_out_IMM_56;
  reg        [10:0]   _zz_out_IMM_57;
  wire       [11:0]   _zz_out_IMM_58;
  wire                _zz_out_IMM_59;
  reg        [19:0]   _zz_out_IMM_60;
  wire       [11:0]   _zz_out_IMM_61;
  wire                _zz_out_IMM_62;
  reg        [19:0]   _zz_out_IMM_63;
  wire       [11:0]   _zz_out_IMM_64;
  wire                _zz_out_IMM_65;
  reg        [19:0]   _zz_out_IMM_66;
  wire       [11:0]   _zz_out_IMM_67;
  wire                _zz_out_IMM_68;
  reg        [19:0]   _zz_out_IMM_69;
  wire       [12:0]   _zz_out_IMM_70;
  wire                _zz_out_IMM_71;
  reg        [18:0]   _zz_out_IMM_72;
  wire       [11:0]   _zz_out_IMM_73;
  wire                _zz_out_IMM_74;
  reg        [19:0]   _zz_out_IMM_75;
  wire       [11:0]   _zz_out_IMM_76;
  wire                _zz_out_IMM_77;
  reg        [19:0]   _zz_out_IMM_78;
  wire       [12:0]   _zz_out_IMM_79;
  wire                _zz_out_IMM_80;
  reg        [18:0]   _zz_out_IMM_81;
  wire       [11:0]   _zz_out_IMM_82;
  wire                _zz_out_IMM_83;
  reg        [19:0]   _zz_out_IMM_84;
  wire       [11:0]   _zz_out_IMM_85;
  wire                _zz_out_IMM_86;
  reg        [19:0]   _zz_out_IMM_87;
  wire       [11:0]   _zz_out_IMM_88;
  wire                _zz_out_IMM_89;
  reg        [19:0]   _zz_out_IMM_90;
  wire       [11:0]   _zz_out_IMM_91;
  wire                _zz_out_IMM_92;
  reg        [19:0]   _zz_out_IMM_93;
  wire       [11:0]   _zz_out_IMM_94;
  wire                _zz_out_IMM_95;
  reg        [19:0]   _zz_out_IMM_96;
  wire       [11:0]   _zz_out_IMM_97;
  wire                _zz_out_IMM_98;
  reg        [19:0]   _zz_out_IMM_99;
  wire       [11:0]   _zz_out_IMM_100;
  wire                _zz_out_IMM_101;
  reg        [19:0]   _zz_out_IMM_102;
  wire       [4:0]    value_RS1;
  wire       [4:0]    value_RS2;
  reg                 TrapHandler_trapSignals_hasTrapped;
  reg        [3:0]    TrapHandler_trapSignals_trapCause;
  reg        [31:0]   TrapHandler_trapSignals_trapVal;
  reg                 TrapHandler_isInterrupt;
  reg        [31:0]   _out_default_IR;
  reg        [31:0]   _out_default_PC;
  reg        [31:0]   _out_default_NEXT_PC;
  `ifndef SYNTHESIS
  reg [7:0] out_LSU_ACCESS_WIDTH_string;
  reg [7:0] _out_default_LSU_ACCESS_WIDTH_string;
  reg [23:0] out_ALU_SRC2_string;
  reg [23:0] _out_default_ALU_SRC2_string;
  reg [39:0] out_ALU_OP_string;
  reg [39:0] _out_default_ALU_OP_string;
  reg [31:0] out_RD_TYPE_string;
  reg [31:0] _out_default_RD_TYPE_string;
  reg [31:0] out_RS2_TYPE_string;
  reg [31:0] _out_default_RS2_TYPE_string;
  reg [31:0] out_RS1_TYPE_string;
  reg [31:0] _out_default_RS1_TYPE_string;
  reg [23:0] out_ALU_SRC1_string;
  reg [23:0] _out_default_ALU_SRC1_string;
  reg [39:0] out_SHIFT_OP_string;
  reg [39:0] _out_default_SHIFT_OP_string;
  reg [31:0] out_CSR_OP_string;
  reg [31:0] _out_default_CSR_OP_string;
  reg [39:0] out_LSU_OPERATION_TYPE_string;
  reg [39:0] _out_default_LSU_OPERATION_TYPE_string;
  reg [31:0] out_BU_CONDITION_string;
  reg [31:0] _out_default_BU_CONDITION_string;
  `endif


  assign _zz_out_IMM_103 = ({12'd0,_zz_out_IMM[31 : 12]} <<< 4'd12);
  assign _zz_out_IMM_104 = ({12'd0,_zz_out_IMM[31 : 12]} <<< 4'd12);
  `ifndef SYNTHESIS
  always @(*) begin
    case(out_LSU_ACCESS_WIDTH)
      LsuAccessWidth_B : out_LSU_ACCESS_WIDTH_string = "B";
      LsuAccessWidth_H : out_LSU_ACCESS_WIDTH_string = "H";
      LsuAccessWidth_W : out_LSU_ACCESS_WIDTH_string = "W";
      default : out_LSU_ACCESS_WIDTH_string = "?";
    endcase
  end
  always @(*) begin
    case(_out_default_LSU_ACCESS_WIDTH)
      LsuAccessWidth_B : _out_default_LSU_ACCESS_WIDTH_string = "B";
      LsuAccessWidth_H : _out_default_LSU_ACCESS_WIDTH_string = "H";
      LsuAccessWidth_W : _out_default_LSU_ACCESS_WIDTH_string = "W";
      default : _out_default_LSU_ACCESS_WIDTH_string = "?";
    endcase
  end
  always @(*) begin
    case(out_ALU_SRC2)
      Src2Select_RS2 : out_ALU_SRC2_string = "RS2";
      Src2Select_IMM : out_ALU_SRC2_string = "IMM";
      default : out_ALU_SRC2_string = "???";
    endcase
  end
  always @(*) begin
    case(_out_default_ALU_SRC2)
      Src2Select_RS2 : _out_default_ALU_SRC2_string = "RS2";
      Src2Select_IMM : _out_default_ALU_SRC2_string = "IMM";
      default : _out_default_ALU_SRC2_string = "???";
    endcase
  end
  always @(*) begin
    case(out_ALU_OP)
      AluOp_ADD : out_ALU_OP_string = "ADD  ";
      AluOp_SUB : out_ALU_OP_string = "SUB  ";
      AluOp_SLT : out_ALU_OP_string = "SLT  ";
      AluOp_SLTU : out_ALU_OP_string = "SLTU ";
      AluOp_XOR_1 : out_ALU_OP_string = "XOR_1";
      AluOp_OR_1 : out_ALU_OP_string = "OR_1 ";
      AluOp_AND_1 : out_ALU_OP_string = "AND_1";
      AluOp_SRC2 : out_ALU_OP_string = "SRC2 ";
      default : out_ALU_OP_string = "?????";
    endcase
  end
  always @(*) begin
    case(_out_default_ALU_OP)
      AluOp_ADD : _out_default_ALU_OP_string = "ADD  ";
      AluOp_SUB : _out_default_ALU_OP_string = "SUB  ";
      AluOp_SLT : _out_default_ALU_OP_string = "SLT  ";
      AluOp_SLTU : _out_default_ALU_OP_string = "SLTU ";
      AluOp_XOR_1 : _out_default_ALU_OP_string = "XOR_1";
      AluOp_OR_1 : _out_default_ALU_OP_string = "OR_1 ";
      AluOp_AND_1 : _out_default_ALU_OP_string = "AND_1";
      AluOp_SRC2 : _out_default_ALU_OP_string = "SRC2 ";
      default : _out_default_ALU_OP_string = "?????";
    endcase
  end
  always @(*) begin
    case(out_RD_TYPE)
      RegisterType_NONE : out_RD_TYPE_string = "NONE";
      RegisterType_GPR : out_RD_TYPE_string = "GPR ";
      default : out_RD_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_out_default_RD_TYPE)
      RegisterType_NONE : _out_default_RD_TYPE_string = "NONE";
      RegisterType_GPR : _out_default_RD_TYPE_string = "GPR ";
      default : _out_default_RD_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(out_RS2_TYPE)
      RegisterType_NONE : out_RS2_TYPE_string = "NONE";
      RegisterType_GPR : out_RS2_TYPE_string = "GPR ";
      default : out_RS2_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_out_default_RS2_TYPE)
      RegisterType_NONE : _out_default_RS2_TYPE_string = "NONE";
      RegisterType_GPR : _out_default_RS2_TYPE_string = "GPR ";
      default : _out_default_RS2_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(out_RS1_TYPE)
      RegisterType_NONE : out_RS1_TYPE_string = "NONE";
      RegisterType_GPR : out_RS1_TYPE_string = "GPR ";
      default : out_RS1_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(_out_default_RS1_TYPE)
      RegisterType_NONE : _out_default_RS1_TYPE_string = "NONE";
      RegisterType_GPR : _out_default_RS1_TYPE_string = "GPR ";
      default : _out_default_RS1_TYPE_string = "????";
    endcase
  end
  always @(*) begin
    case(out_ALU_SRC1)
      Src1Select_RS1 : out_ALU_SRC1_string = "RS1";
      Src1Select_PC : out_ALU_SRC1_string = "PC ";
      default : out_ALU_SRC1_string = "???";
    endcase
  end
  always @(*) begin
    case(_out_default_ALU_SRC1)
      Src1Select_RS1 : _out_default_ALU_SRC1_string = "RS1";
      Src1Select_PC : _out_default_ALU_SRC1_string = "PC ";
      default : _out_default_ALU_SRC1_string = "???";
    endcase
  end
  always @(*) begin
    case(out_SHIFT_OP)
      ShiftOp_NONE : out_SHIFT_OP_string = "NONE ";
      ShiftOp_SLL_1 : out_SHIFT_OP_string = "SLL_1";
      ShiftOp_SRL_1 : out_SHIFT_OP_string = "SRL_1";
      ShiftOp_SRA_1 : out_SHIFT_OP_string = "SRA_1";
      default : out_SHIFT_OP_string = "?????";
    endcase
  end
  always @(*) begin
    case(_out_default_SHIFT_OP)
      ShiftOp_NONE : _out_default_SHIFT_OP_string = "NONE ";
      ShiftOp_SLL_1 : _out_default_SHIFT_OP_string = "SLL_1";
      ShiftOp_SRL_1 : _out_default_SHIFT_OP_string = "SRL_1";
      ShiftOp_SRA_1 : _out_default_SHIFT_OP_string = "SRA_1";
      default : _out_default_SHIFT_OP_string = "?????";
    endcase
  end
  always @(*) begin
    case(out_CSR_OP)
      CsrOp_NONE : out_CSR_OP_string = "NONE";
      CsrOp_RW : out_CSR_OP_string = "RW  ";
      CsrOp_RS : out_CSR_OP_string = "RS  ";
      CsrOp_RC : out_CSR_OP_string = "RC  ";
      default : out_CSR_OP_string = "????";
    endcase
  end
  always @(*) begin
    case(_out_default_CSR_OP)
      CsrOp_NONE : _out_default_CSR_OP_string = "NONE";
      CsrOp_RW : _out_default_CSR_OP_string = "RW  ";
      CsrOp_RS : _out_default_CSR_OP_string = "RS  ";
      CsrOp_RC : _out_default_CSR_OP_string = "RC  ";
      default : _out_default_CSR_OP_string = "????";
    endcase
  end
  always @(*) begin
    case(out_LSU_OPERATION_TYPE)
      LsuOperationType_NONE : out_LSU_OPERATION_TYPE_string = "NONE ";
      LsuOperationType_LOAD : out_LSU_OPERATION_TYPE_string = "LOAD ";
      LsuOperationType_STORE : out_LSU_OPERATION_TYPE_string = "STORE";
      default : out_LSU_OPERATION_TYPE_string = "?????";
    endcase
  end
  always @(*) begin
    case(_out_default_LSU_OPERATION_TYPE)
      LsuOperationType_NONE : _out_default_LSU_OPERATION_TYPE_string = "NONE ";
      LsuOperationType_LOAD : _out_default_LSU_OPERATION_TYPE_string = "LOAD ";
      LsuOperationType_STORE : _out_default_LSU_OPERATION_TYPE_string = "STORE";
      default : _out_default_LSU_OPERATION_TYPE_string = "?????";
    endcase
  end
  always @(*) begin
    case(out_BU_CONDITION)
      BranchCondition_NONE : out_BU_CONDITION_string = "NONE";
      BranchCondition_EQ : out_BU_CONDITION_string = "EQ  ";
      BranchCondition_NE : out_BU_CONDITION_string = "NE  ";
      BranchCondition_LT : out_BU_CONDITION_string = "LT  ";
      BranchCondition_GE : out_BU_CONDITION_string = "GE  ";
      BranchCondition_LTU : out_BU_CONDITION_string = "LTU ";
      BranchCondition_GEU : out_BU_CONDITION_string = "GEU ";
      default : out_BU_CONDITION_string = "????";
    endcase
  end
  always @(*) begin
    case(_out_default_BU_CONDITION)
      BranchCondition_NONE : _out_default_BU_CONDITION_string = "NONE";
      BranchCondition_EQ : _out_default_BU_CONDITION_string = "EQ  ";
      BranchCondition_NE : _out_default_BU_CONDITION_string = "NE  ";
      BranchCondition_LT : _out_default_BU_CONDITION_string = "LT  ";
      BranchCondition_GE : _out_default_BU_CONDITION_string = "GE  ";
      BranchCondition_LTU : _out_default_BU_CONDITION_string = "LTU ";
      BranchCondition_GEU : _out_default_BU_CONDITION_string = "GEU ";
      default : _out_default_BU_CONDITION_string = "????";
    endcase
  end
  `endif

  always @(*) begin
    _out_default_TRAP_VAL = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    _out_default_TRAP_VAL = in_TRAP_VAL;
  end

  always @(*) begin
    out_TRAP_VAL = _out_default_TRAP_VAL;
    if(TrapHandler_trapSignals_hasTrapped) begin
      out_TRAP_VAL = TrapHandler_trapSignals_trapVal;
    end
  end

  always @(*) begin
    _out_default_TRAP_CAUSE = 4'bxxxx;
    _out_default_TRAP_CAUSE = in_TRAP_CAUSE;
  end

  always @(*) begin
    out_TRAP_CAUSE = _out_default_TRAP_CAUSE;
    if(TrapHandler_trapSignals_hasTrapped) begin
      out_TRAP_CAUSE = TrapHandler_trapSignals_trapCause;
    end
  end

  always @(*) begin
    _out_default_TRAP_IS_INTERRUPT = 1'bx;
    _out_default_TRAP_IS_INTERRUPT = in_TRAP_IS_INTERRUPT;
  end

  always @(*) begin
    out_TRAP_IS_INTERRUPT = _out_default_TRAP_IS_INTERRUPT;
    if(TrapHandler_trapSignals_hasTrapped) begin
      out_TRAP_IS_INTERRUPT = TrapHandler_isInterrupt;
    end
  end

  always @(*) begin
    _out_default_HAS_TRAPPED = 1'bx;
    _out_default_HAS_TRAPPED = in_HAS_TRAPPED;
  end

  always @(*) begin
    out_HAS_TRAPPED = _out_default_HAS_TRAPPED;
    if(TrapHandler_trapSignals_hasTrapped) begin
      out_HAS_TRAPPED = 1'b1;
    end
  end

  assign _out_default_RS2_DATA = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
  always @(*) begin
    out_RS2_DATA = _out_default_RS2_DATA;
    out_RS2_DATA = RegisterFileAccessor_regFileIo_rs2Data;
  end

  assign _out_default_RS1_DATA = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
  always @(*) begin
    out_RS1_DATA = _out_default_RS1_DATA;
    out_RS1_DATA = RegisterFileAccessor_regFileIo_rs1Data;
  end

  assign _out_default_LSU_TARGET_VALID = 1'bx;
  always @(*) begin
    out_LSU_TARGET_VALID = _out_default_LSU_TARGET_VALID;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
      end
      32'b0000001??????????010?????0110011 : begin
      end
      32'b?????????????????????????0010111 : begin
      end
      32'b0000000??????????111?????0110011 : begin
      end
      32'b?????????????????000?????0010011 : begin
      end
      32'b0000000??????????010?????0110011 : begin
      end
      32'b0000001??????????101?????0110011 : begin
      end
      32'b?????????????????010?????0000011 : begin
        out_LSU_TARGET_VALID = 1'b0;
      end
      32'b?????????????????011?????0010011 : begin
      end
      32'b?????????????????101?????1100011 : begin
      end
      32'b0100000??????????101?????0110011 : begin
      end
      32'b0000000??????????101?????0110011 : begin
      end
      32'b?????????????????101?????0000011 : begin
        out_LSU_TARGET_VALID = 1'b0;
      end
      32'b?????????????????110?????1110011 : begin
      end
      32'b?????????????????000?????1100011 : begin
      end
      32'b?????????????????000?????0000011 : begin
        out_LSU_TARGET_VALID = 1'b0;
      end
      32'b?????????????????001?????1110011 : begin
      end
      32'b?????????????????????????0110111 : begin
      end
      32'b?????????????????110?????0010011 : begin
      end
      32'b0000001??????????000?????0110011 : begin
      end
      32'b00000000000100000000000001110011 : begin
      end
      32'b?????????????????010?????0100011 : begin
        out_LSU_TARGET_VALID = 1'b0;
      end
      32'b?????????????????110?????1100011 : begin
      end
      32'b?????????????????100?????0010011 : begin
      end
      32'b0100000??????????000?????0110011 : begin
      end
      32'b0000000??????????001?????0010011 : begin
      end
      32'b0000001??????????011?????0110011 : begin
      end
      32'b0000000??????????000?????0110011 : begin
      end
      32'b?????????????????111?????1110011 : begin
      end
      32'b?????????????????001?????1100011 : begin
      end
      32'b?????????????????????????1101111 : begin
      end
      32'b0000000??????????011?????0110011 : begin
      end
      32'b?????????????????111?????0010011 : begin
      end
      32'b?????????????????010?????1110011 : begin
      end
      32'b?????????????????001?????0000011 : begin
        out_LSU_TARGET_VALID = 1'b0;
      end
      32'b?????????????????000?????0100011 : begin
        out_LSU_TARGET_VALID = 1'b0;
      end
      32'b0000001??????????110?????0110011 : begin
      end
      32'b?????????????????100?????1100011 : begin
      end
      32'b0000001??????????001?????0110011 : begin
      end
      32'b?????????????????010?????0010011 : begin
      end
      32'b?????????????????101?????1110011 : begin
      end
      32'b0000000??????????110?????0110011 : begin
      end
      32'b0000000??????????001?????0110011 : begin
      end
      32'b?????????????????111?????1100011 : begin
      end
      32'b0000001??????????100?????0110011 : begin
      end
      32'b00110000001000000000000001110011 : begin
      end
      32'b0000000??????????100?????0110011 : begin
      end
      32'b?????????????????001?????0100011 : begin
        out_LSU_TARGET_VALID = 1'b0;
      end
      32'b0100000??????????101?????0010011 : begin
      end
      32'b?????????????????011?????1110011 : begin
      end
      32'b0000001??????????111?????0110011 : begin
      end
      32'b?????????????????100?????0000011 : begin
        out_LSU_TARGET_VALID = 1'b0;
      end
      32'b0000000??????????101?????0010011 : begin
      end
      32'b?????????????????000?????1100111 : begin
      end
      default : begin
      end
    endcase
  end

  assign _out_default_LSU_ACCESS_WIDTH = (2'bxx);
  always @(*) begin
    out_LSU_ACCESS_WIDTH = _out_default_LSU_ACCESS_WIDTH;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
      end
      32'b0000001??????????010?????0110011 : begin
      end
      32'b?????????????????????????0010111 : begin
      end
      32'b0000000??????????111?????0110011 : begin
      end
      32'b?????????????????000?????0010011 : begin
      end
      32'b0000000??????????010?????0110011 : begin
      end
      32'b0000001??????????101?????0110011 : begin
      end
      32'b?????????????????010?????0000011 : begin
        out_LSU_ACCESS_WIDTH = LsuAccessWidth_W;
      end
      32'b?????????????????011?????0010011 : begin
      end
      32'b?????????????????101?????1100011 : begin
      end
      32'b0100000??????????101?????0110011 : begin
      end
      32'b0000000??????????101?????0110011 : begin
      end
      32'b?????????????????101?????0000011 : begin
        out_LSU_ACCESS_WIDTH = LsuAccessWidth_H;
      end
      32'b?????????????????110?????1110011 : begin
      end
      32'b?????????????????000?????1100011 : begin
      end
      32'b?????????????????000?????0000011 : begin
        out_LSU_ACCESS_WIDTH = LsuAccessWidth_B;
      end
      32'b?????????????????001?????1110011 : begin
      end
      32'b?????????????????????????0110111 : begin
      end
      32'b?????????????????110?????0010011 : begin
      end
      32'b0000001??????????000?????0110011 : begin
      end
      32'b00000000000100000000000001110011 : begin
      end
      32'b?????????????????010?????0100011 : begin
        out_LSU_ACCESS_WIDTH = LsuAccessWidth_W;
      end
      32'b?????????????????110?????1100011 : begin
      end
      32'b?????????????????100?????0010011 : begin
      end
      32'b0100000??????????000?????0110011 : begin
      end
      32'b0000000??????????001?????0010011 : begin
      end
      32'b0000001??????????011?????0110011 : begin
      end
      32'b0000000??????????000?????0110011 : begin
      end
      32'b?????????????????111?????1110011 : begin
      end
      32'b?????????????????001?????1100011 : begin
      end
      32'b?????????????????????????1101111 : begin
      end
      32'b0000000??????????011?????0110011 : begin
      end
      32'b?????????????????111?????0010011 : begin
      end
      32'b?????????????????010?????1110011 : begin
      end
      32'b?????????????????001?????0000011 : begin
        out_LSU_ACCESS_WIDTH = LsuAccessWidth_H;
      end
      32'b?????????????????000?????0100011 : begin
        out_LSU_ACCESS_WIDTH = LsuAccessWidth_B;
      end
      32'b0000001??????????110?????0110011 : begin
      end
      32'b?????????????????100?????1100011 : begin
      end
      32'b0000001??????????001?????0110011 : begin
      end
      32'b?????????????????010?????0010011 : begin
      end
      32'b?????????????????101?????1110011 : begin
      end
      32'b0000000??????????110?????0110011 : begin
      end
      32'b0000000??????????001?????0110011 : begin
      end
      32'b?????????????????111?????1100011 : begin
      end
      32'b0000001??????????100?????0110011 : begin
      end
      32'b00110000001000000000000001110011 : begin
      end
      32'b0000000??????????100?????0110011 : begin
      end
      32'b?????????????????001?????0100011 : begin
        out_LSU_ACCESS_WIDTH = LsuAccessWidth_H;
      end
      32'b0100000??????????101?????0010011 : begin
      end
      32'b?????????????????011?????1110011 : begin
      end
      32'b0000001??????????111?????0110011 : begin
      end
      32'b?????????????????100?????0000011 : begin
        out_LSU_ACCESS_WIDTH = LsuAccessWidth_B;
      end
      32'b0000000??????????101?????0010011 : begin
      end
      32'b?????????????????000?????1100111 : begin
      end
      default : begin
      end
    endcase
  end

  assign _out_default_ALU_SRC2 = (1'bx);
  always @(*) begin
    out_ALU_SRC2 = _out_default_ALU_SRC2;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
      end
      32'b0000001??????????010?????0110011 : begin
      end
      32'b?????????????????????????0010111 : begin
        out_ALU_SRC2 = Src2Select_IMM;
      end
      32'b0000000??????????111?????0110011 : begin
        out_ALU_SRC2 = Src2Select_RS2;
      end
      32'b?????????????????000?????0010011 : begin
        out_ALU_SRC2 = Src2Select_IMM;
      end
      32'b0000000??????????010?????0110011 : begin
        out_ALU_SRC2 = Src2Select_RS2;
      end
      32'b0000001??????????101?????0110011 : begin
      end
      32'b?????????????????010?????0000011 : begin
        out_ALU_SRC2 = Src2Select_IMM;
      end
      32'b?????????????????011?????0010011 : begin
        out_ALU_SRC2 = Src2Select_IMM;
      end
      32'b?????????????????101?????1100011 : begin
        out_ALU_SRC2 = Src2Select_IMM;
      end
      32'b0100000??????????101?????0110011 : begin
      end
      32'b0000000??????????101?????0110011 : begin
      end
      32'b?????????????????101?????0000011 : begin
        out_ALU_SRC2 = Src2Select_IMM;
      end
      32'b?????????????????110?????1110011 : begin
      end
      32'b?????????????????000?????1100011 : begin
        out_ALU_SRC2 = Src2Select_IMM;
      end
      32'b?????????????????000?????0000011 : begin
        out_ALU_SRC2 = Src2Select_IMM;
      end
      32'b?????????????????001?????1110011 : begin
      end
      32'b?????????????????????????0110111 : begin
        out_ALU_SRC2 = Src2Select_IMM;
      end
      32'b?????????????????110?????0010011 : begin
        out_ALU_SRC2 = Src2Select_IMM;
      end
      32'b0000001??????????000?????0110011 : begin
      end
      32'b00000000000100000000000001110011 : begin
      end
      32'b?????????????????010?????0100011 : begin
        out_ALU_SRC2 = Src2Select_IMM;
      end
      32'b?????????????????110?????1100011 : begin
        out_ALU_SRC2 = Src2Select_IMM;
      end
      32'b?????????????????100?????0010011 : begin
        out_ALU_SRC2 = Src2Select_IMM;
      end
      32'b0100000??????????000?????0110011 : begin
        out_ALU_SRC2 = Src2Select_RS2;
      end
      32'b0000000??????????001?????0010011 : begin
      end
      32'b0000001??????????011?????0110011 : begin
      end
      32'b0000000??????????000?????0110011 : begin
        out_ALU_SRC2 = Src2Select_RS2;
      end
      32'b?????????????????111?????1110011 : begin
      end
      32'b?????????????????001?????1100011 : begin
        out_ALU_SRC2 = Src2Select_IMM;
      end
      32'b?????????????????????????1101111 : begin
        out_ALU_SRC2 = Src2Select_IMM;
      end
      32'b0000000??????????011?????0110011 : begin
        out_ALU_SRC2 = Src2Select_RS2;
      end
      32'b?????????????????111?????0010011 : begin
        out_ALU_SRC2 = Src2Select_IMM;
      end
      32'b?????????????????010?????1110011 : begin
      end
      32'b?????????????????001?????0000011 : begin
        out_ALU_SRC2 = Src2Select_IMM;
      end
      32'b?????????????????000?????0100011 : begin
        out_ALU_SRC2 = Src2Select_IMM;
      end
      32'b0000001??????????110?????0110011 : begin
      end
      32'b?????????????????100?????1100011 : begin
        out_ALU_SRC2 = Src2Select_IMM;
      end
      32'b0000001??????????001?????0110011 : begin
      end
      32'b?????????????????010?????0010011 : begin
        out_ALU_SRC2 = Src2Select_IMM;
      end
      32'b?????????????????101?????1110011 : begin
      end
      32'b0000000??????????110?????0110011 : begin
        out_ALU_SRC2 = Src2Select_RS2;
      end
      32'b0000000??????????001?????0110011 : begin
      end
      32'b?????????????????111?????1100011 : begin
        out_ALU_SRC2 = Src2Select_IMM;
      end
      32'b0000001??????????100?????0110011 : begin
      end
      32'b00110000001000000000000001110011 : begin
      end
      32'b0000000??????????100?????0110011 : begin
        out_ALU_SRC2 = Src2Select_RS2;
      end
      32'b?????????????????001?????0100011 : begin
        out_ALU_SRC2 = Src2Select_IMM;
      end
      32'b0100000??????????101?????0010011 : begin
      end
      32'b?????????????????011?????1110011 : begin
      end
      32'b0000001??????????111?????0110011 : begin
      end
      32'b?????????????????100?????0000011 : begin
        out_ALU_SRC2 = Src2Select_IMM;
      end
      32'b0000000??????????101?????0010011 : begin
      end
      32'b?????????????????000?????1100111 : begin
        out_ALU_SRC2 = Src2Select_IMM;
      end
      default : begin
      end
    endcase
  end

  assign _out_default_ALU_OP = (3'bxxx);
  always @(*) begin
    out_ALU_OP = _out_default_ALU_OP;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
      end
      32'b0000001??????????010?????0110011 : begin
      end
      32'b?????????????????????????0010111 : begin
        out_ALU_OP = AluOp_ADD;
      end
      32'b0000000??????????111?????0110011 : begin
        out_ALU_OP = AluOp_AND_1;
      end
      32'b?????????????????000?????0010011 : begin
        out_ALU_OP = AluOp_ADD;
      end
      32'b0000000??????????010?????0110011 : begin
        out_ALU_OP = AluOp_SLT;
      end
      32'b0000001??????????101?????0110011 : begin
      end
      32'b?????????????????010?????0000011 : begin
        out_ALU_OP = AluOp_ADD;
      end
      32'b?????????????????011?????0010011 : begin
        out_ALU_OP = AluOp_SLTU;
      end
      32'b?????????????????101?????1100011 : begin
        out_ALU_OP = AluOp_ADD;
      end
      32'b0100000??????????101?????0110011 : begin
      end
      32'b0000000??????????101?????0110011 : begin
      end
      32'b?????????????????101?????0000011 : begin
        out_ALU_OP = AluOp_ADD;
      end
      32'b?????????????????110?????1110011 : begin
      end
      32'b?????????????????000?????1100011 : begin
        out_ALU_OP = AluOp_ADD;
      end
      32'b?????????????????000?????0000011 : begin
        out_ALU_OP = AluOp_ADD;
      end
      32'b?????????????????001?????1110011 : begin
      end
      32'b?????????????????????????0110111 : begin
        out_ALU_OP = AluOp_SRC2;
      end
      32'b?????????????????110?????0010011 : begin
        out_ALU_OP = AluOp_OR_1;
      end
      32'b0000001??????????000?????0110011 : begin
      end
      32'b00000000000100000000000001110011 : begin
      end
      32'b?????????????????010?????0100011 : begin
        out_ALU_OP = AluOp_ADD;
      end
      32'b?????????????????110?????1100011 : begin
        out_ALU_OP = AluOp_ADD;
      end
      32'b?????????????????100?????0010011 : begin
        out_ALU_OP = AluOp_XOR_1;
      end
      32'b0100000??????????000?????0110011 : begin
        out_ALU_OP = AluOp_SUB;
      end
      32'b0000000??????????001?????0010011 : begin
      end
      32'b0000001??????????011?????0110011 : begin
      end
      32'b0000000??????????000?????0110011 : begin
        out_ALU_OP = AluOp_ADD;
      end
      32'b?????????????????111?????1110011 : begin
      end
      32'b?????????????????001?????1100011 : begin
        out_ALU_OP = AluOp_ADD;
      end
      32'b?????????????????????????1101111 : begin
        out_ALU_OP = AluOp_ADD;
      end
      32'b0000000??????????011?????0110011 : begin
        out_ALU_OP = AluOp_SLTU;
      end
      32'b?????????????????111?????0010011 : begin
        out_ALU_OP = AluOp_AND_1;
      end
      32'b?????????????????010?????1110011 : begin
      end
      32'b?????????????????001?????0000011 : begin
        out_ALU_OP = AluOp_ADD;
      end
      32'b?????????????????000?????0100011 : begin
        out_ALU_OP = AluOp_ADD;
      end
      32'b0000001??????????110?????0110011 : begin
      end
      32'b?????????????????100?????1100011 : begin
        out_ALU_OP = AluOp_ADD;
      end
      32'b0000001??????????001?????0110011 : begin
      end
      32'b?????????????????010?????0010011 : begin
        out_ALU_OP = AluOp_SLT;
      end
      32'b?????????????????101?????1110011 : begin
      end
      32'b0000000??????????110?????0110011 : begin
        out_ALU_OP = AluOp_OR_1;
      end
      32'b0000000??????????001?????0110011 : begin
      end
      32'b?????????????????111?????1100011 : begin
        out_ALU_OP = AluOp_ADD;
      end
      32'b0000001??????????100?????0110011 : begin
      end
      32'b00110000001000000000000001110011 : begin
      end
      32'b0000000??????????100?????0110011 : begin
        out_ALU_OP = AluOp_XOR_1;
      end
      32'b?????????????????001?????0100011 : begin
        out_ALU_OP = AluOp_ADD;
      end
      32'b0100000??????????101?????0010011 : begin
      end
      32'b?????????????????011?????1110011 : begin
      end
      32'b0000001??????????111?????0110011 : begin
      end
      32'b?????????????????100?????0000011 : begin
        out_ALU_OP = AluOp_ADD;
      end
      32'b0000000??????????101?????0010011 : begin
      end
      32'b?????????????????000?????1100111 : begin
        out_ALU_OP = AluOp_ADD;
      end
      default : begin
      end
    endcase
  end

  assign _out_default_RD_TYPE = (1'bx);
  always @(*) begin
    out_RD_TYPE = _out_default_RD_TYPE;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b0000001??????????010?????0110011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b?????????????????????????0010111 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b0000000??????????111?????0110011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b?????????????????000?????0010011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b0000000??????????010?????0110011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b0000001??????????101?????0110011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b?????????????????010?????0000011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b?????????????????011?????0010011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b?????????????????101?????1100011 : begin
        out_RD_TYPE = RegisterType_NONE;
      end
      32'b0100000??????????101?????0110011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b0000000??????????101?????0110011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b?????????????????101?????0000011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b?????????????????110?????1110011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b?????????????????000?????1100011 : begin
        out_RD_TYPE = RegisterType_NONE;
      end
      32'b?????????????????000?????0000011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b?????????????????001?????1110011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b?????????????????????????0110111 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b?????????????????110?????0010011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b0000001??????????000?????0110011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b00000000000100000000000001110011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b?????????????????010?????0100011 : begin
        out_RD_TYPE = RegisterType_NONE;
      end
      32'b?????????????????110?????1100011 : begin
        out_RD_TYPE = RegisterType_NONE;
      end
      32'b?????????????????100?????0010011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b0100000??????????000?????0110011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b0000000??????????001?????0010011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b0000001??????????011?????0110011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b0000000??????????000?????0110011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b?????????????????111?????1110011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b?????????????????001?????1100011 : begin
        out_RD_TYPE = RegisterType_NONE;
      end
      32'b?????????????????????????1101111 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b0000000??????????011?????0110011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b?????????????????111?????0010011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b?????????????????010?????1110011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b?????????????????001?????0000011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b?????????????????000?????0100011 : begin
        out_RD_TYPE = RegisterType_NONE;
      end
      32'b0000001??????????110?????0110011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b?????????????????100?????1100011 : begin
        out_RD_TYPE = RegisterType_NONE;
      end
      32'b0000001??????????001?????0110011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b?????????????????010?????0010011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b?????????????????101?????1110011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b0000000??????????110?????0110011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b0000000??????????001?????0110011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b?????????????????111?????1100011 : begin
        out_RD_TYPE = RegisterType_NONE;
      end
      32'b0000001??????????100?????0110011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b00110000001000000000000001110011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b0000000??????????100?????0110011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b?????????????????001?????0100011 : begin
        out_RD_TYPE = RegisterType_NONE;
      end
      32'b0100000??????????101?????0010011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b?????????????????011?????1110011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b0000001??????????111?????0110011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b?????????????????100?????0000011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b0000000??????????101?????0010011 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      32'b?????????????????000?????1100111 : begin
        out_RD_TYPE = RegisterType_GPR;
      end
      default : begin
      end
    endcase
  end

  assign _out_default_RS2_TYPE = (1'bx);
  always @(*) begin
    out_RS2_TYPE = _out_default_RS2_TYPE;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
        out_RS2_TYPE = RegisterType_NONE;
      end
      32'b0000001??????????010?????0110011 : begin
        out_RS2_TYPE = RegisterType_GPR;
      end
      32'b?????????????????????????0010111 : begin
        out_RS2_TYPE = RegisterType_NONE;
      end
      32'b0000000??????????111?????0110011 : begin
        out_RS2_TYPE = RegisterType_GPR;
      end
      32'b?????????????????000?????0010011 : begin
        out_RS2_TYPE = RegisterType_NONE;
      end
      32'b0000000??????????010?????0110011 : begin
        out_RS2_TYPE = RegisterType_GPR;
      end
      32'b0000001??????????101?????0110011 : begin
        out_RS2_TYPE = RegisterType_GPR;
      end
      32'b?????????????????010?????0000011 : begin
        out_RS2_TYPE = RegisterType_NONE;
      end
      32'b?????????????????011?????0010011 : begin
        out_RS2_TYPE = RegisterType_NONE;
      end
      32'b?????????????????101?????1100011 : begin
        out_RS2_TYPE = RegisterType_GPR;
      end
      32'b0100000??????????101?????0110011 : begin
        out_RS2_TYPE = RegisterType_GPR;
      end
      32'b0000000??????????101?????0110011 : begin
        out_RS2_TYPE = RegisterType_GPR;
      end
      32'b?????????????????101?????0000011 : begin
        out_RS2_TYPE = RegisterType_NONE;
      end
      32'b?????????????????110?????1110011 : begin
        out_RS2_TYPE = RegisterType_NONE;
      end
      32'b?????????????????000?????1100011 : begin
        out_RS2_TYPE = RegisterType_GPR;
      end
      32'b?????????????????000?????0000011 : begin
        out_RS2_TYPE = RegisterType_NONE;
      end
      32'b?????????????????001?????1110011 : begin
        out_RS2_TYPE = RegisterType_NONE;
      end
      32'b?????????????????????????0110111 : begin
        out_RS2_TYPE = RegisterType_NONE;
      end
      32'b?????????????????110?????0010011 : begin
        out_RS2_TYPE = RegisterType_NONE;
      end
      32'b0000001??????????000?????0110011 : begin
        out_RS2_TYPE = RegisterType_GPR;
      end
      32'b00000000000100000000000001110011 : begin
        out_RS2_TYPE = RegisterType_NONE;
      end
      32'b?????????????????010?????0100011 : begin
        out_RS2_TYPE = RegisterType_GPR;
      end
      32'b?????????????????110?????1100011 : begin
        out_RS2_TYPE = RegisterType_GPR;
      end
      32'b?????????????????100?????0010011 : begin
        out_RS2_TYPE = RegisterType_NONE;
      end
      32'b0100000??????????000?????0110011 : begin
        out_RS2_TYPE = RegisterType_GPR;
      end
      32'b0000000??????????001?????0010011 : begin
        out_RS2_TYPE = RegisterType_NONE;
      end
      32'b0000001??????????011?????0110011 : begin
        out_RS2_TYPE = RegisterType_GPR;
      end
      32'b0000000??????????000?????0110011 : begin
        out_RS2_TYPE = RegisterType_GPR;
      end
      32'b?????????????????111?????1110011 : begin
        out_RS2_TYPE = RegisterType_NONE;
      end
      32'b?????????????????001?????1100011 : begin
        out_RS2_TYPE = RegisterType_GPR;
      end
      32'b?????????????????????????1101111 : begin
        out_RS2_TYPE = RegisterType_NONE;
      end
      32'b0000000??????????011?????0110011 : begin
        out_RS2_TYPE = RegisterType_GPR;
      end
      32'b?????????????????111?????0010011 : begin
        out_RS2_TYPE = RegisterType_NONE;
      end
      32'b?????????????????010?????1110011 : begin
        out_RS2_TYPE = RegisterType_NONE;
      end
      32'b?????????????????001?????0000011 : begin
        out_RS2_TYPE = RegisterType_NONE;
      end
      32'b?????????????????000?????0100011 : begin
        out_RS2_TYPE = RegisterType_GPR;
      end
      32'b0000001??????????110?????0110011 : begin
        out_RS2_TYPE = RegisterType_GPR;
      end
      32'b?????????????????100?????1100011 : begin
        out_RS2_TYPE = RegisterType_GPR;
      end
      32'b0000001??????????001?????0110011 : begin
        out_RS2_TYPE = RegisterType_GPR;
      end
      32'b?????????????????010?????0010011 : begin
        out_RS2_TYPE = RegisterType_NONE;
      end
      32'b?????????????????101?????1110011 : begin
        out_RS2_TYPE = RegisterType_NONE;
      end
      32'b0000000??????????110?????0110011 : begin
        out_RS2_TYPE = RegisterType_GPR;
      end
      32'b0000000??????????001?????0110011 : begin
        out_RS2_TYPE = RegisterType_GPR;
      end
      32'b?????????????????111?????1100011 : begin
        out_RS2_TYPE = RegisterType_GPR;
      end
      32'b0000001??????????100?????0110011 : begin
        out_RS2_TYPE = RegisterType_GPR;
      end
      32'b00110000001000000000000001110011 : begin
        out_RS2_TYPE = RegisterType_NONE;
      end
      32'b0000000??????????100?????0110011 : begin
        out_RS2_TYPE = RegisterType_GPR;
      end
      32'b?????????????????001?????0100011 : begin
        out_RS2_TYPE = RegisterType_GPR;
      end
      32'b0100000??????????101?????0010011 : begin
        out_RS2_TYPE = RegisterType_NONE;
      end
      32'b?????????????????011?????1110011 : begin
        out_RS2_TYPE = RegisterType_NONE;
      end
      32'b0000001??????????111?????0110011 : begin
        out_RS2_TYPE = RegisterType_GPR;
      end
      32'b?????????????????100?????0000011 : begin
        out_RS2_TYPE = RegisterType_NONE;
      end
      32'b0000000??????????101?????0010011 : begin
        out_RS2_TYPE = RegisterType_NONE;
      end
      32'b?????????????????000?????1100111 : begin
        out_RS2_TYPE = RegisterType_NONE;
      end
      default : begin
      end
    endcase
  end

  assign _out_default_RS1_TYPE = (1'bx);
  always @(*) begin
    out_RS1_TYPE = _out_default_RS1_TYPE;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b0000001??????????010?????0110011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????????????0010111 : begin
        out_RS1_TYPE = RegisterType_NONE;
      end
      32'b0000000??????????111?????0110011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????000?????0010011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b0000000??????????010?????0110011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b0000001??????????101?????0110011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????010?????0000011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????011?????0010011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????101?????1100011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b0100000??????????101?????0110011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b0000000??????????101?????0110011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????101?????0000011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????110?????1110011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????000?????1100011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????000?????0000011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????001?????1110011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????????????0110111 : begin
        out_RS1_TYPE = RegisterType_NONE;
      end
      32'b?????????????????110?????0010011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b0000001??????????000?????0110011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b00000000000100000000000001110011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????010?????0100011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????110?????1100011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????100?????0010011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b0100000??????????000?????0110011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b0000000??????????001?????0010011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b0000001??????????011?????0110011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b0000000??????????000?????0110011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????111?????1110011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????001?????1100011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????????????1101111 : begin
        out_RS1_TYPE = RegisterType_NONE;
      end
      32'b0000000??????????011?????0110011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????111?????0010011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????010?????1110011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????001?????0000011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????000?????0100011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b0000001??????????110?????0110011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????100?????1100011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b0000001??????????001?????0110011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????010?????0010011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????101?????1110011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b0000000??????????110?????0110011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b0000000??????????001?????0110011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????111?????1100011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b0000001??????????100?????0110011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b00110000001000000000000001110011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b0000000??????????100?????0110011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????001?????0100011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b0100000??????????101?????0010011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????011?????1110011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b0000001??????????111?????0110011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????100?????0000011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b0000000??????????101?????0010011 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      32'b?????????????????000?????1100111 : begin
        out_RS1_TYPE = RegisterType_GPR;
      end
      default : begin
      end
    endcase
  end

  assign _out_default_IMM_USED = 1'bx;
  always @(*) begin
    out_IMM_USED = _out_default_IMM_USED;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b0000001??????????010?????0110011 : begin
        out_IMM_USED = 1'b0;
      end
      32'b?????????????????????????0010111 : begin
        out_IMM_USED = 1'b1;
      end
      32'b0000000??????????111?????0110011 : begin
        out_IMM_USED = 1'b0;
      end
      32'b?????????????????000?????0010011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b0000000??????????010?????0110011 : begin
        out_IMM_USED = 1'b0;
      end
      32'b0000001??????????101?????0110011 : begin
        out_IMM_USED = 1'b0;
      end
      32'b?????????????????010?????0000011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b?????????????????011?????0010011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b?????????????????101?????1100011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b0100000??????????101?????0110011 : begin
        out_IMM_USED = 1'b0;
      end
      32'b0000000??????????101?????0110011 : begin
        out_IMM_USED = 1'b0;
      end
      32'b?????????????????101?????0000011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b?????????????????110?????1110011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b?????????????????000?????1100011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b?????????????????000?????0000011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b?????????????????001?????1110011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b?????????????????????????0110111 : begin
        out_IMM_USED = 1'b1;
      end
      32'b?????????????????110?????0010011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b0000001??????????000?????0110011 : begin
        out_IMM_USED = 1'b0;
      end
      32'b00000000000100000000000001110011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b?????????????????010?????0100011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b?????????????????110?????1100011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b?????????????????100?????0010011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b0100000??????????000?????0110011 : begin
        out_IMM_USED = 1'b0;
      end
      32'b0000000??????????001?????0010011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b0000001??????????011?????0110011 : begin
        out_IMM_USED = 1'b0;
      end
      32'b0000000??????????000?????0110011 : begin
        out_IMM_USED = 1'b0;
      end
      32'b?????????????????111?????1110011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b?????????????????001?????1100011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b?????????????????????????1101111 : begin
        out_IMM_USED = 1'b1;
      end
      32'b0000000??????????011?????0110011 : begin
        out_IMM_USED = 1'b0;
      end
      32'b?????????????????111?????0010011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b?????????????????010?????1110011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b?????????????????001?????0000011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b?????????????????000?????0100011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b0000001??????????110?????0110011 : begin
        out_IMM_USED = 1'b0;
      end
      32'b?????????????????100?????1100011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b0000001??????????001?????0110011 : begin
        out_IMM_USED = 1'b0;
      end
      32'b?????????????????010?????0010011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b?????????????????101?????1110011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b0000000??????????110?????0110011 : begin
        out_IMM_USED = 1'b0;
      end
      32'b0000000??????????001?????0110011 : begin
        out_IMM_USED = 1'b0;
      end
      32'b?????????????????111?????1100011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b0000001??????????100?????0110011 : begin
        out_IMM_USED = 1'b0;
      end
      32'b00110000001000000000000001110011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b0000000??????????100?????0110011 : begin
        out_IMM_USED = 1'b0;
      end
      32'b?????????????????001?????0100011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b0100000??????????101?????0010011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b?????????????????011?????1110011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b0000001??????????111?????0110011 : begin
        out_IMM_USED = 1'b0;
      end
      32'b?????????????????100?????0000011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b0000000??????????101?????0010011 : begin
        out_IMM_USED = 1'b1;
      end
      32'b?????????????????000?????1100111 : begin
        out_IMM_USED = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign _out_default_RD = 5'bxxxxx;
  always @(*) begin
    out_RD = _out_default_RD;
    out_RD = value_IR[11 : 7];
  end

  assign _out_default_RS2 = 5'bxxxxx;
  always @(*) begin
    out_RS2 = _out_default_RS2;
    out_RS2 = value_IR[24 : 20];
  end

  assign _out_default_RS1 = 5'bxxxxx;
  always @(*) begin
    out_RS1 = _out_default_RS1;
    out_RS1 = value_IR[19 : 15];
  end

  assign _out_default_ALU_COMMIT_RESULT = 1'bx;
  always @(*) begin
    out_ALU_COMMIT_RESULT = _out_default_ALU_COMMIT_RESULT;
    out_ALU_COMMIT_RESULT = 1'b0;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
      end
      32'b0000001??????????010?????0110011 : begin
      end
      32'b?????????????????????????0010111 : begin
        out_ALU_COMMIT_RESULT = 1'b1;
      end
      32'b0000000??????????111?????0110011 : begin
        out_ALU_COMMIT_RESULT = 1'b1;
      end
      32'b?????????????????000?????0010011 : begin
        out_ALU_COMMIT_RESULT = 1'b1;
      end
      32'b0000000??????????010?????0110011 : begin
        out_ALU_COMMIT_RESULT = 1'b1;
      end
      32'b0000001??????????101?????0110011 : begin
      end
      32'b?????????????????010?????0000011 : begin
      end
      32'b?????????????????011?????0010011 : begin
        out_ALU_COMMIT_RESULT = 1'b1;
      end
      32'b?????????????????101?????1100011 : begin
      end
      32'b0100000??????????101?????0110011 : begin
      end
      32'b0000000??????????101?????0110011 : begin
      end
      32'b?????????????????101?????0000011 : begin
      end
      32'b?????????????????110?????1110011 : begin
      end
      32'b?????????????????000?????1100011 : begin
      end
      32'b?????????????????000?????0000011 : begin
      end
      32'b?????????????????001?????1110011 : begin
      end
      32'b?????????????????????????0110111 : begin
        out_ALU_COMMIT_RESULT = 1'b1;
      end
      32'b?????????????????110?????0010011 : begin
        out_ALU_COMMIT_RESULT = 1'b1;
      end
      32'b0000001??????????000?????0110011 : begin
      end
      32'b00000000000100000000000001110011 : begin
      end
      32'b?????????????????010?????0100011 : begin
      end
      32'b?????????????????110?????1100011 : begin
      end
      32'b?????????????????100?????0010011 : begin
        out_ALU_COMMIT_RESULT = 1'b1;
      end
      32'b0100000??????????000?????0110011 : begin
        out_ALU_COMMIT_RESULT = 1'b1;
      end
      32'b0000000??????????001?????0010011 : begin
      end
      32'b0000001??????????011?????0110011 : begin
      end
      32'b0000000??????????000?????0110011 : begin
        out_ALU_COMMIT_RESULT = 1'b1;
      end
      32'b?????????????????111?????1110011 : begin
      end
      32'b?????????????????001?????1100011 : begin
      end
      32'b?????????????????????????1101111 : begin
      end
      32'b0000000??????????011?????0110011 : begin
        out_ALU_COMMIT_RESULT = 1'b1;
      end
      32'b?????????????????111?????0010011 : begin
        out_ALU_COMMIT_RESULT = 1'b1;
      end
      32'b?????????????????010?????1110011 : begin
      end
      32'b?????????????????001?????0000011 : begin
      end
      32'b?????????????????000?????0100011 : begin
      end
      32'b0000001??????????110?????0110011 : begin
      end
      32'b?????????????????100?????1100011 : begin
      end
      32'b0000001??????????001?????0110011 : begin
      end
      32'b?????????????????010?????0010011 : begin
        out_ALU_COMMIT_RESULT = 1'b1;
      end
      32'b?????????????????101?????1110011 : begin
      end
      32'b0000000??????????110?????0110011 : begin
        out_ALU_COMMIT_RESULT = 1'b1;
      end
      32'b0000000??????????001?????0110011 : begin
      end
      32'b?????????????????111?????1100011 : begin
      end
      32'b0000001??????????100?????0110011 : begin
      end
      32'b00110000001000000000000001110011 : begin
      end
      32'b0000000??????????100?????0110011 : begin
        out_ALU_COMMIT_RESULT = 1'b1;
      end
      32'b?????????????????001?????0100011 : begin
      end
      32'b0100000??????????101?????0010011 : begin
      end
      32'b?????????????????011?????1110011 : begin
      end
      32'b0000001??????????111?????0110011 : begin
      end
      32'b?????????????????100?????0000011 : begin
      end
      32'b0000000??????????101?????0010011 : begin
      end
      32'b?????????????????000?????1100111 : begin
      end
      default : begin
      end
    endcase
  end

  assign _out_default_ALU_SRC1 = (1'bx);
  always @(*) begin
    out_ALU_SRC1 = _out_default_ALU_SRC1;
    out_ALU_SRC1 = Src1Select_RS1;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
      end
      32'b0000001??????????010?????0110011 : begin
      end
      32'b?????????????????????????0010111 : begin
        out_ALU_SRC1 = Src1Select_PC;
      end
      32'b0000000??????????111?????0110011 : begin
      end
      32'b?????????????????000?????0010011 : begin
      end
      32'b0000000??????????010?????0110011 : begin
      end
      32'b0000001??????????101?????0110011 : begin
      end
      32'b?????????????????010?????0000011 : begin
        out_ALU_SRC1 = Src1Select_RS1;
      end
      32'b?????????????????011?????0010011 : begin
      end
      32'b?????????????????101?????1100011 : begin
        out_ALU_SRC1 = Src1Select_PC;
      end
      32'b0100000??????????101?????0110011 : begin
      end
      32'b0000000??????????101?????0110011 : begin
      end
      32'b?????????????????101?????0000011 : begin
        out_ALU_SRC1 = Src1Select_RS1;
      end
      32'b?????????????????110?????1110011 : begin
      end
      32'b?????????????????000?????1100011 : begin
        out_ALU_SRC1 = Src1Select_PC;
      end
      32'b?????????????????000?????0000011 : begin
        out_ALU_SRC1 = Src1Select_RS1;
      end
      32'b?????????????????001?????1110011 : begin
      end
      32'b?????????????????????????0110111 : begin
      end
      32'b?????????????????110?????0010011 : begin
      end
      32'b0000001??????????000?????0110011 : begin
      end
      32'b00000000000100000000000001110011 : begin
      end
      32'b?????????????????010?????0100011 : begin
        out_ALU_SRC1 = Src1Select_RS1;
      end
      32'b?????????????????110?????1100011 : begin
        out_ALU_SRC1 = Src1Select_PC;
      end
      32'b?????????????????100?????0010011 : begin
      end
      32'b0100000??????????000?????0110011 : begin
      end
      32'b0000000??????????001?????0010011 : begin
      end
      32'b0000001??????????011?????0110011 : begin
      end
      32'b0000000??????????000?????0110011 : begin
      end
      32'b?????????????????111?????1110011 : begin
      end
      32'b?????????????????001?????1100011 : begin
        out_ALU_SRC1 = Src1Select_PC;
      end
      32'b?????????????????????????1101111 : begin
        out_ALU_SRC1 = Src1Select_PC;
      end
      32'b0000000??????????011?????0110011 : begin
      end
      32'b?????????????????111?????0010011 : begin
      end
      32'b?????????????????010?????1110011 : begin
      end
      32'b?????????????????001?????0000011 : begin
        out_ALU_SRC1 = Src1Select_RS1;
      end
      32'b?????????????????000?????0100011 : begin
        out_ALU_SRC1 = Src1Select_RS1;
      end
      32'b0000001??????????110?????0110011 : begin
      end
      32'b?????????????????100?????1100011 : begin
        out_ALU_SRC1 = Src1Select_PC;
      end
      32'b0000001??????????001?????0110011 : begin
      end
      32'b?????????????????010?????0010011 : begin
      end
      32'b?????????????????101?????1110011 : begin
      end
      32'b0000000??????????110?????0110011 : begin
      end
      32'b0000000??????????001?????0110011 : begin
      end
      32'b?????????????????111?????1100011 : begin
        out_ALU_SRC1 = Src1Select_PC;
      end
      32'b0000001??????????100?????0110011 : begin
      end
      32'b00110000001000000000000001110011 : begin
      end
      32'b0000000??????????100?????0110011 : begin
      end
      32'b?????????????????001?????0100011 : begin
        out_ALU_SRC1 = Src1Select_RS1;
      end
      32'b0100000??????????101?????0010011 : begin
      end
      32'b?????????????????011?????1110011 : begin
      end
      32'b0000001??????????111?????0110011 : begin
      end
      32'b?????????????????100?????0000011 : begin
        out_ALU_SRC1 = Src1Select_RS1;
      end
      32'b0000000??????????101?????0010011 : begin
      end
      32'b?????????????????000?????1100111 : begin
        out_ALU_SRC1 = Src1Select_RS1;
      end
      default : begin
      end
    endcase
  end

  assign _out_default_IMM = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
  always @(*) begin
    out_IMM = _out_default_IMM;
    out_IMM = 32'h0;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
        out_IMM = {_zz_out_IMM_3,_zz_out_IMM_1};
      end
      32'b0000001??????????010?????0110011 : begin
        out_IMM = 32'h0;
      end
      32'b?????????????????????????0010111 : begin
        out_IMM = _zz_out_IMM_103;
      end
      32'b0000000??????????111?????0110011 : begin
        out_IMM = 32'h0;
      end
      32'b?????????????????000?????0010011 : begin
        out_IMM = {_zz_out_IMM_6,_zz_out_IMM_4};
      end
      32'b0000000??????????010?????0110011 : begin
        out_IMM = 32'h0;
      end
      32'b0000001??????????101?????0110011 : begin
        out_IMM = 32'h0;
      end
      32'b?????????????????010?????0000011 : begin
        out_IMM = {_zz_out_IMM_9,_zz_out_IMM_7};
      end
      32'b?????????????????011?????0010011 : begin
        out_IMM = {_zz_out_IMM_12,_zz_out_IMM_10};
      end
      32'b?????????????????101?????1100011 : begin
        out_IMM = {_zz_out_IMM_15,_zz_out_IMM_13};
      end
      32'b0100000??????????101?????0110011 : begin
        out_IMM = 32'h0;
      end
      32'b0000000??????????101?????0110011 : begin
        out_IMM = 32'h0;
      end
      32'b?????????????????101?????0000011 : begin
        out_IMM = {_zz_out_IMM_18,_zz_out_IMM_16};
      end
      32'b?????????????????110?????1110011 : begin
        out_IMM = {_zz_out_IMM_21,_zz_out_IMM_19};
      end
      32'b?????????????????000?????1100011 : begin
        out_IMM = {_zz_out_IMM_24,_zz_out_IMM_22};
      end
      32'b?????????????????000?????0000011 : begin
        out_IMM = {_zz_out_IMM_27,_zz_out_IMM_25};
      end
      32'b?????????????????001?????1110011 : begin
        out_IMM = {_zz_out_IMM_30,_zz_out_IMM_28};
      end
      32'b?????????????????????????0110111 : begin
        out_IMM = _zz_out_IMM_104;
      end
      32'b?????????????????110?????0010011 : begin
        out_IMM = {_zz_out_IMM_33,_zz_out_IMM_31};
      end
      32'b0000001??????????000?????0110011 : begin
        out_IMM = 32'h0;
      end
      32'b00000000000100000000000001110011 : begin
        out_IMM = {_zz_out_IMM_36,_zz_out_IMM_34};
      end
      32'b?????????????????010?????0100011 : begin
        out_IMM = {_zz_out_IMM_39,_zz_out_IMM_37};
      end
      32'b?????????????????110?????1100011 : begin
        out_IMM = {_zz_out_IMM_42,_zz_out_IMM_40};
      end
      32'b?????????????????100?????0010011 : begin
        out_IMM = {_zz_out_IMM_45,_zz_out_IMM_43};
      end
      32'b0100000??????????000?????0110011 : begin
        out_IMM = 32'h0;
      end
      32'b0000000??????????001?????0010011 : begin
        out_IMM = {_zz_out_IMM_48,_zz_out_IMM_46};
      end
      32'b0000001??????????011?????0110011 : begin
        out_IMM = 32'h0;
      end
      32'b0000000??????????000?????0110011 : begin
        out_IMM = 32'h0;
      end
      32'b?????????????????111?????1110011 : begin
        out_IMM = {_zz_out_IMM_51,_zz_out_IMM_49};
      end
      32'b?????????????????001?????1100011 : begin
        out_IMM = {_zz_out_IMM_54,_zz_out_IMM_52};
      end
      32'b?????????????????????????1101111 : begin
        out_IMM = {_zz_out_IMM_57,_zz_out_IMM_55};
      end
      32'b0000000??????????011?????0110011 : begin
        out_IMM = 32'h0;
      end
      32'b?????????????????111?????0010011 : begin
        out_IMM = {_zz_out_IMM_60,_zz_out_IMM_58};
      end
      32'b?????????????????010?????1110011 : begin
        out_IMM = {_zz_out_IMM_63,_zz_out_IMM_61};
      end
      32'b?????????????????001?????0000011 : begin
        out_IMM = {_zz_out_IMM_66,_zz_out_IMM_64};
      end
      32'b?????????????????000?????0100011 : begin
        out_IMM = {_zz_out_IMM_69,_zz_out_IMM_67};
      end
      32'b0000001??????????110?????0110011 : begin
        out_IMM = 32'h0;
      end
      32'b?????????????????100?????1100011 : begin
        out_IMM = {_zz_out_IMM_72,_zz_out_IMM_70};
      end
      32'b0000001??????????001?????0110011 : begin
        out_IMM = 32'h0;
      end
      32'b?????????????????010?????0010011 : begin
        out_IMM = {_zz_out_IMM_75,_zz_out_IMM_73};
      end
      32'b?????????????????101?????1110011 : begin
        out_IMM = {_zz_out_IMM_78,_zz_out_IMM_76};
      end
      32'b0000000??????????110?????0110011 : begin
        out_IMM = 32'h0;
      end
      32'b0000000??????????001?????0110011 : begin
        out_IMM = 32'h0;
      end
      32'b?????????????????111?????1100011 : begin
        out_IMM = {_zz_out_IMM_81,_zz_out_IMM_79};
      end
      32'b0000001??????????100?????0110011 : begin
        out_IMM = 32'h0;
      end
      32'b00110000001000000000000001110011 : begin
        out_IMM = {_zz_out_IMM_84,_zz_out_IMM_82};
      end
      32'b0000000??????????100?????0110011 : begin
        out_IMM = 32'h0;
      end
      32'b?????????????????001?????0100011 : begin
        out_IMM = {_zz_out_IMM_87,_zz_out_IMM_85};
      end
      32'b0100000??????????101?????0010011 : begin
        out_IMM = {_zz_out_IMM_90,_zz_out_IMM_88};
      end
      32'b?????????????????011?????1110011 : begin
        out_IMM = {_zz_out_IMM_93,_zz_out_IMM_91};
      end
      32'b0000001??????????111?????0110011 : begin
        out_IMM = 32'h0;
      end
      32'b?????????????????100?????0000011 : begin
        out_IMM = {_zz_out_IMM_96,_zz_out_IMM_94};
      end
      32'b0000000??????????101?????0010011 : begin
        out_IMM = {_zz_out_IMM_99,_zz_out_IMM_97};
      end
      32'b?????????????????000?????1100111 : begin
        out_IMM = {_zz_out_IMM_102,_zz_out_IMM_100};
      end
      default : begin
      end
    endcase
  end

  assign _out_default_MULDIV_RS1_SIGNED = 1'bx;
  always @(*) begin
    out_MULDIV_RS1_SIGNED = _out_default_MULDIV_RS1_SIGNED;
    out_MULDIV_RS1_SIGNED = 1'b0;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
      end
      32'b0000001??????????010?????0110011 : begin
        out_MULDIV_RS1_SIGNED = 1'b1;
      end
      32'b?????????????????????????0010111 : begin
      end
      32'b0000000??????????111?????0110011 : begin
      end
      32'b?????????????????000?????0010011 : begin
      end
      32'b0000000??????????010?????0110011 : begin
      end
      32'b0000001??????????101?????0110011 : begin
        out_MULDIV_RS1_SIGNED = 1'b0;
      end
      32'b?????????????????010?????0000011 : begin
      end
      32'b?????????????????011?????0010011 : begin
      end
      32'b?????????????????101?????1100011 : begin
      end
      32'b0100000??????????101?????0110011 : begin
      end
      32'b0000000??????????101?????0110011 : begin
      end
      32'b?????????????????101?????0000011 : begin
      end
      32'b?????????????????110?????1110011 : begin
      end
      32'b?????????????????000?????1100011 : begin
      end
      32'b?????????????????000?????0000011 : begin
      end
      32'b?????????????????001?????1110011 : begin
      end
      32'b?????????????????????????0110111 : begin
      end
      32'b?????????????????110?????0010011 : begin
      end
      32'b0000001??????????000?????0110011 : begin
        out_MULDIV_RS1_SIGNED = 1'b1;
      end
      32'b00000000000100000000000001110011 : begin
      end
      32'b?????????????????010?????0100011 : begin
      end
      32'b?????????????????110?????1100011 : begin
      end
      32'b?????????????????100?????0010011 : begin
      end
      32'b0100000??????????000?????0110011 : begin
      end
      32'b0000000??????????001?????0010011 : begin
      end
      32'b0000001??????????011?????0110011 : begin
        out_MULDIV_RS1_SIGNED = 1'b0;
      end
      32'b0000000??????????000?????0110011 : begin
      end
      32'b?????????????????111?????1110011 : begin
      end
      32'b?????????????????001?????1100011 : begin
      end
      32'b?????????????????????????1101111 : begin
      end
      32'b0000000??????????011?????0110011 : begin
      end
      32'b?????????????????111?????0010011 : begin
      end
      32'b?????????????????010?????1110011 : begin
      end
      32'b?????????????????001?????0000011 : begin
      end
      32'b?????????????????000?????0100011 : begin
      end
      32'b0000001??????????110?????0110011 : begin
        out_MULDIV_RS1_SIGNED = 1'b1;
      end
      32'b?????????????????100?????1100011 : begin
      end
      32'b0000001??????????001?????0110011 : begin
        out_MULDIV_RS1_SIGNED = 1'b1;
      end
      32'b?????????????????010?????0010011 : begin
      end
      32'b?????????????????101?????1110011 : begin
      end
      32'b0000000??????????110?????0110011 : begin
      end
      32'b0000000??????????001?????0110011 : begin
      end
      32'b?????????????????111?????1100011 : begin
      end
      32'b0000001??????????100?????0110011 : begin
        out_MULDIV_RS1_SIGNED = 1'b1;
      end
      32'b00110000001000000000000001110011 : begin
      end
      32'b0000000??????????100?????0110011 : begin
      end
      32'b?????????????????001?????0100011 : begin
      end
      32'b0100000??????????101?????0010011 : begin
      end
      32'b?????????????????011?????1110011 : begin
      end
      32'b0000001??????????111?????0110011 : begin
        out_MULDIV_RS1_SIGNED = 1'b0;
      end
      32'b?????????????????100?????0000011 : begin
      end
      32'b0000000??????????101?????0010011 : begin
      end
      32'b?????????????????000?????1100111 : begin
      end
      default : begin
      end
    endcase
  end

  assign _out_default_BU_IS_BRANCH = 1'bx;
  always @(*) begin
    out_BU_IS_BRANCH = _out_default_BU_IS_BRANCH;
    out_BU_IS_BRANCH = 1'b0;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
      end
      32'b0000001??????????010?????0110011 : begin
      end
      32'b?????????????????????????0010111 : begin
      end
      32'b0000000??????????111?????0110011 : begin
      end
      32'b?????????????????000?????0010011 : begin
      end
      32'b0000000??????????010?????0110011 : begin
      end
      32'b0000001??????????101?????0110011 : begin
      end
      32'b?????????????????010?????0000011 : begin
      end
      32'b?????????????????011?????0010011 : begin
      end
      32'b?????????????????101?????1100011 : begin
        out_BU_IS_BRANCH = 1'b1;
      end
      32'b0100000??????????101?????0110011 : begin
      end
      32'b0000000??????????101?????0110011 : begin
      end
      32'b?????????????????101?????0000011 : begin
      end
      32'b?????????????????110?????1110011 : begin
      end
      32'b?????????????????000?????1100011 : begin
        out_BU_IS_BRANCH = 1'b1;
      end
      32'b?????????????????000?????0000011 : begin
      end
      32'b?????????????????001?????1110011 : begin
      end
      32'b?????????????????????????0110111 : begin
      end
      32'b?????????????????110?????0010011 : begin
      end
      32'b0000001??????????000?????0110011 : begin
      end
      32'b00000000000100000000000001110011 : begin
      end
      32'b?????????????????010?????0100011 : begin
      end
      32'b?????????????????110?????1100011 : begin
        out_BU_IS_BRANCH = 1'b1;
      end
      32'b?????????????????100?????0010011 : begin
      end
      32'b0100000??????????000?????0110011 : begin
      end
      32'b0000000??????????001?????0010011 : begin
      end
      32'b0000001??????????011?????0110011 : begin
      end
      32'b0000000??????????000?????0110011 : begin
      end
      32'b?????????????????111?????1110011 : begin
      end
      32'b?????????????????001?????1100011 : begin
        out_BU_IS_BRANCH = 1'b1;
      end
      32'b?????????????????????????1101111 : begin
        out_BU_IS_BRANCH = 1'b1;
      end
      32'b0000000??????????011?????0110011 : begin
      end
      32'b?????????????????111?????0010011 : begin
      end
      32'b?????????????????010?????1110011 : begin
      end
      32'b?????????????????001?????0000011 : begin
      end
      32'b?????????????????000?????0100011 : begin
      end
      32'b0000001??????????110?????0110011 : begin
      end
      32'b?????????????????100?????1100011 : begin
        out_BU_IS_BRANCH = 1'b1;
      end
      32'b0000001??????????001?????0110011 : begin
      end
      32'b?????????????????010?????0010011 : begin
      end
      32'b?????????????????101?????1110011 : begin
      end
      32'b0000000??????????110?????0110011 : begin
      end
      32'b0000000??????????001?????0110011 : begin
      end
      32'b?????????????????111?????1100011 : begin
        out_BU_IS_BRANCH = 1'b1;
      end
      32'b0000001??????????100?????0110011 : begin
      end
      32'b00110000001000000000000001110011 : begin
      end
      32'b0000000??????????100?????0110011 : begin
      end
      32'b?????????????????001?????0100011 : begin
      end
      32'b0100000??????????101?????0010011 : begin
      end
      32'b?????????????????011?????1110011 : begin
      end
      32'b0000001??????????111?????0110011 : begin
      end
      32'b?????????????????100?????0000011 : begin
      end
      32'b0000000??????????101?????0010011 : begin
      end
      32'b?????????????????000?????1100111 : begin
        out_BU_IS_BRANCH = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign _out_default_CSR_USE_IMM = 1'bx;
  always @(*) begin
    out_CSR_USE_IMM = _out_default_CSR_USE_IMM;
    out_CSR_USE_IMM = 1'b0;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
      end
      32'b0000001??????????010?????0110011 : begin
      end
      32'b?????????????????????????0010111 : begin
      end
      32'b0000000??????????111?????0110011 : begin
      end
      32'b?????????????????000?????0010011 : begin
      end
      32'b0000000??????????010?????0110011 : begin
      end
      32'b0000001??????????101?????0110011 : begin
      end
      32'b?????????????????010?????0000011 : begin
      end
      32'b?????????????????011?????0010011 : begin
      end
      32'b?????????????????101?????1100011 : begin
      end
      32'b0100000??????????101?????0110011 : begin
      end
      32'b0000000??????????101?????0110011 : begin
      end
      32'b?????????????????101?????0000011 : begin
      end
      32'b?????????????????110?????1110011 : begin
        out_CSR_USE_IMM = 1'b1;
      end
      32'b?????????????????000?????1100011 : begin
      end
      32'b?????????????????000?????0000011 : begin
      end
      32'b?????????????????001?????1110011 : begin
        out_CSR_USE_IMM = 1'b0;
      end
      32'b?????????????????????????0110111 : begin
      end
      32'b?????????????????110?????0010011 : begin
      end
      32'b0000001??????????000?????0110011 : begin
      end
      32'b00000000000100000000000001110011 : begin
      end
      32'b?????????????????010?????0100011 : begin
      end
      32'b?????????????????110?????1100011 : begin
      end
      32'b?????????????????100?????0010011 : begin
      end
      32'b0100000??????????000?????0110011 : begin
      end
      32'b0000000??????????001?????0010011 : begin
      end
      32'b0000001??????????011?????0110011 : begin
      end
      32'b0000000??????????000?????0110011 : begin
      end
      32'b?????????????????111?????1110011 : begin
        out_CSR_USE_IMM = 1'b1;
      end
      32'b?????????????????001?????1100011 : begin
      end
      32'b?????????????????????????1101111 : begin
      end
      32'b0000000??????????011?????0110011 : begin
      end
      32'b?????????????????111?????0010011 : begin
      end
      32'b?????????????????010?????1110011 : begin
        out_CSR_USE_IMM = 1'b0;
      end
      32'b?????????????????001?????0000011 : begin
      end
      32'b?????????????????000?????0100011 : begin
      end
      32'b0000001??????????110?????0110011 : begin
      end
      32'b?????????????????100?????1100011 : begin
      end
      32'b0000001??????????001?????0110011 : begin
      end
      32'b?????????????????010?????0010011 : begin
      end
      32'b?????????????????101?????1110011 : begin
        out_CSR_USE_IMM = 1'b1;
      end
      32'b0000000??????????110?????0110011 : begin
      end
      32'b0000000??????????001?????0110011 : begin
      end
      32'b?????????????????111?????1100011 : begin
      end
      32'b0000001??????????100?????0110011 : begin
      end
      32'b00110000001000000000000001110011 : begin
      end
      32'b0000000??????????100?????0110011 : begin
      end
      32'b?????????????????001?????0100011 : begin
      end
      32'b0100000??????????101?????0010011 : begin
      end
      32'b?????????????????011?????1110011 : begin
        out_CSR_USE_IMM = 1'b0;
      end
      32'b0000001??????????111?????0110011 : begin
      end
      32'b?????????????????100?????0000011 : begin
      end
      32'b0000000??????????101?????0010011 : begin
      end
      32'b?????????????????000?????1100111 : begin
      end
      default : begin
      end
    endcase
  end

  assign _out_default_MRET = 1'bx;
  always @(*) begin
    out_MRET = _out_default_MRET;
    out_MRET = 1'b0;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
      end
      32'b0000001??????????010?????0110011 : begin
      end
      32'b?????????????????????????0010111 : begin
      end
      32'b0000000??????????111?????0110011 : begin
      end
      32'b?????????????????000?????0010011 : begin
      end
      32'b0000000??????????010?????0110011 : begin
      end
      32'b0000001??????????101?????0110011 : begin
      end
      32'b?????????????????010?????0000011 : begin
      end
      32'b?????????????????011?????0010011 : begin
      end
      32'b?????????????????101?????1100011 : begin
      end
      32'b0100000??????????101?????0110011 : begin
      end
      32'b0000000??????????101?????0110011 : begin
      end
      32'b?????????????????101?????0000011 : begin
      end
      32'b?????????????????110?????1110011 : begin
      end
      32'b?????????????????000?????1100011 : begin
      end
      32'b?????????????????000?????0000011 : begin
      end
      32'b?????????????????001?????1110011 : begin
      end
      32'b?????????????????????????0110111 : begin
      end
      32'b?????????????????110?????0010011 : begin
      end
      32'b0000001??????????000?????0110011 : begin
      end
      32'b00000000000100000000000001110011 : begin
      end
      32'b?????????????????010?????0100011 : begin
      end
      32'b?????????????????110?????1100011 : begin
      end
      32'b?????????????????100?????0010011 : begin
      end
      32'b0100000??????????000?????0110011 : begin
      end
      32'b0000000??????????001?????0010011 : begin
      end
      32'b0000001??????????011?????0110011 : begin
      end
      32'b0000000??????????000?????0110011 : begin
      end
      32'b?????????????????111?????1110011 : begin
      end
      32'b?????????????????001?????1100011 : begin
      end
      32'b?????????????????????????1101111 : begin
      end
      32'b0000000??????????011?????0110011 : begin
      end
      32'b?????????????????111?????0010011 : begin
      end
      32'b?????????????????010?????1110011 : begin
      end
      32'b?????????????????001?????0000011 : begin
      end
      32'b?????????????????000?????0100011 : begin
      end
      32'b0000001??????????110?????0110011 : begin
      end
      32'b?????????????????100?????1100011 : begin
      end
      32'b0000001??????????001?????0110011 : begin
      end
      32'b?????????????????010?????0010011 : begin
      end
      32'b?????????????????101?????1110011 : begin
      end
      32'b0000000??????????110?????0110011 : begin
      end
      32'b0000000??????????001?????0110011 : begin
      end
      32'b?????????????????111?????1100011 : begin
      end
      32'b0000001??????????100?????0110011 : begin
      end
      32'b00110000001000000000000001110011 : begin
        out_MRET = 1'b1;
      end
      32'b0000000??????????100?????0110011 : begin
      end
      32'b?????????????????001?????0100011 : begin
      end
      32'b0100000??????????101?????0010011 : begin
      end
      32'b?????????????????011?????1110011 : begin
      end
      32'b0000001??????????111?????0110011 : begin
      end
      32'b?????????????????100?????0000011 : begin
      end
      32'b0000000??????????101?????0010011 : begin
      end
      32'b?????????????????000?????1100111 : begin
      end
      default : begin
      end
    endcase
  end

  assign _out_default_BU_IGNORE_TARGET_LSB = 1'bx;
  always @(*) begin
    out_BU_IGNORE_TARGET_LSB = _out_default_BU_IGNORE_TARGET_LSB;
    out_BU_IGNORE_TARGET_LSB = 1'b0;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
      end
      32'b0000001??????????010?????0110011 : begin
      end
      32'b?????????????????????????0010111 : begin
      end
      32'b0000000??????????111?????0110011 : begin
      end
      32'b?????????????????000?????0010011 : begin
      end
      32'b0000000??????????010?????0110011 : begin
      end
      32'b0000001??????????101?????0110011 : begin
      end
      32'b?????????????????010?????0000011 : begin
      end
      32'b?????????????????011?????0010011 : begin
      end
      32'b?????????????????101?????1100011 : begin
      end
      32'b0100000??????????101?????0110011 : begin
      end
      32'b0000000??????????101?????0110011 : begin
      end
      32'b?????????????????101?????0000011 : begin
      end
      32'b?????????????????110?????1110011 : begin
      end
      32'b?????????????????000?????1100011 : begin
      end
      32'b?????????????????000?????0000011 : begin
      end
      32'b?????????????????001?????1110011 : begin
      end
      32'b?????????????????????????0110111 : begin
      end
      32'b?????????????????110?????0010011 : begin
      end
      32'b0000001??????????000?????0110011 : begin
      end
      32'b00000000000100000000000001110011 : begin
      end
      32'b?????????????????010?????0100011 : begin
      end
      32'b?????????????????110?????1100011 : begin
      end
      32'b?????????????????100?????0010011 : begin
      end
      32'b0100000??????????000?????0110011 : begin
      end
      32'b0000000??????????001?????0010011 : begin
      end
      32'b0000001??????????011?????0110011 : begin
      end
      32'b0000000??????????000?????0110011 : begin
      end
      32'b?????????????????111?????1110011 : begin
      end
      32'b?????????????????001?????1100011 : begin
      end
      32'b?????????????????????????1101111 : begin
      end
      32'b0000000??????????011?????0110011 : begin
      end
      32'b?????????????????111?????0010011 : begin
      end
      32'b?????????????????010?????1110011 : begin
      end
      32'b?????????????????001?????0000011 : begin
      end
      32'b?????????????????000?????0100011 : begin
      end
      32'b0000001??????????110?????0110011 : begin
      end
      32'b?????????????????100?????1100011 : begin
      end
      32'b0000001??????????001?????0110011 : begin
      end
      32'b?????????????????010?????0010011 : begin
      end
      32'b?????????????????101?????1110011 : begin
      end
      32'b0000000??????????110?????0110011 : begin
      end
      32'b0000000??????????001?????0110011 : begin
      end
      32'b?????????????????111?????1100011 : begin
      end
      32'b0000001??????????100?????0110011 : begin
      end
      32'b00110000001000000000000001110011 : begin
      end
      32'b0000000??????????100?????0110011 : begin
      end
      32'b?????????????????001?????0100011 : begin
      end
      32'b0100000??????????101?????0010011 : begin
      end
      32'b?????????????????011?????1110011 : begin
      end
      32'b0000001??????????111?????0110011 : begin
      end
      32'b?????????????????100?????0000011 : begin
      end
      32'b0000000??????????101?????0010011 : begin
      end
      32'b?????????????????000?????1100111 : begin
        out_BU_IGNORE_TARGET_LSB = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign _out_default_RD_DATA_VALID = 1'bx;
  always @(*) begin
    out_RD_DATA_VALID = _out_default_RD_DATA_VALID;
    out_RD_DATA_VALID = 1'b0;
  end

  assign _out_default_MULDIV_RS2_SIGNED = 1'bx;
  always @(*) begin
    out_MULDIV_RS2_SIGNED = _out_default_MULDIV_RS2_SIGNED;
    out_MULDIV_RS2_SIGNED = 1'b0;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
      end
      32'b0000001??????????010?????0110011 : begin
        out_MULDIV_RS2_SIGNED = 1'b0;
      end
      32'b?????????????????????????0010111 : begin
      end
      32'b0000000??????????111?????0110011 : begin
      end
      32'b?????????????????000?????0010011 : begin
      end
      32'b0000000??????????010?????0110011 : begin
      end
      32'b0000001??????????101?????0110011 : begin
        out_MULDIV_RS2_SIGNED = 1'b0;
      end
      32'b?????????????????010?????0000011 : begin
      end
      32'b?????????????????011?????0010011 : begin
      end
      32'b?????????????????101?????1100011 : begin
      end
      32'b0100000??????????101?????0110011 : begin
      end
      32'b0000000??????????101?????0110011 : begin
      end
      32'b?????????????????101?????0000011 : begin
      end
      32'b?????????????????110?????1110011 : begin
      end
      32'b?????????????????000?????1100011 : begin
      end
      32'b?????????????????000?????0000011 : begin
      end
      32'b?????????????????001?????1110011 : begin
      end
      32'b?????????????????????????0110111 : begin
      end
      32'b?????????????????110?????0010011 : begin
      end
      32'b0000001??????????000?????0110011 : begin
        out_MULDIV_RS2_SIGNED = 1'b1;
      end
      32'b00000000000100000000000001110011 : begin
      end
      32'b?????????????????010?????0100011 : begin
      end
      32'b?????????????????110?????1100011 : begin
      end
      32'b?????????????????100?????0010011 : begin
      end
      32'b0100000??????????000?????0110011 : begin
      end
      32'b0000000??????????001?????0010011 : begin
      end
      32'b0000001??????????011?????0110011 : begin
        out_MULDIV_RS2_SIGNED = 1'b0;
      end
      32'b0000000??????????000?????0110011 : begin
      end
      32'b?????????????????111?????1110011 : begin
      end
      32'b?????????????????001?????1100011 : begin
      end
      32'b?????????????????????????1101111 : begin
      end
      32'b0000000??????????011?????0110011 : begin
      end
      32'b?????????????????111?????0010011 : begin
      end
      32'b?????????????????010?????1110011 : begin
      end
      32'b?????????????????001?????0000011 : begin
      end
      32'b?????????????????000?????0100011 : begin
      end
      32'b0000001??????????110?????0110011 : begin
        out_MULDIV_RS2_SIGNED = 1'b1;
      end
      32'b?????????????????100?????1100011 : begin
      end
      32'b0000001??????????001?????0110011 : begin
        out_MULDIV_RS2_SIGNED = 1'b1;
      end
      32'b?????????????????010?????0010011 : begin
      end
      32'b?????????????????101?????1110011 : begin
      end
      32'b0000000??????????110?????0110011 : begin
      end
      32'b0000000??????????001?????0110011 : begin
      end
      32'b?????????????????111?????1100011 : begin
      end
      32'b0000001??????????100?????0110011 : begin
        out_MULDIV_RS2_SIGNED = 1'b1;
      end
      32'b00110000001000000000000001110011 : begin
      end
      32'b0000000??????????100?????0110011 : begin
      end
      32'b?????????????????001?????0100011 : begin
      end
      32'b0100000??????????101?????0010011 : begin
      end
      32'b?????????????????011?????1110011 : begin
      end
      32'b0000001??????????111?????0110011 : begin
        out_MULDIV_RS2_SIGNED = 1'b0;
      end
      32'b?????????????????100?????0000011 : begin
      end
      32'b0000000??????????101?????0010011 : begin
      end
      32'b?????????????????000?????1100111 : begin
      end
      default : begin
      end
    endcase
  end

  assign _out_default_DIV = 1'bx;
  always @(*) begin
    out_DIV = _out_default_DIV;
    out_DIV = 1'b0;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
      end
      32'b0000001??????????010?????0110011 : begin
      end
      32'b?????????????????????????0010111 : begin
      end
      32'b0000000??????????111?????0110011 : begin
      end
      32'b?????????????????000?????0010011 : begin
      end
      32'b0000000??????????010?????0110011 : begin
      end
      32'b0000001??????????101?????0110011 : begin
        out_DIV = 1'b1;
      end
      32'b?????????????????010?????0000011 : begin
      end
      32'b?????????????????011?????0010011 : begin
      end
      32'b?????????????????101?????1100011 : begin
      end
      32'b0100000??????????101?????0110011 : begin
      end
      32'b0000000??????????101?????0110011 : begin
      end
      32'b?????????????????101?????0000011 : begin
      end
      32'b?????????????????110?????1110011 : begin
      end
      32'b?????????????????000?????1100011 : begin
      end
      32'b?????????????????000?????0000011 : begin
      end
      32'b?????????????????001?????1110011 : begin
      end
      32'b?????????????????????????0110111 : begin
      end
      32'b?????????????????110?????0010011 : begin
      end
      32'b0000001??????????000?????0110011 : begin
      end
      32'b00000000000100000000000001110011 : begin
      end
      32'b?????????????????010?????0100011 : begin
      end
      32'b?????????????????110?????1100011 : begin
      end
      32'b?????????????????100?????0010011 : begin
      end
      32'b0100000??????????000?????0110011 : begin
      end
      32'b0000000??????????001?????0010011 : begin
      end
      32'b0000001??????????011?????0110011 : begin
      end
      32'b0000000??????????000?????0110011 : begin
      end
      32'b?????????????????111?????1110011 : begin
      end
      32'b?????????????????001?????1100011 : begin
      end
      32'b?????????????????????????1101111 : begin
      end
      32'b0000000??????????011?????0110011 : begin
      end
      32'b?????????????????111?????0010011 : begin
      end
      32'b?????????????????010?????1110011 : begin
      end
      32'b?????????????????001?????0000011 : begin
      end
      32'b?????????????????000?????0100011 : begin
      end
      32'b0000001??????????110?????0110011 : begin
        out_DIV = 1'b1;
      end
      32'b?????????????????100?????1100011 : begin
      end
      32'b0000001??????????001?????0110011 : begin
      end
      32'b?????????????????010?????0010011 : begin
      end
      32'b?????????????????101?????1110011 : begin
      end
      32'b0000000??????????110?????0110011 : begin
      end
      32'b0000000??????????001?????0110011 : begin
      end
      32'b?????????????????111?????1100011 : begin
      end
      32'b0000001??????????100?????0110011 : begin
        out_DIV = 1'b1;
      end
      32'b00110000001000000000000001110011 : begin
      end
      32'b0000000??????????100?????0110011 : begin
      end
      32'b?????????????????001?????0100011 : begin
      end
      32'b0100000??????????101?????0010011 : begin
      end
      32'b?????????????????011?????1110011 : begin
      end
      32'b0000001??????????111?????0110011 : begin
        out_DIV = 1'b1;
      end
      32'b?????????????????100?????0000011 : begin
      end
      32'b0000000??????????101?????0010011 : begin
      end
      32'b?????????????????000?????1100111 : begin
      end
      default : begin
      end
    endcase
  end

  assign _out_default_MUL = 1'bx;
  always @(*) begin
    out_MUL = _out_default_MUL;
    out_MUL = 1'b0;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
      end
      32'b0000001??????????010?????0110011 : begin
        out_MUL = 1'b1;
      end
      32'b?????????????????????????0010111 : begin
      end
      32'b0000000??????????111?????0110011 : begin
      end
      32'b?????????????????000?????0010011 : begin
      end
      32'b0000000??????????010?????0110011 : begin
      end
      32'b0000001??????????101?????0110011 : begin
      end
      32'b?????????????????010?????0000011 : begin
      end
      32'b?????????????????011?????0010011 : begin
      end
      32'b?????????????????101?????1100011 : begin
      end
      32'b0100000??????????101?????0110011 : begin
      end
      32'b0000000??????????101?????0110011 : begin
      end
      32'b?????????????????101?????0000011 : begin
      end
      32'b?????????????????110?????1110011 : begin
      end
      32'b?????????????????000?????1100011 : begin
      end
      32'b?????????????????000?????0000011 : begin
      end
      32'b?????????????????001?????1110011 : begin
      end
      32'b?????????????????????????0110111 : begin
      end
      32'b?????????????????110?????0010011 : begin
      end
      32'b0000001??????????000?????0110011 : begin
        out_MUL = 1'b1;
      end
      32'b00000000000100000000000001110011 : begin
      end
      32'b?????????????????010?????0100011 : begin
      end
      32'b?????????????????110?????1100011 : begin
      end
      32'b?????????????????100?????0010011 : begin
      end
      32'b0100000??????????000?????0110011 : begin
      end
      32'b0000000??????????001?????0010011 : begin
      end
      32'b0000001??????????011?????0110011 : begin
        out_MUL = 1'b1;
      end
      32'b0000000??????????000?????0110011 : begin
      end
      32'b?????????????????111?????1110011 : begin
      end
      32'b?????????????????001?????1100011 : begin
      end
      32'b?????????????????????????1101111 : begin
      end
      32'b0000000??????????011?????0110011 : begin
      end
      32'b?????????????????111?????0010011 : begin
      end
      32'b?????????????????010?????1110011 : begin
      end
      32'b?????????????????001?????0000011 : begin
      end
      32'b?????????????????000?????0100011 : begin
      end
      32'b0000001??????????110?????0110011 : begin
      end
      32'b?????????????????100?????1100011 : begin
      end
      32'b0000001??????????001?????0110011 : begin
        out_MUL = 1'b1;
      end
      32'b?????????????????010?????0010011 : begin
      end
      32'b?????????????????101?????1110011 : begin
      end
      32'b0000000??????????110?????0110011 : begin
      end
      32'b0000000??????????001?????0110011 : begin
      end
      32'b?????????????????111?????1100011 : begin
      end
      32'b0000001??????????100?????0110011 : begin
      end
      32'b00110000001000000000000001110011 : begin
      end
      32'b0000000??????????100?????0110011 : begin
      end
      32'b?????????????????001?????0100011 : begin
      end
      32'b0100000??????????101?????0010011 : begin
      end
      32'b?????????????????011?????1110011 : begin
      end
      32'b0000001??????????111?????0110011 : begin
      end
      32'b?????????????????100?????0000011 : begin
      end
      32'b0000000??????????101?????0010011 : begin
      end
      32'b?????????????????000?????1100111 : begin
      end
      default : begin
      end
    endcase
  end

  assign _out_default_EBREAK = 1'bx;
  always @(*) begin
    out_EBREAK = _out_default_EBREAK;
    out_EBREAK = 1'b0;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
      end
      32'b0000001??????????010?????0110011 : begin
      end
      32'b?????????????????????????0010111 : begin
      end
      32'b0000000??????????111?????0110011 : begin
      end
      32'b?????????????????000?????0010011 : begin
      end
      32'b0000000??????????010?????0110011 : begin
      end
      32'b0000001??????????101?????0110011 : begin
      end
      32'b?????????????????010?????0000011 : begin
      end
      32'b?????????????????011?????0010011 : begin
      end
      32'b?????????????????101?????1100011 : begin
      end
      32'b0100000??????????101?????0110011 : begin
      end
      32'b0000000??????????101?????0110011 : begin
      end
      32'b?????????????????101?????0000011 : begin
      end
      32'b?????????????????110?????1110011 : begin
      end
      32'b?????????????????000?????1100011 : begin
      end
      32'b?????????????????000?????0000011 : begin
      end
      32'b?????????????????001?????1110011 : begin
      end
      32'b?????????????????????????0110111 : begin
      end
      32'b?????????????????110?????0010011 : begin
      end
      32'b0000001??????????000?????0110011 : begin
      end
      32'b00000000000100000000000001110011 : begin
        out_EBREAK = 1'b1;
      end
      32'b?????????????????010?????0100011 : begin
      end
      32'b?????????????????110?????1100011 : begin
      end
      32'b?????????????????100?????0010011 : begin
      end
      32'b0100000??????????000?????0110011 : begin
      end
      32'b0000000??????????001?????0010011 : begin
      end
      32'b0000001??????????011?????0110011 : begin
      end
      32'b0000000??????????000?????0110011 : begin
      end
      32'b?????????????????111?????1110011 : begin
      end
      32'b?????????????????001?????1100011 : begin
      end
      32'b?????????????????????????1101111 : begin
      end
      32'b0000000??????????011?????0110011 : begin
      end
      32'b?????????????????111?????0010011 : begin
      end
      32'b?????????????????010?????1110011 : begin
      end
      32'b?????????????????001?????0000011 : begin
      end
      32'b?????????????????000?????0100011 : begin
      end
      32'b0000001??????????110?????0110011 : begin
      end
      32'b?????????????????100?????1100011 : begin
      end
      32'b0000001??????????001?????0110011 : begin
      end
      32'b?????????????????010?????0010011 : begin
      end
      32'b?????????????????101?????1110011 : begin
      end
      32'b0000000??????????110?????0110011 : begin
      end
      32'b0000000??????????001?????0110011 : begin
      end
      32'b?????????????????111?????1100011 : begin
      end
      32'b0000001??????????100?????0110011 : begin
      end
      32'b00110000001000000000000001110011 : begin
      end
      32'b0000000??????????100?????0110011 : begin
      end
      32'b?????????????????001?????0100011 : begin
      end
      32'b0100000??????????101?????0010011 : begin
      end
      32'b?????????????????011?????1110011 : begin
      end
      32'b0000001??????????111?????0110011 : begin
      end
      32'b?????????????????100?????0000011 : begin
      end
      32'b0000000??????????101?????0010011 : begin
      end
      32'b?????????????????000?????1100111 : begin
      end
      default : begin
      end
    endcase
  end

  assign _out_default_LSU_IS_UNSIGNED = 1'bx;
  always @(*) begin
    out_LSU_IS_UNSIGNED = _out_default_LSU_IS_UNSIGNED;
    out_LSU_IS_UNSIGNED = 1'b0;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
      end
      32'b0000001??????????010?????0110011 : begin
      end
      32'b?????????????????????????0010111 : begin
      end
      32'b0000000??????????111?????0110011 : begin
      end
      32'b?????????????????000?????0010011 : begin
      end
      32'b0000000??????????010?????0110011 : begin
      end
      32'b0000001??????????101?????0110011 : begin
      end
      32'b?????????????????010?????0000011 : begin
        out_LSU_IS_UNSIGNED = 1'b0;
      end
      32'b?????????????????011?????0010011 : begin
      end
      32'b?????????????????101?????1100011 : begin
      end
      32'b0100000??????????101?????0110011 : begin
      end
      32'b0000000??????????101?????0110011 : begin
      end
      32'b?????????????????101?????0000011 : begin
        out_LSU_IS_UNSIGNED = 1'b1;
      end
      32'b?????????????????110?????1110011 : begin
      end
      32'b?????????????????000?????1100011 : begin
      end
      32'b?????????????????000?????0000011 : begin
        out_LSU_IS_UNSIGNED = 1'b0;
      end
      32'b?????????????????001?????1110011 : begin
      end
      32'b?????????????????????????0110111 : begin
      end
      32'b?????????????????110?????0010011 : begin
      end
      32'b0000001??????????000?????0110011 : begin
      end
      32'b00000000000100000000000001110011 : begin
      end
      32'b?????????????????010?????0100011 : begin
      end
      32'b?????????????????110?????1100011 : begin
      end
      32'b?????????????????100?????0010011 : begin
      end
      32'b0100000??????????000?????0110011 : begin
      end
      32'b0000000??????????001?????0010011 : begin
      end
      32'b0000001??????????011?????0110011 : begin
      end
      32'b0000000??????????000?????0110011 : begin
      end
      32'b?????????????????111?????1110011 : begin
      end
      32'b?????????????????001?????1100011 : begin
      end
      32'b?????????????????????????1101111 : begin
      end
      32'b0000000??????????011?????0110011 : begin
      end
      32'b?????????????????111?????0010011 : begin
      end
      32'b?????????????????010?????1110011 : begin
      end
      32'b?????????????????001?????0000011 : begin
        out_LSU_IS_UNSIGNED = 1'b0;
      end
      32'b?????????????????000?????0100011 : begin
      end
      32'b0000001??????????110?????0110011 : begin
      end
      32'b?????????????????100?????1100011 : begin
      end
      32'b0000001??????????001?????0110011 : begin
      end
      32'b?????????????????010?????0010011 : begin
      end
      32'b?????????????????101?????1110011 : begin
      end
      32'b0000000??????????110?????0110011 : begin
      end
      32'b0000000??????????001?????0110011 : begin
      end
      32'b?????????????????111?????1100011 : begin
      end
      32'b0000001??????????100?????0110011 : begin
      end
      32'b00110000001000000000000001110011 : begin
      end
      32'b0000000??????????100?????0110011 : begin
      end
      32'b?????????????????001?????0100011 : begin
      end
      32'b0100000??????????101?????0010011 : begin
      end
      32'b?????????????????011?????1110011 : begin
      end
      32'b0000001??????????111?????0110011 : begin
      end
      32'b?????????????????100?????0000011 : begin
        out_LSU_IS_UNSIGNED = 1'b1;
      end
      32'b0000000??????????101?????0010011 : begin
      end
      32'b?????????????????000?????1100111 : begin
      end
      default : begin
      end
    endcase
  end

  assign _out_default_BU_WRITE_RET_ADDR_TO_RD = 1'bx;
  always @(*) begin
    out_BU_WRITE_RET_ADDR_TO_RD = _out_default_BU_WRITE_RET_ADDR_TO_RD;
    out_BU_WRITE_RET_ADDR_TO_RD = 1'b0;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
      end
      32'b0000001??????????010?????0110011 : begin
      end
      32'b?????????????????????????0010111 : begin
      end
      32'b0000000??????????111?????0110011 : begin
      end
      32'b?????????????????000?????0010011 : begin
      end
      32'b0000000??????????010?????0110011 : begin
      end
      32'b0000001??????????101?????0110011 : begin
      end
      32'b?????????????????010?????0000011 : begin
      end
      32'b?????????????????011?????0010011 : begin
      end
      32'b?????????????????101?????1100011 : begin
      end
      32'b0100000??????????101?????0110011 : begin
      end
      32'b0000000??????????101?????0110011 : begin
      end
      32'b?????????????????101?????0000011 : begin
      end
      32'b?????????????????110?????1110011 : begin
      end
      32'b?????????????????000?????1100011 : begin
      end
      32'b?????????????????000?????0000011 : begin
      end
      32'b?????????????????001?????1110011 : begin
      end
      32'b?????????????????????????0110111 : begin
      end
      32'b?????????????????110?????0010011 : begin
      end
      32'b0000001??????????000?????0110011 : begin
      end
      32'b00000000000100000000000001110011 : begin
      end
      32'b?????????????????010?????0100011 : begin
      end
      32'b?????????????????110?????1100011 : begin
      end
      32'b?????????????????100?????0010011 : begin
      end
      32'b0100000??????????000?????0110011 : begin
      end
      32'b0000000??????????001?????0010011 : begin
      end
      32'b0000001??????????011?????0110011 : begin
      end
      32'b0000000??????????000?????0110011 : begin
      end
      32'b?????????????????111?????1110011 : begin
      end
      32'b?????????????????001?????1100011 : begin
      end
      32'b?????????????????????????1101111 : begin
        out_BU_WRITE_RET_ADDR_TO_RD = 1'b1;
      end
      32'b0000000??????????011?????0110011 : begin
      end
      32'b?????????????????111?????0010011 : begin
      end
      32'b?????????????????010?????1110011 : begin
      end
      32'b?????????????????001?????0000011 : begin
      end
      32'b?????????????????000?????0100011 : begin
      end
      32'b0000001??????????110?????0110011 : begin
      end
      32'b?????????????????100?????1100011 : begin
      end
      32'b0000001??????????001?????0110011 : begin
      end
      32'b?????????????????010?????0010011 : begin
      end
      32'b?????????????????101?????1110011 : begin
      end
      32'b0000000??????????110?????0110011 : begin
      end
      32'b0000000??????????001?????0110011 : begin
      end
      32'b?????????????????111?????1100011 : begin
      end
      32'b0000001??????????100?????0110011 : begin
      end
      32'b00110000001000000000000001110011 : begin
      end
      32'b0000000??????????100?????0110011 : begin
      end
      32'b?????????????????001?????0100011 : begin
      end
      32'b0100000??????????101?????0010011 : begin
      end
      32'b?????????????????011?????1110011 : begin
      end
      32'b0000001??????????111?????0110011 : begin
      end
      32'b?????????????????100?????0000011 : begin
      end
      32'b0000000??????????101?????0010011 : begin
      end
      32'b?????????????????000?????1100111 : begin
        out_BU_WRITE_RET_ADDR_TO_RD = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign _out_default_MUL_HIGH = 1'bx;
  always @(*) begin
    out_MUL_HIGH = _out_default_MUL_HIGH;
    out_MUL_HIGH = 1'b0;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
      end
      32'b0000001??????????010?????0110011 : begin
        out_MUL_HIGH = 1'b1;
      end
      32'b?????????????????????????0010111 : begin
      end
      32'b0000000??????????111?????0110011 : begin
      end
      32'b?????????????????000?????0010011 : begin
      end
      32'b0000000??????????010?????0110011 : begin
      end
      32'b0000001??????????101?????0110011 : begin
      end
      32'b?????????????????010?????0000011 : begin
      end
      32'b?????????????????011?????0010011 : begin
      end
      32'b?????????????????101?????1100011 : begin
      end
      32'b0100000??????????101?????0110011 : begin
      end
      32'b0000000??????????101?????0110011 : begin
      end
      32'b?????????????????101?????0000011 : begin
      end
      32'b?????????????????110?????1110011 : begin
      end
      32'b?????????????????000?????1100011 : begin
      end
      32'b?????????????????000?????0000011 : begin
      end
      32'b?????????????????001?????1110011 : begin
      end
      32'b?????????????????????????0110111 : begin
      end
      32'b?????????????????110?????0010011 : begin
      end
      32'b0000001??????????000?????0110011 : begin
        out_MUL_HIGH = 1'b0;
      end
      32'b00000000000100000000000001110011 : begin
      end
      32'b?????????????????010?????0100011 : begin
      end
      32'b?????????????????110?????1100011 : begin
      end
      32'b?????????????????100?????0010011 : begin
      end
      32'b0100000??????????000?????0110011 : begin
      end
      32'b0000000??????????001?????0010011 : begin
      end
      32'b0000001??????????011?????0110011 : begin
        out_MUL_HIGH = 1'b1;
      end
      32'b0000000??????????000?????0110011 : begin
      end
      32'b?????????????????111?????1110011 : begin
      end
      32'b?????????????????001?????1100011 : begin
      end
      32'b?????????????????????????1101111 : begin
      end
      32'b0000000??????????011?????0110011 : begin
      end
      32'b?????????????????111?????0010011 : begin
      end
      32'b?????????????????010?????1110011 : begin
      end
      32'b?????????????????001?????0000011 : begin
      end
      32'b?????????????????000?????0100011 : begin
      end
      32'b0000001??????????110?????0110011 : begin
      end
      32'b?????????????????100?????1100011 : begin
      end
      32'b0000001??????????001?????0110011 : begin
        out_MUL_HIGH = 1'b1;
      end
      32'b?????????????????010?????0010011 : begin
      end
      32'b?????????????????101?????1110011 : begin
      end
      32'b0000000??????????110?????0110011 : begin
      end
      32'b0000000??????????001?????0110011 : begin
      end
      32'b?????????????????111?????1100011 : begin
      end
      32'b0000001??????????100?????0110011 : begin
      end
      32'b00110000001000000000000001110011 : begin
      end
      32'b0000000??????????100?????0110011 : begin
      end
      32'b?????????????????001?????0100011 : begin
      end
      32'b0100000??????????101?????0010011 : begin
      end
      32'b?????????????????011?????1110011 : begin
      end
      32'b0000001??????????111?????0110011 : begin
      end
      32'b?????????????????100?????0000011 : begin
      end
      32'b0000000??????????101?????0010011 : begin
      end
      32'b?????????????????000?????1100111 : begin
      end
      default : begin
      end
    endcase
  end

  assign _out_default_REM = 1'bx;
  always @(*) begin
    out_REM = _out_default_REM;
    out_REM = 1'b0;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
      end
      32'b0000001??????????010?????0110011 : begin
      end
      32'b?????????????????????????0010111 : begin
      end
      32'b0000000??????????111?????0110011 : begin
      end
      32'b?????????????????000?????0010011 : begin
      end
      32'b0000000??????????010?????0110011 : begin
      end
      32'b0000001??????????101?????0110011 : begin
        out_REM = 1'b0;
      end
      32'b?????????????????010?????0000011 : begin
      end
      32'b?????????????????011?????0010011 : begin
      end
      32'b?????????????????101?????1100011 : begin
      end
      32'b0100000??????????101?????0110011 : begin
      end
      32'b0000000??????????101?????0110011 : begin
      end
      32'b?????????????????101?????0000011 : begin
      end
      32'b?????????????????110?????1110011 : begin
      end
      32'b?????????????????000?????1100011 : begin
      end
      32'b?????????????????000?????0000011 : begin
      end
      32'b?????????????????001?????1110011 : begin
      end
      32'b?????????????????????????0110111 : begin
      end
      32'b?????????????????110?????0010011 : begin
      end
      32'b0000001??????????000?????0110011 : begin
      end
      32'b00000000000100000000000001110011 : begin
      end
      32'b?????????????????010?????0100011 : begin
      end
      32'b?????????????????110?????1100011 : begin
      end
      32'b?????????????????100?????0010011 : begin
      end
      32'b0100000??????????000?????0110011 : begin
      end
      32'b0000000??????????001?????0010011 : begin
      end
      32'b0000001??????????011?????0110011 : begin
      end
      32'b0000000??????????000?????0110011 : begin
      end
      32'b?????????????????111?????1110011 : begin
      end
      32'b?????????????????001?????1100011 : begin
      end
      32'b?????????????????????????1101111 : begin
      end
      32'b0000000??????????011?????0110011 : begin
      end
      32'b?????????????????111?????0010011 : begin
      end
      32'b?????????????????010?????1110011 : begin
      end
      32'b?????????????????001?????0000011 : begin
      end
      32'b?????????????????000?????0100011 : begin
      end
      32'b0000001??????????110?????0110011 : begin
        out_REM = 1'b1;
      end
      32'b?????????????????100?????1100011 : begin
      end
      32'b0000001??????????001?????0110011 : begin
      end
      32'b?????????????????010?????0010011 : begin
      end
      32'b?????????????????101?????1110011 : begin
      end
      32'b0000000??????????110?????0110011 : begin
      end
      32'b0000000??????????001?????0110011 : begin
      end
      32'b?????????????????111?????1100011 : begin
      end
      32'b0000001??????????100?????0110011 : begin
        out_REM = 1'b0;
      end
      32'b00110000001000000000000001110011 : begin
      end
      32'b0000000??????????100?????0110011 : begin
      end
      32'b?????????????????001?????0100011 : begin
      end
      32'b0100000??????????101?????0010011 : begin
      end
      32'b?????????????????011?????1110011 : begin
      end
      32'b0000001??????????111?????0110011 : begin
        out_REM = 1'b1;
      end
      32'b?????????????????100?????0000011 : begin
      end
      32'b0000000??????????101?????0010011 : begin
      end
      32'b?????????????????000?????1100111 : begin
      end
      default : begin
      end
    endcase
  end

  assign _out_default_LSU_IS_EXTERNAL_OP = 1'bx;
  always @(*) begin
    out_LSU_IS_EXTERNAL_OP = _out_default_LSU_IS_EXTERNAL_OP;
    out_LSU_IS_EXTERNAL_OP = 1'b0;
  end

  assign _out_default_ECALL = 1'bx;
  always @(*) begin
    out_ECALL = _out_default_ECALL;
    out_ECALL = 1'b0;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
        out_ECALL = 1'b1;
      end
      32'b0000001??????????010?????0110011 : begin
      end
      32'b?????????????????????????0010111 : begin
      end
      32'b0000000??????????111?????0110011 : begin
      end
      32'b?????????????????000?????0010011 : begin
      end
      32'b0000000??????????010?????0110011 : begin
      end
      32'b0000001??????????101?????0110011 : begin
      end
      32'b?????????????????010?????0000011 : begin
      end
      32'b?????????????????011?????0010011 : begin
      end
      32'b?????????????????101?????1100011 : begin
      end
      32'b0100000??????????101?????0110011 : begin
      end
      32'b0000000??????????101?????0110011 : begin
      end
      32'b?????????????????101?????0000011 : begin
      end
      32'b?????????????????110?????1110011 : begin
      end
      32'b?????????????????000?????1100011 : begin
      end
      32'b?????????????????000?????0000011 : begin
      end
      32'b?????????????????001?????1110011 : begin
      end
      32'b?????????????????????????0110111 : begin
      end
      32'b?????????????????110?????0010011 : begin
      end
      32'b0000001??????????000?????0110011 : begin
      end
      32'b00000000000100000000000001110011 : begin
      end
      32'b?????????????????010?????0100011 : begin
      end
      32'b?????????????????110?????1100011 : begin
      end
      32'b?????????????????100?????0010011 : begin
      end
      32'b0100000??????????000?????0110011 : begin
      end
      32'b0000000??????????001?????0010011 : begin
      end
      32'b0000001??????????011?????0110011 : begin
      end
      32'b0000000??????????000?????0110011 : begin
      end
      32'b?????????????????111?????1110011 : begin
      end
      32'b?????????????????001?????1100011 : begin
      end
      32'b?????????????????????????1101111 : begin
      end
      32'b0000000??????????011?????0110011 : begin
      end
      32'b?????????????????111?????0010011 : begin
      end
      32'b?????????????????010?????1110011 : begin
      end
      32'b?????????????????001?????0000011 : begin
      end
      32'b?????????????????000?????0100011 : begin
      end
      32'b0000001??????????110?????0110011 : begin
      end
      32'b?????????????????100?????1100011 : begin
      end
      32'b0000001??????????001?????0110011 : begin
      end
      32'b?????????????????010?????0010011 : begin
      end
      32'b?????????????????101?????1110011 : begin
      end
      32'b0000000??????????110?????0110011 : begin
      end
      32'b0000000??????????001?????0110011 : begin
      end
      32'b?????????????????111?????1100011 : begin
      end
      32'b0000001??????????100?????0110011 : begin
      end
      32'b00110000001000000000000001110011 : begin
      end
      32'b0000000??????????100?????0110011 : begin
      end
      32'b?????????????????001?????0100011 : begin
      end
      32'b0100000??????????101?????0010011 : begin
      end
      32'b?????????????????011?????1110011 : begin
      end
      32'b0000001??????????111?????0110011 : begin
      end
      32'b?????????????????100?????0000011 : begin
      end
      32'b0000000??????????101?????0010011 : begin
      end
      32'b?????????????????000?????1100111 : begin
      end
      default : begin
      end
    endcase
  end

  assign _out_default_SHIFT_OP = (2'bxx);
  always @(*) begin
    out_SHIFT_OP = _out_default_SHIFT_OP;
    out_SHIFT_OP = ShiftOp_NONE;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
      end
      32'b0000001??????????010?????0110011 : begin
      end
      32'b?????????????????????????0010111 : begin
      end
      32'b0000000??????????111?????0110011 : begin
      end
      32'b?????????????????000?????0010011 : begin
      end
      32'b0000000??????????010?????0110011 : begin
      end
      32'b0000001??????????101?????0110011 : begin
      end
      32'b?????????????????010?????0000011 : begin
      end
      32'b?????????????????011?????0010011 : begin
      end
      32'b?????????????????101?????1100011 : begin
      end
      32'b0100000??????????101?????0110011 : begin
        out_SHIFT_OP = ShiftOp_SRA_1;
      end
      32'b0000000??????????101?????0110011 : begin
        out_SHIFT_OP = ShiftOp_SRL_1;
      end
      32'b?????????????????101?????0000011 : begin
      end
      32'b?????????????????110?????1110011 : begin
      end
      32'b?????????????????000?????1100011 : begin
      end
      32'b?????????????????000?????0000011 : begin
      end
      32'b?????????????????001?????1110011 : begin
      end
      32'b?????????????????????????0110111 : begin
      end
      32'b?????????????????110?????0010011 : begin
      end
      32'b0000001??????????000?????0110011 : begin
      end
      32'b00000000000100000000000001110011 : begin
      end
      32'b?????????????????010?????0100011 : begin
      end
      32'b?????????????????110?????1100011 : begin
      end
      32'b?????????????????100?????0010011 : begin
      end
      32'b0100000??????????000?????0110011 : begin
      end
      32'b0000000??????????001?????0010011 : begin
        out_SHIFT_OP = ShiftOp_SLL_1;
      end
      32'b0000001??????????011?????0110011 : begin
      end
      32'b0000000??????????000?????0110011 : begin
      end
      32'b?????????????????111?????1110011 : begin
      end
      32'b?????????????????001?????1100011 : begin
      end
      32'b?????????????????????????1101111 : begin
      end
      32'b0000000??????????011?????0110011 : begin
      end
      32'b?????????????????111?????0010011 : begin
      end
      32'b?????????????????010?????1110011 : begin
      end
      32'b?????????????????001?????0000011 : begin
      end
      32'b?????????????????000?????0100011 : begin
      end
      32'b0000001??????????110?????0110011 : begin
      end
      32'b?????????????????100?????1100011 : begin
      end
      32'b0000001??????????001?????0110011 : begin
      end
      32'b?????????????????010?????0010011 : begin
      end
      32'b?????????????????101?????1110011 : begin
      end
      32'b0000000??????????110?????0110011 : begin
      end
      32'b0000000??????????001?????0110011 : begin
        out_SHIFT_OP = ShiftOp_SLL_1;
      end
      32'b?????????????????111?????1100011 : begin
      end
      32'b0000001??????????100?????0110011 : begin
      end
      32'b00110000001000000000000001110011 : begin
      end
      32'b0000000??????????100?????0110011 : begin
      end
      32'b?????????????????001?????0100011 : begin
      end
      32'b0100000??????????101?????0010011 : begin
        out_SHIFT_OP = ShiftOp_SRA_1;
      end
      32'b?????????????????011?????1110011 : begin
      end
      32'b0000001??????????111?????0110011 : begin
      end
      32'b?????????????????100?????0000011 : begin
      end
      32'b0000000??????????101?????0010011 : begin
        out_SHIFT_OP = ShiftOp_SRL_1;
      end
      32'b?????????????????000?????1100111 : begin
      end
      default : begin
      end
    endcase
  end

  assign _out_default_CSR_OP = (2'bxx);
  always @(*) begin
    out_CSR_OP = _out_default_CSR_OP;
    out_CSR_OP = CsrOp_NONE;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
      end
      32'b0000001??????????010?????0110011 : begin
      end
      32'b?????????????????????????0010111 : begin
      end
      32'b0000000??????????111?????0110011 : begin
      end
      32'b?????????????????000?????0010011 : begin
      end
      32'b0000000??????????010?????0110011 : begin
      end
      32'b0000001??????????101?????0110011 : begin
      end
      32'b?????????????????010?????0000011 : begin
      end
      32'b?????????????????011?????0010011 : begin
      end
      32'b?????????????????101?????1100011 : begin
      end
      32'b0100000??????????101?????0110011 : begin
      end
      32'b0000000??????????101?????0110011 : begin
      end
      32'b?????????????????101?????0000011 : begin
      end
      32'b?????????????????110?????1110011 : begin
        out_CSR_OP = CsrOp_RS;
      end
      32'b?????????????????000?????1100011 : begin
      end
      32'b?????????????????000?????0000011 : begin
      end
      32'b?????????????????001?????1110011 : begin
        out_CSR_OP = CsrOp_RW;
      end
      32'b?????????????????????????0110111 : begin
      end
      32'b?????????????????110?????0010011 : begin
      end
      32'b0000001??????????000?????0110011 : begin
      end
      32'b00000000000100000000000001110011 : begin
      end
      32'b?????????????????010?????0100011 : begin
      end
      32'b?????????????????110?????1100011 : begin
      end
      32'b?????????????????100?????0010011 : begin
      end
      32'b0100000??????????000?????0110011 : begin
      end
      32'b0000000??????????001?????0010011 : begin
      end
      32'b0000001??????????011?????0110011 : begin
      end
      32'b0000000??????????000?????0110011 : begin
      end
      32'b?????????????????111?????1110011 : begin
        out_CSR_OP = CsrOp_RC;
      end
      32'b?????????????????001?????1100011 : begin
      end
      32'b?????????????????????????1101111 : begin
      end
      32'b0000000??????????011?????0110011 : begin
      end
      32'b?????????????????111?????0010011 : begin
      end
      32'b?????????????????010?????1110011 : begin
        out_CSR_OP = CsrOp_RS;
      end
      32'b?????????????????001?????0000011 : begin
      end
      32'b?????????????????000?????0100011 : begin
      end
      32'b0000001??????????110?????0110011 : begin
      end
      32'b?????????????????100?????1100011 : begin
      end
      32'b0000001??????????001?????0110011 : begin
      end
      32'b?????????????????010?????0010011 : begin
      end
      32'b?????????????????101?????1110011 : begin
        out_CSR_OP = CsrOp_RW;
      end
      32'b0000000??????????110?????0110011 : begin
      end
      32'b0000000??????????001?????0110011 : begin
      end
      32'b?????????????????111?????1100011 : begin
      end
      32'b0000001??????????100?????0110011 : begin
      end
      32'b00110000001000000000000001110011 : begin
      end
      32'b0000000??????????100?????0110011 : begin
      end
      32'b?????????????????001?????0100011 : begin
      end
      32'b0100000??????????101?????0010011 : begin
      end
      32'b?????????????????011?????1110011 : begin
        out_CSR_OP = CsrOp_RC;
      end
      32'b0000001??????????111?????0110011 : begin
      end
      32'b?????????????????100?????0000011 : begin
      end
      32'b0000000??????????101?????0010011 : begin
      end
      32'b?????????????????000?????1100111 : begin
      end
      default : begin
      end
    endcase
  end

  assign _out_default_LSU_OPERATION_TYPE = (2'bxx);
  always @(*) begin
    out_LSU_OPERATION_TYPE = _out_default_LSU_OPERATION_TYPE;
    out_LSU_OPERATION_TYPE = LsuOperationType_NONE;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
      end
      32'b0000001??????????010?????0110011 : begin
      end
      32'b?????????????????????????0010111 : begin
      end
      32'b0000000??????????111?????0110011 : begin
      end
      32'b?????????????????000?????0010011 : begin
      end
      32'b0000000??????????010?????0110011 : begin
      end
      32'b0000001??????????101?????0110011 : begin
      end
      32'b?????????????????010?????0000011 : begin
        out_LSU_OPERATION_TYPE = LsuOperationType_LOAD;
      end
      32'b?????????????????011?????0010011 : begin
      end
      32'b?????????????????101?????1100011 : begin
      end
      32'b0100000??????????101?????0110011 : begin
      end
      32'b0000000??????????101?????0110011 : begin
      end
      32'b?????????????????101?????0000011 : begin
        out_LSU_OPERATION_TYPE = LsuOperationType_LOAD;
      end
      32'b?????????????????110?????1110011 : begin
      end
      32'b?????????????????000?????1100011 : begin
      end
      32'b?????????????????000?????0000011 : begin
        out_LSU_OPERATION_TYPE = LsuOperationType_LOAD;
      end
      32'b?????????????????001?????1110011 : begin
      end
      32'b?????????????????????????0110111 : begin
      end
      32'b?????????????????110?????0010011 : begin
      end
      32'b0000001??????????000?????0110011 : begin
      end
      32'b00000000000100000000000001110011 : begin
      end
      32'b?????????????????010?????0100011 : begin
        out_LSU_OPERATION_TYPE = LsuOperationType_STORE;
      end
      32'b?????????????????110?????1100011 : begin
      end
      32'b?????????????????100?????0010011 : begin
      end
      32'b0100000??????????000?????0110011 : begin
      end
      32'b0000000??????????001?????0010011 : begin
      end
      32'b0000001??????????011?????0110011 : begin
      end
      32'b0000000??????????000?????0110011 : begin
      end
      32'b?????????????????111?????1110011 : begin
      end
      32'b?????????????????001?????1100011 : begin
      end
      32'b?????????????????????????1101111 : begin
      end
      32'b0000000??????????011?????0110011 : begin
      end
      32'b?????????????????111?????0010011 : begin
      end
      32'b?????????????????010?????1110011 : begin
      end
      32'b?????????????????001?????0000011 : begin
        out_LSU_OPERATION_TYPE = LsuOperationType_LOAD;
      end
      32'b?????????????????000?????0100011 : begin
        out_LSU_OPERATION_TYPE = LsuOperationType_STORE;
      end
      32'b0000001??????????110?????0110011 : begin
      end
      32'b?????????????????100?????1100011 : begin
      end
      32'b0000001??????????001?????0110011 : begin
      end
      32'b?????????????????010?????0010011 : begin
      end
      32'b?????????????????101?????1110011 : begin
      end
      32'b0000000??????????110?????0110011 : begin
      end
      32'b0000000??????????001?????0110011 : begin
      end
      32'b?????????????????111?????1100011 : begin
      end
      32'b0000001??????????100?????0110011 : begin
      end
      32'b00110000001000000000000001110011 : begin
      end
      32'b0000000??????????100?????0110011 : begin
      end
      32'b?????????????????001?????0100011 : begin
        out_LSU_OPERATION_TYPE = LsuOperationType_STORE;
      end
      32'b0100000??????????101?????0010011 : begin
      end
      32'b?????????????????011?????1110011 : begin
      end
      32'b0000001??????????111?????0110011 : begin
      end
      32'b?????????????????100?????0000011 : begin
        out_LSU_OPERATION_TYPE = LsuOperationType_LOAD;
      end
      32'b0000000??????????101?????0010011 : begin
      end
      32'b?????????????????000?????1100111 : begin
      end
      default : begin
      end
    endcase
  end

  assign _out_default_BU_CONDITION = (3'bxxx);
  always @(*) begin
    out_BU_CONDITION = _out_default_BU_CONDITION;
    out_BU_CONDITION = BranchCondition_NONE;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
      end
      32'b0000001??????????010?????0110011 : begin
      end
      32'b?????????????????????????0010111 : begin
      end
      32'b0000000??????????111?????0110011 : begin
      end
      32'b?????????????????000?????0010011 : begin
      end
      32'b0000000??????????010?????0110011 : begin
      end
      32'b0000001??????????101?????0110011 : begin
      end
      32'b?????????????????010?????0000011 : begin
      end
      32'b?????????????????011?????0010011 : begin
      end
      32'b?????????????????101?????1100011 : begin
        out_BU_CONDITION = BranchCondition_GE;
      end
      32'b0100000??????????101?????0110011 : begin
      end
      32'b0000000??????????101?????0110011 : begin
      end
      32'b?????????????????101?????0000011 : begin
      end
      32'b?????????????????110?????1110011 : begin
      end
      32'b?????????????????000?????1100011 : begin
        out_BU_CONDITION = BranchCondition_EQ;
      end
      32'b?????????????????000?????0000011 : begin
      end
      32'b?????????????????001?????1110011 : begin
      end
      32'b?????????????????????????0110111 : begin
      end
      32'b?????????????????110?????0010011 : begin
      end
      32'b0000001??????????000?????0110011 : begin
      end
      32'b00000000000100000000000001110011 : begin
      end
      32'b?????????????????010?????0100011 : begin
      end
      32'b?????????????????110?????1100011 : begin
        out_BU_CONDITION = BranchCondition_LTU;
      end
      32'b?????????????????100?????0010011 : begin
      end
      32'b0100000??????????000?????0110011 : begin
      end
      32'b0000000??????????001?????0010011 : begin
      end
      32'b0000001??????????011?????0110011 : begin
      end
      32'b0000000??????????000?????0110011 : begin
      end
      32'b?????????????????111?????1110011 : begin
      end
      32'b?????????????????001?????1100011 : begin
        out_BU_CONDITION = BranchCondition_NE;
      end
      32'b?????????????????????????1101111 : begin
      end
      32'b0000000??????????011?????0110011 : begin
      end
      32'b?????????????????111?????0010011 : begin
      end
      32'b?????????????????010?????1110011 : begin
      end
      32'b?????????????????001?????0000011 : begin
      end
      32'b?????????????????000?????0100011 : begin
      end
      32'b0000001??????????110?????0110011 : begin
      end
      32'b?????????????????100?????1100011 : begin
        out_BU_CONDITION = BranchCondition_LT;
      end
      32'b0000001??????????001?????0110011 : begin
      end
      32'b?????????????????010?????0010011 : begin
      end
      32'b?????????????????101?????1110011 : begin
      end
      32'b0000000??????????110?????0110011 : begin
      end
      32'b0000000??????????001?????0110011 : begin
      end
      32'b?????????????????111?????1100011 : begin
        out_BU_CONDITION = BranchCondition_GEU;
      end
      32'b0000001??????????100?????0110011 : begin
      end
      32'b00110000001000000000000001110011 : begin
      end
      32'b0000000??????????100?????0110011 : begin
      end
      32'b?????????????????001?????0100011 : begin
      end
      32'b0100000??????????101?????0010011 : begin
      end
      32'b?????????????????011?????1110011 : begin
      end
      32'b0000001??????????111?????0110011 : begin
      end
      32'b?????????????????100?????0000011 : begin
      end
      32'b0000000??????????101?????0010011 : begin
      end
      32'b?????????????????000?????1100111 : begin
      end
      default : begin
      end
    endcase
  end

  assign arbitration_isAvailable = ((! arbitration_isValid) || arbitration_isDone);
  assign arbitration_isReady = 1'b1;
  assign arbitration_rs1Needed = 1'b0;
  assign arbitration_rs2Needed = 1'b0;
  assign arbitration_jumpRequested = 1'b0;
  assign arbitration_isDone = ((arbitration_isValid && arbitration_isReady) && (! arbitration_isStalled));
  assign TrapHandler_interruptSignals_hasTrapped = 1'b0;
  assign TrapHandler_interruptSignals_trapCause = 4'bxxxx;
  assign TrapHandler_interruptSignals_trapVal = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
  always @(*) begin
    TrapHandler_exceptionSignals_hasTrapped = 1'b0;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
      end
      32'b0000001??????????010?????0110011 : begin
      end
      32'b?????????????????????????0010111 : begin
      end
      32'b0000000??????????111?????0110011 : begin
      end
      32'b?????????????????000?????0010011 : begin
      end
      32'b0000000??????????010?????0110011 : begin
      end
      32'b0000001??????????101?????0110011 : begin
      end
      32'b?????????????????010?????0000011 : begin
      end
      32'b?????????????????011?????0010011 : begin
      end
      32'b?????????????????101?????1100011 : begin
      end
      32'b0100000??????????101?????0110011 : begin
      end
      32'b0000000??????????101?????0110011 : begin
      end
      32'b?????????????????101?????0000011 : begin
      end
      32'b?????????????????110?????1110011 : begin
      end
      32'b?????????????????000?????1100011 : begin
      end
      32'b?????????????????000?????0000011 : begin
      end
      32'b?????????????????001?????1110011 : begin
      end
      32'b?????????????????????????0110111 : begin
      end
      32'b?????????????????110?????0010011 : begin
      end
      32'b0000001??????????000?????0110011 : begin
      end
      32'b00000000000100000000000001110011 : begin
      end
      32'b?????????????????010?????0100011 : begin
      end
      32'b?????????????????110?????1100011 : begin
      end
      32'b?????????????????100?????0010011 : begin
      end
      32'b0100000??????????000?????0110011 : begin
      end
      32'b0000000??????????001?????0010011 : begin
      end
      32'b0000001??????????011?????0110011 : begin
      end
      32'b0000000??????????000?????0110011 : begin
      end
      32'b?????????????????111?????1110011 : begin
      end
      32'b?????????????????001?????1100011 : begin
      end
      32'b?????????????????????????1101111 : begin
      end
      32'b0000000??????????011?????0110011 : begin
      end
      32'b?????????????????111?????0010011 : begin
      end
      32'b?????????????????010?????1110011 : begin
      end
      32'b?????????????????001?????0000011 : begin
      end
      32'b?????????????????000?????0100011 : begin
      end
      32'b0000001??????????110?????0110011 : begin
      end
      32'b?????????????????100?????1100011 : begin
      end
      32'b0000001??????????001?????0110011 : begin
      end
      32'b?????????????????010?????0010011 : begin
      end
      32'b?????????????????101?????1110011 : begin
      end
      32'b0000000??????????110?????0110011 : begin
      end
      32'b0000000??????????001?????0110011 : begin
      end
      32'b?????????????????111?????1100011 : begin
      end
      32'b0000001??????????100?????0110011 : begin
      end
      32'b00110000001000000000000001110011 : begin
      end
      32'b0000000??????????100?????0110011 : begin
      end
      32'b?????????????????001?????0100011 : begin
      end
      32'b0100000??????????101?????0010011 : begin
      end
      32'b?????????????????011?????1110011 : begin
      end
      32'b0000001??????????111?????0110011 : begin
      end
      32'b?????????????????100?????0000011 : begin
      end
      32'b0000000??????????101?????0010011 : begin
      end
      32'b?????????????????000?????1100111 : begin
      end
      default : begin
        TrapHandler_exceptionSignals_hasTrapped = 1'b1;
      end
    endcase
  end

  always @(*) begin
    TrapHandler_exceptionSignals_trapCause = 4'bxxxx;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
      end
      32'b0000001??????????010?????0110011 : begin
      end
      32'b?????????????????????????0010111 : begin
      end
      32'b0000000??????????111?????0110011 : begin
      end
      32'b?????????????????000?????0010011 : begin
      end
      32'b0000000??????????010?????0110011 : begin
      end
      32'b0000001??????????101?????0110011 : begin
      end
      32'b?????????????????010?????0000011 : begin
      end
      32'b?????????????????011?????0010011 : begin
      end
      32'b?????????????????101?????1100011 : begin
      end
      32'b0100000??????????101?????0110011 : begin
      end
      32'b0000000??????????101?????0110011 : begin
      end
      32'b?????????????????101?????0000011 : begin
      end
      32'b?????????????????110?????1110011 : begin
      end
      32'b?????????????????000?????1100011 : begin
      end
      32'b?????????????????000?????0000011 : begin
      end
      32'b?????????????????001?????1110011 : begin
      end
      32'b?????????????????????????0110111 : begin
      end
      32'b?????????????????110?????0010011 : begin
      end
      32'b0000001??????????000?????0110011 : begin
      end
      32'b00000000000100000000000001110011 : begin
      end
      32'b?????????????????010?????0100011 : begin
      end
      32'b?????????????????110?????1100011 : begin
      end
      32'b?????????????????100?????0010011 : begin
      end
      32'b0100000??????????000?????0110011 : begin
      end
      32'b0000000??????????001?????0010011 : begin
      end
      32'b0000001??????????011?????0110011 : begin
      end
      32'b0000000??????????000?????0110011 : begin
      end
      32'b?????????????????111?????1110011 : begin
      end
      32'b?????????????????001?????1100011 : begin
      end
      32'b?????????????????????????1101111 : begin
      end
      32'b0000000??????????011?????0110011 : begin
      end
      32'b?????????????????111?????0010011 : begin
      end
      32'b?????????????????010?????1110011 : begin
      end
      32'b?????????????????001?????0000011 : begin
      end
      32'b?????????????????000?????0100011 : begin
      end
      32'b0000001??????????110?????0110011 : begin
      end
      32'b?????????????????100?????1100011 : begin
      end
      32'b0000001??????????001?????0110011 : begin
      end
      32'b?????????????????010?????0010011 : begin
      end
      32'b?????????????????101?????1110011 : begin
      end
      32'b0000000??????????110?????0110011 : begin
      end
      32'b0000000??????????001?????0110011 : begin
      end
      32'b?????????????????111?????1100011 : begin
      end
      32'b0000001??????????100?????0110011 : begin
      end
      32'b00110000001000000000000001110011 : begin
      end
      32'b0000000??????????100?????0110011 : begin
      end
      32'b?????????????????001?????0100011 : begin
      end
      32'b0100000??????????101?????0010011 : begin
      end
      32'b?????????????????011?????1110011 : begin
      end
      32'b0000001??????????111?????0110011 : begin
      end
      32'b?????????????????100?????0000011 : begin
      end
      32'b0000000??????????101?????0010011 : begin
      end
      32'b?????????????????000?????1100111 : begin
      end
      default : begin
        TrapHandler_exceptionSignals_trapCause = 4'b0010;
      end
    endcase
  end

  always @(*) begin
    TrapHandler_exceptionSignals_trapVal = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    casez(value_IR)
      32'b00000000000000000000000001110011 : begin
      end
      32'b0000001??????????010?????0110011 : begin
      end
      32'b?????????????????????????0010111 : begin
      end
      32'b0000000??????????111?????0110011 : begin
      end
      32'b?????????????????000?????0010011 : begin
      end
      32'b0000000??????????010?????0110011 : begin
      end
      32'b0000001??????????101?????0110011 : begin
      end
      32'b?????????????????010?????0000011 : begin
      end
      32'b?????????????????011?????0010011 : begin
      end
      32'b?????????????????101?????1100011 : begin
      end
      32'b0100000??????????101?????0110011 : begin
      end
      32'b0000000??????????101?????0110011 : begin
      end
      32'b?????????????????101?????0000011 : begin
      end
      32'b?????????????????110?????1110011 : begin
      end
      32'b?????????????????000?????1100011 : begin
      end
      32'b?????????????????000?????0000011 : begin
      end
      32'b?????????????????001?????1110011 : begin
      end
      32'b?????????????????????????0110111 : begin
      end
      32'b?????????????????110?????0010011 : begin
      end
      32'b0000001??????????000?????0110011 : begin
      end
      32'b00000000000100000000000001110011 : begin
      end
      32'b?????????????????010?????0100011 : begin
      end
      32'b?????????????????110?????1100011 : begin
      end
      32'b?????????????????100?????0010011 : begin
      end
      32'b0100000??????????000?????0110011 : begin
      end
      32'b0000000??????????001?????0010011 : begin
      end
      32'b0000001??????????011?????0110011 : begin
      end
      32'b0000000??????????000?????0110011 : begin
      end
      32'b?????????????????111?????1110011 : begin
      end
      32'b?????????????????001?????1100011 : begin
      end
      32'b?????????????????????????1101111 : begin
      end
      32'b0000000??????????011?????0110011 : begin
      end
      32'b?????????????????111?????0010011 : begin
      end
      32'b?????????????????010?????1110011 : begin
      end
      32'b?????????????????001?????0000011 : begin
      end
      32'b?????????????????000?????0100011 : begin
      end
      32'b0000001??????????110?????0110011 : begin
      end
      32'b?????????????????100?????1100011 : begin
      end
      32'b0000001??????????001?????0110011 : begin
      end
      32'b?????????????????010?????0010011 : begin
      end
      32'b?????????????????101?????1110011 : begin
      end
      32'b0000000??????????110?????0110011 : begin
      end
      32'b0000000??????????001?????0110011 : begin
      end
      32'b?????????????????111?????1100011 : begin
      end
      32'b0000001??????????100?????0110011 : begin
      end
      32'b00110000001000000000000001110011 : begin
      end
      32'b0000000??????????100?????0110011 : begin
      end
      32'b?????????????????001?????0100011 : begin
      end
      32'b0100000??????????101?????0010011 : begin
      end
      32'b?????????????????011?????1110011 : begin
      end
      32'b0000001??????????111?????0110011 : begin
      end
      32'b?????????????????100?????0000011 : begin
      end
      32'b0000000??????????101?????0010011 : begin
      end
      32'b?????????????????000?????1100111 : begin
      end
      default : begin
        TrapHandler_exceptionSignals_trapVal = value_IR;
      end
    endcase
  end

  assign _zz_out_IMM = value_IR;
  assign _zz_out_IMM_1 = _zz_out_IMM[31 : 20];
  assign _zz_out_IMM_2 = _zz_out_IMM_1[11];
  always @(*) begin
    _zz_out_IMM_3[19] = _zz_out_IMM_2;
    _zz_out_IMM_3[18] = _zz_out_IMM_2;
    _zz_out_IMM_3[17] = _zz_out_IMM_2;
    _zz_out_IMM_3[16] = _zz_out_IMM_2;
    _zz_out_IMM_3[15] = _zz_out_IMM_2;
    _zz_out_IMM_3[14] = _zz_out_IMM_2;
    _zz_out_IMM_3[13] = _zz_out_IMM_2;
    _zz_out_IMM_3[12] = _zz_out_IMM_2;
    _zz_out_IMM_3[11] = _zz_out_IMM_2;
    _zz_out_IMM_3[10] = _zz_out_IMM_2;
    _zz_out_IMM_3[9] = _zz_out_IMM_2;
    _zz_out_IMM_3[8] = _zz_out_IMM_2;
    _zz_out_IMM_3[7] = _zz_out_IMM_2;
    _zz_out_IMM_3[6] = _zz_out_IMM_2;
    _zz_out_IMM_3[5] = _zz_out_IMM_2;
    _zz_out_IMM_3[4] = _zz_out_IMM_2;
    _zz_out_IMM_3[3] = _zz_out_IMM_2;
    _zz_out_IMM_3[2] = _zz_out_IMM_2;
    _zz_out_IMM_3[1] = _zz_out_IMM_2;
    _zz_out_IMM_3[0] = _zz_out_IMM_2;
  end

  assign _zz_out_IMM_4 = _zz_out_IMM[31 : 20];
  assign _zz_out_IMM_5 = _zz_out_IMM_4[11];
  always @(*) begin
    _zz_out_IMM_6[19] = _zz_out_IMM_5;
    _zz_out_IMM_6[18] = _zz_out_IMM_5;
    _zz_out_IMM_6[17] = _zz_out_IMM_5;
    _zz_out_IMM_6[16] = _zz_out_IMM_5;
    _zz_out_IMM_6[15] = _zz_out_IMM_5;
    _zz_out_IMM_6[14] = _zz_out_IMM_5;
    _zz_out_IMM_6[13] = _zz_out_IMM_5;
    _zz_out_IMM_6[12] = _zz_out_IMM_5;
    _zz_out_IMM_6[11] = _zz_out_IMM_5;
    _zz_out_IMM_6[10] = _zz_out_IMM_5;
    _zz_out_IMM_6[9] = _zz_out_IMM_5;
    _zz_out_IMM_6[8] = _zz_out_IMM_5;
    _zz_out_IMM_6[7] = _zz_out_IMM_5;
    _zz_out_IMM_6[6] = _zz_out_IMM_5;
    _zz_out_IMM_6[5] = _zz_out_IMM_5;
    _zz_out_IMM_6[4] = _zz_out_IMM_5;
    _zz_out_IMM_6[3] = _zz_out_IMM_5;
    _zz_out_IMM_6[2] = _zz_out_IMM_5;
    _zz_out_IMM_6[1] = _zz_out_IMM_5;
    _zz_out_IMM_6[0] = _zz_out_IMM_5;
  end

  assign _zz_out_IMM_7 = _zz_out_IMM[31 : 20];
  assign _zz_out_IMM_8 = _zz_out_IMM_7[11];
  always @(*) begin
    _zz_out_IMM_9[19] = _zz_out_IMM_8;
    _zz_out_IMM_9[18] = _zz_out_IMM_8;
    _zz_out_IMM_9[17] = _zz_out_IMM_8;
    _zz_out_IMM_9[16] = _zz_out_IMM_8;
    _zz_out_IMM_9[15] = _zz_out_IMM_8;
    _zz_out_IMM_9[14] = _zz_out_IMM_8;
    _zz_out_IMM_9[13] = _zz_out_IMM_8;
    _zz_out_IMM_9[12] = _zz_out_IMM_8;
    _zz_out_IMM_9[11] = _zz_out_IMM_8;
    _zz_out_IMM_9[10] = _zz_out_IMM_8;
    _zz_out_IMM_9[9] = _zz_out_IMM_8;
    _zz_out_IMM_9[8] = _zz_out_IMM_8;
    _zz_out_IMM_9[7] = _zz_out_IMM_8;
    _zz_out_IMM_9[6] = _zz_out_IMM_8;
    _zz_out_IMM_9[5] = _zz_out_IMM_8;
    _zz_out_IMM_9[4] = _zz_out_IMM_8;
    _zz_out_IMM_9[3] = _zz_out_IMM_8;
    _zz_out_IMM_9[2] = _zz_out_IMM_8;
    _zz_out_IMM_9[1] = _zz_out_IMM_8;
    _zz_out_IMM_9[0] = _zz_out_IMM_8;
  end

  assign _zz_out_IMM_10 = _zz_out_IMM[31 : 20];
  assign _zz_out_IMM_11 = _zz_out_IMM_10[11];
  always @(*) begin
    _zz_out_IMM_12[19] = _zz_out_IMM_11;
    _zz_out_IMM_12[18] = _zz_out_IMM_11;
    _zz_out_IMM_12[17] = _zz_out_IMM_11;
    _zz_out_IMM_12[16] = _zz_out_IMM_11;
    _zz_out_IMM_12[15] = _zz_out_IMM_11;
    _zz_out_IMM_12[14] = _zz_out_IMM_11;
    _zz_out_IMM_12[13] = _zz_out_IMM_11;
    _zz_out_IMM_12[12] = _zz_out_IMM_11;
    _zz_out_IMM_12[11] = _zz_out_IMM_11;
    _zz_out_IMM_12[10] = _zz_out_IMM_11;
    _zz_out_IMM_12[9] = _zz_out_IMM_11;
    _zz_out_IMM_12[8] = _zz_out_IMM_11;
    _zz_out_IMM_12[7] = _zz_out_IMM_11;
    _zz_out_IMM_12[6] = _zz_out_IMM_11;
    _zz_out_IMM_12[5] = _zz_out_IMM_11;
    _zz_out_IMM_12[4] = _zz_out_IMM_11;
    _zz_out_IMM_12[3] = _zz_out_IMM_11;
    _zz_out_IMM_12[2] = _zz_out_IMM_11;
    _zz_out_IMM_12[1] = _zz_out_IMM_11;
    _zz_out_IMM_12[0] = _zz_out_IMM_11;
  end

  assign _zz_out_IMM_13 = {{{{_zz_out_IMM[31],_zz_out_IMM[7]},_zz_out_IMM[30 : 25]},_zz_out_IMM[11 : 8]},1'b0};
  assign _zz_out_IMM_14 = _zz_out_IMM_13[12];
  always @(*) begin
    _zz_out_IMM_15[18] = _zz_out_IMM_14;
    _zz_out_IMM_15[17] = _zz_out_IMM_14;
    _zz_out_IMM_15[16] = _zz_out_IMM_14;
    _zz_out_IMM_15[15] = _zz_out_IMM_14;
    _zz_out_IMM_15[14] = _zz_out_IMM_14;
    _zz_out_IMM_15[13] = _zz_out_IMM_14;
    _zz_out_IMM_15[12] = _zz_out_IMM_14;
    _zz_out_IMM_15[11] = _zz_out_IMM_14;
    _zz_out_IMM_15[10] = _zz_out_IMM_14;
    _zz_out_IMM_15[9] = _zz_out_IMM_14;
    _zz_out_IMM_15[8] = _zz_out_IMM_14;
    _zz_out_IMM_15[7] = _zz_out_IMM_14;
    _zz_out_IMM_15[6] = _zz_out_IMM_14;
    _zz_out_IMM_15[5] = _zz_out_IMM_14;
    _zz_out_IMM_15[4] = _zz_out_IMM_14;
    _zz_out_IMM_15[3] = _zz_out_IMM_14;
    _zz_out_IMM_15[2] = _zz_out_IMM_14;
    _zz_out_IMM_15[1] = _zz_out_IMM_14;
    _zz_out_IMM_15[0] = _zz_out_IMM_14;
  end

  assign _zz_out_IMM_16 = _zz_out_IMM[31 : 20];
  assign _zz_out_IMM_17 = _zz_out_IMM_16[11];
  always @(*) begin
    _zz_out_IMM_18[19] = _zz_out_IMM_17;
    _zz_out_IMM_18[18] = _zz_out_IMM_17;
    _zz_out_IMM_18[17] = _zz_out_IMM_17;
    _zz_out_IMM_18[16] = _zz_out_IMM_17;
    _zz_out_IMM_18[15] = _zz_out_IMM_17;
    _zz_out_IMM_18[14] = _zz_out_IMM_17;
    _zz_out_IMM_18[13] = _zz_out_IMM_17;
    _zz_out_IMM_18[12] = _zz_out_IMM_17;
    _zz_out_IMM_18[11] = _zz_out_IMM_17;
    _zz_out_IMM_18[10] = _zz_out_IMM_17;
    _zz_out_IMM_18[9] = _zz_out_IMM_17;
    _zz_out_IMM_18[8] = _zz_out_IMM_17;
    _zz_out_IMM_18[7] = _zz_out_IMM_17;
    _zz_out_IMM_18[6] = _zz_out_IMM_17;
    _zz_out_IMM_18[5] = _zz_out_IMM_17;
    _zz_out_IMM_18[4] = _zz_out_IMM_17;
    _zz_out_IMM_18[3] = _zz_out_IMM_17;
    _zz_out_IMM_18[2] = _zz_out_IMM_17;
    _zz_out_IMM_18[1] = _zz_out_IMM_17;
    _zz_out_IMM_18[0] = _zz_out_IMM_17;
  end

  assign _zz_out_IMM_19 = _zz_out_IMM[31 : 20];
  assign _zz_out_IMM_20 = _zz_out_IMM_19[11];
  always @(*) begin
    _zz_out_IMM_21[19] = _zz_out_IMM_20;
    _zz_out_IMM_21[18] = _zz_out_IMM_20;
    _zz_out_IMM_21[17] = _zz_out_IMM_20;
    _zz_out_IMM_21[16] = _zz_out_IMM_20;
    _zz_out_IMM_21[15] = _zz_out_IMM_20;
    _zz_out_IMM_21[14] = _zz_out_IMM_20;
    _zz_out_IMM_21[13] = _zz_out_IMM_20;
    _zz_out_IMM_21[12] = _zz_out_IMM_20;
    _zz_out_IMM_21[11] = _zz_out_IMM_20;
    _zz_out_IMM_21[10] = _zz_out_IMM_20;
    _zz_out_IMM_21[9] = _zz_out_IMM_20;
    _zz_out_IMM_21[8] = _zz_out_IMM_20;
    _zz_out_IMM_21[7] = _zz_out_IMM_20;
    _zz_out_IMM_21[6] = _zz_out_IMM_20;
    _zz_out_IMM_21[5] = _zz_out_IMM_20;
    _zz_out_IMM_21[4] = _zz_out_IMM_20;
    _zz_out_IMM_21[3] = _zz_out_IMM_20;
    _zz_out_IMM_21[2] = _zz_out_IMM_20;
    _zz_out_IMM_21[1] = _zz_out_IMM_20;
    _zz_out_IMM_21[0] = _zz_out_IMM_20;
  end

  assign _zz_out_IMM_22 = {{{{_zz_out_IMM[31],_zz_out_IMM[7]},_zz_out_IMM[30 : 25]},_zz_out_IMM[11 : 8]},1'b0};
  assign _zz_out_IMM_23 = _zz_out_IMM_22[12];
  always @(*) begin
    _zz_out_IMM_24[18] = _zz_out_IMM_23;
    _zz_out_IMM_24[17] = _zz_out_IMM_23;
    _zz_out_IMM_24[16] = _zz_out_IMM_23;
    _zz_out_IMM_24[15] = _zz_out_IMM_23;
    _zz_out_IMM_24[14] = _zz_out_IMM_23;
    _zz_out_IMM_24[13] = _zz_out_IMM_23;
    _zz_out_IMM_24[12] = _zz_out_IMM_23;
    _zz_out_IMM_24[11] = _zz_out_IMM_23;
    _zz_out_IMM_24[10] = _zz_out_IMM_23;
    _zz_out_IMM_24[9] = _zz_out_IMM_23;
    _zz_out_IMM_24[8] = _zz_out_IMM_23;
    _zz_out_IMM_24[7] = _zz_out_IMM_23;
    _zz_out_IMM_24[6] = _zz_out_IMM_23;
    _zz_out_IMM_24[5] = _zz_out_IMM_23;
    _zz_out_IMM_24[4] = _zz_out_IMM_23;
    _zz_out_IMM_24[3] = _zz_out_IMM_23;
    _zz_out_IMM_24[2] = _zz_out_IMM_23;
    _zz_out_IMM_24[1] = _zz_out_IMM_23;
    _zz_out_IMM_24[0] = _zz_out_IMM_23;
  end

  assign _zz_out_IMM_25 = _zz_out_IMM[31 : 20];
  assign _zz_out_IMM_26 = _zz_out_IMM_25[11];
  always @(*) begin
    _zz_out_IMM_27[19] = _zz_out_IMM_26;
    _zz_out_IMM_27[18] = _zz_out_IMM_26;
    _zz_out_IMM_27[17] = _zz_out_IMM_26;
    _zz_out_IMM_27[16] = _zz_out_IMM_26;
    _zz_out_IMM_27[15] = _zz_out_IMM_26;
    _zz_out_IMM_27[14] = _zz_out_IMM_26;
    _zz_out_IMM_27[13] = _zz_out_IMM_26;
    _zz_out_IMM_27[12] = _zz_out_IMM_26;
    _zz_out_IMM_27[11] = _zz_out_IMM_26;
    _zz_out_IMM_27[10] = _zz_out_IMM_26;
    _zz_out_IMM_27[9] = _zz_out_IMM_26;
    _zz_out_IMM_27[8] = _zz_out_IMM_26;
    _zz_out_IMM_27[7] = _zz_out_IMM_26;
    _zz_out_IMM_27[6] = _zz_out_IMM_26;
    _zz_out_IMM_27[5] = _zz_out_IMM_26;
    _zz_out_IMM_27[4] = _zz_out_IMM_26;
    _zz_out_IMM_27[3] = _zz_out_IMM_26;
    _zz_out_IMM_27[2] = _zz_out_IMM_26;
    _zz_out_IMM_27[1] = _zz_out_IMM_26;
    _zz_out_IMM_27[0] = _zz_out_IMM_26;
  end

  assign _zz_out_IMM_28 = _zz_out_IMM[31 : 20];
  assign _zz_out_IMM_29 = _zz_out_IMM_28[11];
  always @(*) begin
    _zz_out_IMM_30[19] = _zz_out_IMM_29;
    _zz_out_IMM_30[18] = _zz_out_IMM_29;
    _zz_out_IMM_30[17] = _zz_out_IMM_29;
    _zz_out_IMM_30[16] = _zz_out_IMM_29;
    _zz_out_IMM_30[15] = _zz_out_IMM_29;
    _zz_out_IMM_30[14] = _zz_out_IMM_29;
    _zz_out_IMM_30[13] = _zz_out_IMM_29;
    _zz_out_IMM_30[12] = _zz_out_IMM_29;
    _zz_out_IMM_30[11] = _zz_out_IMM_29;
    _zz_out_IMM_30[10] = _zz_out_IMM_29;
    _zz_out_IMM_30[9] = _zz_out_IMM_29;
    _zz_out_IMM_30[8] = _zz_out_IMM_29;
    _zz_out_IMM_30[7] = _zz_out_IMM_29;
    _zz_out_IMM_30[6] = _zz_out_IMM_29;
    _zz_out_IMM_30[5] = _zz_out_IMM_29;
    _zz_out_IMM_30[4] = _zz_out_IMM_29;
    _zz_out_IMM_30[3] = _zz_out_IMM_29;
    _zz_out_IMM_30[2] = _zz_out_IMM_29;
    _zz_out_IMM_30[1] = _zz_out_IMM_29;
    _zz_out_IMM_30[0] = _zz_out_IMM_29;
  end

  assign _zz_out_IMM_31 = _zz_out_IMM[31 : 20];
  assign _zz_out_IMM_32 = _zz_out_IMM_31[11];
  always @(*) begin
    _zz_out_IMM_33[19] = _zz_out_IMM_32;
    _zz_out_IMM_33[18] = _zz_out_IMM_32;
    _zz_out_IMM_33[17] = _zz_out_IMM_32;
    _zz_out_IMM_33[16] = _zz_out_IMM_32;
    _zz_out_IMM_33[15] = _zz_out_IMM_32;
    _zz_out_IMM_33[14] = _zz_out_IMM_32;
    _zz_out_IMM_33[13] = _zz_out_IMM_32;
    _zz_out_IMM_33[12] = _zz_out_IMM_32;
    _zz_out_IMM_33[11] = _zz_out_IMM_32;
    _zz_out_IMM_33[10] = _zz_out_IMM_32;
    _zz_out_IMM_33[9] = _zz_out_IMM_32;
    _zz_out_IMM_33[8] = _zz_out_IMM_32;
    _zz_out_IMM_33[7] = _zz_out_IMM_32;
    _zz_out_IMM_33[6] = _zz_out_IMM_32;
    _zz_out_IMM_33[5] = _zz_out_IMM_32;
    _zz_out_IMM_33[4] = _zz_out_IMM_32;
    _zz_out_IMM_33[3] = _zz_out_IMM_32;
    _zz_out_IMM_33[2] = _zz_out_IMM_32;
    _zz_out_IMM_33[1] = _zz_out_IMM_32;
    _zz_out_IMM_33[0] = _zz_out_IMM_32;
  end

  assign _zz_out_IMM_34 = _zz_out_IMM[31 : 20];
  assign _zz_out_IMM_35 = _zz_out_IMM_34[11];
  always @(*) begin
    _zz_out_IMM_36[19] = _zz_out_IMM_35;
    _zz_out_IMM_36[18] = _zz_out_IMM_35;
    _zz_out_IMM_36[17] = _zz_out_IMM_35;
    _zz_out_IMM_36[16] = _zz_out_IMM_35;
    _zz_out_IMM_36[15] = _zz_out_IMM_35;
    _zz_out_IMM_36[14] = _zz_out_IMM_35;
    _zz_out_IMM_36[13] = _zz_out_IMM_35;
    _zz_out_IMM_36[12] = _zz_out_IMM_35;
    _zz_out_IMM_36[11] = _zz_out_IMM_35;
    _zz_out_IMM_36[10] = _zz_out_IMM_35;
    _zz_out_IMM_36[9] = _zz_out_IMM_35;
    _zz_out_IMM_36[8] = _zz_out_IMM_35;
    _zz_out_IMM_36[7] = _zz_out_IMM_35;
    _zz_out_IMM_36[6] = _zz_out_IMM_35;
    _zz_out_IMM_36[5] = _zz_out_IMM_35;
    _zz_out_IMM_36[4] = _zz_out_IMM_35;
    _zz_out_IMM_36[3] = _zz_out_IMM_35;
    _zz_out_IMM_36[2] = _zz_out_IMM_35;
    _zz_out_IMM_36[1] = _zz_out_IMM_35;
    _zz_out_IMM_36[0] = _zz_out_IMM_35;
  end

  assign _zz_out_IMM_37 = {_zz_out_IMM[31 : 25],_zz_out_IMM[11 : 7]};
  assign _zz_out_IMM_38 = _zz_out_IMM_37[11];
  always @(*) begin
    _zz_out_IMM_39[19] = _zz_out_IMM_38;
    _zz_out_IMM_39[18] = _zz_out_IMM_38;
    _zz_out_IMM_39[17] = _zz_out_IMM_38;
    _zz_out_IMM_39[16] = _zz_out_IMM_38;
    _zz_out_IMM_39[15] = _zz_out_IMM_38;
    _zz_out_IMM_39[14] = _zz_out_IMM_38;
    _zz_out_IMM_39[13] = _zz_out_IMM_38;
    _zz_out_IMM_39[12] = _zz_out_IMM_38;
    _zz_out_IMM_39[11] = _zz_out_IMM_38;
    _zz_out_IMM_39[10] = _zz_out_IMM_38;
    _zz_out_IMM_39[9] = _zz_out_IMM_38;
    _zz_out_IMM_39[8] = _zz_out_IMM_38;
    _zz_out_IMM_39[7] = _zz_out_IMM_38;
    _zz_out_IMM_39[6] = _zz_out_IMM_38;
    _zz_out_IMM_39[5] = _zz_out_IMM_38;
    _zz_out_IMM_39[4] = _zz_out_IMM_38;
    _zz_out_IMM_39[3] = _zz_out_IMM_38;
    _zz_out_IMM_39[2] = _zz_out_IMM_38;
    _zz_out_IMM_39[1] = _zz_out_IMM_38;
    _zz_out_IMM_39[0] = _zz_out_IMM_38;
  end

  assign _zz_out_IMM_40 = {{{{_zz_out_IMM[31],_zz_out_IMM[7]},_zz_out_IMM[30 : 25]},_zz_out_IMM[11 : 8]},1'b0};
  assign _zz_out_IMM_41 = _zz_out_IMM_40[12];
  always @(*) begin
    _zz_out_IMM_42[18] = _zz_out_IMM_41;
    _zz_out_IMM_42[17] = _zz_out_IMM_41;
    _zz_out_IMM_42[16] = _zz_out_IMM_41;
    _zz_out_IMM_42[15] = _zz_out_IMM_41;
    _zz_out_IMM_42[14] = _zz_out_IMM_41;
    _zz_out_IMM_42[13] = _zz_out_IMM_41;
    _zz_out_IMM_42[12] = _zz_out_IMM_41;
    _zz_out_IMM_42[11] = _zz_out_IMM_41;
    _zz_out_IMM_42[10] = _zz_out_IMM_41;
    _zz_out_IMM_42[9] = _zz_out_IMM_41;
    _zz_out_IMM_42[8] = _zz_out_IMM_41;
    _zz_out_IMM_42[7] = _zz_out_IMM_41;
    _zz_out_IMM_42[6] = _zz_out_IMM_41;
    _zz_out_IMM_42[5] = _zz_out_IMM_41;
    _zz_out_IMM_42[4] = _zz_out_IMM_41;
    _zz_out_IMM_42[3] = _zz_out_IMM_41;
    _zz_out_IMM_42[2] = _zz_out_IMM_41;
    _zz_out_IMM_42[1] = _zz_out_IMM_41;
    _zz_out_IMM_42[0] = _zz_out_IMM_41;
  end

  assign _zz_out_IMM_43 = _zz_out_IMM[31 : 20];
  assign _zz_out_IMM_44 = _zz_out_IMM_43[11];
  always @(*) begin
    _zz_out_IMM_45[19] = _zz_out_IMM_44;
    _zz_out_IMM_45[18] = _zz_out_IMM_44;
    _zz_out_IMM_45[17] = _zz_out_IMM_44;
    _zz_out_IMM_45[16] = _zz_out_IMM_44;
    _zz_out_IMM_45[15] = _zz_out_IMM_44;
    _zz_out_IMM_45[14] = _zz_out_IMM_44;
    _zz_out_IMM_45[13] = _zz_out_IMM_44;
    _zz_out_IMM_45[12] = _zz_out_IMM_44;
    _zz_out_IMM_45[11] = _zz_out_IMM_44;
    _zz_out_IMM_45[10] = _zz_out_IMM_44;
    _zz_out_IMM_45[9] = _zz_out_IMM_44;
    _zz_out_IMM_45[8] = _zz_out_IMM_44;
    _zz_out_IMM_45[7] = _zz_out_IMM_44;
    _zz_out_IMM_45[6] = _zz_out_IMM_44;
    _zz_out_IMM_45[5] = _zz_out_IMM_44;
    _zz_out_IMM_45[4] = _zz_out_IMM_44;
    _zz_out_IMM_45[3] = _zz_out_IMM_44;
    _zz_out_IMM_45[2] = _zz_out_IMM_44;
    _zz_out_IMM_45[1] = _zz_out_IMM_44;
    _zz_out_IMM_45[0] = _zz_out_IMM_44;
  end

  assign _zz_out_IMM_46 = _zz_out_IMM[31 : 20];
  assign _zz_out_IMM_47 = _zz_out_IMM_46[11];
  always @(*) begin
    _zz_out_IMM_48[19] = _zz_out_IMM_47;
    _zz_out_IMM_48[18] = _zz_out_IMM_47;
    _zz_out_IMM_48[17] = _zz_out_IMM_47;
    _zz_out_IMM_48[16] = _zz_out_IMM_47;
    _zz_out_IMM_48[15] = _zz_out_IMM_47;
    _zz_out_IMM_48[14] = _zz_out_IMM_47;
    _zz_out_IMM_48[13] = _zz_out_IMM_47;
    _zz_out_IMM_48[12] = _zz_out_IMM_47;
    _zz_out_IMM_48[11] = _zz_out_IMM_47;
    _zz_out_IMM_48[10] = _zz_out_IMM_47;
    _zz_out_IMM_48[9] = _zz_out_IMM_47;
    _zz_out_IMM_48[8] = _zz_out_IMM_47;
    _zz_out_IMM_48[7] = _zz_out_IMM_47;
    _zz_out_IMM_48[6] = _zz_out_IMM_47;
    _zz_out_IMM_48[5] = _zz_out_IMM_47;
    _zz_out_IMM_48[4] = _zz_out_IMM_47;
    _zz_out_IMM_48[3] = _zz_out_IMM_47;
    _zz_out_IMM_48[2] = _zz_out_IMM_47;
    _zz_out_IMM_48[1] = _zz_out_IMM_47;
    _zz_out_IMM_48[0] = _zz_out_IMM_47;
  end

  assign _zz_out_IMM_49 = _zz_out_IMM[31 : 20];
  assign _zz_out_IMM_50 = _zz_out_IMM_49[11];
  always @(*) begin
    _zz_out_IMM_51[19] = _zz_out_IMM_50;
    _zz_out_IMM_51[18] = _zz_out_IMM_50;
    _zz_out_IMM_51[17] = _zz_out_IMM_50;
    _zz_out_IMM_51[16] = _zz_out_IMM_50;
    _zz_out_IMM_51[15] = _zz_out_IMM_50;
    _zz_out_IMM_51[14] = _zz_out_IMM_50;
    _zz_out_IMM_51[13] = _zz_out_IMM_50;
    _zz_out_IMM_51[12] = _zz_out_IMM_50;
    _zz_out_IMM_51[11] = _zz_out_IMM_50;
    _zz_out_IMM_51[10] = _zz_out_IMM_50;
    _zz_out_IMM_51[9] = _zz_out_IMM_50;
    _zz_out_IMM_51[8] = _zz_out_IMM_50;
    _zz_out_IMM_51[7] = _zz_out_IMM_50;
    _zz_out_IMM_51[6] = _zz_out_IMM_50;
    _zz_out_IMM_51[5] = _zz_out_IMM_50;
    _zz_out_IMM_51[4] = _zz_out_IMM_50;
    _zz_out_IMM_51[3] = _zz_out_IMM_50;
    _zz_out_IMM_51[2] = _zz_out_IMM_50;
    _zz_out_IMM_51[1] = _zz_out_IMM_50;
    _zz_out_IMM_51[0] = _zz_out_IMM_50;
  end

  assign _zz_out_IMM_52 = {{{{_zz_out_IMM[31],_zz_out_IMM[7]},_zz_out_IMM[30 : 25]},_zz_out_IMM[11 : 8]},1'b0};
  assign _zz_out_IMM_53 = _zz_out_IMM_52[12];
  always @(*) begin
    _zz_out_IMM_54[18] = _zz_out_IMM_53;
    _zz_out_IMM_54[17] = _zz_out_IMM_53;
    _zz_out_IMM_54[16] = _zz_out_IMM_53;
    _zz_out_IMM_54[15] = _zz_out_IMM_53;
    _zz_out_IMM_54[14] = _zz_out_IMM_53;
    _zz_out_IMM_54[13] = _zz_out_IMM_53;
    _zz_out_IMM_54[12] = _zz_out_IMM_53;
    _zz_out_IMM_54[11] = _zz_out_IMM_53;
    _zz_out_IMM_54[10] = _zz_out_IMM_53;
    _zz_out_IMM_54[9] = _zz_out_IMM_53;
    _zz_out_IMM_54[8] = _zz_out_IMM_53;
    _zz_out_IMM_54[7] = _zz_out_IMM_53;
    _zz_out_IMM_54[6] = _zz_out_IMM_53;
    _zz_out_IMM_54[5] = _zz_out_IMM_53;
    _zz_out_IMM_54[4] = _zz_out_IMM_53;
    _zz_out_IMM_54[3] = _zz_out_IMM_53;
    _zz_out_IMM_54[2] = _zz_out_IMM_53;
    _zz_out_IMM_54[1] = _zz_out_IMM_53;
    _zz_out_IMM_54[0] = _zz_out_IMM_53;
  end

  assign _zz_out_IMM_55 = {{{{{_zz_out_IMM[31],_zz_out_IMM[19 : 12]},_zz_out_IMM[20]},_zz_out_IMM[30 : 25]},_zz_out_IMM[24 : 21]},1'b0};
  assign _zz_out_IMM_56 = _zz_out_IMM_55[20];
  always @(*) begin
    _zz_out_IMM_57[10] = _zz_out_IMM_56;
    _zz_out_IMM_57[9] = _zz_out_IMM_56;
    _zz_out_IMM_57[8] = _zz_out_IMM_56;
    _zz_out_IMM_57[7] = _zz_out_IMM_56;
    _zz_out_IMM_57[6] = _zz_out_IMM_56;
    _zz_out_IMM_57[5] = _zz_out_IMM_56;
    _zz_out_IMM_57[4] = _zz_out_IMM_56;
    _zz_out_IMM_57[3] = _zz_out_IMM_56;
    _zz_out_IMM_57[2] = _zz_out_IMM_56;
    _zz_out_IMM_57[1] = _zz_out_IMM_56;
    _zz_out_IMM_57[0] = _zz_out_IMM_56;
  end

  assign _zz_out_IMM_58 = _zz_out_IMM[31 : 20];
  assign _zz_out_IMM_59 = _zz_out_IMM_58[11];
  always @(*) begin
    _zz_out_IMM_60[19] = _zz_out_IMM_59;
    _zz_out_IMM_60[18] = _zz_out_IMM_59;
    _zz_out_IMM_60[17] = _zz_out_IMM_59;
    _zz_out_IMM_60[16] = _zz_out_IMM_59;
    _zz_out_IMM_60[15] = _zz_out_IMM_59;
    _zz_out_IMM_60[14] = _zz_out_IMM_59;
    _zz_out_IMM_60[13] = _zz_out_IMM_59;
    _zz_out_IMM_60[12] = _zz_out_IMM_59;
    _zz_out_IMM_60[11] = _zz_out_IMM_59;
    _zz_out_IMM_60[10] = _zz_out_IMM_59;
    _zz_out_IMM_60[9] = _zz_out_IMM_59;
    _zz_out_IMM_60[8] = _zz_out_IMM_59;
    _zz_out_IMM_60[7] = _zz_out_IMM_59;
    _zz_out_IMM_60[6] = _zz_out_IMM_59;
    _zz_out_IMM_60[5] = _zz_out_IMM_59;
    _zz_out_IMM_60[4] = _zz_out_IMM_59;
    _zz_out_IMM_60[3] = _zz_out_IMM_59;
    _zz_out_IMM_60[2] = _zz_out_IMM_59;
    _zz_out_IMM_60[1] = _zz_out_IMM_59;
    _zz_out_IMM_60[0] = _zz_out_IMM_59;
  end

  assign _zz_out_IMM_61 = _zz_out_IMM[31 : 20];
  assign _zz_out_IMM_62 = _zz_out_IMM_61[11];
  always @(*) begin
    _zz_out_IMM_63[19] = _zz_out_IMM_62;
    _zz_out_IMM_63[18] = _zz_out_IMM_62;
    _zz_out_IMM_63[17] = _zz_out_IMM_62;
    _zz_out_IMM_63[16] = _zz_out_IMM_62;
    _zz_out_IMM_63[15] = _zz_out_IMM_62;
    _zz_out_IMM_63[14] = _zz_out_IMM_62;
    _zz_out_IMM_63[13] = _zz_out_IMM_62;
    _zz_out_IMM_63[12] = _zz_out_IMM_62;
    _zz_out_IMM_63[11] = _zz_out_IMM_62;
    _zz_out_IMM_63[10] = _zz_out_IMM_62;
    _zz_out_IMM_63[9] = _zz_out_IMM_62;
    _zz_out_IMM_63[8] = _zz_out_IMM_62;
    _zz_out_IMM_63[7] = _zz_out_IMM_62;
    _zz_out_IMM_63[6] = _zz_out_IMM_62;
    _zz_out_IMM_63[5] = _zz_out_IMM_62;
    _zz_out_IMM_63[4] = _zz_out_IMM_62;
    _zz_out_IMM_63[3] = _zz_out_IMM_62;
    _zz_out_IMM_63[2] = _zz_out_IMM_62;
    _zz_out_IMM_63[1] = _zz_out_IMM_62;
    _zz_out_IMM_63[0] = _zz_out_IMM_62;
  end

  assign _zz_out_IMM_64 = _zz_out_IMM[31 : 20];
  assign _zz_out_IMM_65 = _zz_out_IMM_64[11];
  always @(*) begin
    _zz_out_IMM_66[19] = _zz_out_IMM_65;
    _zz_out_IMM_66[18] = _zz_out_IMM_65;
    _zz_out_IMM_66[17] = _zz_out_IMM_65;
    _zz_out_IMM_66[16] = _zz_out_IMM_65;
    _zz_out_IMM_66[15] = _zz_out_IMM_65;
    _zz_out_IMM_66[14] = _zz_out_IMM_65;
    _zz_out_IMM_66[13] = _zz_out_IMM_65;
    _zz_out_IMM_66[12] = _zz_out_IMM_65;
    _zz_out_IMM_66[11] = _zz_out_IMM_65;
    _zz_out_IMM_66[10] = _zz_out_IMM_65;
    _zz_out_IMM_66[9] = _zz_out_IMM_65;
    _zz_out_IMM_66[8] = _zz_out_IMM_65;
    _zz_out_IMM_66[7] = _zz_out_IMM_65;
    _zz_out_IMM_66[6] = _zz_out_IMM_65;
    _zz_out_IMM_66[5] = _zz_out_IMM_65;
    _zz_out_IMM_66[4] = _zz_out_IMM_65;
    _zz_out_IMM_66[3] = _zz_out_IMM_65;
    _zz_out_IMM_66[2] = _zz_out_IMM_65;
    _zz_out_IMM_66[1] = _zz_out_IMM_65;
    _zz_out_IMM_66[0] = _zz_out_IMM_65;
  end

  assign _zz_out_IMM_67 = {_zz_out_IMM[31 : 25],_zz_out_IMM[11 : 7]};
  assign _zz_out_IMM_68 = _zz_out_IMM_67[11];
  always @(*) begin
    _zz_out_IMM_69[19] = _zz_out_IMM_68;
    _zz_out_IMM_69[18] = _zz_out_IMM_68;
    _zz_out_IMM_69[17] = _zz_out_IMM_68;
    _zz_out_IMM_69[16] = _zz_out_IMM_68;
    _zz_out_IMM_69[15] = _zz_out_IMM_68;
    _zz_out_IMM_69[14] = _zz_out_IMM_68;
    _zz_out_IMM_69[13] = _zz_out_IMM_68;
    _zz_out_IMM_69[12] = _zz_out_IMM_68;
    _zz_out_IMM_69[11] = _zz_out_IMM_68;
    _zz_out_IMM_69[10] = _zz_out_IMM_68;
    _zz_out_IMM_69[9] = _zz_out_IMM_68;
    _zz_out_IMM_69[8] = _zz_out_IMM_68;
    _zz_out_IMM_69[7] = _zz_out_IMM_68;
    _zz_out_IMM_69[6] = _zz_out_IMM_68;
    _zz_out_IMM_69[5] = _zz_out_IMM_68;
    _zz_out_IMM_69[4] = _zz_out_IMM_68;
    _zz_out_IMM_69[3] = _zz_out_IMM_68;
    _zz_out_IMM_69[2] = _zz_out_IMM_68;
    _zz_out_IMM_69[1] = _zz_out_IMM_68;
    _zz_out_IMM_69[0] = _zz_out_IMM_68;
  end

  assign _zz_out_IMM_70 = {{{{_zz_out_IMM[31],_zz_out_IMM[7]},_zz_out_IMM[30 : 25]},_zz_out_IMM[11 : 8]},1'b0};
  assign _zz_out_IMM_71 = _zz_out_IMM_70[12];
  always @(*) begin
    _zz_out_IMM_72[18] = _zz_out_IMM_71;
    _zz_out_IMM_72[17] = _zz_out_IMM_71;
    _zz_out_IMM_72[16] = _zz_out_IMM_71;
    _zz_out_IMM_72[15] = _zz_out_IMM_71;
    _zz_out_IMM_72[14] = _zz_out_IMM_71;
    _zz_out_IMM_72[13] = _zz_out_IMM_71;
    _zz_out_IMM_72[12] = _zz_out_IMM_71;
    _zz_out_IMM_72[11] = _zz_out_IMM_71;
    _zz_out_IMM_72[10] = _zz_out_IMM_71;
    _zz_out_IMM_72[9] = _zz_out_IMM_71;
    _zz_out_IMM_72[8] = _zz_out_IMM_71;
    _zz_out_IMM_72[7] = _zz_out_IMM_71;
    _zz_out_IMM_72[6] = _zz_out_IMM_71;
    _zz_out_IMM_72[5] = _zz_out_IMM_71;
    _zz_out_IMM_72[4] = _zz_out_IMM_71;
    _zz_out_IMM_72[3] = _zz_out_IMM_71;
    _zz_out_IMM_72[2] = _zz_out_IMM_71;
    _zz_out_IMM_72[1] = _zz_out_IMM_71;
    _zz_out_IMM_72[0] = _zz_out_IMM_71;
  end

  assign _zz_out_IMM_73 = _zz_out_IMM[31 : 20];
  assign _zz_out_IMM_74 = _zz_out_IMM_73[11];
  always @(*) begin
    _zz_out_IMM_75[19] = _zz_out_IMM_74;
    _zz_out_IMM_75[18] = _zz_out_IMM_74;
    _zz_out_IMM_75[17] = _zz_out_IMM_74;
    _zz_out_IMM_75[16] = _zz_out_IMM_74;
    _zz_out_IMM_75[15] = _zz_out_IMM_74;
    _zz_out_IMM_75[14] = _zz_out_IMM_74;
    _zz_out_IMM_75[13] = _zz_out_IMM_74;
    _zz_out_IMM_75[12] = _zz_out_IMM_74;
    _zz_out_IMM_75[11] = _zz_out_IMM_74;
    _zz_out_IMM_75[10] = _zz_out_IMM_74;
    _zz_out_IMM_75[9] = _zz_out_IMM_74;
    _zz_out_IMM_75[8] = _zz_out_IMM_74;
    _zz_out_IMM_75[7] = _zz_out_IMM_74;
    _zz_out_IMM_75[6] = _zz_out_IMM_74;
    _zz_out_IMM_75[5] = _zz_out_IMM_74;
    _zz_out_IMM_75[4] = _zz_out_IMM_74;
    _zz_out_IMM_75[3] = _zz_out_IMM_74;
    _zz_out_IMM_75[2] = _zz_out_IMM_74;
    _zz_out_IMM_75[1] = _zz_out_IMM_74;
    _zz_out_IMM_75[0] = _zz_out_IMM_74;
  end

  assign _zz_out_IMM_76 = _zz_out_IMM[31 : 20];
  assign _zz_out_IMM_77 = _zz_out_IMM_76[11];
  always @(*) begin
    _zz_out_IMM_78[19] = _zz_out_IMM_77;
    _zz_out_IMM_78[18] = _zz_out_IMM_77;
    _zz_out_IMM_78[17] = _zz_out_IMM_77;
    _zz_out_IMM_78[16] = _zz_out_IMM_77;
    _zz_out_IMM_78[15] = _zz_out_IMM_77;
    _zz_out_IMM_78[14] = _zz_out_IMM_77;
    _zz_out_IMM_78[13] = _zz_out_IMM_77;
    _zz_out_IMM_78[12] = _zz_out_IMM_77;
    _zz_out_IMM_78[11] = _zz_out_IMM_77;
    _zz_out_IMM_78[10] = _zz_out_IMM_77;
    _zz_out_IMM_78[9] = _zz_out_IMM_77;
    _zz_out_IMM_78[8] = _zz_out_IMM_77;
    _zz_out_IMM_78[7] = _zz_out_IMM_77;
    _zz_out_IMM_78[6] = _zz_out_IMM_77;
    _zz_out_IMM_78[5] = _zz_out_IMM_77;
    _zz_out_IMM_78[4] = _zz_out_IMM_77;
    _zz_out_IMM_78[3] = _zz_out_IMM_77;
    _zz_out_IMM_78[2] = _zz_out_IMM_77;
    _zz_out_IMM_78[1] = _zz_out_IMM_77;
    _zz_out_IMM_78[0] = _zz_out_IMM_77;
  end

  assign _zz_out_IMM_79 = {{{{_zz_out_IMM[31],_zz_out_IMM[7]},_zz_out_IMM[30 : 25]},_zz_out_IMM[11 : 8]},1'b0};
  assign _zz_out_IMM_80 = _zz_out_IMM_79[12];
  always @(*) begin
    _zz_out_IMM_81[18] = _zz_out_IMM_80;
    _zz_out_IMM_81[17] = _zz_out_IMM_80;
    _zz_out_IMM_81[16] = _zz_out_IMM_80;
    _zz_out_IMM_81[15] = _zz_out_IMM_80;
    _zz_out_IMM_81[14] = _zz_out_IMM_80;
    _zz_out_IMM_81[13] = _zz_out_IMM_80;
    _zz_out_IMM_81[12] = _zz_out_IMM_80;
    _zz_out_IMM_81[11] = _zz_out_IMM_80;
    _zz_out_IMM_81[10] = _zz_out_IMM_80;
    _zz_out_IMM_81[9] = _zz_out_IMM_80;
    _zz_out_IMM_81[8] = _zz_out_IMM_80;
    _zz_out_IMM_81[7] = _zz_out_IMM_80;
    _zz_out_IMM_81[6] = _zz_out_IMM_80;
    _zz_out_IMM_81[5] = _zz_out_IMM_80;
    _zz_out_IMM_81[4] = _zz_out_IMM_80;
    _zz_out_IMM_81[3] = _zz_out_IMM_80;
    _zz_out_IMM_81[2] = _zz_out_IMM_80;
    _zz_out_IMM_81[1] = _zz_out_IMM_80;
    _zz_out_IMM_81[0] = _zz_out_IMM_80;
  end

  assign _zz_out_IMM_82 = _zz_out_IMM[31 : 20];
  assign _zz_out_IMM_83 = _zz_out_IMM_82[11];
  always @(*) begin
    _zz_out_IMM_84[19] = _zz_out_IMM_83;
    _zz_out_IMM_84[18] = _zz_out_IMM_83;
    _zz_out_IMM_84[17] = _zz_out_IMM_83;
    _zz_out_IMM_84[16] = _zz_out_IMM_83;
    _zz_out_IMM_84[15] = _zz_out_IMM_83;
    _zz_out_IMM_84[14] = _zz_out_IMM_83;
    _zz_out_IMM_84[13] = _zz_out_IMM_83;
    _zz_out_IMM_84[12] = _zz_out_IMM_83;
    _zz_out_IMM_84[11] = _zz_out_IMM_83;
    _zz_out_IMM_84[10] = _zz_out_IMM_83;
    _zz_out_IMM_84[9] = _zz_out_IMM_83;
    _zz_out_IMM_84[8] = _zz_out_IMM_83;
    _zz_out_IMM_84[7] = _zz_out_IMM_83;
    _zz_out_IMM_84[6] = _zz_out_IMM_83;
    _zz_out_IMM_84[5] = _zz_out_IMM_83;
    _zz_out_IMM_84[4] = _zz_out_IMM_83;
    _zz_out_IMM_84[3] = _zz_out_IMM_83;
    _zz_out_IMM_84[2] = _zz_out_IMM_83;
    _zz_out_IMM_84[1] = _zz_out_IMM_83;
    _zz_out_IMM_84[0] = _zz_out_IMM_83;
  end

  assign _zz_out_IMM_85 = {_zz_out_IMM[31 : 25],_zz_out_IMM[11 : 7]};
  assign _zz_out_IMM_86 = _zz_out_IMM_85[11];
  always @(*) begin
    _zz_out_IMM_87[19] = _zz_out_IMM_86;
    _zz_out_IMM_87[18] = _zz_out_IMM_86;
    _zz_out_IMM_87[17] = _zz_out_IMM_86;
    _zz_out_IMM_87[16] = _zz_out_IMM_86;
    _zz_out_IMM_87[15] = _zz_out_IMM_86;
    _zz_out_IMM_87[14] = _zz_out_IMM_86;
    _zz_out_IMM_87[13] = _zz_out_IMM_86;
    _zz_out_IMM_87[12] = _zz_out_IMM_86;
    _zz_out_IMM_87[11] = _zz_out_IMM_86;
    _zz_out_IMM_87[10] = _zz_out_IMM_86;
    _zz_out_IMM_87[9] = _zz_out_IMM_86;
    _zz_out_IMM_87[8] = _zz_out_IMM_86;
    _zz_out_IMM_87[7] = _zz_out_IMM_86;
    _zz_out_IMM_87[6] = _zz_out_IMM_86;
    _zz_out_IMM_87[5] = _zz_out_IMM_86;
    _zz_out_IMM_87[4] = _zz_out_IMM_86;
    _zz_out_IMM_87[3] = _zz_out_IMM_86;
    _zz_out_IMM_87[2] = _zz_out_IMM_86;
    _zz_out_IMM_87[1] = _zz_out_IMM_86;
    _zz_out_IMM_87[0] = _zz_out_IMM_86;
  end

  assign _zz_out_IMM_88 = _zz_out_IMM[31 : 20];
  assign _zz_out_IMM_89 = _zz_out_IMM_88[11];
  always @(*) begin
    _zz_out_IMM_90[19] = _zz_out_IMM_89;
    _zz_out_IMM_90[18] = _zz_out_IMM_89;
    _zz_out_IMM_90[17] = _zz_out_IMM_89;
    _zz_out_IMM_90[16] = _zz_out_IMM_89;
    _zz_out_IMM_90[15] = _zz_out_IMM_89;
    _zz_out_IMM_90[14] = _zz_out_IMM_89;
    _zz_out_IMM_90[13] = _zz_out_IMM_89;
    _zz_out_IMM_90[12] = _zz_out_IMM_89;
    _zz_out_IMM_90[11] = _zz_out_IMM_89;
    _zz_out_IMM_90[10] = _zz_out_IMM_89;
    _zz_out_IMM_90[9] = _zz_out_IMM_89;
    _zz_out_IMM_90[8] = _zz_out_IMM_89;
    _zz_out_IMM_90[7] = _zz_out_IMM_89;
    _zz_out_IMM_90[6] = _zz_out_IMM_89;
    _zz_out_IMM_90[5] = _zz_out_IMM_89;
    _zz_out_IMM_90[4] = _zz_out_IMM_89;
    _zz_out_IMM_90[3] = _zz_out_IMM_89;
    _zz_out_IMM_90[2] = _zz_out_IMM_89;
    _zz_out_IMM_90[1] = _zz_out_IMM_89;
    _zz_out_IMM_90[0] = _zz_out_IMM_89;
  end

  assign _zz_out_IMM_91 = _zz_out_IMM[31 : 20];
  assign _zz_out_IMM_92 = _zz_out_IMM_91[11];
  always @(*) begin
    _zz_out_IMM_93[19] = _zz_out_IMM_92;
    _zz_out_IMM_93[18] = _zz_out_IMM_92;
    _zz_out_IMM_93[17] = _zz_out_IMM_92;
    _zz_out_IMM_93[16] = _zz_out_IMM_92;
    _zz_out_IMM_93[15] = _zz_out_IMM_92;
    _zz_out_IMM_93[14] = _zz_out_IMM_92;
    _zz_out_IMM_93[13] = _zz_out_IMM_92;
    _zz_out_IMM_93[12] = _zz_out_IMM_92;
    _zz_out_IMM_93[11] = _zz_out_IMM_92;
    _zz_out_IMM_93[10] = _zz_out_IMM_92;
    _zz_out_IMM_93[9] = _zz_out_IMM_92;
    _zz_out_IMM_93[8] = _zz_out_IMM_92;
    _zz_out_IMM_93[7] = _zz_out_IMM_92;
    _zz_out_IMM_93[6] = _zz_out_IMM_92;
    _zz_out_IMM_93[5] = _zz_out_IMM_92;
    _zz_out_IMM_93[4] = _zz_out_IMM_92;
    _zz_out_IMM_93[3] = _zz_out_IMM_92;
    _zz_out_IMM_93[2] = _zz_out_IMM_92;
    _zz_out_IMM_93[1] = _zz_out_IMM_92;
    _zz_out_IMM_93[0] = _zz_out_IMM_92;
  end

  assign _zz_out_IMM_94 = _zz_out_IMM[31 : 20];
  assign _zz_out_IMM_95 = _zz_out_IMM_94[11];
  always @(*) begin
    _zz_out_IMM_96[19] = _zz_out_IMM_95;
    _zz_out_IMM_96[18] = _zz_out_IMM_95;
    _zz_out_IMM_96[17] = _zz_out_IMM_95;
    _zz_out_IMM_96[16] = _zz_out_IMM_95;
    _zz_out_IMM_96[15] = _zz_out_IMM_95;
    _zz_out_IMM_96[14] = _zz_out_IMM_95;
    _zz_out_IMM_96[13] = _zz_out_IMM_95;
    _zz_out_IMM_96[12] = _zz_out_IMM_95;
    _zz_out_IMM_96[11] = _zz_out_IMM_95;
    _zz_out_IMM_96[10] = _zz_out_IMM_95;
    _zz_out_IMM_96[9] = _zz_out_IMM_95;
    _zz_out_IMM_96[8] = _zz_out_IMM_95;
    _zz_out_IMM_96[7] = _zz_out_IMM_95;
    _zz_out_IMM_96[6] = _zz_out_IMM_95;
    _zz_out_IMM_96[5] = _zz_out_IMM_95;
    _zz_out_IMM_96[4] = _zz_out_IMM_95;
    _zz_out_IMM_96[3] = _zz_out_IMM_95;
    _zz_out_IMM_96[2] = _zz_out_IMM_95;
    _zz_out_IMM_96[1] = _zz_out_IMM_95;
    _zz_out_IMM_96[0] = _zz_out_IMM_95;
  end

  assign _zz_out_IMM_97 = _zz_out_IMM[31 : 20];
  assign _zz_out_IMM_98 = _zz_out_IMM_97[11];
  always @(*) begin
    _zz_out_IMM_99[19] = _zz_out_IMM_98;
    _zz_out_IMM_99[18] = _zz_out_IMM_98;
    _zz_out_IMM_99[17] = _zz_out_IMM_98;
    _zz_out_IMM_99[16] = _zz_out_IMM_98;
    _zz_out_IMM_99[15] = _zz_out_IMM_98;
    _zz_out_IMM_99[14] = _zz_out_IMM_98;
    _zz_out_IMM_99[13] = _zz_out_IMM_98;
    _zz_out_IMM_99[12] = _zz_out_IMM_98;
    _zz_out_IMM_99[11] = _zz_out_IMM_98;
    _zz_out_IMM_99[10] = _zz_out_IMM_98;
    _zz_out_IMM_99[9] = _zz_out_IMM_98;
    _zz_out_IMM_99[8] = _zz_out_IMM_98;
    _zz_out_IMM_99[7] = _zz_out_IMM_98;
    _zz_out_IMM_99[6] = _zz_out_IMM_98;
    _zz_out_IMM_99[5] = _zz_out_IMM_98;
    _zz_out_IMM_99[4] = _zz_out_IMM_98;
    _zz_out_IMM_99[3] = _zz_out_IMM_98;
    _zz_out_IMM_99[2] = _zz_out_IMM_98;
    _zz_out_IMM_99[1] = _zz_out_IMM_98;
    _zz_out_IMM_99[0] = _zz_out_IMM_98;
  end

  assign _zz_out_IMM_100 = _zz_out_IMM[31 : 20];
  assign _zz_out_IMM_101 = _zz_out_IMM_100[11];
  always @(*) begin
    _zz_out_IMM_102[19] = _zz_out_IMM_101;
    _zz_out_IMM_102[18] = _zz_out_IMM_101;
    _zz_out_IMM_102[17] = _zz_out_IMM_101;
    _zz_out_IMM_102[16] = _zz_out_IMM_101;
    _zz_out_IMM_102[15] = _zz_out_IMM_101;
    _zz_out_IMM_102[14] = _zz_out_IMM_101;
    _zz_out_IMM_102[13] = _zz_out_IMM_101;
    _zz_out_IMM_102[12] = _zz_out_IMM_101;
    _zz_out_IMM_102[11] = _zz_out_IMM_101;
    _zz_out_IMM_102[10] = _zz_out_IMM_101;
    _zz_out_IMM_102[9] = _zz_out_IMM_101;
    _zz_out_IMM_102[8] = _zz_out_IMM_101;
    _zz_out_IMM_102[7] = _zz_out_IMM_101;
    _zz_out_IMM_102[6] = _zz_out_IMM_101;
    _zz_out_IMM_102[5] = _zz_out_IMM_101;
    _zz_out_IMM_102[4] = _zz_out_IMM_101;
    _zz_out_IMM_102[3] = _zz_out_IMM_101;
    _zz_out_IMM_102[2] = _zz_out_IMM_101;
    _zz_out_IMM_102[1] = _zz_out_IMM_101;
    _zz_out_IMM_102[0] = _zz_out_IMM_101;
  end

  assign RegisterFileAccessor_regFileIo_rs1 = value_RS1;
  assign RegisterFileAccessor_regFileIo_rs2 = value_RS2;
  always @(*) begin
    TrapHandler_trapSignals_hasTrapped = 1'b0;
    if(TrapHandler_interruptSignals_hasTrapped) begin
      TrapHandler_trapSignals_hasTrapped = TrapHandler_interruptSignals_hasTrapped;
    end else begin
      TrapHandler_trapSignals_hasTrapped = TrapHandler_exceptionSignals_hasTrapped;
    end
  end

  always @(*) begin
    TrapHandler_trapSignals_trapCause = 4'bxxxx;
    if(TrapHandler_interruptSignals_hasTrapped) begin
      TrapHandler_trapSignals_trapCause = TrapHandler_interruptSignals_trapCause;
    end else begin
      TrapHandler_trapSignals_trapCause = TrapHandler_exceptionSignals_trapCause;
    end
  end

  always @(*) begin
    TrapHandler_trapSignals_trapVal = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(TrapHandler_interruptSignals_hasTrapped) begin
      TrapHandler_trapSignals_trapVal = TrapHandler_interruptSignals_trapVal;
    end else begin
      TrapHandler_trapSignals_trapVal = TrapHandler_exceptionSignals_trapVal;
    end
  end

  always @(*) begin
    TrapHandler_isInterrupt = 1'b0;
    if(TrapHandler_interruptSignals_hasTrapped) begin
      TrapHandler_isInterrupt = 1'b1;
    end
  end

  always @(*) begin
    _out_default_IR = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    _out_default_IR = in_IR;
  end

  assign out_IR = _out_default_IR;
  always @(*) begin
    _out_default_PC = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    _out_default_PC = in_PC;
  end

  assign out_PC = _out_default_PC;
  always @(*) begin
    _out_default_NEXT_PC = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    _out_default_NEXT_PC = in_NEXT_PC;
  end

  assign out_NEXT_PC = _out_default_NEXT_PC;
  assign value_RS2 = out_RS2;
  assign value_RS1 = out_RS1;
  assign value_IR = out_IR;

endmodule

module Stage_IF (
  input  wire          arbitration_isValid,
  input  wire          arbitration_isStalled,
  output reg           arbitration_isReady,
  output wire          arbitration_isDone,
  output wire          arbitration_rs1Needed,
  output wire          arbitration_rs2Needed,
  output wire          arbitration_jumpRequested,
  output wire          arbitration_isAvailable,
  output reg           Fetcher_ibus_cmd_valid,
  input  wire          Fetcher_ibus_cmd_ready,
  output reg  [31:0]   Fetcher_ibus_cmd_payload_address,
  input  wire          Fetcher_ibus_rsp_valid,
  output wire          Fetcher_ibus_rsp_ready,
  input  wire [31:0]   Fetcher_ibus_rsp_payload_rdata,
  input  wire [31:0]   in_PC,
  output reg  [31:0]   out_NEXT_PC,
  output reg  [31:0]   out_IR,
  input  wire          in_HAS_TRAPPED,
  output reg           out_HAS_TRAPPED,
  output reg           out_TRAP_IS_INTERRUPT,
  output reg  [3:0]    out_TRAP_CAUSE,
  output reg  [31:0]   out_TRAP_VAL,
  output wire [31:0]   out_PC,
  input  wire          clk,
  input  wire          reset
);

  reg                 Fetcher_ibusCtrl_cmdFifo_io_push_valid;
  reg        [31:0]   Fetcher_ibusCtrl_cmdFifo_io_push_payload_address;
  reg                 Fetcher_ibusCtrl_cmdFifo_io_pop_ready;
  reg                 Fetcher_ibusCtrl_rspFifo_io_push_valid;
  reg        [31:0]   Fetcher_ibusCtrl_rspFifo_io_push_payload_address;
  reg        [31:0]   Fetcher_ibusCtrl_rspFifo_io_push_payload_ir;
  reg                 Fetcher_ibusCtrl_rspFifo_io_pop_ready;
  reg                 Fetcher_ibusCtrl_rspFifo_io_flush;
  wire                Fetcher_ibusCtrl_cmdFifo_io_push_ready;
  wire                Fetcher_ibusCtrl_cmdFifo_io_pop_valid;
  wire       [31:0]   Fetcher_ibusCtrl_cmdFifo_io_pop_payload_address;
  wire       [1:0]    Fetcher_ibusCtrl_cmdFifo_io_occupancy;
  wire       [1:0]    Fetcher_ibusCtrl_cmdFifo_io_availability;
  wire                Fetcher_ibusCtrl_rspFifo_io_push_ready;
  wire                Fetcher_ibusCtrl_rspFifo_io_pop_valid;
  wire       [31:0]   Fetcher_ibusCtrl_rspFifo_io_pop_payload_address;
  wire       [31:0]   Fetcher_ibusCtrl_rspFifo_io_pop_payload_ir;
  wire       [2:0]    Fetcher_ibusCtrl_rspFifo_io_occupancy;
  wire       [2:0]    Fetcher_ibusCtrl_rspFifo_io_availability;
  wire       [1:0]    _zz_Fetcher_ibusCtrl_restartCmdsToFlush;
  wire       [1:0]    _zz_Fetcher_ibusCtrl_restartCmdsToFlush_1;
  wire       [0:0]    _zz_Fetcher_ibusCtrl_restartCmdsToFlush_2;
  wire       [1:0]    _zz_Fetcher_ibusCtrl_restartCmdsToFlush_3;
  wire       [0:0]    _zz_Fetcher_ibusCtrl_restartCmdsToFlush_4;
  wire       [31:0]   _out_default_TRAP_VAL;
  wire       [3:0]    _out_default_TRAP_CAUSE;
  wire                _out_default_TRAP_IS_INTERRUPT;
  reg                 _out_default_HAS_TRAPPED;
  wire       [31:0]   _out_default_IR;
  wire       [31:0]   _out_default_NEXT_PC;
  wire                TrapHandler_interruptSignals_hasTrapped;
  wire       [3:0]    TrapHandler_interruptSignals_trapCause;
  wire       [31:0]   TrapHandler_interruptSignals_trapVal;
  wire                TrapHandler_exceptionSignals_hasTrapped;
  wire       [3:0]    TrapHandler_exceptionSignals_trapCause;
  wire       [31:0]   TrapHandler_exceptionSignals_trapVal;
  reg                 Fetcher_ibusCtrl_currentCmd_valid;
  reg                 Fetcher_ibusCtrl_currentCmd_accepted;
  reg        [31:0]   Fetcher_ibusCtrl_currentCmd_address;
  reg                 Fetcher_ibusCtrl_restartAddress_valid;
  reg        [31:0]   Fetcher_ibusCtrl_restartAddress_payload;
  reg        [1:0]    Fetcher_ibusCtrl_restartCmdsToFlush;
  wire                Fetcher_ibusCtrl_restarting;
  reg                 Fetcher_ibusCtrl_restartAccepted;
  reg                 Fetcher_ibusCtrl_nextCmd_valid;
  reg        [31:0]   Fetcher_ibusCtrl_nextCmd_payload;
  reg                 Fetcher_ibusCtrl_poppingCmd;
  wire                when_MemBus_l356;
  wire                when_MemBus_l368;
  wire                when_MemBus_l378;
  reg                 Fetcher_ibusCtrl_pushRsp;
  wire                when_MemBus_l418;
  wire       [31:0]   Fetcher_nextPc;
  wire                when_Fetcher_l29;
  reg                 when_Fetcher_l33;
  reg        [31:0]   _zz_out_IR;
  reg                 _zz_when_MemBus_l481;
  reg                 _zz_1;
  reg        [31:0]   _zz_when_MemBus_l465;
  reg        [31:0]   _zz_out_IR_1;
  wire                when_MemBus_l465;
  wire                when_MemBus_l474;
  wire                when_MemBus_l481;
  reg                 TrapHandler_trapSignals_hasTrapped;
  reg        [3:0]    TrapHandler_trapSignals_trapCause;
  reg        [31:0]   TrapHandler_trapSignals_trapVal;
  reg                 TrapHandler_isInterrupt;
  reg        [31:0]   _out_default_PC;

  assign _zz_Fetcher_ibusCtrl_restartCmdsToFlush = (Fetcher_ibusCtrl_cmdFifo_io_occupancy - _zz_Fetcher_ibusCtrl_restartCmdsToFlush_1);
  assign _zz_Fetcher_ibusCtrl_restartCmdsToFlush_2 = Fetcher_ibusCtrl_poppingCmd;
  assign _zz_Fetcher_ibusCtrl_restartCmdsToFlush_1 = {1'd0, _zz_Fetcher_ibusCtrl_restartCmdsToFlush_2};
  assign _zz_Fetcher_ibusCtrl_restartCmdsToFlush_4 = (Fetcher_ibusCtrl_currentCmd_valid && (! Fetcher_ibusCtrl_currentCmd_accepted));
  assign _zz_Fetcher_ibusCtrl_restartCmdsToFlush_3 = {1'd0, _zz_Fetcher_ibusCtrl_restartCmdsToFlush_4};
  StreamFifoLowLatency_2 Fetcher_ibusCtrl_cmdFifo (
    .io_push_valid           (Fetcher_ibusCtrl_cmdFifo_io_push_valid                ), //i
    .io_push_ready           (Fetcher_ibusCtrl_cmdFifo_io_push_ready                ), //o
    .io_push_payload_address (Fetcher_ibusCtrl_cmdFifo_io_push_payload_address[31:0]), //i
    .io_pop_valid            (Fetcher_ibusCtrl_cmdFifo_io_pop_valid                 ), //o
    .io_pop_ready            (Fetcher_ibusCtrl_cmdFifo_io_pop_ready                 ), //i
    .io_pop_payload_address  (Fetcher_ibusCtrl_cmdFifo_io_pop_payload_address[31:0] ), //o
    .io_flush                (1'b0                                                  ), //i
    .io_occupancy            (Fetcher_ibusCtrl_cmdFifo_io_occupancy[1:0]            ), //o
    .io_availability         (Fetcher_ibusCtrl_cmdFifo_io_availability[1:0]         ), //o
    .clk                     (clk                                                   ), //i
    .reset                   (reset                                                 )  //i
  );
  StreamFifoLowLatency_3 Fetcher_ibusCtrl_rspFifo (
    .io_push_valid           (Fetcher_ibusCtrl_rspFifo_io_push_valid                ), //i
    .io_push_ready           (Fetcher_ibusCtrl_rspFifo_io_push_ready                ), //o
    .io_push_payload_address (Fetcher_ibusCtrl_rspFifo_io_push_payload_address[31:0]), //i
    .io_push_payload_ir      (Fetcher_ibusCtrl_rspFifo_io_push_payload_ir[31:0]     ), //i
    .io_pop_valid            (Fetcher_ibusCtrl_rspFifo_io_pop_valid                 ), //o
    .io_pop_ready            (Fetcher_ibusCtrl_rspFifo_io_pop_ready                 ), //i
    .io_pop_payload_address  (Fetcher_ibusCtrl_rspFifo_io_pop_payload_address[31:0] ), //o
    .io_pop_payload_ir       (Fetcher_ibusCtrl_rspFifo_io_pop_payload_ir[31:0]      ), //o
    .io_flush                (Fetcher_ibusCtrl_rspFifo_io_flush                     ), //i
    .io_occupancy            (Fetcher_ibusCtrl_rspFifo_io_occupancy[2:0]            ), //o
    .io_availability         (Fetcher_ibusCtrl_rspFifo_io_availability[2:0]         ), //o
    .clk                     (clk                                                   ), //i
    .reset                   (reset                                                 )  //i
  );
  assign _out_default_TRAP_VAL = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
  always @(*) begin
    out_TRAP_VAL = _out_default_TRAP_VAL;
    if(TrapHandler_trapSignals_hasTrapped) begin
      out_TRAP_VAL = TrapHandler_trapSignals_trapVal;
    end
  end

  assign _out_default_TRAP_CAUSE = 4'bxxxx;
  always @(*) begin
    out_TRAP_CAUSE = _out_default_TRAP_CAUSE;
    if(TrapHandler_trapSignals_hasTrapped) begin
      out_TRAP_CAUSE = TrapHandler_trapSignals_trapCause;
    end
  end

  assign _out_default_TRAP_IS_INTERRUPT = 1'bx;
  always @(*) begin
    out_TRAP_IS_INTERRUPT = _out_default_TRAP_IS_INTERRUPT;
    if(TrapHandler_trapSignals_hasTrapped) begin
      out_TRAP_IS_INTERRUPT = TrapHandler_isInterrupt;
    end
  end

  always @(*) begin
    _out_default_HAS_TRAPPED = 1'bx;
    _out_default_HAS_TRAPPED = in_HAS_TRAPPED;
  end

  always @(*) begin
    out_HAS_TRAPPED = _out_default_HAS_TRAPPED;
    if(TrapHandler_trapSignals_hasTrapped) begin
      out_HAS_TRAPPED = 1'b1;
    end
  end

  assign _out_default_IR = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
  always @(*) begin
    out_IR = _out_default_IR;
    if(when_Fetcher_l29) begin
      if(when_Fetcher_l33) begin
        out_IR = _zz_out_IR;
      end
    end
  end

  assign _out_default_NEXT_PC = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
  always @(*) begin
    out_NEXT_PC = _out_default_NEXT_PC;
    if(when_Fetcher_l29) begin
      if(when_Fetcher_l33) begin
        out_NEXT_PC = Fetcher_nextPc;
      end
    end
  end

  assign arbitration_isAvailable = ((! arbitration_isValid) || arbitration_isDone);
  always @(*) begin
    arbitration_isReady = 1'b1;
    arbitration_isReady = 1'b0;
    if(when_Fetcher_l29) begin
      if(when_Fetcher_l33) begin
        arbitration_isReady = 1'b1;
      end
    end
  end

  assign arbitration_rs1Needed = 1'b0;
  assign arbitration_rs2Needed = 1'b0;
  assign arbitration_jumpRequested = 1'b0;
  assign arbitration_isDone = ((arbitration_isValid && arbitration_isReady) && (! arbitration_isStalled));
  assign TrapHandler_interruptSignals_hasTrapped = 1'b0;
  assign TrapHandler_interruptSignals_trapCause = 4'bxxxx;
  assign TrapHandler_interruptSignals_trapVal = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
  assign TrapHandler_exceptionSignals_hasTrapped = 1'b0;
  assign TrapHandler_exceptionSignals_trapCause = 4'bxxxx;
  assign TrapHandler_exceptionSignals_trapVal = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
  always @(*) begin
    Fetcher_ibusCtrl_cmdFifo_io_push_valid = 1'b0;
    if(when_MemBus_l418) begin
      Fetcher_ibusCtrl_cmdFifo_io_push_valid = 1'b1;
    end
  end

  always @(*) begin
    Fetcher_ibusCtrl_cmdFifo_io_push_payload_address = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(when_MemBus_l418) begin
      Fetcher_ibusCtrl_cmdFifo_io_push_payload_address = ((Fetcher_ibusCtrl_currentCmd_valid && (! Fetcher_ibusCtrl_currentCmd_accepted)) ? Fetcher_ibusCtrl_currentCmd_address : Fetcher_ibusCtrl_nextCmd_payload);
    end
  end

  always @(*) begin
    Fetcher_ibusCtrl_cmdFifo_io_pop_ready = 1'b0;
    if(Fetcher_ibus_rsp_valid) begin
      Fetcher_ibusCtrl_cmdFifo_io_pop_ready = 1'b1;
    end
    if(when_Fetcher_l29) begin
      if(!Fetcher_ibusCtrl_rspFifo_io_pop_valid) begin
        if(Fetcher_ibus_rsp_valid) begin
          Fetcher_ibusCtrl_cmdFifo_io_pop_ready = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    Fetcher_ibusCtrl_rspFifo_io_push_valid = 1'b0;
    if(Fetcher_ibus_rsp_valid) begin
      Fetcher_ibusCtrl_rspFifo_io_push_valid = Fetcher_ibusCtrl_pushRsp;
    end
  end

  always @(*) begin
    Fetcher_ibusCtrl_rspFifo_io_push_payload_address = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(Fetcher_ibus_rsp_valid) begin
      Fetcher_ibusCtrl_rspFifo_io_push_payload_address = Fetcher_ibusCtrl_cmdFifo_io_pop_payload_address;
    end
  end

  always @(*) begin
    Fetcher_ibusCtrl_rspFifo_io_push_payload_ir = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(Fetcher_ibus_rsp_valid) begin
      Fetcher_ibusCtrl_rspFifo_io_push_payload_ir = Fetcher_ibus_rsp_payload_rdata;
    end
  end

  always @(*) begin
    Fetcher_ibusCtrl_rspFifo_io_pop_ready = 1'b0;
    if(when_Fetcher_l29) begin
      if(Fetcher_ibusCtrl_rspFifo_io_pop_valid) begin
        Fetcher_ibusCtrl_rspFifo_io_pop_ready = 1'b1;
      end
    end
  end

  always @(*) begin
    Fetcher_ibusCtrl_rspFifo_io_flush = 1'b0;
    if(when_Fetcher_l29) begin
      if(when_MemBus_l481) begin
        Fetcher_ibusCtrl_rspFifo_io_flush = 1'b1;
      end
    end
  end

  always @(*) begin
    Fetcher_ibus_cmd_payload_address = Fetcher_ibusCtrl_currentCmd_address;
    if(Fetcher_ibusCtrl_nextCmd_valid) begin
      if(when_MemBus_l368) begin
        Fetcher_ibus_cmd_payload_address = Fetcher_ibusCtrl_nextCmd_payload;
      end
    end
  end

  always @(*) begin
    Fetcher_ibus_cmd_valid = (Fetcher_ibusCtrl_currentCmd_valid && (! Fetcher_ibusCtrl_currentCmd_accepted));
    if(Fetcher_ibusCtrl_nextCmd_valid) begin
      if(when_MemBus_l368) begin
        Fetcher_ibus_cmd_valid = 1'b1;
      end
    end
  end

  assign Fetcher_ibus_rsp_ready = 1'b1;
  always @(*) begin
    Fetcher_ibusCtrl_restartAddress_valid = 1'b0;
    if(when_Fetcher_l29) begin
      if(when_MemBus_l481) begin
        Fetcher_ibusCtrl_restartAddress_valid = 1'b1;
      end
    end
  end

  always @(*) begin
    Fetcher_ibusCtrl_restartAddress_payload = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(when_Fetcher_l29) begin
      if(when_MemBus_l481) begin
        Fetcher_ibusCtrl_restartAddress_payload = in_PC;
      end
    end
  end

  assign Fetcher_ibusCtrl_restarting = (Fetcher_ibusCtrl_restartCmdsToFlush != 2'b00);
  always @(*) begin
    Fetcher_ibusCtrl_restartAccepted = 1'b0;
    if(Fetcher_ibusCtrl_nextCmd_valid) begin
      if(when_MemBus_l356) begin
        Fetcher_ibusCtrl_restartAccepted = Fetcher_ibusCtrl_restartAddress_valid;
      end
    end
  end

  always @(*) begin
    Fetcher_ibusCtrl_nextCmd_valid = 1'b0;
    if(Fetcher_ibusCtrl_restartAddress_valid) begin
      Fetcher_ibusCtrl_nextCmd_valid = 1'b1;
    end else begin
      if(Fetcher_ibusCtrl_currentCmd_valid) begin
        Fetcher_ibusCtrl_nextCmd_valid = 1'b1;
      end
    end
  end

  always @(*) begin
    Fetcher_ibusCtrl_nextCmd_payload = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(Fetcher_ibusCtrl_restartAddress_valid) begin
      Fetcher_ibusCtrl_nextCmd_payload = Fetcher_ibusCtrl_restartAddress_payload;
    end else begin
      if(Fetcher_ibusCtrl_currentCmd_valid) begin
        Fetcher_ibusCtrl_nextCmd_payload = (Fetcher_ibusCtrl_currentCmd_address + 32'h00000004);
      end
    end
  end

  always @(*) begin
    Fetcher_ibusCtrl_poppingCmd = 1'b0;
    if(Fetcher_ibus_rsp_valid) begin
      Fetcher_ibusCtrl_poppingCmd = 1'b1;
    end
  end

  assign when_MemBus_l356 = (((! Fetcher_ibusCtrl_currentCmd_valid) || Fetcher_ibusCtrl_currentCmd_accepted) || Fetcher_ibus_cmd_ready);
  assign when_MemBus_l368 = ((! Fetcher_ibusCtrl_currentCmd_valid) || Fetcher_ibusCtrl_currentCmd_accepted);
  assign when_MemBus_l378 = (Fetcher_ibusCtrl_currentCmd_valid && (! Fetcher_ibusCtrl_currentCmd_accepted));
  always @(*) begin
    Fetcher_ibusCtrl_pushRsp = 1'b1;
    if(when_Fetcher_l29) begin
      if(!Fetcher_ibusCtrl_rspFifo_io_pop_valid) begin
        if(Fetcher_ibus_rsp_valid) begin
          Fetcher_ibusCtrl_pushRsp = 1'b0;
        end
      end
    end
  end

  assign when_MemBus_l418 = (Fetcher_ibus_cmd_valid && Fetcher_ibus_cmd_ready);
  assign Fetcher_nextPc = (in_PC + 32'h00000004);
  assign when_Fetcher_l29 = (! ((! arbitration_isValid) || arbitration_isStalled));
  always @(*) begin
    when_Fetcher_l33 = 1'b0;
    if(_zz_1) begin
      if(when_MemBus_l465) begin
        when_Fetcher_l33 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_out_IR = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(_zz_1) begin
      if(when_MemBus_l465) begin
        _zz_out_IR = _zz_out_IR_1;
      end
    end
  end

  always @(*) begin
    _zz_when_MemBus_l481 = 1'b0;
    if(_zz_1) begin
      if(!when_MemBus_l465) begin
        _zz_when_MemBus_l481 = 1'b1;
      end
    end else begin
      if(when_MemBus_l474) begin
        _zz_when_MemBus_l481 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(Fetcher_ibusCtrl_rspFifo_io_pop_valid) begin
      _zz_1 = Fetcher_ibusCtrl_rspFifo_io_pop_valid;
    end else begin
      if(Fetcher_ibus_rsp_valid) begin
        _zz_1 = 1'b1;
      end
    end
    if(Fetcher_ibusCtrl_restarting) begin
      _zz_1 = 1'b0;
    end
  end

  always @(*) begin
    _zz_when_MemBus_l465 = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(Fetcher_ibusCtrl_rspFifo_io_pop_valid) begin
      _zz_when_MemBus_l465 = Fetcher_ibusCtrl_rspFifo_io_pop_payload_address;
    end else begin
      if(Fetcher_ibus_rsp_valid) begin
        _zz_when_MemBus_l465 = Fetcher_ibusCtrl_cmdFifo_io_pop_payload_address;
      end
    end
  end

  always @(*) begin
    _zz_out_IR_1 = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(Fetcher_ibusCtrl_rspFifo_io_pop_valid) begin
      _zz_out_IR_1 = Fetcher_ibusCtrl_rspFifo_io_pop_payload_ir;
    end else begin
      if(Fetcher_ibus_rsp_valid) begin
        _zz_out_IR_1 = Fetcher_ibus_rsp_payload_rdata;
      end
    end
  end

  assign when_MemBus_l465 = (_zz_when_MemBus_l465 == in_PC);
  assign when_MemBus_l474 = ((! Fetcher_ibusCtrl_cmdFifo_io_pop_valid) || (Fetcher_ibusCtrl_cmdFifo_io_pop_payload_address != in_PC));
  assign when_MemBus_l481 = (_zz_when_MemBus_l481 && (! Fetcher_ibusCtrl_restarting));
  always @(*) begin
    TrapHandler_trapSignals_hasTrapped = 1'b0;
    if(TrapHandler_interruptSignals_hasTrapped) begin
      TrapHandler_trapSignals_hasTrapped = TrapHandler_interruptSignals_hasTrapped;
    end else begin
      TrapHandler_trapSignals_hasTrapped = TrapHandler_exceptionSignals_hasTrapped;
    end
  end

  always @(*) begin
    TrapHandler_trapSignals_trapCause = 4'bxxxx;
    if(TrapHandler_interruptSignals_hasTrapped) begin
      TrapHandler_trapSignals_trapCause = TrapHandler_interruptSignals_trapCause;
    end else begin
      TrapHandler_trapSignals_trapCause = TrapHandler_exceptionSignals_trapCause;
    end
  end

  always @(*) begin
    TrapHandler_trapSignals_trapVal = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(TrapHandler_interruptSignals_hasTrapped) begin
      TrapHandler_trapSignals_trapVal = TrapHandler_interruptSignals_trapVal;
    end else begin
      TrapHandler_trapSignals_trapVal = TrapHandler_exceptionSignals_trapVal;
    end
  end

  always @(*) begin
    TrapHandler_isInterrupt = 1'b0;
    if(TrapHandler_interruptSignals_hasTrapped) begin
      TrapHandler_isInterrupt = 1'b1;
    end
  end

  always @(*) begin
    _out_default_PC = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    _out_default_PC = in_PC;
  end

  assign out_PC = _out_default_PC;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      Fetcher_ibusCtrl_currentCmd_valid <= 1'b0;
      Fetcher_ibusCtrl_currentCmd_accepted <= 1'b0;
      Fetcher_ibusCtrl_restartCmdsToFlush <= 2'b00;
    end else begin
      if(Fetcher_ibusCtrl_nextCmd_valid) begin
        if(when_MemBus_l356) begin
          Fetcher_ibusCtrl_currentCmd_valid <= 1'b1;
          Fetcher_ibusCtrl_currentCmd_accepted <= 1'b0;
        end
        if(when_MemBus_l368) begin
          Fetcher_ibusCtrl_currentCmd_accepted <= Fetcher_ibus_cmd_ready;
        end
      end else begin
        if(when_MemBus_l378) begin
          Fetcher_ibusCtrl_currentCmd_accepted <= Fetcher_ibus_cmd_ready;
        end
      end
      if(Fetcher_ibusCtrl_restartAccepted) begin
        Fetcher_ibusCtrl_restartCmdsToFlush <= (_zz_Fetcher_ibusCtrl_restartCmdsToFlush + _zz_Fetcher_ibusCtrl_restartCmdsToFlush_3);
      end
      if(Fetcher_ibus_rsp_valid) begin
        if(Fetcher_ibusCtrl_restarting) begin
          Fetcher_ibusCtrl_restartCmdsToFlush <= (Fetcher_ibusCtrl_restartCmdsToFlush - 2'b01);
        end
      end
    end
  end

  always @(posedge clk) begin
    if(Fetcher_ibusCtrl_nextCmd_valid) begin
      if(when_MemBus_l356) begin
        Fetcher_ibusCtrl_currentCmd_address <= Fetcher_ibusCtrl_nextCmd_payload;
      end
    end
  end


endmodule

//StreamFifo replaced by StreamFifo_1

module StreamFifo_1 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  output reg           io_pop_valid,
  input  wire          io_pop_ready,
  input  wire          io_flush,
  output wire [2:0]    io_occupancy,
  output wire [2:0]    io_availability,
  input  wire          clk,
  input  wire          reset
);

  reg                 logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [2:0]    logic_ptr_push;
  reg        [2:0]    logic_ptr_pop;
  wire       [2:0]    logic_ptr_occupancy;
  wire       [2:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1248;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [1:0]    logic_push_onRam_write_payload_address;
  wire                logic_pop_addressGen_valid;
  wire                logic_pop_addressGen_ready;
  wire       [1:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_addressGen_translated_valid;
  wire                logic_pop_addressGen_translated_ready;

  assign when_Stream_l1248 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 3'b100) == 3'b000);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  always @(*) begin
    logic_ptr_doPush = io_push_fire;
    if(logic_ptr_empty) begin
      if(io_pop_ready) begin
        logic_ptr_doPush = 1'b0;
      end
    end
  end

  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[1:0];
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[1:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  assign logic_pop_addressGen_translated_valid = logic_pop_addressGen_valid;
  assign logic_pop_addressGen_ready = logic_pop_addressGen_translated_ready;
  always @(*) begin
    io_pop_valid = logic_pop_addressGen_translated_valid;
    if(logic_ptr_empty) begin
      io_pop_valid = io_push_valid;
    end
  end

  assign logic_pop_addressGen_translated_ready = io_pop_ready;
  assign logic_ptr_popOnIo = logic_ptr_pop;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (3'b100 - logic_ptr_occupancy);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_ptr_push <= 3'b000;
      logic_ptr_pop <= 3'b000;
      logic_ptr_wentUp <= 1'b0;
    end else begin
      if(when_Stream_l1248) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 3'b001);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 3'b001);
      end
      if(io_flush) begin
        logic_ptr_push <= 3'b000;
        logic_ptr_pop <= 3'b000;
      end
    end
  end


endmodule

module StreamFifoLowLatency_3 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [31:0]   io_push_payload_address,
  input  wire [31:0]   io_push_payload_ir,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [31:0]   io_pop_payload_address,
  output wire [31:0]   io_pop_payload_ir,
  input  wire          io_flush,
  output wire [2:0]    io_occupancy,
  output wire [2:0]    io_availability,
  input  wire          clk,
  input  wire          reset
);

  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire       [31:0]   fifo_io_pop_payload_address;
  wire       [31:0]   fifo_io_pop_payload_ir;
  wire       [2:0]    fifo_io_occupancy;
  wire       [2:0]    fifo_io_availability;

  StreamFifo_2 fifo (
    .io_push_valid           (io_push_valid                    ), //i
    .io_push_ready           (fifo_io_push_ready               ), //o
    .io_push_payload_address (io_push_payload_address[31:0]    ), //i
    .io_push_payload_ir      (io_push_payload_ir[31:0]         ), //i
    .io_pop_valid            (fifo_io_pop_valid                ), //o
    .io_pop_ready            (io_pop_ready                     ), //i
    .io_pop_payload_address  (fifo_io_pop_payload_address[31:0]), //o
    .io_pop_payload_ir       (fifo_io_pop_payload_ir[31:0]     ), //o
    .io_flush                (io_flush                         ), //i
    .io_occupancy            (fifo_io_occupancy[2:0]           ), //o
    .io_availability         (fifo_io_availability[2:0]        ), //o
    .clk                     (clk                              ), //i
    .reset                   (reset                            )  //i
  );
  assign io_push_ready = fifo_io_push_ready;
  assign io_pop_valid = fifo_io_pop_valid;
  assign io_pop_payload_address = fifo_io_pop_payload_address;
  assign io_pop_payload_ir = fifo_io_pop_payload_ir;
  assign io_occupancy = fifo_io_occupancy;
  assign io_availability = fifo_io_availability;

endmodule

module StreamFifoLowLatency_2 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [31:0]   io_push_payload_address,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [31:0]   io_pop_payload_address,
  input  wire          io_flush,
  output wire [1:0]    io_occupancy,
  output wire [1:0]    io_availability,
  input  wire          clk,
  input  wire          reset
);

  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire       [31:0]   fifo_io_pop_payload_address;
  wire       [1:0]    fifo_io_occupancy;
  wire       [1:0]    fifo_io_availability;

  StreamFifo_3 fifo (
    .io_push_valid           (io_push_valid                    ), //i
    .io_push_ready           (fifo_io_push_ready               ), //o
    .io_push_payload_address (io_push_payload_address[31:0]    ), //i
    .io_pop_valid            (fifo_io_pop_valid                ), //o
    .io_pop_ready            (io_pop_ready                     ), //i
    .io_pop_payload_address  (fifo_io_pop_payload_address[31:0]), //o
    .io_flush                (io_flush                         ), //i
    .io_occupancy            (fifo_io_occupancy[1:0]           ), //o
    .io_availability         (fifo_io_availability[1:0]        ), //o
    .clk                     (clk                              ), //i
    .reset                   (reset                            )  //i
  );
  assign io_push_ready = fifo_io_push_ready;
  assign io_pop_valid = fifo_io_pop_valid;
  assign io_pop_payload_address = fifo_io_pop_payload_address;
  assign io_occupancy = fifo_io_occupancy;
  assign io_availability = fifo_io_availability;

endmodule

module StreamFifo_2 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [31:0]   io_push_payload_address,
  input  wire [31:0]   io_push_payload_ir,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [31:0]   io_pop_payload_address,
  output wire [31:0]   io_pop_payload_ir,
  input  wire          io_flush,
  output wire [2:0]    io_occupancy,
  output wire [2:0]    io_availability,
  input  wire          clk,
  input  wire          reset
);

  wire       [63:0]   logic_ram_spinal_port1;
  wire       [63:0]   _zz_logic_ram_port;
  reg                 _zz_1;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [2:0]    logic_ptr_push;
  reg        [2:0]    logic_ptr_pop;
  wire       [2:0]    logic_ptr_occupancy;
  wire       [2:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1248;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [1:0]    logic_push_onRam_write_payload_address;
  wire       [31:0]   logic_push_onRam_write_payload_data_address;
  wire       [31:0]   logic_push_onRam_write_payload_data_ir;
  wire                logic_pop_addressGen_valid;
  wire                logic_pop_addressGen_ready;
  wire       [1:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire       [31:0]   logic_pop_async_readed_address;
  wire       [31:0]   logic_pop_async_readed_ir;
  wire       [63:0]   _zz_logic_pop_async_readed_address;
  wire                logic_pop_addressGen_translated_valid;
  wire                logic_pop_addressGen_translated_ready;
  wire       [31:0]   logic_pop_addressGen_translated_payload_address;
  wire       [31:0]   logic_pop_addressGen_translated_payload_ir;
  (* ram_style = "distributed" *) reg [63:0] logic_ram [0:3];

  assign _zz_logic_ram_port = {logic_push_onRam_write_payload_data_ir,logic_push_onRam_write_payload_data_address};
  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= _zz_logic_ram_port;
    end
  end

  assign logic_ram_spinal_port1 = logic_ram[logic_pop_addressGen_payload];
  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1248 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 3'b100) == 3'b000);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[1:0];
  assign logic_push_onRam_write_payload_data_address = io_push_payload_address;
  assign logic_push_onRam_write_payload_data_ir = io_push_payload_ir;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[1:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  assign _zz_logic_pop_async_readed_address = logic_ram_spinal_port1;
  assign logic_pop_async_readed_address = _zz_logic_pop_async_readed_address[31 : 0];
  assign logic_pop_async_readed_ir = _zz_logic_pop_async_readed_address[63 : 32];
  assign logic_pop_addressGen_translated_valid = logic_pop_addressGen_valid;
  assign logic_pop_addressGen_ready = logic_pop_addressGen_translated_ready;
  assign logic_pop_addressGen_translated_payload_address = logic_pop_async_readed_address;
  assign logic_pop_addressGen_translated_payload_ir = logic_pop_async_readed_ir;
  assign io_pop_valid = logic_pop_addressGen_translated_valid;
  assign logic_pop_addressGen_translated_ready = io_pop_ready;
  assign io_pop_payload_address = logic_pop_addressGen_translated_payload_address;
  assign io_pop_payload_ir = logic_pop_addressGen_translated_payload_ir;
  assign logic_ptr_popOnIo = logic_ptr_pop;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (3'b100 - logic_ptr_occupancy);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_ptr_push <= 3'b000;
      logic_ptr_pop <= 3'b000;
      logic_ptr_wentUp <= 1'b0;
    end else begin
      if(when_Stream_l1248) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 3'b001);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 3'b001);
      end
      if(io_flush) begin
        logic_ptr_push <= 3'b000;
        logic_ptr_pop <= 3'b000;
      end
    end
  end


endmodule

module StreamFifo_3 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [31:0]   io_push_payload_address,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [31:0]   io_pop_payload_address,
  input  wire          io_flush,
  output wire [1:0]    io_occupancy,
  output wire [1:0]    io_availability,
  input  wire          clk,
  input  wire          reset
);

  wire       [31:0]   logic_ram_spinal_port1;
  wire       [1:0]    _zz_logic_ptr_notPow2_counter;
  wire       [1:0]    _zz_logic_ptr_notPow2_counter_1;
  wire       [0:0]    _zz_logic_ptr_notPow2_counter_2;
  wire       [1:0]    _zz_logic_ptr_notPow2_counter_3;
  wire       [0:0]    _zz_logic_ptr_notPow2_counter_4;
  wire       [31:0]   _zz_logic_ram_port;
  reg                 _zz_1;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [1:0]    logic_ptr_push;
  reg        [1:0]    logic_ptr_pop;
  wire       [1:0]    logic_ptr_occupancy;
  wire       [1:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1248;
  reg                 logic_ptr_wentUp;
  wire                when_Stream_l1283;
  wire                when_Stream_l1287;
  reg        [1:0]    logic_ptr_notPow2_counter;
  wire                io_push_fire;
  wire                io_pop_fire;
  wire                logic_push_onRam_write_valid;
  wire       [1:0]    logic_push_onRam_write_payload_address;
  wire       [31:0]   logic_push_onRam_write_payload_data_address;
  wire                logic_pop_addressGen_valid;
  wire                logic_pop_addressGen_ready;
  wire       [1:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire       [31:0]   logic_pop_async_readed_address;
  wire                logic_pop_addressGen_translated_valid;
  wire                logic_pop_addressGen_translated_ready;
  wire       [31:0]   logic_pop_addressGen_translated_payload_address;
  (* ram_style = "distributed" *) reg [31:0] logic_ram [0:2];

  assign _zz_logic_ptr_notPow2_counter = (logic_ptr_notPow2_counter + _zz_logic_ptr_notPow2_counter_1);
  assign _zz_logic_ptr_notPow2_counter_2 = io_push_fire;
  assign _zz_logic_ptr_notPow2_counter_1 = {1'd0, _zz_logic_ptr_notPow2_counter_2};
  assign _zz_logic_ptr_notPow2_counter_4 = io_pop_fire;
  assign _zz_logic_ptr_notPow2_counter_3 = {1'd0, _zz_logic_ptr_notPow2_counter_4};
  assign _zz_logic_ram_port = logic_push_onRam_write_payload_data_address;
  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= _zz_logic_ram_port;
    end
  end

  assign logic_ram_spinal_port1 = logic_ram[logic_pop_addressGen_payload];
  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1248 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = ((logic_ptr_push == logic_ptr_popOnIo) && logic_ptr_wentUp);
  assign logic_ptr_empty = ((logic_ptr_push == logic_ptr_pop) && (! logic_ptr_wentUp));
  assign when_Stream_l1283 = (logic_ptr_push == 2'b10);
  assign when_Stream_l1287 = (logic_ptr_pop == 2'b10);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign logic_ptr_occupancy = logic_ptr_notPow2_counter;
  assign io_push_ready = (! logic_ptr_full);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push;
  assign logic_push_onRam_write_payload_data_address = io_push_payload_address;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop;
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  assign logic_pop_async_readed_address = logic_ram_spinal_port1[31 : 0];
  assign logic_pop_addressGen_translated_valid = logic_pop_addressGen_valid;
  assign logic_pop_addressGen_ready = logic_pop_addressGen_translated_ready;
  assign logic_pop_addressGen_translated_payload_address = logic_pop_async_readed_address;
  assign io_pop_valid = logic_pop_addressGen_translated_valid;
  assign logic_pop_addressGen_translated_ready = io_pop_ready;
  assign io_pop_payload_address = logic_pop_addressGen_translated_payload_address;
  assign logic_ptr_popOnIo = logic_ptr_pop;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (2'b11 - logic_ptr_occupancy);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_ptr_push <= 2'b00;
      logic_ptr_pop <= 2'b00;
      logic_ptr_wentUp <= 1'b0;
      logic_ptr_notPow2_counter <= 2'b00;
    end else begin
      if(when_Stream_l1248) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 2'b01);
        if(when_Stream_l1283) begin
          logic_ptr_push <= 2'b00;
        end
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 2'b01);
        if(when_Stream_l1287) begin
          logic_ptr_pop <= 2'b00;
        end
      end
      if(io_flush) begin
        logic_ptr_push <= 2'b00;
        logic_ptr_pop <= 2'b00;
      end
      logic_ptr_notPow2_counter <= (_zz_logic_ptr_notPow2_counter - _zz_logic_ptr_notPow2_counter_3);
      if(io_flush) begin
        logic_ptr_notPow2_counter <= 2'b00;
      end
    end
  end


endmodule
