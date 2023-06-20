hola <- function() {
  
  a <- readline(prompt = "Select from the following: Year / Seasonality / Week / Hour / Month")
  
  if (a == "Year") {    
    b <- readline(prompt = "By which year? (2007 / 2008 / 2009) ")
    if (b == "2007") {
      print(year_2007)
    } else if (b == "2008") {
      print(year_2008)
    } else if (b == "2009") {
      print(year_2009)
    }
  }
  
  if (a == "Seasonality") { 
    c <- readline(prompt = "By which sub-meter? (1 - Kitchen, 2 - Laundry or 3 - Water & AC) ")
    d <- readline(prompt = "By which year? (2007, 2008 or 2009) ")
    if (c == "1" && d == "2007") {
      print(kitchen_season_2007)
    } else if (c == "2" && d == "2007") {
      print(laundry_season_2007)
    } else if (c == "3" && d == "2007") {
      print(water_season_2007)
    } else if (c == "1" && d == "2008") {
      print(kitchen_season_2008)
    } else if (c == "2" && d == "2008") {
      print(laundry_season_2008)
    } else if (c == "3" && d == "2008") {
      print(water_season_2008)
    } else if (c == "1" && d == "2009") {
      print(kitchen_season_2009)
    } else if (c == "2" && d == "2009") {
      print(laundry_season_2009)
    } else if (c == "3" && d == "2009") {
      print(water_season_2009)
    }
  }
  
  if (a == "Week") {
    d <- readline(prompt="By what year? (2007 / 2008 / 2009) ")
    if (d == "2007") {
      print(weekday_2007)
    } else if (d == "2008") {
      print(weekday_2008)
    } else if (d == "2009") {
      print(weekday_2009)
    }
  }
  
  if(a == "Hour") { 
    e <- readline(prompt="By what year? (2007 / 2008 / 2009) ")
    f <- readline(prompt="By which Sub-meter? (1-Kitchen, 2-Laundry or 3-Water) ")
    if (e == "2007") {
      print(hour_2007)
    } else if (e == "2008") {
      print(hour_2008)
    } else if (e == "2009") {
      print(hour_2009)
    }  
    if (e == "2007") {
      if (f=="1-Kitchen") {
        print(ly_2007)
      } else if (f=="2-Laundry") {
        print(lyy_2007)
      } else if (f=="3-Water") {
        print(lyyy_2007)
      }
    } else if (e == "2008") {
      if (f=="1-Kitchen") {
        print(ly_2008)
      } else if (f=="2-Laundry") {
        print(lyy_2008)
      } else if (f=="3-Water") {
        print(lyyy_2008)
      }
    } else if (e == "2009")
      if (f=="1-Kitchen") {
        print(ly_2009)
      } else if (f=="2-Laundry") {
        print(lyy_2009)
      } else if (f=="3-Water") {
        print(lyyy_2009)
      }
  }
  
  if (a == "Month") { 
    g <- readline(prompt = "By which sub-meter? (1 - Kitchen, 2 - Laundry or 3 - Water & AC) ")
    h <- readline(prompt = "By which year? (2007, 2008 or 2009) ")
    if (g == "1 - Kitchen" && h == "2007") {
      print(thly_2007)
    } else if (g == "2 - Laundry" && h == "2007") {
      print(thlyy_2007)
    } else if (g == "3 - Water & AC" && h == "2007") {
      print(thlyyy_2007)
    } else if (g == "1 - Kitchen" && h == "2008") {
      print(thly_2008)
    } else if (g == "2 - Laundry" && h == "2008") {
      print(thlyy_2008)
    } else if (g == "3 - Water & AC" && h == "2008") {
      print(thlyyy_2008)
    } else if (g == "1 - Kitchen" && h == "2009") {
      print(thly_2009)
    } else if (g == "2 - Laundry" && h == "2009") {
      print(thlyy_2009)
    } else if (g == "3 - Water & AC" && h == "2009") {
      print(thlyyy_2009)
    }
  }
}


hola()
    

weekday_2007
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    



