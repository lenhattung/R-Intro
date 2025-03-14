
### Các bài tập ######################################################################
### Sử dụng bộ dữ liệu có sẵn CO2 cho các nhiệm vụ sau:
# 1. In giá trị CO2 uptake từ lớn nhất đến nhỏ nhất.
# 2. Hiển thị các dòng của bộ dữ liệu CO2 có Type là Quebec và Treatment là chilled.
# 3. Hiển thị các dòng của bộ dữ liệu CO2 có uptake lớn hơn 40 và 
# được sắp xếp theo giá trị conc từ nhỏ nhất đến lớn nhất.
# Điểm thưởng nếu giữ toàn bộ mã trong một dòng duy nhất. Nếu cần tạo
# một đối tượng trung gian, hãy đặt tên là 'temp'.
# 4. Làm thế nào để sắp xếp ngẫu nhiên bộ dữ liệu CO2? GỢI Ý: Bạn có thể cần tạo
# một vector với các chỉ số ngẫu nhiên từ kết quả của order(runif(...)).
# Tham khảo phần "Picking random rows from data".
# Điểm thưởng nếu viết mã trong một dòng duy nhất không có đối tượng trung gian.
### Chạy mã này trước khi thực hiện các nhiệm vụ tiếp theo
set.seed(123)
missCO2 <- CO2
missCO2[c(as.integer(runif(10)*nrow(missCO2)),14:16),"uptake"] <- NA
missCO2[c(as.integer(runif(10)*nrow(missCO2)),14:16),"conc"] <- NA
missCO2$weight <- paste0(as.integer(runif(nrow(missCO2))*30),"kg")
# 5. Hiển thị các dòng của bộ dữ liệu missCO2 có ít nhất một giá trị bị thiếu.
# 6. Điền các giá trị uptake bị thiếu với giá trị 20.
# 7. Điền các giá trị conc bị thiếu với giá trị trung bình của conc.
# 8. Trích xuất giá trị số từ biến weight và lưu trong cột mới
# "weightNumber". Điểm thưởng nếu giữ mã trong một dòng,
# không sử dụng đối tượng trung gian nào.


#######################
### Các bài tập ######################################################################
### Sử dụng bộ dữ liệu có sẵn CO2 cho các nhiệm vụ sau:
# 1. In giá trị CO2 uptake từ lớn nhất đến nhỏ nhất.
CO2
sort(CO2$uptake)
sort(CO2$uptake, decreasing = TRUE)
# 2. Hiển thị các dòng của bộ dữ liệu CO2 có Type là Quebec và Treatment là chilled.
CO2[CO2$Type=="Quebec" & CO2$Treatment=="chilled",]
# 3. Hiển thị các dòng của bộ dữ liệu CO2 có uptake lớn hơn 40 và 
# được sắp xếp theo giá trị conc từ nhỏ nhất đến lớn nhất.
# Điểm thưởng nếu giữ toàn bộ mã trong một dòng duy nhất. Nếu cần tạo
# một đối tượng trung gian, hãy đặt tên là 'temp'.
temp<-CO2[order(CO2$conc),]
temp[temp$uptake>40,]


CO2[order(CO2$conc),][CO2[order(CO2$conc),]$uptake>40,]

# 4. Làm thế nào để sắp xếp ngẫu nhiên bộ dữ liệu CO2? GỢI Ý: Bạn có thể cần tạo
# một vector với các chỉ số ngẫu nhiên từ kết quả của order(runif(...)).
# Tham khảo phần "Picking random rows from data".
# Điểm thưởng nếu viết mã trong một dòng duy nhất không có đối tượng trung gian.
CO2[order(runif(nrow(CO2))),]


### Chạy mã này trước khi thực hiện các nhiệm vụ tiếp theo
set.seed(123)
missCO2 <- CO2
missCO2[c(as.integer(runif(10)*nrow(missCO2)),14:16),"uptake"] <- NA
missCO2[c(as.integer(runif(10)*nrow(missCO2)),14:16),"conc"] <- NA
missCO2$weight <- paste0(as.integer(runif(nrow(missCO2))*30),"kg")
missCO2

# 5. Hiển thị các dòng của bộ dữ liệu missCO2 có ít nhất một giá trị bị thiếu.
missCO2[!complete.cases(missCO2),]
# Giải thích:
# - complete.cases(missCO2) trả về TRUE cho các dòng không có giá trị NA
# - Toán tử ! phủ định kết quả, trả về TRUE cho các dòng có ít nhất một giá trị NA
# - missCO2[chỉ số, ] chọn các dòng thỏa mãn điều kiện

# 6. Điền các giá trị uptake bị thiếu với giá trị 20.
missCO2[is.na(missCO2$uptake),"uptake"]<-20
missCO2[is.na(missCO2$uptake),]

# 7. Điền các giá trị conc bị thiếu với giá trị trung bình của conc.
mean(missCO2$conc, na.rm = TRUE)

missCO2[is.na(missCO2$conc), "conc"] <- mean(missCO2$conc, na.rm = TRUE)
missCO2[is.na(missCO2$conc), ] 


# 8. Trích xuất giá trị số từ biến weight và lưu trong cột mới
# "weightNumber". Điểm thưởng nếu giữ mã trong một dòng,
# không sử dụng đối tượng trung gian nào.

missCO2$weightNumber <- as.numeric(sub( "kg", "", missCO2$weight))

missCO2$weightNumber2 <- as.numeric(substring(missCO2$weight, 1, nchar(missCO2$weight)-2))


# Lưu DATA FRAME vào một tệp CSV
write.csv(missCO2, "missCO2.csv", row.names = TRUE)

# Lưu DATA FRAME vào một tệp RDS (định dạng R)
saveRDS(missCO2, "missCO2.rds")

# Lưu nhiều đối tượng vào một tệp RData
# save(iris, mtcars, file = "multiple_datasets.RData")

