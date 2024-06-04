#Variable Importace in Projection####
#VIP for the comparsion

#Variable importance in projection####
pls_result_candles_Rhineland <- plsr.mcSimulation(object = frost_protection_mc_simulation_scenario_Rhineland_100000,
                                                  resultName = names(frost_protection_mc_simulation_scenario_Rhineland_100000$y)[11], ncomp = 1)
pls_result_candles_Lake_Constance <- plsr.mcSimulation(object = frost_protection_mc_simulation_scenario_Lake_Constance_100000,
                                                       resultName = names(frost_protection_mc_simulation_scenario_Lake_Constance_100000$y)[11], ncomp = 1)
pls_result_frostbuster_Rhineland <- plsr.mcSimulation(object = frost_protection_mc_simulation_scenario_Rhineland_100000,
                                                      resultName = names(frost_protection_mc_simulation_scenario_Rhineland_100000$y)[12], ncomp = 1)
pls_result_frostbuster_Lake_Constance <- plsr.mcSimulation(object = frost_protection_mc_simulation_scenario_Lake_Constance_100000,
                                                           resultName = names(frost_protection_mc_simulation_scenario_Lake_Constance_100000$y)[12], ncomp = 1)
pls_result_frostguard_Rhineland <- plsr.mcSimulation(object = frost_protection_mc_simulation_scenario_Rhineland_100000,
                                                     resultName = names(frost_protection_mc_simulation_scenario_Rhineland_100000$y)[13], ncomp = 1)
pls_result_frostguard_Lake_Constance <- plsr.mcSimulation(object = frost_protection_mc_simulation_scenario_Lake_Constance_100000,
                                                          resultName = names(frost_protection_mc_simulation_scenario_Lake_Constance_100000$y)[13], ncomp = 1)
pls_result_mobile_windmachine_Rhineland <- plsr.mcSimulation(object = frost_protection_mc_simulation_scenario_Rhineland_100000,
                                                             resultName = names(frost_protection_mc_simulation_scenario_Rhineland_100000$y)[14], ncomp = 1)
pls_result_mobile_windmachine_Lake_Constance <- plsr.mcSimulation(object = frost_protection_mc_simulation_scenario_Lake_Constance_100000,
                                                                  resultName = names(frost_protection_mc_simulation_scenario_Lake_Constance_100000$y)[14], ncomp = 1)
pls_result_stationary_windmachine_Rhineland <- plsr.mcSimulation(object = frost_protection_mc_simulation_scenario_Rhineland_100000,
                                                                 resultName = names(frost_protection_mc_simulation_scenario_Rhineland_100000$y)[15], ncomp = 1)
pls_result_stationary_windmachine_Lake_Constance <- plsr.mcSimulation(object = frost_protection_mc_simulation_scenario_Lake_Constance_100000,
                                                                      resultName = names(frost_protection_mc_simulation_scenario_Lake_Constance_100000$y)[15], ncomp = 1)
pls_result_ov_irrigation_Rhineland <- plsr.mcSimulation(object = frost_protection_mc_simulation_scenario_Rhineland_100000,
                                                        resultName = names(frost_protection_mc_simulation_scenario_Rhineland_100000$y)[16], ncomp = 1)
pls_result_ov_irrigation_Lake_Constance <- plsr.mcSimulation(object = frost_protection_mc_simulation_scenario_Lake_Constance_100000,
                                                             resultName = names(frost_protection_mc_simulation_scenario_Lake_Constance_100000$y)[16], ncomp = 1)
pls_result_ut_irrigation_Rhineland <- plsr.mcSimulation(object = frost_protection_mc_simulation_scenario_Rhineland_100000,
                                                        resultName = names(frost_protection_mc_simulation_scenario_Rhineland_100000$y)[17], ncomp = 1)
pls_result_ut_irrigation_Lake_Constance <- plsr.mcSimulation(object = frost_protection_mc_simulation_scenario_Lake_Constance_100000,
                                                             resultName = names(frost_protection_mc_simulation_scenario_Lake_Constance_100000$y)[17], ncomp = 1)
pls_result_heaters_Rhineland <- plsr.mcSimulation(object = frost_protection_mc_simulation_scenario_Rhineland_100000,
                                                  resultName = names(frost_protection_mc_simulation_scenario_Rhineland_100000$y)[18], ncomp = 1)
pls_result_heaters_Lake_Constance <- plsr.mcSimulation(object = frost_protection_mc_simulation_scenario_Lake_Constance_100000,
                                                       resultName = names(frost_protection_mc_simulation_scenario_Lake_Constance_100000$y)[18], ncomp = 1)

#find the maximum VIP value####
VIP_results_candles_Rhineland<-VIP_table(pls_result_candles_Rhineland, input_table = Frost_Input_Rhineland,threshold = 0)
VIP_results_heaters_Rhineland<-VIP_table(pls_result_heaters_Rhineland, input_table = Frost_Input_Rhineland,threshold = 0)
VIP_results_frostbuster_Rhineland<-VIP_table(pls_result_frostbuster_Rhineland, input_table = Frost_Input_Rhineland,threshold = 0)
VIP_results_frostguard_Rhineland<-VIP_table(pls_result_frostguard_Rhineland, input_table = Frost_Input_Rhineland,threshold = 0)
VIP_results_mobile_windmachine_Rhineland<-VIP_table(pls_result_mobile_windmachine_Rhineland, input_table = Frost_Input_Rhineland,threshold = 0)
VIP_results_ov_irrigation_Rhineland<-VIP_table(pls_result_ov_irrigation_Rhineland, input_table = Frost_Input_Rhineland,threshold = 0)
VIP_results_ut_irrigation_Rhineland<-VIP_table(pls_result_ut_irrigation_Rhineland, input_table = Frost_Input_Rhineland,threshold = 0)
VIP_results_stationary_windmachine_Rhineland<-VIP_table(pls_result_stationary_windmachine_Rhineland, input_table = Frost_Input_Rhineland,threshold = 0)

