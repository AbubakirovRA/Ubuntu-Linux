
# Список сетевых адаптеров
ls /sys/class/net

sudo ip -s addr show enp0s3

ip route delete default via 192.168.0.254

ip route add default via 192.168.0.254 dev enp0s3



# Добавляем IP к интерфейсу
sudo ip addr add 192.168.0.9/255.255.255.0 broadcast 192.168.0.255 dev enp0s3

sudo ip route show



# Прописываем дефолтный маршрут
sudo ip route add default via 192.168.0.254
