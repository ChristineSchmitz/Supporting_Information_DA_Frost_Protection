#Preparations for plotting
#Apple manuskript plots and statistics

#Load in required libraries####
library(decisionSupport)
library(tidyverse)
library(patchwork)

#load saved data
frost_protection_mc_simulation_scenario_Rhineland_100000<-readRDS("results/Monte_Carlo_apple_scenario_Rhineland_100000.RDS")
frost_protection_mc_simulation_scenario_Lake_Constance_100000<-readRDS("results/Monte_Carlo_apple_scenario_Lake_Constance_100000.RDS")

#prepare data for plotting
results_data_Rhineland<-frost_protection_mc_simulation_scenario_Rhineland_100000$y
results_data_Lake_Constance<-frost_protection_mc_simulation_scenario_Lake_Constance_100000$y

#Plotting setup####
#General setup####

options(scipen=100000)
remove_x <- theme(
  axis.text.x = element_blank(),
  #axis.ticks.x = element_blank(),
  axis.title.x = element_blank()
)

remove_title<-theme(strip.text.x = element_blank())

remove_legend<-theme(legend.position = "none")

remove_y <- theme(
  axis.text.y = element_blank(),
  #axis.ticks.y = element_blank(),
  axis.title.y = element_blank()
)
remove_y_only_title<-theme(axis.title.y = element_blank())
remove_x_only_title<-theme(axis.title.x = element_blank())

#Number of harmful frost events####

frost_night_data_Rhineland <- results_data_Rhineland %>% dplyr::select(dplyr::starts_with("n_harmful_frost_nights_per_year"))
frost_night_data_Rhineland <- frost_night_data_Rhineland %>%  rowwise() %>%
  mutate(frost_years =18-sum(c_across(n_harmful_frost_nights_per_year1:n_harmful_frost_nights_per_year18)==0))

frost_night_data_Lake_Constance <- results_data_Lake_Constance %>% dplyr::select(dplyr::starts_with("n_harmful_frost_nights_per_year"))
frost_night_data_Lake_Constance <- frost_night_data_Lake_Constance %>%  rowwise() %>%
  mutate(frost_years =18-sum(c_across(n_harmful_frost_nights_per_year1:n_harmful_frost_nights_per_year18)==0))


frost_year_data_all<-data.frame(frost_years_Rhineland=frost_night_data_Rhineland$frost_years,
                                frost_years_Lake_Constance=frost_night_data_Lake_Constance$frost_years)
frost_year_data_all <- tidyr::pivot_longer(frost_year_data_all, tidyselect::all_of(c("frost_years_Rhineland","frost_years_Lake_Constance")))

median(frost_night_data_Lake_Constance$frost_years)
median(frost_night_data_Rhineland$frost_years)

#in %
Rhineland_frost_year_percentage<-frost_night_data_Rhineland%>%
  group_by(frost_years)%>%
  summarise(Frost_Frequecy=length(frost_years), Frost_percentage=length(frost_years)/1000)
LakeConstance_frost_year_percentage<-frost_night_data_Lake_Constance%>%
  group_by(frost_years)%>%
  summarise(Frost_Frequecy=length(frost_years), Frost_percentage=length(frost_years)/1000)

png("figures_manuscript/Frost_scenarios_Rhineland_Lake_Constance_percentage.png", pointsize=10, width=6000, height=4000, res=600)
ggplot()+ 
  geom_bar(data=Rhineland_frost_year_percentage, aes(x=frost_years, y= Frost_percentage, fill="#3fbf79"),alpha=0.5, stat = "identity")+
  geom_bar(data=LakeConstance_frost_year_percentage, aes(x=frost_years, y= Frost_percentage, fill="#ffa600"),alpha=0.5, stat = "identity")+
  theme(  panel.border = element_blank(),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          axis.line = element_line(colour = "black"),
          panel.background =element_blank(),
          legend.position = c(0.8,0.9),
          text = element_text(family = "sans", size = 15),
          axis.text = element_text(colour = "black"))+
  xlab("Number of harmful spring frost years within 18 years of orchard lifetime")+
  ylab("Frequency in the simulation [%]")+
  guides(fill=guide_legend(title="Frost scenario", override.aes = list(alpha = 0.3)))+
  xlim(-0.5,18.5)+
  scale_fill_identity(name = "Frost scenario",
                      breaks = c("#3fbf79", "#ffa600"),
                      labels = c("Rhineland", "Lake Constance"),guide = "legend")
