import binascii
#from Tkinter import Tk
#from tkinter.filedialog import askopenfilename

#Tk().withdraw()
#file_path = askopenfilename()
text_file = open("Output.txt", "w")
text_file2 = '20200116anu'

chunk_size = 40
with open(text_file2, 'rb') as f:
    while True:
        data = f.read(chunk_size)
        if not data:
            break
        hexa = binascii.b2a_uu(data)
        hexa_string = hexa.decode('ascii')
        text_file.write(hexa_string)

text_file.close()