VIP_results_candles_Lake_Constance<-VIP_table(pls_result_candles_Lake_Constance, input_table = Frost_Input_Lake_Constance,threshold = 0)
VIP_results_heaters_Lake_Constance<-VIP_table(pls_result_heaters_Lake_Constance, input_table = Frost_Input_Lake_Constance,threshold = 0)
VIP_results_frostbuster_Lake_Constance<-VIP_table(pls_result_frostbuster_Lake_Constance, input_table = Frost_Input_Lake_Constance,threshold = 0)
VIP_results_frostguard_Lake_Constance<-VIP_table(pls_result_frostguard_Lake_Constance, input_table = Frost_Input_Lake_Constance,threshold = 0)
VIP_results_mobile_windmachine_Lake_Constance<-VIP_table(pls_result_mobile_windmachine_Lake_Constance, input_table = Frost_Input_Lake_Constance,threshold = 0)
VIP_results_ov_irrigation_Lake_Constance<-VIP_table(pls_result_ov_irrigation_Lake_Constance, input_table = Frost_Input_Lake_Constance,threshold = 0)
VIP_results_ut_irrigation_Lake_Constance<-VIP_table(pls_result_ut_irrigation_Lake_Constance, input_table = Frost_Input_Lake_Constance,threshold = 0)
VIP_results_stationary_windmachine_Lake_Constance<-VIP_table(pls_result_stationary_windmachine_Lake_Constance, input_table = Frost_Input_Lake_Constance,threshold = 0)

max_VIP<-max(max(VIP_results_stationary_windmachine_Rhineland$VIP),
             max(VIP_results_stationary_windmachine_Lake_Constance$VIP),
             max(VIP_results_mobile_windmachine_Rhineland$VIP),
             max(VIP_results_mobile_windmachine_Lake_Constance$VIP),
             max(VIP_results_frostbuster_Rhineland$VIP),
             max(VIP_results_frostbuster_Lake_Constance$VIP),
             max(VIP_results_frostguard_Rhineland$VIP),
             max(VIP_results_frostguard_Lake_Constance$VIP),
             max(VIP_results_candles_Rhineland$VIP),
             max(VIP_results_candles_Lake_Constance$VIP),
             max(VIP_results_heaters_Rhineland$VIP),
             max(VIP_results_heaters_Lake_Constance$VIP),
             max(VIP_results_ov_irrigation_Rhineland$VIP),
             max(VIP_results_ov_irrigation_Lake_Constance$VIP),
             max(VIP_results_ut_irrigation_Rhineland$VIP),
             max(VIP_results_ut_irrigation_Lake_Constance$VIP))

x_limit_VIP<-c(0, ceiling(max_VIP))

#prepare the plots####
#for each protection measure, the first plot shows the results for variable names
#and the second plot with a short description of the variable

##candles####

VIP_candles_Rhineland<-plot_pls(pls_result_candles_Rhineland, input_table = Frost_Input, threshold = 1)+
  ggtitle("candles Rhineland")+
  theme(plot.title = element_text(size = 8, face = "bold"),
        legend.position = "right",
        axis.title.x = element_text(size = 7))+
  scale_x_continuous(limits = c(0,15), expand = c(0, 0))
VIP_candles_Rhineland

VIP_candles_Rhineland<-plot_pls(pls_result_candles_Rhineland, input_table = Frost_Input_Rhineland, threshold = 1)+
  #ggtitle("Rhineland")+
  scale_x_continuous(limits = x_limit_VIP, expand = c(0, 0))+
  theme(plot.title = element_text(size = 15, face = "bold", hjust = 0),
        legend.position = c(0.8, 0.2),
        #axis.title.x = element_text(size = 7,margin = margin(t = 10)),
        axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15))+
  scale_y_discrete(labels=rev(c("mean storage costs per candle",
                                "number of candles needed per ha",
                                "recommended number of\ncandles in storage",
                                "risk of preparing the orchard for frost\nbut no frost occurs",
                                "risk of unnecessarily starting the protection",
                                "mean duration of frost per frost night",
                                "discount rate",
                                "mean yield loss due to a frost night")))+
  annotate("text",x=4, y= 1, label = "candles", color = "black", size=12*0.352777778,family="sans",hjust = 0)

VIP_candles_Rhineland

VIP_candles_Lake_Constance<-plot_pls(pls_result_candles_Lake_Constance, input_table = Frost_Input, threshold = 1)+
  ggtitle("candles Lake_Constance")+
  theme(plot.title = element_text(size = 8, face = "bold"),
        legend.position = "right",
        axis.title.x = element_text(size = 7))+
  scale_x_continuous(limits = c(0,15), expand = c(0, 0))
VIP_candles_Lake_Constance

VIP_candles_Lake_Constance<-plot_pls(pls_result_candles_Lake_Constance, input_table = Frost_Input_Lake_Constance, threshold = 1)+
  #ggtitle("Lake Constance")+
  scale_x_continuous(limits = x_limit_VIP, expand = c(0, 0))+
  theme(plot.title = element_text(size = 15, face = "bold", hjust = 0),
        legend.position = c(0.8, 0.2),
        #axis.title.x = element_text(size = 7,margin = margin(t = 10)),
        axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15))+
  scale_y_discrete(labels=rev(c("mean storage costs per candle",
                                "number of candles needed per ha",
                                "recommended number of\ncandles in storage",
                                "mean duration of frost per frost night",
                                "number of frost nights during\nblossom in a year with frost",
                                "frost risk",
                                "risk of unnecessarily starting the protection",
                                "mean burining time of candles",
                                "discount rate",
                                "mean protection efficiency candles",
                                "mean candle price",
                                "risk of preparing the orchard for frost\nbut no frost occurs",
                                "mean number of unnecessary starts\nin years with unnecessary starts",
                                "mean yield loss due to a frost night")))+
  annotate("text",x=4, y= 1, label = "candles", color = "black", size=12*0.352777778,family="sans",hjust = 0)

VIP_candles_Lake_Constance

##tractor-mounted gas heater####

VIP_frostbuster_Rhineland<-plot_pls(pls_result_frostbuster_Rhineland, input_table = Frost_Input, threshold = 1)+
  ggtitle("frostbuster Rhineland")+
  theme(plot.title = element_text(size = 8, face = "bold"),
        legend.position = "right",
        axis.title.x = element_text(size = 7))+
  scale_x_continuous(limits = c(0,15), expand = c(0, 0))
VIP_frostbuster_Rhineland

VIP_frostbuster_Rhineland<-plot_pls(pls_result_frostbuster_Rhineland, input_table = Frost_Input_Rhineland, threshold = 1)+
  #ggtitle("Rhineland")+
  scale_x_continuous(limits = x_limit_VIP, expand = c(0, 0))+
  theme(plot.title = element_text(size = 15, face = "bold", hjust = 0),
        legend.position = c(0.8, 0.2),
        #axis.title.x = element_text(size = 7,margin = margin(t = 10)),
        axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15))+
  scale_y_discrete(labels=rev(c("mean area protected by\none tractor-mounted gas heater",
                                "mean yield loss due to a frost night",
                                "frostbuster price",
                                "risk of burning damage at leaves or\nbuds by tractor-mounted gas heater",
                                "number of frost nights during\nblossom in a year with frost",
                                "mean yield loss due to burning damage",
                                "mean protection efficiency\ntractor-mounted gas heater",
                                "frost risk",
                                "risk ineffective protection\ntractor-mounted gas heater",
                                "mean duration of frost per frost night",
                                "percentage residual value of the\ntractor-mounted gas heater after 18 years",
                                "mean maintenance costs\ntractor-mounted gas heater")))+
  annotate("text",x=3.5, y= 1.5, label = "tractor-mounted\ngas heater", color = "black", size=12*0.352777778,family="sans",hjust = 0)
