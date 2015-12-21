python generate_hardcode.py > geo_hardcode
python install.py > compile_sc_py.ml
sh compile_sc_py.sh
chmod +x geo
rm compile_sc_py.ml
rm geo_hardcode