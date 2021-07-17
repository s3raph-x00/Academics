import os
import sys

CHUNK_SIZE = 256
file_number = 1


os.mkdir("20200116_broken")
os.chdir("20200116_broken")
with open("../20200116anuhex.txt") as f:
    chunk = f.read(CHUNK_SIZE)
    while chunk:
		filename = ('20200116anuhex_' + str(file_number))
		with open(filename,"w+") as chunk_file:
			chunk_file.write(chunk)
		file_number += 1
		chunk = f.read(CHUNK_SIZE)