VIP_frostbuster_Rhineland

VIP_frostbuster_Lake_Constance<-plot_pls(pls_result_frostbuster_Lake_Constance, input_table = Frost_Input, threshold = 1)+
  ggtitle("tractor-mounted gas heater Lake_Constance")+
  theme(plot.title = element_text(size = 8, face = "bold"),
        legend.position = "right",
        axis.title.x = element_text(size = 7))+
  scale_x_continuous(limits = c(0,15), expand = c(0, 0))
VIP_frostbuster_Lake_Constance

VIP_frostbuster_Lake_Constance<-plot_pls(pls_result_frostbuster_Lake_Constance, input_table = Frost_Input_Lake_Constance, threshold = 1)+
  #ggtitle("Lake Constance")+
  scale_x_continuous(limits = x_limit_VIP, expand = c(0, 0))+
  theme(plot.title = element_text(size = 15, face = "bold", hjust = 0),
        legend.position = c(0.8, 0.2),
        #axis.title.x = element_text(size = 7,margin = margin(t = 10)),
        axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15))+
  scale_y_discrete(labels=rev(c("mean area protected by\none tractor-mounted gas heater",
                                "mean yield loss due to a frost night",
                                "frost risk",
                                "mean protection efficiency\ntractor-mounted gas heater",
                                "price of one tractor-mounted gas heater",
                                "number of frost nights during\nblossom in a year with frost",
                                "risk of burning damage at leaves or\nbuds by tractor-mounted gas heater",
                                "mean yield loss due to burning damage",
                                "mean duration of frost per frost night",
                                "risk ineffective protection\ntractor-mounted gas heater")))+
  annotate("text",x=3.5, y= 1.5, label = "tractor-mounted\ngas heater", color = "black", size=12*0.352777778,family="sans",hjust = 0)
VIP_frostbuster_Lake_Constance

##portable gas heater####

VIP_frostguard_Rhineland<-plot_pls(pls_result_frostguard_Rhineland, input_table = Frost_Input, threshold = 1)+
  ggtitle("portable gas heater Rhineland")+
  theme(plot.title = element_text(size = 8, face = "bold"),
        legend.position = "right",
        axis.title.x = element_text(size = 7))+
  scale_x_continuous(limits = c(0,15), expand = c(0, 0))
VIP_frostguard_Rhineland

VIP_frostguard_Rhineland<-plot_pls(pls_result_frostguard_Rhineland, input_table = Frost_Input_Rhineland, threshold = 1)+
  #ggtitle("Rhineland")+
  scale_x_continuous(limits = x_limit_VIP, expand = c(0, 0))+
  theme(plot.title = element_text(size = 15, face = "bold", hjust = 0),
        legend.position = c(0.8, 0.2),
        #axis.title.x = element_text(size = 7,margin = margin(t = 10)),
        axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15))+
  scale_y_discrete(labels=rev(c("mean area protected by\none portable gas heater",
                                "risk of burning damage at leaves or\nbuds by portable gas heater",
                                "mean yield loss due to burning damage",
                                "mean yield loss due to a frost night",
                                "number of frost nights during\nblossom in a year with frost",
                                "frost risk",
                                "price of one portable gas heater",
                                "mean apple yield",
                                "risk ineffective protection\nportable gas heater",
                                "mean protection efficiency\nportable gas heater",
                                "mean maintenance costs\nportable gas heater",
                                "discount rate")))+
  annotate("text",x=4, y= 1.5, label = "portable\ngas heater", color = "black", size=12*0.352777778,family="sans",hjust = 0)
VIP_frostguard_Rhineland


VIP_frostguard_Lake_Constance<-plot_pls(pls_result_frostguard_Lake_Constance, input_table = Frost_Input, threshold = 1)+
  ggtitle("portable gas heater Lake_Constance")+
  theme(plot.title = element_text(size = 8, face = "bold"),
        legend.position = "right",
        axis.title.x = element_text(size = 7))+
  scale_x_continuous(limits = c(0,15), expand = c(0, 0))
VIP_frostguard_Lake_Constance

VIP_frostguard_Lake_Constance<-plot_pls(pls_result_frostguard_Lake_Constance, input_table = Frost_Input_Lake_Constance, threshold = 1)+
  #ggtitle("Lake Constance")+
  scale_x_continuous(limits = x_limit_VIP, expand = c(0, 0))+
  theme(plot.title = element_text(size = 15, face = "bold", hjust = 0),
        legend.position = c(0.75, 0.25),
        #axis.title.x = element_text(size = 7,margin = margin(t = 10)),
        axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15))+
  scale_y_discrete(labels=rev(c("mean yield loss due to a frost night",
                                "mean area protected by\none portable gas heater",
                                "frost risk",
                                "risk of burning damage at leaves or\nbuds by portable gas heater",
                                "mean yield loss due to burning damage",
                                "number of frost nights during\nblossom in a year with frost",
                                "price of one portable gas heater",
                                "mean protection efficiency\nportable gas heater",
                                "risk ineffective protection\nportable gas heater",
                                "mean apple yield")))+
  annotate("text",x=4, y= 1.25, label = "portable\ngas heater", color = "black", size=12*0.352777778,family="sans",hjust = 0)
VIP_frostguard_Lake_Constance

##mobile windmachine####

VIP_mobile_windmachine_Rhineland<-plot_pls(pls_result_mobile_windmachine_Rhineland, input_table = Frost_Input, threshold = 1)+
  ggtitle("mobile_windmachine Rhineland")+
  theme(plot.title = element_text(size = 8, face = "bold"),
        legend.position = "right",
        axis.title.x = element_text(size = 7))+
  scale_x_continuous(limits = c(0,15), expand = c(0, 0))
VIP_mobile_windmachine_Rhineland

