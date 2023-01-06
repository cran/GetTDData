## ----example1-----------------------------------------------------------------
library(GetTDData)

asset.codes <- 'LTN'   # Identifier of assets 
cache_folder <- paste0(tempdir(), '/TD_cache')

my.flag <- download.TD.data(asset.codes = asset.codes, 
                            dl.folder = cache_folder)

my.df <- read.TD.files(dl.folder = cache_folder)

## ----plot.prices, fig.width=7, fig.height=2.5---------------------------------
library(ggplot2)
library(dplyr)

# filter  LTN 
my_asset_code <- "LTN 010123"
first_date <- as.Date("2015-01-01")

my.df <- my.df %>%
  filter(ref.date >= first_date)

LTN <- my.df %>%
  filter(asset.code  ==  my_asset_code,
         ref.date >= first_date)

p <- ggplot(data = LTN, 
            aes(x = as.Date(ref.date), 
                y = price.bid, 
                color = asset.code)) + 
  geom_line(size = 1) + scale_x_date() + labs(title = '', x = 'Dates')

print(p)

## ----plot.yield, fig.width=7, fig.height=2.5----------------------------------
p <- ggplot(data = LTN, 
            aes(x = as.Date(ref.date), 
                y = yield.bid, 
                color = asset.code)) + 
  geom_line(size = 1) + 
  scale_x_date() + 
  labs(title = '', 
       x = 'Dates')

print(p)

## ----example2_plots, fig.width=7, fig.height=2.5------------------------------
# plot data (prices)
p <- ggplot(data = my.df, 
            aes(x = as.Date(ref.date), y = price.bid, color = asset.code)) + 
  geom_line() + 
  scale_x_date() + 
  labs(title = '', x = 'Dates', y = 'Prices' )

print(p)

# plot data (yields)
p <- ggplot(data = my.df, 
            aes(x = as.Date(ref.date), y = yield.bid, color = asset.code)) + 
  geom_line() + 
  scale_x_date() + 
  labs(title = '', x = 'Dates', y = 'Yields' )

print(p)