dev.off()


#NPV advantage####
png("figures_manuscript/NPV_advantage_violin_scenarios_Rhineland_Lake_Constance_5_95.png", pointsize=10, width=3600, height=2400, res=600)
scenario_plot_Rhineland_Lake_Constance_violin_5_95(vars = c("advantage_ov_irrigation",
                                                            "advantage_stationary_windmachine",
                                                            "advantage_heaters",
                                                            "advantage_candles",
                                                            "advantage_ut_irrigation",
                                                            "advantage_frostbuster",
                                                            "advantage_frostguard",
                                                            "advantage_mobile_windmachine"),
                                                   x_axis_name = "Net present value (NPV) advantage compared to no protection [€/ha]",
                                                   y_axis_name = "Decision option")+
  scale_y_discrete(labels=c("advantage_ov_irrigation"="Overhead\nirrigation",
                            "advantage_stationary_windmachine"="Stationary\nwind machine",
                            "advantage_heaters"="Pellet\nheaters",
                            "advantage_candles"="Candles",
                            "advantage_ut_irrigation"="Below-canopy\nirrigation",
                            "advantage_frostbuster"="Tractor-mounted\ngas heater",
                            "advantage_frostguard"="Portable gas\nheater",
                            "advantage_mobile_windmachine"="Mobile\nwind machine"))+
  theme(legend.position = c(0.2, 0.85))+
  geom_vline(xintercept = 0, col="red")+
  remove_y_only_title
dev.off()


#yield advantage####
png("figures_manuscript/yield_advantage_violin_scenarios_Rhineland_Lake_Constance_5_95.png", pointsize=10, width=3600, height=2400, res=600)
scenario_plot_Rhineland_Lake_Constance_violin_5_95_v2(vars = c("yield_advantage_ov_irrigation",
                                                               "yield_advantage_stationary_windmachine",
                                                               "yield_advantage_heaters",
                                                               "yield_advantage_candles",
                                                               "yield_advantage_ut_irrigation",
                                                               "yield_advantage_frostbuster",
                                                               "yield_advantage_frostguard",
                                                               "yield_advantage_mobile_windmachine"),
                                                      x_axis_name = " Yield [kg/ha] change due to frost protection measures\nover 18 years of orchard lifetime",
                                                      y_axis_name = "Decision option")+
  scale_y_discrete(labels=c("yield_advantage_ov_irrigation"="Overhead\nirrigation",
                            "yield_advantage_stationary_windmachine"="Stationary\nwind machine",
                            "yield_advantage_heaters"="Pellet\nheaters",
                            "yield_advantage_candles"="Candles",
                            "yield_advantage_ut_irrigation"="Below-canopy\nirrigation",
                            "yield_advantage_frostbuster"="Tractor-mounted\ngas heater",
                            "yield_advantage_frostguard"="Portable gas\nheater",
                            "yield_advantage_mobile_windmachine"="Mobile\nwind machine"))+
  theme(legend.position = c(0.85, 0.15))+
  geom_vline(xintercept = 0, col="red")+
  remove_y_only_title
dev.off()

#cost per kg whole time####
png("figures_manuscript/Cost_per_kg_whole_time_boxplot_scenarios_Rhineland_Lake_Constance_5_95.png", pointsize=8, width=3600, height=2400, res=600)