VIP_mobile_windmachine_Rhineland<-plot_pls(pls_result_mobile_windmachine_Rhineland, input_table = Frost_Input_Rhineland, threshold = 1)+
  #ggtitle("Rhineland")+
  scale_x_continuous(limits = x_limit_VIP, expand = c(0, 0))+
  theme(plot.title = element_text(size = 15, face = "bold", hjust = 0),
        legend.position = c(0.8, 0.2),
        #axis.title.x = element_text(size = 7,margin = margin(t = 10)),
        axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15))+
  scale_y_discrete(labels=rev(c("mean area protected by one\nmobile wind machine",
                                "mean mobile wind machine price",
                                "mean yield loss due to a frost night",
                                "risk ineffective protection\nmobile wind machine",
                                "number of frost nights during\nblossom in a year with frost",
                                "mean protection efficiency\nwind machine",
                                "frost risk",
                                "percentage residual value of a\nmobile wind machine after 18 years",
                                "mean apple yield",
                                "risk of damage due to use of wind machines\nin unfavourable weather conditions")))+
  annotate("text",x=4, y= 1.5, label = "mobile\nwind machine", color = "black", size=12*0.352777778,family="sans",hjust = 0)
VIP_mobile_windmachine_Rhineland

VIP_mobile_windmachine_Lake_Constance<-plot_pls(pls_result_mobile_windmachine_Lake_Constance, input_table = Frost_Input, threshold = 1)+
  ggtitle("mobile_windmachine Lake_Constance")+
  theme(plot.title = element_text(size = 8, face = "bold"),
        legend.position = "right",
        axis.title.x = element_text(size = 7))+
  scale_x_continuous(limits = c(0,15), expand = c(0, 0))
VIP_mobile_windmachine_Lake_Constance

VIP_mobile_windmachine_Lake_Constance<-plot_pls(pls_result_mobile_windmachine_Lake_Constance, input_table = Frost_Input_Lake_Constance, threshold = 1)+
  #ggtitle("Lake Constance")+
  scale_x_continuous(limits = x_limit_VIP, expand = c(0, 0))+
  theme(plot.title = element_text(size = 15, face = "bold", hjust = 0),
        legend.position = c(0.75, 0.25),
        #axis.title.x = element_text(size = 7,margin = margin(t = 10)),
        axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15))+
  scale_y_discrete(labels=rev(c("mean area protected by one\nmobile wind machine",
                                "frost risk",
                                "mean mobile wind machine price",
                                "mean yield loss due to a frost night",
                                "risk ineffective protection\nmobile wind machine",
                                "mean protection efficiency\nwind machine",
                                "number of frost nights during\nblossom in a year with frost",
                                "mean apple yield",
                                "percentage residual value of a\nmobile wind machine after 18 years")))+
  annotate("text",x=4, y= 1.5, label = "mobile\nwind machine", color = "black", size=12*0.352777778,family="sans",hjust = 0)
VIP_mobile_windmachine_Lake_Constance

##stationary windmachine####

VIP_stationary_windmachine_Rhineland<-plot_pls(pls_result_stationary_windmachine_Rhineland, input_table = Frost_Input, threshold = 1)+
  ggtitle("stationary wind machine Rhineland")+
  theme(plot.title = element_text(size = 8, face = "bold"),
        legend.position = "right",
        axis.title.x = element_text(size = 7))+
  scale_x_continuous(limits = c(0,15), expand = c(0, 0))
VIP_stationary_windmachine_Rhineland

VIP_stationary_windmachine_Rhineland<-plot_pls(pls_result_stationary_windmachine_Rhineland, input_table = Frost_Input, threshold = 1)+
  #ggtitle("Rhineland")+
  scale_x_continuous(limits = x_limit_VIP, expand = c(0, 0))+
  theme(plot.title = element_text(size = 15, face = "bold", hjust = 0),
        legend.position = c(0.8, 0.2),
        #axis.title.x = element_text(size = 7,margin = margin(t = 10)),
        axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15))+
  scale_y_discrete(labels=rev(c("mean yield loss due to a frost night",
                                "mean protection efficiency wind machine",
                                "number of frost nights during\nblossom in a year with frost",
                                "frost risk",
                                "mean apple yield",
                                "discount rate",
                                "area that can be protected by\none stationary wind machine ",
                                "risk of ineffective protection\nstationary wind machine",
                                "installation costs\nstationary wind machine",
                                "risk of damage due to use of wind machines\nin unfavourable weather conditions ",
                                "share of frost events that\nare harmful to the flowers",
                                "risk of starting the protection too late",
                                "costs for the building permit",
                                "price stationary wind machine")))+
  annotate("text",x=4, y= 1.5, label = "stationary \nwind machine", color = "black", size=12*0.352777778,family="sans",hjust = 0)

VIP_stationary_windmachine_Rhineland


VIP_stationary_windmachine_Lake_Constance<-plot_pls(pls_result_stationary_windmachine_Lake_Constance, input_table = Frost_Input, threshold = 1)+
  ggtitle("stationary wind machine Lake Constance")+
  theme(plot.title = element_text(size = 8, face = "bold"),
        legend.position = "right",
        axis.title.x = element_text(size = 7))+
  scale_x_continuous(limits = c(0,15), expand = c(0, 0))
VIP_stationary_windmachine_Lake_Constance

VIP_stationary_windmachine_Lake_Constance<-plot_pls(pls_result_stationary_windmachine_Lake_Constance, input_table = Frost_Input, threshold = 1)+
  #ggtitle("Lake Constance")+
  scale_x_continuous(limits = x_limit_VIP, expand = c(0, 0))+
  theme(plot.title = element_text(size = 15, face = "bold", hjust = 0),
        legend.position = c(0.7, 0.5),
        #axis.title.x = element_text(size = 7,margin = margin(t = 10)),
        axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15),
        legend.text = element_text(size = 10),
        legend.title = element_text(size = 10))+
  scale_y_discrete(labels=rev(c("frost risk",
                                "mean protection efficiency wind machine",
                                "mean yield loss due to a frost night",
                                "number of frost nights during\nblossom in a year with frost",
                                "mean apple yield",
                                "risk of ineffective protection\nstationary wind machine",
                                "discount rate",
                                "area protected by one wind machine",
                                "risk of starting the protection too late",
                                "installation costs\nstationary wind machine",
                                "risk of missing to use\nthe protection")))+
  annotate("text",x=4, y= 1.5, label = "stationary\nwind machine", color = "black", size=12*0.352777778,family="sans",hjust = 0)

VIP_stationary_windmachine_Lake_Constance

##overhead irrigation####

VIP_ov_irrigation_Rhineland<-plot_pls(pls_result_ov_irrigation_Rhineland, input_table = Frost_Input, threshold = 1)+
  ggtitle("ov_irrigation Rhineland")+
  theme(plot.title = element_text(size = 8, face = "bold"),
        legend.position = "right",
        axis.title.x = element_text(size = 7))+
  scale_x_continuous(limits = c(0,15), expand = c(0, 0))
VIP_ov_irrigation_Rhineland

