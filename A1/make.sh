python genarealight.py > arrowlight.rib
cd shaders
rm -rf *.slo
shader *.sl
cd ..
prman -d x11 droids.rib	