scenario_plot_Rhineland_Lake_Constance_violin_5_95(vars = c("cost_per_kg_no_protection_whole_time",
                                                            "cost_per_kg_ov_irrigation_whole_time",
                                                            "cost_per_kg_stationary_windmachine_whole_time",
                                                            "cost_per_kg_heaters_whole_time",
                                                            "cost_per_kg_candles_whole_time",
                                                            "cost_per_kg_ut_irrigation_whole_time",
                                                            "cost_per_kg_frostbuster_whole_time",
                                                            "cost_per_kg_frostguard_whole_time",
                                                            "cost_per_kg_mobile_windmachine_whole_time"),
                                                   x_axis_name = "Cost per kg apple [€/kg] over the whole orchard lifetime",
                                                   y_axis_name = "Decision option")+
  scale_y_discrete(labels=c("cost_per_kg_no_protection_whole_time"="No protection",
                            "cost_per_kg_ov_irrigation_whole_time"="Overhead\nirrigation",
                            "cost_per_kg_stationary_windmachine_whole_time"="Stationary\nwind machine",
                            "cost_per_kg_heaters_whole_time"="Pellet\nheaters",
                            "cost_per_kg_candles_whole_time"="Candles",
                            "cost_per_kg_ut_irrigation_whole_time"="Below-canopy\nirrigation",
                            "cost_per_kg_frostbuster_whole_time"="Tractor-mounted\ngas heater",
                            "cost_per_kg_frostguard_whole_time"="Portable gas\nheater",
                            "cost_per_kg_mobile_windmachine_whole_time"="Mobile\nwind machine"))+
  theme(legend.position = c(0.85,0.15))+
  coord_cartesian(xlim = c(0,1.5))+
  remove_y_only_title
dev.off()

#Cashflow ####
#no prot und stat. windmaschine Rhineland/Lake_Constance
y_lim_cashflow<-c(floor(min(quantile(frost_protection_mc_simulation_scenario_Lake_Constance_100000$y$cashflow_no_protection1,0.05),
                            quantile(frost_protection_mc_simulation_scenario_Rhineland_100000$y$cashflow_no_protection1,0.05),
                            quantile(frost_protection_mc_simulation_scenario_Lake_Constance_100000$y$cashflow_stationary_windmachine1,0.05),
                            quantile(frost_protection_mc_simulation_scenario_Rhineland_100000$y$cashflow_stationary_windmachine1,0.05))),
                  ceiling(max(quantile(frost_protection_mc_simulation_scenario_Lake_Constance_100000$y$cashflow_no_protection18,0.95),
                              quantile(frost_protection_mc_simulation_scenario_Rhineland_100000$y$cashflow_no_protection18,0.95),
                              quantile(frost_protection_mc_simulation_scenario_Lake_Constance_100000$y$cashflow_stationary_windmachine18,0.95),
                              quantile(frost_protection_mc_simulation_scenario_Rhineland_100000$y$cashflow_stationary_windmachine18,0.95))))

max(frost_protection_mc_simulation_scenario_Lake_Constance_100000$y$cashflow_no_protection18)
max(frost_protection_mc_simulation_scenario_Lake_Constance_100000$y$cashflow_no_protection18)
max(frost_protection_mc_simulation_scenario_Lake_Constance_100000$y$cashflow_no_protection18)
Cashflow_no_protection_Lake_Constance<-plot_cashflow(mcSimulation_object = frost_protection_mc_simulation_scenario_Lake_Constance_100000,
                                                     cashflow_var_name =c("cashflow_no_protection") ,
                                                     x_axis_name = "Years with intervention",
                                                     y_axis_name = "Annual cash flow [€/ha]",
                                                     facet_labels = c("Lake Constance"))+
  annotate("text", x=2, y= 25000, label = "No protection", color = "black", size=15*0.352777778,family="sans",hjust = 0)+
  theme(legend.position = c(0.8,0.2),
        axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15),
        plot.title = element_text(size = 15, hjust = 0.5))+
  ylim(y_lim_cashflow)+
  scale_fill_manual(values=c("5 to 95" = "#ffeac2", "25 to 75" = "#ffa600"))#+
