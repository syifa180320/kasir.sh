#!/bin/bash
#menampilkan daftar menu makanan dan minuman beserta harga
echo "=== MENU WARUNG MAKAN ==="
echo "1. Nasi Goreng	- Rp15000"
echo "2. Mie Goreng	- Rp12000"
echo "3. Sate Ayam	- Rp18000"
echo "4. Teh Manis	- Rp5000"
echo "5. Es Jeruk	- Rp6000"

#meminta jumlah item yang ingin dibeli
echo -n "berapa item yang ingin dibeli? "
read jumlah
total_harga=0

#loop untuk memilih jumlah item yang ingin dibeli
for ((i=1; i<=jumlah; i++));
do
	echo "item ke-$i: " #perintah untuk menampilkan jumnlah item yang ingin dibeli
	echo -n "pilih menu (1-5): " #perintah untuk memilih nomor menu yang dipilih
	read pilih_menu #menyimpan pilih_menu
	echo -n "jumlah porsi: "  #perintah untuk memasukkan jumlah porsi
	read porsi #simpan jumlah porsi
	
	#menentukan harga berdasarkan menu yang dipilih
	case $pilih_menu in
		1) harga=15000 ;;
		2) harga=12000 ;;
		3) harga=18000 ;;
		4) harga=5000 ;;
		5) harga=6000 ;;
		*) echo "nomor tidak valid"; exit 1 ; #untuk mengatasi nomor yang dimasukkan tidak valid atau tidak sesuai, maka otomatis akan keluar dari program
	esac
	subtotal=$((harga * porsi)) #hitung subtotal
	total_belanja=$((total_belanja + subtotal)) #hitung total belanja dari semua item dengan menambahkan subtotal 
done

#perintah untuk menampilkan total belanja
echo "total belanja: Rp$total_belanja"

#perintah untuk memasukkan  jumlah uang yang dibayarkan oleh pelanggan
echo -n "Masukkan jumlah uang: "
read uang

#menghitung dan menampilkan kembalian
if [ $uang -ge $total_belanja ]; then kembalian=$((uang - total_belanja))
	echo "kembalian: Rp$kembalian"
	echo "terimakasih telah berbelanja!"
else
	echo "uang tidak cukup!" #untuk menampilkan pesan jika uang tidak cukup
fi