VIP_ov_irrigation_Rhineland<-plot_pls(pls_result_ov_irrigation_Rhineland, input_table = Frost_Input, threshold = 1)+
  #ggtitle("Rhineland")+
  scale_x_continuous(limits = x_limit_VIP, expand = c(0, 0))+
  theme(plot.title = element_text(size = 15, face = "bold", hjust = 0),
        legend.position = c(0.8, 0.2),
        #axis.title.x = element_text(size = 7,margin = margin(t = 10)),
        axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15))+
  scale_y_discrete(labels=rev(c("mean yield loss due to a frost night",
                                "number of frost nights during\nblossom in a year with frost",
                                "frost risk",
                                "mean apple yield",
                                "mean protection efficiency\noverhead irrigation",
                                "mean maintenance costs\noverhead irrigation",
                                "risk of excessively windy weather",
                                "costs for water lines in the orchard",
                                "recommended water storage\ncapacity of the pond",
                                "costs for building the pond",
                                "funding rate for the\nirrigation infrastructure",
                                "risk of starting the protection too late",
                                "share of frost events that\nare harmful to the flowers",
                                "establishment costs per ha",
                                "percentage residual value\nof the pond after 18 years",
                                "apple price increase in frost years",
                                "risk of frozen water lines",
                                "risk of missing to use\nthe protection")))+
  annotate("text",x=4, y= 1.5, label = "overhead\nirrigation", color = "black", size=12*0.352777778,family="sans",hjust = 0)

VIP_ov_irrigation_Rhineland

VIP_ov_irrigation_Lake_Constance<-plot_pls(pls_result_ov_irrigation_Lake_Constance, input_table = Frost_Input, threshold = 1)+
  ggtitle("ov_irrigation Lake_Constance")+
  theme(plot.title = element_text(size = 8, face = "bold"),
        legend.position = "right",
        axis.title.x = element_text(size = 7))+
  scale_x_continuous(limits = c(0,15), expand = c(0, 0))
VIP_ov_irrigation_Lake_Constance

VIP_ov_irrigation_Lake_Constance<-plot_pls(pls_result_ov_irrigation_Lake_Constance, input_table = Frost_Input, threshold = 1)+
  #ggtitle("Lake Constance")+
  scale_x_continuous(limits = x_limit_VIP, expand = c(0, 0))+
  theme(plot.title = element_text(size = 15, face = "bold", hjust = 0),
        legend.position = c(0.8, 0.2),
        #axis.title.x = element_text(size = 7,margin = margin(t = 10)),
        axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15))+
  scale_y_discrete(labels=rev(c("frost risk",
                                "mean yield loss due to a frost night",
                                "mean apple yield",
                                "number of frost nights during\nblossom in a year with frost",
                                "mean protection efficiency\noverhead irrigation",
                                "risk of excessively windy weather",
                                "mean maintenance costs\noverhead irrigation",
                                "costs for water lines in the orchard",
                                "risk of starting the protection too late",
                                "costs for building the pond",
                                "funding rate for the\nirrigation infrastructure",
                                "apple price increase in frost years",
                                "risk of missing to use\nthe protection",
                                "risk of frozen water lines",
                                "discount rate",
                                "mean apple price")))+
  annotate("text",x=4, y= 1.5, label = "overhead\nirrigation", color = "black", size=12*0.352777778,family="sans",hjust = 0)

VIP_ov_irrigation_Lake_Constance


##below-canopy irrigation####

VIP_ut_irrigation_Rhineland<-plot_pls(pls_result_ut_irrigation_Rhineland, input_table = Frost_Input, threshold = 1)+
  ggtitle("ut_irrigation Rhineland")+
  theme(plot.title = element_text(size = 8, face = "bold"),
        legend.position = "right",
        axis.title.x = element_text(size = 7))+
  scale_x_continuous(limits = c(0,15), expand = c(0, 0))
VIP_ut_irrigation_Rhineland

VIP_ut_irrigation_Rhineland<-plot_pls(pls_result_ut_irrigation_Rhineland, input_table = Frost_Input, threshold = 1)+
  ggtitle("Rhineland")+
  scale_x_continuous(limits = x_limit_VIP, expand = c(0, 0))+
  theme(plot.title = element_text(size = 15, face = "bold", hjust = 0),
        legend.position = c(0.8, 0.2),
        #axis.title.x = element_text(size = 7,margin = margin(t = 10)),
        axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15),
        axis.text.y = element_text(lineheight=.7))+
  scale_y_discrete(labels=rev(c("mean yield loss due to a frost night",
                                "number of frost nights during\nblossom in a year with frost",
                                "frost risk",
                                "mean protection efficiency\nbelow-canopy irrigation",
                                "recommended water storage\ncapacity of the pond",
                                "costs for water lines in the orchard",
                                "costs for building the pond",
                                "water need below-canopy irrigation",
                                "mean apple yield",
                                "funding rate for the\nirrigation infrastructure",
                                "mean maintenance costs\nbelow-canopy irrigation",
                                "reduced protection efficiency\nin case of small problems",
                                "risk of excessively windy weather",
                                "percentage residual value\nof the pond after 18 years",
                                "well drilling costs",
                                "risk of technical failure\nbelow-canopy irrigation",
                                "share of frost events that\nare harmful to the flowers")))+
  annotate("text",x=4, y= 1.5, label = "below-canopy\nirrigation", color = "black", size=12*0.352777778,family="sans",hjust = 0)

VIP_ut_irrigation_Rhineland


VIP_ut_irrigation_Lake_Constance<-plot_pls(pls_result_ut_irrigation_Lake_Constance, input_table = Frost_Input, threshold = 1)+
  ggtitle("ut_irrigation Lake_Constance")+
  theme(plot.title = element_text(size = 8, face = "bold"),
        legend.position = "right",
        axis.title.x = element_text(size = 7))+
  scale_x_continuous(limits = c(0,15), expand = c(0, 0))
VIP_ut_irrigation_Lake_Constance

VIP_ut_irrigation_Lake_Constance<-plot_pls(pls_result_ut_irrigation_Lake_Constance, input_table = Frost_Input, threshold = 1)+
  ggtitle("Lake Constance")+
  scale_x_continuous(limits = x_limit_VIP, expand = c(0, 0))+
  theme(plot.title = element_text(size = 15, face = "bold", hjust = 0),
        legend.position = c(0.8, 0.2),
        #axis.title.x = element_text(size = 7,margin = margin(t = 10)),
        axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15))+
  scale_y_discrete(labels=rev(c("frost risk",
                                "mean yield loss due to a frost night",
                                "mean protection efficiency\nbelow-canopy irrigation",
                                "number of frost nights during\nblossom in a year with frost",
                                "mean apple yield",
                                "costs for water lines in the orchard",
                                "recommended water storage\ncapacity of the pond",
                                "funding rate for the\nirrigation infrastructure",
                                "reduced protection efficiency\nin case of small problems",
                                "water need below-canopy irrigation",
                                "costs for building the pond",
                                "risk of excessively windy weather",
                                "mean maintenance costs\nbelow-canopy irrigation",
                                "percentage residual value\nof the pond after 18 years",
                                "well drilling costs",
                                "apple price increase in frost years")))+
  annotate("text",x=4, y= 1.5, label = "below-canopy \nirrigation", color = "black", size=12*0.352777778,family="sans",hjust = 0)

