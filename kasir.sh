#!/bin/bash
#menampilkan daftar menu makanan dan minuman beserta harga
echo "=== MENU WARUNG MAKAN ==="
echo "1. Nasi Goreng	- Rp15000"
echo "2. Mie Goreng	- Rp12000"
echo "3. Sate Ayam	- Rp18000"
echo "4. Teh Manis	- Rp5000"
echo "5. Es Jeruk	- Rp6000"

echo -n "berapa item yang ingin dibeli? "
read jumlah
total_harga=0

#meminta jumlah item yang ingin dibeli
for ((i=1; i<=jumlah; i++));
do
	echo "item ke-$i: " 
	echo -n "pilih menu (1-5): " #input nomor menu
	read pilih_menu
	echo -n "jumlah porsi: "  #input jumlah porsi
	read porsi
	
	#menentukan harga berdasarkan menu yang dipilih
	case $pilih_menu in
		1) harga=15000 ;;
		2) harga=12000 ;;
		3) harga=18000 ;;
		4) harga=5000 ;;
		5) harga=6000 ;;
		*) echo "nomor tidak valid"; exit 1 ;
	esac
	subtotal=$((harga * porsi)) #hitung subtotal
	total_belanja=$((total_belanja + subtotal)) #hitung total belanja daari semua item
done

#input tampilan total belanja
echo "total belanja: Rp$total_belanja"

#input jumlah uang yang dibayarkan oleh pelanggan
echo -n "Masukkan jumlah uang: "
read uang

#menghitung dan menampilkan kembalian
if [ $uang -ge $total_belanja ]; then kembalian=$((uang - total_belanja))
	echo "kembalian: Rp$kembalian"
	echo "terimakasih telah berbelanja!"
else
	echo "uang tidak cukup!" #input untuk menampilkan pesan jika uang tidak cukup
fi