#scale_color_manual(values = "#ffa600")

Cashflow_no_protection_Rhineland<-plot_cashflow(mcSimulation_object = frost_protection_mc_simulation_scenario_Rhineland_100000,
                                                cashflow_var_name =c("cashflow_no_protection") ,
                                                x_axis_name = "Years with intervention",
                                                y_axis_name = "Annual cash flow [€/ha]",
                                                facet_labels = c("Rhineland"))+
  annotate("text",x=2, y= 25000, label = "No protection", color = "black", size=15*0.352777778,family="sans",hjust = 0)+
  theme(legend.position = c(0.8,0.2),
        axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15),
        plot.title = element_text(size = 15, hjust = 0.5))+
  ylim(y_lim_cashflow)+
  scale_fill_manual(values=c("5 to 95" = "#bee9d2", "25 to 75" = "#3fbf79"))#+
#scale_color_manual(values = "#3fbf79")



Cashflow_stationary_windmachine_Lake_Constance<-plot_cashflow(mcSimulation_object = frost_protection_mc_simulation_scenario_Lake_Constance_100000,
                                                              cashflow_var_name =c("cashflow_stationary_windmachine") ,
                                                              x_axis_name = "Years with intervention",
                                                              y_axis_name = "Annual cash flow [€/ha]",
                                                              facet_labels = c("Lake Constance"))+
  annotate("text", x=2, y= 25000, label = "Stationary wind machine", color = "black", size=15*0.352777778,family="sans",hjust = 0)+
  theme(legend.position = c(0.8,0.2),
        axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15),
        plot.title = element_text(size = 15, hjust = 0.5))+
  ylim(y_lim_cashflow)+
  scale_fill_manual(values=c("5 to 95" = "#ffeac2", "25 to 75" = "#ffa600"))#+
#scale_color_manual(values = "#ffa600")

Cashflow_stationary_windmachine_Rhineland<-plot_cashflow(mcSimulation_object = frost_protection_mc_simulation_scenario_Rhineland_100000,
                                                         cashflow_var_name =c("cashflow_stationary_windmachine") ,
                                                         x_axis_name = "Years with intervention",
                                                         y_axis_name = "Annual cash flow [€/ha]",
                                                         facet_labels = c("Rhineland"))+
  annotate("text",x=2, y= 25000, label = "Stationary wind machine", color = "black", size=15*0.352777778,family="sans",hjust = 0)+
  theme(legend.position = c(0.8,0.2),
        axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15),
        plot.title = element_text(size = 15, hjust = 0.5))+
  ylim(y_lim_cashflow)+
  scale_fill_manual(values=c("5 to 95" = "#bee9d2", "25 to 75" = "#3fbf79"))#+
#scale_color_manual(values = "#3fbf79"

Cashflow_combined <- list(Cashflow_no_protection_Rhineland+remove_x+remove_legend+remove_y_only_title,
                          Cashflow_no_protection_Lake_Constance+remove_x+remove_y+remove_legend,
                          Cashflow_stationary_windmachine_Rhineland+
                            #remove_legend+
                            remove_x_only_title+remove_y_only_title+remove_title,
                          Cashflow_stationary_windmachine_Lake_Constance+remove_y+remove_x_only_title+remove_title)
wrap_plots(Cashflow_combined, nrow = 2, ncol = 2) +
  plot_layout(guides = "keep")


plot_cashflow<-wrap_plots(Cashflow_combined, nrow = 2, ncol = 2) +
  plot_layout(guides = "keep")+
  labs(tag = "Years with intervention")+
  theme(plot.tag = element_text(size = 15),
        plot.tag.position = c(0,-0.05),
        plot.margin = margin(0.2,0,0.8,0, "cm"))

