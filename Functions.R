#VIP Table####

VIP_table<-function (plsrResults, input_table = NULL, cut_off_line = 1, 
          threshold = 0.8, x_axis_name = "Variable Importance in Projection", 
          y_axis_name = NULL, legend_name = "Coefficient", legend_labels = c("Positive", 
                                                                             "Negative"), pos_color = "cadetblue", neg_color = "firebrick", 
          base_size = 11, ...) 
{
  assertthat::assert_that(class(plsrResults) == "mvr", 
                          msg = "plsrResults is not class 'mvr', please provide a valid object. This does not appear to have been generated with the 'plsr.mcSimulation' function.")
  VIP <- function(object) {
    if (object$method != "oscorespls") 
      stop("Only implemented for orthogonal scores algorithm.  Refit with 'method = \"oscorespls\"'")
    if (nrow(object$Yloadings) > 1) 
      stop("Only implemented for single-response models")
    SS <- c(object$Yloadings)^2 * colSums(object$scores^2)
    Wnorm2 <- colSums(object$loading.weights^2)
    SSW <- sweep(object$loading.weights^2, 2, SS/Wnorm2, 
                 "*")
    sqrt(nrow(SSW) * apply(SSW, 1, cumsum)/cumsum(SS))
  }
  if (plsrResults$ncomp == 1) 
    vipResult <- VIP(plsrResults)
  else vipResult <- VIP(plsrResults)["Comp 1", ]
  coef <- plsrResults$coefficients[, , 1]
  pls_outputs <- data.frame(Variable = names(vipResult), VIP = vipResult, 
                            Coefficient = coef)
  rownames(pls_outputs) <- NULL
  if (!(is.null(input_table))) 
    combined_table <- dplyr::left_join(pls_outputs, input_table, 
                                       by = c(Variable = "variable"))
  else combined_table <- pls_outputs
  filtered_table <- dplyr::filter(combined_table, VIP > threshold)
  if ("label" %in% colnames(filtered_table)) 
    ordered_vars <- stats::reorder(filtered_table$label, 
                                   filtered_table$VIP)
  else ordered_vars <- stats::reorder(filtered_table$Variable, 
                                      filtered_table$VIP)
  
  return(VIP_table_results=filtered_table)
  
}

#Violin Plot functions####

#normal case, using the quantile function
scenario_plot_Rhineland_Lake_Constance_violin_5_95<-function(results_Rhineland=results_data_Rhineland,
                                                             results_Lake_Constance=results_data_Lake_Constance,
                                                             vars=vars,
                                                             x_axis_name="value",
                                                             y_axis_name="option"){
  
  data_Rhineland <- dplyr::select(results_Rhineland, tidyselect::all_of(vars))
  Rhineland_quantiles <- quantile(data_Rhineland[,1], c(0.05, 0.95))
  
  mat = matrix(ncol = length(vars) , nrow = 90000) 
  df_Rhineland=data.frame(mat)
  colnames(df_Rhineland) = vars
  
  for(i in 1:length(vars)){
    Rhineland_quantiles <- quantile(data_Rhineland[,i], c(0.05, 0.95))
    
    df_Rhineland[,i]<- data_Rhineland[,i][data_Rhineland[,i] > Rhineland_quantiles[1] &                     # Drop values below/above percentiles
                                            data_Rhineland[,i] < Rhineland_quantiles[2]]
  }
  new_names <- names(df_Rhineland)
  results_Rhineland1 <- tidyr::pivot_longer(df_Rhineland, tidyselect::all_of(new_names))
  
  data_Lake_Constance <- dplyr::select(results_Lake_Constance, tidyselect::all_of(vars))
  Lake_Constance_quantiles <- quantile(data_Lake_Constance[,1], c(0.05, 0.95))
  
  mat = matrix(ncol = length(vars) , nrow = 90000) 
  df_Lake_Constance=data.frame(mat)
  colnames(df_Lake_Constance) = vars
  
  for(i in 1:length(vars)){
    Lake_Constance_quantiles <- quantile(data_Lake_Constance[,i], c(0.05, 0.95))
    
    df_Lake_Constance[,i]<- data_Lake_Constance[,i][data_Lake_Constance[,i] > Lake_Constance_quantiles[1] &                     # Drop values below/above percentiles
                                                      data_Lake_Constance[,i] < Lake_Constance_quantiles[2]]
  }
  new_names <- names(df_Lake_Constance)
  results_Lake_Constance1 <- tidyr::pivot_longer(df_Lake_Constance, tidyselect::all_of(new_names))
  
  
  results_Rhineland1$scenario<-rep("Rhineland", length(results_Rhineland1[1]))
  results_Lake_Constance1$scenario<-rep("Lake Constance", length(results_Lake_Constance1[1]))
  
  results_all_scenarios<-rbind(results_Rhineland1, results_Lake_Constance1)
  
  options(scipen = 999)
  return(
    
    ggplot(results_all_scenarios, aes(x = value,y = stats::reorder(name, value, FUN = stats::median), fill = factor(scenario , levels=c("Rhineland", "Lake Constance")))) +
      #scale_x_continuous(expand = ggplot2::expansion(mult = 0.01),labels = scales::comma) +
      #scale_y_continuous(expand = ggplot2::expansion(mult = 0.01),labels = scales::comma) +
      #ggplot2::scale_fill_manual(values = colors) + 
      labs(x = x_axis_name, y = y_axis_name) + 
      #ggplot2::theme_bw()+
      geom_violin(color="white",trim = TRUE)+
      geom_boxplot(outlier.alpha = 0.3, outlier.size = 0.5, width=0.2,position = position_dodge(width = 0.9), fatten=1)+
      #geom_boxplot(outlier.shape=NA, width=0.2,position = position_dodge(width = 0.9), fatten=1)+
      scale_fill_manual(values=c("#ffa600", "#3fbf79"),name="Location",limits = c("Lake Constance", "Rhineland"))+
      theme(  panel.border = element_blank(),
              panel.grid.major = element_blank(),
              panel.grid.minor = element_blank(),
              axis.line = element_line(colour = "black"),
              panel.background =element_blank(),
              axis.text = element_text(colour = "black"))
    
  )
}




