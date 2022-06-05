install.packages("scatterplot3d")

library(scatterplot3d)
x = c(3.0, 6.0, 3.0, 6.0, 7.5, 7.5, 15.0)
u = c(10.0, 10.0, 20.0, 20.0, 5.0 ,10.0, 12.0)
y = c(4.56, 5.9, 6.7, 8.02, 7.7, 8.1, 6.1)

scatterplot3d(x,u,y, xlim = 0:15, ylim = 0:20, zlim = 0:10, pch = 20, type = "h")

m = lm(y ~ x + u)
coef(m)

s=scatterplot3d(x,u,y, xlim = 0:15, ylim = 0:20, zlim = 0:10, pch = 20, type = "h")

s$plane3d(m)
fitted(m)
residuals(m)
deviance(m)
deviance(m)/length(x)

nx = c(7.5, 5.0)
nu = c(15.0, 12.0)
new_data = data.frame(x = nx, u = nu)
ny = predict(m, new_data)
ny

s=scatterplot3d(nx,nu,ny, xlim = 0:15, ylim = 0:20, zlim = 0:10, pch = 20, type = "h", color = "red")
s$plane3d(m)