plot_y_axis_name <- ggplot(data.frame(l = "Annual cash flow [€/ha]", x = 1, y = 1)) +
  geom_text(aes(x, y, label = l), angle = 90, size=15*0.352777778) + 
  theme_void() +
  coord_cartesian(clip = "off")

plot_y_axis_name+plot_cashflow+plot_layout(widths = c(1,25))

png("figures_manuscript/Cashflow_Lake_Constance_Rhineland_stat_wind_and_no_prot_color_2.png", pointsize=8, width=6000, height=4000, res=600)
plot_y_axis_name+plot_cashflow+plot_layout(widths = c(1,25))
dev.off()


#NPV supplementary####
png("Supporting_Information_NPV.png", pointsize=10, width=3600, height=2400, res=600)

scenario_plot_Rhineland_Lake_Constance_violin_5_95(vars = c("result_no_protection",
                                                            "result_ov_irrigation",
                                                            "result_stationary_windmachine",
                                                            "result_heaters",
                                                            "result_candles",
                                                            "result_ut_irrigation",
                                                            "result_frostbuster",
                                                            "result_frostguard",
                                                            "result_mobile_windmachine"),
                                                   x_axis_name = "Net present value (NPV) [€/ha]",
                                                   y_axis_name = "Decision option")+
  scale_y_discrete(labels=c("result_no_protection"= "No\nprotection",
                            "result_ov_irrigation"="Overhead\nirrigation",
                            "result_stationary_windmachine"="Stationary\nwind machine",
                            "result_heaters"="Pellet\nheaters",
                            "result_candles"="Candles",
                            "result_ut_irrigation"="Below-canopy\nirrigation",
                            "result_frostbuster"="Trailed gas\nheater",
                            "result_frostguard"="Portable gas\nheater",
                            "result_mobile_windmachine"="Mobile\nwind machine"))+
  theme(legend.position = c(0.2, 0.85))+
  remove_y_only_title
dev.off()

#Cashflow supplementary####
#Rhineland
png("Supporting_information_Cashflow_Rhineland.png", pointsize=10, width=6000, height=4000, res=600)

plot_cashflow(mcSimulation_object = frost_protection_mc_simulation_scenario_Rhineland_100000,
              cashflow_var_name =c("cashflow_no_protection",
                                   "cashflow_frostbuster",
                                   "cashflow_ov_irrigation",
                                   "cashflow_stationary_windmachine",
                                   "cashflow_heaters",
                                   "cashflow_candles",
                                   "cashflow_ut_irrigation",
                                   "cashflow_frostguard",
                                   "cashflow_mobile_windmachine") ,
              x_axis_name = "Years with intervention",
              y_axis_name = "Annual cash flow [€/ha]",
              facet_labels = c("cashflow_no_protection"= "No protection",
                               "cashflow_frostbuster" ="Trailed gas heater",
                               "cashflow_ov_irrigation"="Overhead irrigation",
                               "cashflow_stationary_windmachine"="Stationary wind machine",
                               "cashflow_heaters"="Pellet heaters",
                               "cashflow_candles"="Candles",
                               "cashflow_ut_irrigation"="Below-canopy irrigation",
                               "cashflow_frostguard"="Portable gas heater",
                               "cashflow_mobile_windmachine"="Mobile wind machine"))+
  ggtitle("Scenario Rhineland")+
  theme(axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15),
        plot.title = element_text(size = 15, hjust = 0.5))+
  scale_fill_manual(values=c("5 to 95" = "#bee9d2", "25 to 75" = "#3fbf79"))
dev.off()

#Lake Constance
png("Supporting_information_Cashflow_Lake_Constance.png", pointsize=10, width=6000, height=4000, res=600)