VIP_ut_irrigation_Lake_Constance


##pellet heaters####

VIP_heaters_Rhineland<-plot_pls(pls_result_heaters_Rhineland, input_table = Frost_Input, threshold = 1)+
  ggtitle("Pellet heaters Rhineland")+
  theme(plot.title = element_text(size = 8, face = "bold"),
        legend.position = "right",
        axis.title.x = element_text(size = 7))+
  scale_x_continuous(limits = c(0,15), expand = c(0, 0))
VIP_heaters_Rhineland

VIP_heaters_Rhineland<-plot_pls(pls_result_heaters_Rhineland, input_table = Frost_Input_Rhineland, threshold = 1)+
  ggtitle("Rhineland")+
  scale_x_continuous(limits = x_limit_VIP, expand = c(0, 0))+
  theme(plot.title = element_text(size = 15, face = "bold", hjust = 0),
        legend.position = c(0.8, 0.2),
        #axis.title.x = element_text(size = 7,margin = margin(t = 10)),
        axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15))+
  scale_y_discrete(labels=rev(c("number of heaters needed per ha",
                                "risk of preparing the orchard for frost\nbut no frost occurs",
                                "mean transport costs from\nfarm to orchard",
                                "discount rate",
                                "mean yield loss due to a frost night",
                                "mean protection efficiency\npellet heaters",
                                "mean storage costs per pellet heater",
                                "risk ineffective protection\n pellet heater")))+
  annotate("text",x=4, y= 1.5, label = "pellet\nheaters", color = "black", size=12*0.352777778,family="sans",hjust = 0)

VIP_heaters_Rhineland

VIP_heaters_Lake_Constance<-plot_pls(pls_result_heaters_Lake_Constance, input_table = Frost_Input, threshold = 1)+
  ggtitle("heaters Lake_Constance")+
  theme(plot.title = element_text(size = 8, face = "bold"),
        legend.position = "right",
        axis.title.x = element_text(size = 7))+
  scale_x_continuous(limits = c(0,15), expand = c(0, 0))
VIP_heaters_Lake_Constance

VIP_heaters_Lake_Constance<-plot_pls(pls_result_heaters_Lake_Constance, input_table = Frost_Input_Lake_Constance, threshold = 1)+
  ggtitle("Lake Constance")+
  scale_x_continuous(limits = x_limit_VIP, expand = c(0, 0))+
  theme(plot.title = element_text(size = 15, face = "bold", hjust = 0),
        legend.position = c(0.8, 0.2),
        #axis.title.x = element_text(size = 7,margin = margin(t = 10)),
        axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15))+
  scale_y_discrete(labels=rev(c("number of heaters needed per ha",
                                "risk of preparing the orchard for frost\nbut no frost occurs",
                                "mean transport costs from\nfarm to orchard",
                                "discount rate",
                                "mean protection efficiency pellet heaters",
                                "mean yield loss due to a frost night",
                                "frost risk",
                                "number of frost nights during\nblossom in a year with frost",
                                "risk of missing to prepare\nbefore frost",
                                "risk ineffective protection\n pellet heaters",
                                "mean storage costs per pellet heater")))+
  annotate("text",x=4, y= 1.5, label = "pellet\nheaters", color = "black", size=12*0.352777778,family="sans",hjust = 0)

VIP_heaters_Lake_Constance

#combine all####
pVIPLake_Constance_Rhineland_supp1 <- list(VIP_ov_irrigation_Rhineland+remove_legend+remove_x,
                                           VIP_ov_irrigation_Lake_Constance+remove_x+remove_legend,
                                           VIP_ut_irrigation_Rhineland+remove_legend+remove_x,
                                           VIP_ut_irrigation_Lake_Constance+remove_x+remove_legend,
                                           VIP_stationary_windmachine_Rhineland+remove_legend+remove_x,
                                           VIP_stationary_windmachine_Lake_Constance+remove_x+remove_legend,
                                           VIP_mobile_windmachine_Rhineland+remove_legend+remove_x_only_title,
                                           VIP_mobile_windmachine_Lake_Constance+remove_x_only_title)

pVIPLake_Constance_Rhineland_supp2 <- list(VIP_candles_Rhineland+remove_x+remove_legend,
                                           VIP_candles_Lake_Constance+remove_legend+remove_x,
                                           VIP_heaters_Rhineland+remove_legend+remove_x,
                                           VIP_heaters_Lake_Constance+remove_x+remove_legend,
                                           VIP_frostbuster_Rhineland+remove_legend+remove_x,
                                           VIP_frostbuster_Lake_Constance+remove_x+remove_legend,
                                           VIP_frostguard_Rhineland+remove_legend+remove_x_only_title,
                                           VIP_frostguard_Lake_Constance+remove_x_only_title)

wrap_plots(pVIPLake_Constance_Rhineland_supp1, nrow = 4, ncol = 2) +
  plot_layout(guides = "keep")

wrap_plots(pVIPLake_Constance_Rhineland_supp2, nrow = 4, ncol = 2) +
  plot_layout(guides = "keep")

plot_VIP_Lake_ConstanceRhineland_supp1<-wrap_plots(pVIPLake_Constance_Rhineland_supp1, nrow = 4, ncol = 2) +
  plot_layout(guides = "keep")+
  labs(tag = "Variable importance in projection (VIP)")+
  theme(plot.tag = element_text(size = 15),
        plot.tag.position = c(0,-0.05),
        plot.margin = margin(0.2,0,0.8,0, "cm"))

plot_VIP_Lake_ConstanceRhineland_supp2<-wrap_plots(pVIPLake_Constance_Rhineland_supp2, nrow = 4, ncol = 2) +
  plot_layout(guides = "keep")+
  labs(tag = "Variable importance in projection (VIP)")+
  theme(plot.tag = element_text(size = 15),
        plot.tag.position = c(0,-0.05),
        plot.margin = margin(0.2,0,0.8,0, "cm"))

