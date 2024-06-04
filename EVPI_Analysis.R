#EVPI####
library(evpi)

input_data_Rhineland<- data.frame(frost_protection_mc_simulation_scenario_Rhineland_100000$x)
advantage_data_Rhineland<-data.frame(frost_protection_mc_simulation_scenario_Rhineland_100000$y[11:18])
NPV_data_Rhineland<-data.frame(frost_protection_mc_simulation_scenario_Rhineland_100000$y[1:10])

input_data_Lake_Constance<- data.frame(frost_protection_mc_simulation_scenario_Lake_Constance_100000$x)
advantage_data_Lake_Constance<-data.frame(frost_protection_mc_simulation_scenario_Lake_Constance_100000$y[11:18])
NPV_data_Lake_Constance<-data.frame(frost_protection_mc_simulation_scenario_Lake_Constance_100000$y[1:10])

evppi_multi_Rhineland<-multi_evppi(input_data_Rhineland,NPV_data_Rhineland)

evpi_candles_Rhineland<-binary_multi_evppi(input_data_Rhineland, advantage_data_Rhineland$advantage_candles)
evpi_stationary_windmachine_Rhineland<-binary_multi_evppi(input_data_Rhineland, advantage_data_Rhineland$advantage_stationary_windmachine)
evpi_mobile_windmachine_Rhineland<-binary_multi_evppi(input_data_Rhineland, advantage_data_Rhineland$advantage_mobile_windmachine)
evpi_heaters_Rhineland<-binary_multi_evppi(input_data_Rhineland, advantage_data_Rhineland$advantage_heaters)
evpi_ut_irrigation_Rhineland<-binary_multi_evppi(input_data_Rhineland, advantage_data_Rhineland$advantage_ut_irrigation)
evpi_ov_irrigation_Rhineland<-binary_multi_evppi(input_data_Rhineland, advantage_data_Rhineland$advantage_ov_irrigation)
evpi_frostbuster_Rhineland<-binary_multi_evppi(input_data_Rhineland, advantage_data_Rhineland$advantage_frostbuster)
evpi_frostguard_Rhineland<-binary_multi_evppi(input_data_Rhineland, advantage_data_Rhineland$advantage_frostguard)

evppi_multi_Lake_Constance<-multi_evppi(input_data_Lake_Constance,NPV_data_Lake_Constance)

evpi_candles_Lake_Constance<-binary_multi_evppi(input_data_Lake_Constance, advantage_data_Lake_Constance$advantage_candles)
evpi_stationary_windmachine_Lake_Constance<-binary_multi_evppi(input_data_Lake_Constance, advantage_data_Lake_Constance$advantage_stationary_windmachine)
evpi_mobile_windmachine_Lake_Constance<-binary_multi_evppi(input_data_Lake_Constance, advantage_data_Lake_Constance$advantage_mobile_windmachine)
evpi_heaters_Lake_Constance<-binary_multi_evppi(input_data_Lake_Constance, advantage_data_Lake_Constance$advantage_heaters)
evpi_ut_irrigation_Lake_Constance<-binary_multi_evppi(input_data_Lake_Constance, advantage_data_Lake_Constance$advantage_ut_irrigation)
evpi_ov_irrigation_Lake_Constance<-binary_multi_evppi(input_data_Lake_Constance, advantage_data_Lake_Constance$advantage_ov_irrigation)
evpi_frostbuster_Lake_Constance<-binary_multi_evppi(input_data_Lake_Constance, advantage_data_Lake_Constance$advantage_frostbuster)
evpi_frostguard_Lake_Constance<-binary_multi_evppi(input_data_Lake_Constance, advantage_data_Lake_Constance$advantage_frostguard)

plot_evpi_inputs_Rhineland<-data.frame(Frost_Input_Rhineland$variable,
                                       evpi_mobile_windmachine_Rhineland,
                                       evpi_candles_Rhineland,
                                       evpi_stationary_windmachine_Rhineland,
                                       evpi_ov_irrigation_Rhineland,
                                       evpi_ut_irrigation_Rhineland,
                                       evpi_frostbuster_Rhineland,
                                       evpi_frostguard_Rhineland,
                                       evpi_heaters_Rhineland)
write.csv(plot_evpi_inputs_Rhineland, "results/evpi_Rhineland.csv")

plot_evpi_inputs_Lake_Constance<-data.frame(Frost_Input_Lake_Constance$variable,
                                            evpi_mobile_windmachine_Lake_Constance,
                                            evpi_candles_Lake_Constance,
                                            evpi_stationary_windmachine_Lake_Constance,
                                            evpi_ov_irrigation_Lake_Constance,
                                            evpi_ut_irrigation_Lake_Constance,
                                            evpi_frostbuster_Lake_Constance,
                                            evpi_frostguard_Lake_Constance,
                                            evpi_heaters_Lake_Constance)
write.csv(plot_evpi_inputs_Lake_Constance, "results/evpi_LakeConstance.csv")


