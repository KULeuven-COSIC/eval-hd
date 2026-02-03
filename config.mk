######### TO MODIFY #####################################################################

export DESIGN_NICKNAME = proteus_libra
export DESIGN_NAME = Core
export PLATFORM    = nangate45

export VERILOG_FILES = $(sort $(wildcard $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/*.v)) 
export SDC_FILE      = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/constraints.sdc

# Uncomment for SystemVerilog
# export SYNTH_HDL_FRONTEND = slang

##########################################################################################

# Do not modify below
export ABC_AREA      = 1
export CORE_UTILIZATION ?= 50
export PLACE_DENSITY_LB_ADDON = 0.20
export TNS_END_PERCENT        = 100
export REMOVE_CELLS_FOR_EQY   = TAPCELL*