VIP_plot_y_axis_name <- ggplot(data.frame(l = "Input variable", x = 1, y = 1)) +
  geom_text(aes(x, y, label = l), angle = 90, size=15*0.352777778) + 
  theme_void() +
  coord_cartesian(clip = "off")

VIP_plot_y_axis_name+plot_VIP_Lake_ConstanceRhineland_supp1+plot_layout(widths = c(1,25))
VIP_plot_y_axis_name+plot_VIP_Lake_ConstanceRhineland_supp2+plot_layout(widths = c(1,25))

#plot for the manuscript####
VIP_results_ov_irrigation_Rhineland<-VIP_table(pls_result_ov_irrigation_Rhineland, input_table = Frost_Input_Rhineland,threshold = 0)
VIP_results_stationary_windmachine_Rhineland<-VIP_table(pls_result_stationary_windmachine_Rhineland, input_table = Frost_Input_Rhineland,threshold = 0)
VIP_results_ov_irrigation_Lake_Constance<-VIP_table(pls_result_ov_irrigation_Lake_Constance, input_table = Frost_Input_Lake_Constance,threshold = 0)
VIP_results_stationary_windmachine_Lake_Constance<-VIP_table(pls_result_stationary_windmachine_Lake_Constance, input_table = Frost_Input_Lake_Constance,threshold = 0)

max_VIP<-max(max(VIP_results_ov_irrigation_Rhineland$VIP),
             max(VIP_results_ov_irrigation_Lake_Constance$VIP),
             max(VIP_results_stationary_windmachine_Rhineland$VIP),
             max(VIP_results_stationary_windmachine_Lake_Constance$VIP))

x_limit_VIP<-c(0, ceiling(max_VIP)+0.5)

VIP_ov_irrigation_Rhineland<-plot_pls(pls_result_ov_irrigation_Rhineland, input_table = Frost_Input_Rhineland, threshold = 1,
                                      pos_color = "#ffeac2",
                                      neg_color = "darkred")+
  ggtitle("Rhineland")+
  scale_x_continuous(limits = x_limit_VIP, expand = c(0, 0))+
  theme(plot.title = element_text(size = 15, face = "bold", hjust = 0),
        legend.position = c(0.8, 0.2),
        #axis.title.x = element_text(size = 7,margin = margin(t = 10)),
        axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15))+
  scale_y_discrete(labels=rev(c("mean yield loss due to a frost night",
                                "number of frost nights during\nblossom in a year with frost",
                                "frost risk",
                                "mean apple yield",
                                "mean protection efficiency\noverhead irrigation",
                                "mean maintenance costs\noverhead irrigation",
                                "risk of excessively windy weather",
                                "costs for water lines in the orchard",
                                "recommended water storage\ncapacity of the pond",
                                "costs for building the pond",
                                "funding rate for the\nirrigation infrastructure",
                                "risk of starting the protection too late",
                                "share of frost events that\nare harmful to the flowers",
                                "establishment costs per ha",
                                "percentage residual value\nof the pond after 18 years",
                                "apple price increase in frost years",
                                "risk of frozen water lines",
                                "risk of missing to use\nthe protection")))+
  annotate("text",x=4, y= 1.5, label = "overhead\nirrigation", color = "black", size=12*0.352777778,family="sans",hjust = 0)

VIP_ov_irrigation_Rhineland

VIP_ov_irrigation_Lake_Constance<-plot_pls(pls_result_ov_irrigation_Lake_Constance, input_table = Frost_Input, threshold = 1,
                                           pos_color = "#FFB771",
                                           neg_color = "darkred")+
  scale_x_continuous(limits = x_limit_VIP, expand = c(0, 0))+
  ggtitle("Lake Constance")+
  theme(plot.title = element_text(size = 15, face = "bold", hjust = 0),
        legend.position = c(0.8, 0.2),
        #axis.title.x = element_text(size = 7,margin = margin(t = 10)),
        axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15))+
  scale_y_discrete(labels=rev(c("frost risk",
                                "mean yield loss due to a frost night",
                                "mean apple yield",
                                "number of frost nights during\nblossom in a year with frost",
                                "mean protection efficiency\noverhead irrigation",
                                "risk of excessively windy weather",
                                "mean maintenance costs\noverhead irrigation",
                                "costs for water lines in the orchard",
                                "risk of starting the protection too late",
                                "costs for building the pond",
                                "funding rate for the\nirrigation infrastructure",
                                "apple price increase in frost years",
                                "risk of missing to use\nthe protection",
                                "risk of frozen water lines",
                                "discount rate",
                                "mean apple price")))+
  annotate("text",x=4, y= 1.5, label = "overhead\nirrigation", color = "black", size=12*0.352777778,family="sans",hjust = 0)

VIP_ov_irrigation_Lake_Constance

VIP_stationary_windmachine_Rhineland<-plot_pls(pls_result_stationary_windmachine_Rhineland, input_table = Frost_Input, threshold = 1,
                                               pos_color = "#60A917",
                                               neg_color = "#A50026")+
  #ggtitle("Rhineland")+
  scale_x_continuous(limits = x_limit_VIP, expand = c(0, 0))+
  theme(plot.title = element_text(size = 15, face = "bold", hjust = 0),
        legend.position = c(0.8, 0.2),
        #axis.title.x = element_text(size = 7,margin = margin(t = 10)),
        axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15))+
  scale_y_discrete(labels=rev(c("mean yield loss due to a frost night",
                                "mean protection efficiency wind machine",
                                "number of frost nights during\nblossom in a year with frost",
                                "frost risk",
                                "mean apple yield",
                                "discount rate",
                                "area that can be protected by\none stationary wind machine ",
                                "risk of ineffective protection\nstationary wind machine",
                                "installation costs\nstationary wind machine",
                                "risk of damage due to use of wind machines\nin unfavourable weather conditions ",
                                "share of frost events that\nare harmful to the flowers",
                                "risk of starting the protection too late",
                                "costs for the building permit",
                                "price stationary wind machine")))+
  annotate("text",x=4, y= 1.5, label = "stationary \nwind machine", color = "black", size=12*0.352777778,family="sans",hjust = 0)

VIP_stationary_windmachine_Rhineland

