plot.BchronCalibratedDates <-
function(x,
         withPositions=FALSE,
         pause=FALSE,
         dateHeight = 30,
         borderCol = NULL,
         fillCol = 'gray',
         withHDR = TRUE,
         hdrCol = 'darkgray',
         ...) {

  # Get extra arguments if provided
  ex = list(...)#as.list(substitute(list(...)))[-1L]

  if(is.null(ex$xlab)) ex$xlab = 'Age'
  if(is.null(ex$ylab)) ex$ylab = ifelse(withPositions,'Position','Density')

  # First plot for individual dates
  if(length(x)==1) {
    ag = x[[1]]$ageGrid
    den = x[[1]]$densities
    ex$x = ag
    ex$y = den
    ex$type = 'l'
    if(is.null(ex$main)) ex$main = names(x)
    args = utils::modifyList(ex, list(...))
    do.call("plot", args)
    graphics::mtext(paste(x[[1]]$calCurves),side=1,line=4,adj=0,cex=0.6)
    if(withHDR) {
      my_hdr = hdr(x[[1]])
      for(j in 1:length(my_hdr)) {
        x_seq = seq(my_hdr[[j]][1], my_hdr[[j]][2], by = 1)
        y_lookup = match(x_seq, ag)
        y_seq = den[y_lookup]
        graphics::polygon(c(my_hdr[[j]][1], x_seq, my_hdr[[j]][2]),
                          c(0, y_seq, 0),
                          col = hdrCol,
                          border = NA)
      }
    }

  }

  # Now for multiple dates without depths
  if(length(x)>1 & withPositions==FALSE) {
    for(i in 1:length(x)) {
      ex_curr = ex
      ag = x[[i]]$ageGrid
      den = x[[i]]$densities
      ex_curr$x = ag
      ex_curr$y = den
      ex_curr$type = 'l'
      if(is.null(ex_curr$main)) ex_curr$main = names(x)[i]
      args = utils::modifyList(ex_curr, list(...))
      do.call("plot", args)
      graphics::mtext(paste(x[[i]]$calCurves),side=1,line=4,adj=0,cex=0.6)
      if(withHDR) {
        my_hdr = hdr(x[[i]])
        for(j in 1:length(my_hdr)) {
          x_seq = seq(my_hdr[[j]][1], my_hdr[[j]][2], by = 1)
          y_lookup = match(x_seq, ag)
          y_seq = den[y_lookup]
          graphics::polygon(c(my_hdr[[j]][1], x_seq, my_hdr[[j]][2]),
                            c(0, y_seq, 0),
                            col = hdrCol,
                            border = NA)
        }
      }
      if(pause) if(i<length(x)) readline('Hit Enter for next plot...')
    }
  }

  # Finally for multiple dates with depths
  if(length(x)>1 & withPositions==TRUE) {
    xlimits = NULL
    ylimits = NULL
    for(i in 1:length(x)) {
      xlimits = range(c(xlimits,x[[i]]$ageGrid))
      ylimits = range(c(ylimits,x[[i]]$positions))
    }
    #dateHeight=0.2*diff(pretty(ylimits))[1]
    ylimits[1] = ylimits[1]-dateHeight
    if(is.null(ex$xlim)) ex$xlim = rev(xlimits)
    if(is.null(ex$ylim)) ex$ylim = rev(ylimits)
    ex$x = ex$y = 1
    ex$type = 'n'
    if(is.null(ex$main)) ex$main = 'Calibrated dates by position'
    args = utils::modifyList(ex, list(...))
    do.call("plot", args)

    for(i in 1:length(x)) {
      curr_xlimit = range(x[[i]]$ageGrid)
      curr_pos = x[[i]]$positions
      graphics::polygon(c(curr_xlimit[1], x[[i]]$ageGrid, curr_xlimit[2]),
                        c(curr_pos, x[[i]]$positions-x[[i]]$densities*dateHeight/max(x[[i]]$densities), curr_pos),
                        border=ifelse(is.null(borderCol),NA,borderCol),
                        col=fillCol)
    }
  }

}