plot_cashflow(mcSimulation_object = frost_protection_mc_simulation_scenario_Lake_Constance_100000,
              cashflow_var_name =c("cashflow_no_protection",
                                   "cashflow_frostbuster",
                                   "cashflow_ov_irrigation",
                                   "cashflow_stationary_windmachine",
                                   "cashflow_heaters",
                                   "cashflow_candles",
                                   "cashflow_ut_irrigation",
                                   "cashflow_frostguard",
                                   "cashflow_mobile_windmachine") ,
              x_axis_name = "Years with intervention",
              y_axis_name = "Annual cash flow [€/ha]",
              facet_labels = c("cashflow_no_protection"= "No protection",
                               "cashflow_frostbuster" ="Trailed gas heater",
                               "cashflow_ov_irrigation"="Overhead irrigation",
                               "cashflow_stationary_windmachine"="Stationary wind machine",
                               "cashflow_heaters"="Pellet heaters",
                               "cashflow_candles"="Candles",
                               "cashflow_ut_irrigation"="Below-canopy irrigation",
                               "cashflow_frostguard"="Portable gas heater",
                               "cashflow_mobile_windmachine"="Mobile wind machine"))+
  ggtitle("Scenario Lake Constance")+
  theme(axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15),
        plot.title = element_text(size = 15, hjust = 0.5))+
  scale_fill_manual(values=c("5 to 95" = "#ffeac2", "25 to 75" = "#ffa600"))
dev.off()

#Cost per kg apple (mature trees) supplementary####
png("Supporting_Information_cost_per_kg_mature.png", pointsize=10, width=3600, height=2400, res=600)

scenario_plot_Rhineland_Lake_Constance_violin_5_95(vars = c("cost_per_kg_no_protection_full_bearing",
                                                            "cost_per_kg_ov_irrigation_full_bearing",
                                                            "cost_per_kg_stationary_windmachine_full_bearing",
                                                            "cost_per_kg_heaters_full_bearing",
                                                            "cost_per_kg_candles_full_bearing",
                                                            "cost_per_kg_ut_irrigation_full_bearing",
                                                            "cost_per_kg_frostbuster_full_bearing",
                                                            "cost_per_kg_frostguard_full_bearing",
                                                            "cost_per_kg_mobile_windmachine_full_bearing"),
                                                   x_axis_name = "Cost per kg apple [€/kg] in mature orchards",
                                                   y_axis_name = "Decision option")+
  scale_y_discrete(labels=c("cost_per_kg_no_protection_full_bearing"="No protection",
                            "cost_per_kg_ov_irrigation_full_bearing"="Overhead irrigation",
                            "cost_per_kg_stationary_windmachine_full_bearing"="Stationary wind machine",
                            "cost_per_kg_heaters_full_bearing"="Pellet heaters",
                            "cost_per_kg_candles_full_bearing"="Candles",
                            "cost_per_kg_ut_irrigation_full_bearing"="Below-canopy irrigation",
                            "cost_per_kg_frostbuster_full_bearing"="Trailed gas heater",
                            "cost_per_kg_frostguard_full_bearing"="Portable gas heater",
                            "cost_per_kg_mobile_windmachine_full_bearing"="Mobile wind machine"))+
  theme(legend.position = c(0.8, 0.2))+
  remove_y_only_title+
  coord_cartesian(xlim = c(0,1.3))
dev.off()

#Initial investment in frost protection measures supplementary####
png("Supporting_Information_investment.png", pointsize=10, width=3600, height=2400, res=600)

scenario_plot_Rhineland_Lake_Constance_violin_5_95(vars = c("investment_ov_irrigation",
                                                            "investment_stationary_windmachine",
                                                            "investment_heaters",
                                                            "investment_candles",
                                                            "investment_ut_irrigation",
                                                            "investment_frostbuster",
                                                            "investment_frostguard",
                                                            "investment_mobile_windmachine"),
                                                   x_axis_name = "Initial investment in frost protection [€/ha]",
                                                   y_axis_name = "Decision option")+
  scale_y_discrete(labels=c("investment_ov_irrigation"="Overhead\nirrigation",
                            "investment_stationary_windmachine"="Stationary\nwind machine",
                            "investment_heaters"="Pellet\nheaters",
                            "investment_candles"="Candles",
                            "investment_ut_irrigation"="Below-canopy\nirrigation",
                            "investment_frostbuster"="Trailed gas\nheater",
                            "investment_frostguard"="Portable gas\nheater",
                            "investment_mobile_windmachine"="Mobile\nwind machine"))+
  theme(legend.position = c(0.2, 0.85))+
  remove_y_only_title
