
nimble install cligen
echo "building"
nim compile --run -o:dist/gitdist -d:ssl src/gitdist

echo "finshied"