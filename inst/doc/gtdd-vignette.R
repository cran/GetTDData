## ----example1------------------------------------------------------------
library(GetTDData)

asset.codes <- 'LTN'   # Identifier of assets 
maturity <- '010116'  # Maturity date as string (ddmmyy)

my.flag <- download.TD.data(asset.codes = asset.codes)

my.df <- read.TD.files(asset.codes = asset.codes,
                       maturity = maturity)


## ----plot.prices, fig.width=7, fig.height=2.5----------------------------
library(ggplot2)

p <- ggplot(data = my.df, aes(x = as.Date(ref.date), y = price.bid, color = asset.code))
p <- p + geom_line(size = 1) + scale_x_date() + labs(title = '', x = 'Dates')
print(p)

## ----plot.yield, fig.width=7, fig.height=2.5-----------------------------
p <- ggplot(data = my.df, aes(x = as.Date(ref.date), y = yield.bid, color = asset.code))
p <- p + geom_line(size = 1) + scale_x_date()+ labs(title = '', x = 'Dates' )
print(p)


## ----example2, fig.width=7, fig.height=2.5-------------------------------
library(GetTDData)
library(ggplot2)

asset.codes <- 'LTN'   # Name of asset
maturity <- NULL      # = NULL, downloads all maturities

# download data
my.flag <- download.TD.data(asset.codes = asset.codes, 
                            do.clean.up = F)

# reads data
my.df <- read.TD.files(asset.codes = asset.codes, 
                       maturity = maturity)

# plot data (prices)
p <- ggplot(data = my.df, aes(x = as.Date(ref.date), y = price.bid, color = asset.code))
p <- p + geom_line() + scale_x_date() + labs(title = '', x = 'Dates', y = 'Prices' )
print(p)

# plot data (yields)
p <- ggplot(data = my.df, aes(x = as.Date(ref.date), y = yield.bid, color = asset.code))
p <- p + geom_line() + scale_x_date() + labs(title = '', x = 'Dates', y = 'Yields' )
print(p)