#several items with the exact value of the quantile -> sorting to values and 
#tanking those between place 5001 and 95000 in the table
scenario_plot_Rhineland_Lake_Constance_violin_5_95_v2<-function(results_Rhineland=results_data_Rhineland,
                                                                results_Lake_Constance=results_data_Lake_Constance,
                                                                vars=vars,
                                                                x_axis_name="value",
                                                                y_axis_name="option"){
  
  data_Rhineland <- dplyr::select(results_Rhineland, tidyselect::all_of(vars))
  #Rhineland_quantiles <- quantile(data_Rhineland[,1], c(0.05, 0.95))
  
  mat = matrix(ncol = length(vars) , nrow = 90000) 
  df_Rhineland=data.frame(mat)
  colnames(df_Rhineland) = vars
  
  for(i in 1:length(vars)){
    data_Rhineland <-data_Rhineland[order(data_Rhineland[,i]),]
    df_Rhineland[,i]<- data_Rhineland[5001:95000,i]
  }
  new_names <- names(df_Rhineland)
  results_Rhineland1 <- tidyr::pivot_longer(df_Rhineland, tidyselect::all_of(new_names))
  
  data_Lake_Constance <- dplyr::select(results_Lake_Constance, tidyselect::all_of(vars))
  Lake_Constance_quantiles <- quantile(data_Lake_Constance[,1], c(0.05, 0.95))
  
  mat = matrix(ncol = length(vars) , nrow = 90000) 
  df_Lake_Constance=data.frame(mat)
  colnames(df_Lake_Constance) = vars
  
  for(i in 1:length(vars)){
    data_Lake_Constance <-data_Lake_Constance[order(data_Lake_Constance[,i]),]
    df_Lake_Constance[,i]<- data_Lake_Constance[5001:95000,i]
  }
  new_names <- names(df_Lake_Constance)
  results_Lake_Constance1 <- tidyr::pivot_longer(df_Lake_Constance, tidyselect::all_of(new_names))
  
  
  results_Rhineland1$scenario<-rep("Rhineland", length(results_Rhineland1[1]))
  results_Lake_Constance1$scenario<-rep("Lake Constance", length(results_Lake_Constance1[1]))
  
  results_all_scenarios<-rbind(results_Rhineland1, results_Lake_Constance1)
  
  options(scipen = 999)
  return(
    
    ggplot(results_all_scenarios, aes(x = value,y = stats::reorder(name, value, FUN = stats::median), fill = factor(scenario , levels=c("Rhineland", "Lake Constance")))) +
      #scale_x_continuous(expand = ggplot2::expansion(mult = 0.01),labels = scales::comma) +
      #scale_y_continuous(expand = ggplot2::expansion(mult = 0.01),labels = scales::comma) +
      #ggplot2::scale_fill_manual(values = colors) + 
      labs(x = x_axis_name, y = y_axis_name) + 
      #ggplot2::theme_bw()+
      geom_violin(color="white",trim = TRUE)+
      geom_boxplot(outlier.alpha = 0.3, outlier.size = 0.5, width=0.2,position = position_dodge(width = 0.9), fatten=1)+
      #geom_boxplot(outlier.shape=NA, width=0.2,position = position_dodge(width = 0.9), fatten=1)+
      scale_fill_manual(values=c("#ffa600", "#3fbf79"),name="Location",limits = c("Lake Constance", "Rhineland"))+
      theme(  panel.border = element_blank(),
              panel.grid.major = element_blank(),
              panel.grid.minor = element_blank(),
              axis.line = element_line(colour = "black"),
              panel.background =element_blank(),
              axis.text = element_text(colour = "black"))
    
  )
}
