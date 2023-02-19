start=int(input('Nhập thời gian bắt đầu: '))
end=int(input('Nhập thời gian kết thúc: '))
t=0
if start<14 and end<14:
    t=end-start
    t*=10000
    print('Số tiền phải trả khi gửi trẻ từ', start,'h đến', end,'h là:', t)
elif start>14 and end>14:
    t=(end-start)*15000
    print('Số tiền phải trả khi gửi trẻ từ', start,'h đến', end,'h là:', t)
elif start<14 and end>14:
    t= ((14-start)*10000)+((end-14)*15000)
    print('Số tiền phải trả khi gửi trẻ từ', start,'h đến', end,'h là:', t)