dev.off()

#Development of apple yield supplementary####

#Rhineland
png("Supporting_information_Yieldflow_Rhineland.png", pointsize=10, width=6000, height=4000, res=600)

plot_cashflow(mcSimulation_object = frost_protection_mc_simulation_scenario_Rhineland_100000,
              cashflow_var_name =c("yieldflow_no_protection",
                                   "yieldflow_frostbuster",
                                   "yieldflow_ov_irrigation",
                                   "yieldflow_stationary_windmachine",
                                   "yieldflow_heaters",
                                   "yieldflow_candles",
                                   "yieldflow_ut_irrigation",
                                   "yieldflow_frostguard",
                                   "yieldflow_mobile_windmachine") ,
              x_axis_name = "Years with intervention",
              y_axis_name = "Annual yield in kg/ha",
              facet_labels = c("yieldflow_no_protection"= "No protection",
                               "yieldflow_frostbuster" ="Trailed gas heater",
                               "yieldflow_ov_irrigation"="Overhead irrigation",
                               "yieldflow_stationary_windmachine"="Stationary wind machine",
                               "yieldflow_heaters"="Pellet heaters",
                               "yieldflow_candles"="Candles",
                               "yieldflow_ut_irrigation"="Below-canopy irrigation",
                               "yieldflow_frostguard"="Portable gas heater",
                               "yieldflow_mobile_windmachine"="Mobile wind machine"))+
  ggtitle("Scenario Rhineland")+
  theme(axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15),
        plot.title = element_text(size = 15, hjust = 0.5))+
  scale_fill_manual(values=c("5 to 95" = "#bee9d2", "25 to 75" = "#3fbf79"))
dev.off()


#Lake Constance
png("Supporting_information_Yieldflow_Lake_Constance.png", pointsize=10, width=6000, height=4000, res=600)

plot_cashflow(mcSimulation_object = frost_protection_mc_simulation_scenario_Lake_Constance_100000,
              cashflow_var_name =c("yieldflow_no_protection",
                                   "yieldflow_frostbuster",
                                   "yieldflow_ov_irrigation",
                                   "yieldflow_stationary_windmachine",
                                   "yieldflow_heaters",
                                   "yieldflow_candles",
                                   "yieldflow_ut_irrigation",
                                   "yieldflow_frostguard",
                                   "yieldflow_mobile_windmachine") ,
              x_axis_name = "Years with intervention",
              y_axis_name = "Annual yield in kg/ha",
              facet_labels = c("yieldflow_no_protection"= "No protection",
                               "yieldflow_frostbuster" ="Trailed gas heater",
                               "yieldflow_ov_irrigation"="Overhead irrigation",
                               "yieldflow_stationary_windmachine"="Stationary wind machine",
                               "yieldflow_heaters"="Pellet heaters",
                               "yieldflow_candles"="Candles",
                               "yieldflow_ut_irrigation"="Below-canopy irrigation",
                               "yieldflow_frostguard"="Portable gas heater",
                               "yieldflow_mobile_windmachine"="Mobile wind machine"))+
  ggtitle("Scenario Lake Constance")+
  theme(axis.text = element_text(colour = "black"),
        text = element_text(family = "sans", size = 15),
        plot.title = element_text(size = 15, hjust = 0.5))+
  scale_fill_manual(values=c("5 to 95" = "#ffeac2", "25 to 75" = "#ffa600"))
dev.off()