VIP_stationary_windmachine_Lake_Constance<-plot_pls(pls_result_stationary_windmachine_Lake_Constance, input_table = Frost_Input, threshold = 1)+
  #ggtitle("Lake Constance")+
  scale_x_continuous(limits = x_limit_VIP, expand = c(0, 0))+
  theme(plot.title = element_text(size = 15, face = "bold", hjust = 0),
        legend.position = c(0.7, 0.5),
        #axis.title.x = element_text(size = 7,margin = margin(t = 10)),
        axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15),
        legend.text = element_text(size = 10),
        legend.title = element_text(size = 10))+
  scale_y_discrete(labels=rev(c("frost risk",
                                "mean protection efficiency wind machine",
                                "mean yield loss due to a frost night",
                                "number of frost nights during\nblossom in a year with frost",
                                "mean apple yield",
                                "risk of ineffective protection\nstationary wind machine",
                                "discount rate",
                                "area protected by one wind machine",
                                "risk of starting the protection too late",
                                "installation costs\nstationary wind machine",
                                "risk of missing to use\nthe protection")))+
  annotate("text",x=4, y= 1.5, label = "stationary \nwind machine", color = "black", size=12*0.352777778,family="sans",hjust = 0)

VIP_stationary_windmachine_Lake_Constance


pVIPLake_Constance_Rhineland_stat_wind_and_no_prot <- list(VIP_ov_irrigation_Rhineland+remove_x+remove_legend,
                                                           VIP_ov_irrigation_Lake_Constance+remove_legend+remove_x,
                                                           VIP_stationary_windmachine_Rhineland+remove_legend+remove_x_only_title,
                                                           VIP_stationary_windmachine_Lake_Constance+remove_x_only_title)
wrap_plots(pVIPLake_Constance_Rhineland_stat_wind_and_no_prot, nrow = 2, ncol = 2) +
  plot_layout(guides = "keep")

plot_VIP_Lake_ConstanceRhineland<-wrap_plots(pVIPLake_Constance_Rhineland_stat_wind_and_no_prot, nrow = 2, ncol = 2) +
  plot_layout(guides = "keep")+
  labs(tag = "Variable importance in projection (VIP)")+
  theme(plot.tag = element_text(size = 15),
        plot.tag.position = c(0,-0.05),
        plot.margin = margin(0.2,0,0.8,0, "cm"))

VIP_plot_y_axis_name <- ggplot(data.frame(l = "Input variable", x = 1, y = 1)) +
  geom_text(aes(x, y, label = l), angle = 90, size=15*0.352777778) + 
  theme_void() +
  coord_cartesian(clip = "off")

VIP_plot_y_axis_name+plot_VIP_Lake_ConstanceRhineland+plot_layout(widths = c(1,25))

png("figures_manuscript/VIP_Lake_Constance_Rhineland_stat_wind_and_no_prot_colors.png", pointsize=8, width=6400, height=7400, res=600)
VIP_plot_y_axis_name+plot_VIP_Lake_ConstanceRhineland+plot_layout(widths = c(1,25))
dev.off()


png("figures_manuscript/VIP_Lake_Constance_Rhineland_stat_wind_and_no_prot.png", pointsize=8, width=6400, height=7400, res=600)
VIP_plot_y_axis_name+plot_VIP_Lake_ConstanceRhineland+plot_layout(widths = c(1,25))
dev.off()

#plot for supplementary####
pVIPLake_Constance_Rhineland_supp_decision_1 <- list(#VIP_ov_irrigation_Rhineland+remove_legend+remove_x,
  #VIP_ov_irrigation_Lake_Constance+remove_x+remove_legend,
  VIP_ut_irrigation_Rhineland+remove_legend+remove_x,
  VIP_ut_irrigation_Lake_Constance+remove_x+remove_legend,
  VIP_candles_Rhineland+remove_x+remove_legend,
  VIP_candles_Lake_Constance+remove_legend+remove_x,
  #VIP_stationary_windmachine_Rhineland+remove_legend+remove_x,
  #VIP_stationary_windmachine_Lake_Constance+remove_x+remove_legend,
  VIP_mobile_windmachine_Rhineland+remove_legend+remove_x_only_title,
  VIP_mobile_windmachine_Lake_Constance+remove_x_only_title)

pVIPLake_Constance_Rhineland_supp_decision_2 <- list(
  VIP_heaters_Rhineland+remove_legend+remove_x,
  VIP_heaters_Lake_Constance+remove_x+remove_legend,
  VIP_frostbuster_Rhineland+remove_legend+remove_x,
  VIP_frostbuster_Lake_Constance+remove_x+remove_legend,
  VIP_frostguard_Rhineland+remove_legend+remove_x_only_title,
  VIP_frostguard_Lake_Constance+remove_x_only_title)

wrap_plots(pVIPLake_Constance_Rhineland_supp_decision_1, nrow = 3, ncol = 2) +
  plot_layout(guides = "keep")

wrap_plots(pVIPLake_Constance_Rhineland_supp_decision_2, nrow = 3, ncol = 2) +
  plot_layout(guides = "keep")

plot_VIP_Lake_ConstanceRhineland_supp_decision_1<-wrap_plots(pVIPLake_Constance_Rhineland_supp_decision_1, nrow = 3, ncol = 2) +
  plot_layout(guides = "keep")+
  labs(tag = "Variable importance in projection (VIP)")+
  theme(plot.tag = element_text(size = 15),
        plot.tag.position = c(0,-0.05),
        plot.margin = margin(0.2,0,0.8,0, "cm"))

plot_VIP_Lake_ConstanceRhineland_supp_decision_2<-wrap_plots(pVIPLake_Constance_Rhineland_supp_decision_2, nrow = 3, ncol = 2) +
  plot_layout(guides = "keep")+
  labs(tag = "Variable importance in projection (VIP)")+
  theme(plot.tag = element_text(size = 15),
        plot.tag.position = c(0,-0.05),
        plot.margin = margin(0.2,0,0.8,0, "cm"))

VIP_plot_y_axis_name <- ggplot(data.frame(l = "Input variable", x = 1, y = 1)) +
  geom_text(aes(x, y, label = l), angle = 90, size=15*0.352777778) + 
  theme_void() +
  coord_cartesian(clip = "off")

VIP_plot_y_axis_name+plot_VIP_Lake_ConstanceRhineland_supp_decision_1+plot_layout(widths = c(1,25))
VIP_plot_y_axis_name+plot_VIP_Lake_ConstanceRhineland_supp_decision_2+plot_layout(widths = c(1,25))

png("figures_manuscript/VIP_decision_Lake_Constance_Rhineland_supp1.png", pointsize=8, width=6400, height=10000, res=600)
VIP_plot_y_axis_name+plot_VIP_Lake_ConstanceRhineland_supp_decision_1+plot_layout(widths = c(1,25))
dev.off()

png("figures_manuscript/VIP_decision_Lake_Constance_Rhineland_supp2.png", pointsize=8, width=6400, height=10000, res=600)
VIP_plot_y_axis_name+plot_VIP_Lake_ConstanceRhineland_supp_decision_2+plot_layout(widths = c(1,25))
dev.off()




