import tkinter as tk
from tkinter import ttk


class ServerNamer:
    def __init__(self):
        self.rodzaj_mapping = {
            'F': 'Fizyczna',
            'V': 'Wirtualna',
            'D': 'Docker kontener',
            'C': 'Chmurowa',
        }
        self.typ_mapping = {
            'PROD': 'Produkcyjny',
            'DEV': 'Developerski',
            'CLI': 'Kliencki',
            'TEST': 'Testowy'
        }
        self.miasto_mapping = {
            'OPO': 'Opole',
            'WAW': 'Warszawa',
            'WYS': 'WYSOWA-ZDROJ',
            'KRK': 'KRAKOW'
        }
        self.wlasciciel_mapping = {
            'AIR': 'AIRLAN',
            'AKT': 'AKOLOTECH',
            'LKP': 'ŁUKASZ KOŁODZIEJ',
            'MKP': 'MARIUSZ KOŁODZIEJ',
            'SLO': 'STEFAN OLESZKO',
            'JDU': 'JAKUB DUDA',
            'DLA': 'DAWID LAKWA',
            'ADE': 'ALEX DEBOWSKI',
            'WCA': 'WIKTOR CALUS',
            'BBO': 'BARTEK BODUCH',
            'MKU': 'MIŁOSZ KUBICZ'
        }
        self.system_mapping = {
            'W10': 'Windows 10',
            'W11': 'Windows 11',
            'WS12': 'Windows Server 2012',
            'WS16': 'Windows Server 2016',
            'WS19': 'Windows Server 2019',
            'WS22': 'Windows Server 2022',
            'LU16': 'Linux Ubuntu 16.04 LTS',
            'LU18': 'Linux Ubuntu 18.04 LTS',
            'LU20': 'Linux Ubuntu 20.04 LTS',
            'LU22': 'Linux Ubuntu 22.04 LTS',
            'LD8': 'Linux Debian 8 LTS',
            'LD9': 'Linux Debian 9 LTS',
            'LD10': 'Linux Debian 10 LTS'
        }
        self.zastosowanie_mapping = {
            'APP': 'Aplikacyjny',
            'OPS': 'Operacyjny',
            'K8S': 'Kubernetes',
            'DNS': 'Serwer DNS',
            'STU': 'Do nauki',
            'DB': 'Bazodanowy',
            'WEB': 'Webowy',
            'VMH': 'Host Maszyn Wirtualnych'
        }

    def decode_server_name(self, server_name):
        rodzaj = self.rodzaj_mapping.get(server_name[1])
        typ = self.typ_mapping.get(server_name[0])
        miasto = self.miasto_mapping.get(server_name[4:7])
        wlasciciel = self.wlasciciel_mapping.get(server_name[7:10])
        system = self.system_mapping.get(server_name[10:12])
        zastosowanie = self.zastosowanie_mapping.get(server_name[12:15])
        numer = server_name[15:]

        return f'{rodzaj} {typ} {miasto} {wlasciciel} {system} {zastosowanie} numer {numer}'

    def encode_server_data(self, rodzaj, typ, miasto, wlasciciel, system, zastosowanie, numer):
        typ_code = next((k for k, v in self.typ_mapping.items() if v == typ), None)
        rodzaj_code = next((k for k, v in self.rodzaj_mapping.items() if v == rodzaj), None)
        miasto_code = next((k for k, v in self.miasto_mapping.items() if v == miasto), None)
        wlasciciel_code = next((k for k, v in self.wlasciciel_mapping.items() if v == wlasciciel), None)
        system_code = next((k for k, v in self.system_mapping.items() if v == system), None)
        zastosowanie_code = next((k for k, v in self.zastosowanie_mapping.items() if v == zastosowanie), None)

        server_name = f'{rodzaj_code}{typ_code}{miasto_code}{wlasciciel_code}{system_code}{zastosowanie_code}{numer}'

        return server_name


class ServerNamerGUI:
    def __init__(self, root):
        self.root = root
        self.root.title("Narzędzie do nazewnictwa serwerów")

        # Ramka wyświetlająca rozwiązanie nazwy serwera
        self.result_frame = ttk.LabelFrame(self.root, text="Rozwiązanie nazwy serwera")
        self.result_frame.pack(padx=10, pady=10, fill=tk.BOTH, expand=True)

        self.result_label = ttk.Label(self.result_frame, wraplength=300)
        self.result_label.pack(padx=10, pady=10)

        # Ramka tworzenia nazwy serwera
        self.create_frame = ttk.LabelFrame(self.root, text="Tworzenie nazwy serwera")
        self.create_frame.pack(padx=10, pady=10)

        # Typ serwera
        self.typ_label = ttk.Label(self.create_frame, text="Typ:")
        self.typ_label.grid(row=0, column=0, padx=5, pady=5, sticky=tk.E)

        self.typ_combobox = ttk.Combobox(self.create_frame, values=["Produkcyjny", "Developerski", "Kliencki", "Testowy"])
        self.typ_combobox.grid(row=0, column=1, padx=5, pady=5, sticky=tk.W)

        # Rodzaj serwera
        self.rodzaj_label = ttk.Label(self.create_frame, text="Rodzaj:")
        self.rodzaj_label.grid(row=1, column=0, padx=5, pady=5, sticky=tk.E)

        self.rodzaj_combobox = ttk.Combobox(self.create_frame, values=["Fizyczna", "Wirtualna", "Docker kontener", "Chmurowa"])
        self.rodzaj_combobox.grid(row=1, column=1, padx=5, pady=5, sticky=tk.W)

        # Miasto
        self.miasto_label = ttk.Label(self.create_frame, text="Miasto:")
        self.miasto_label.grid(row=2, column=0, padx=5, pady=5, sticky=tk.E)

        self.miasto_combobox = ttk.Combobox(self.create_frame, values=["Opole", "Warszawa", "WYSOWA-ZDROJ", "KRAKOW"])
        self.miasto_combobox.grid(row=2, column=1, padx=5, pady=5, sticky=tk.W)

        # Właściciel
        self.wlasciciel_label = ttk.Label(self.create_frame, text="Właściciel:")
        self.wlasciciel_label.grid(row=3, column=0, padx=5, pady=5, sticky=tk.E)

        self.wlasciciel_combobox = ttk.Combobox(self.create_frame, values=["AIRLAN", "AKOLOTECH", "ŁUKASZ KOŁODZIEJ", "MARIUSZ KOŁODZIEJ", "STEFAN OLESZKO", "JAKUB DUDA", "DAWID LAKWA", "ALEX DEBOWSKI", "WIKTOR CALUS", "BARTEK BODUCH", "MIŁOSZ KUBICZ"])
        self.wlasciciel_combobox.grid(row=3, column=1, padx=5, pady=5, sticky=tk.W)

        # System
        self.system_label = ttk.Label(self.create_frame, text="System:")
        self.system_label.grid(row=4, column=0, padx=5, pady=5, sticky=tk.E)

        self.system_combobox = ttk.Combobox(self.create_frame, values=["Windows 10", "Windows 11", "Windows Server 2012", "Windows Server 2016", "Windows Server 2019", "Windows Server 2022", "Linux Ubuntu 16.04 LTS", "Linux Ubuntu 18.04 LTS", "Linux Ubuntu 20.04 LTS", "Linux Ubuntu 22.04 LTS", "Linux Debian 8 LTS", "Linux Debian 9 LTS", "Linux Debian 10 LTS"])
        self.system_combobox.grid(row=4, column=1, padx=5, pady=5, sticky=tk.W)

        # Zastosowanie
        self.zastosowanie_label = ttk.Label(self.create_frame, text="Zastosowanie:")
        self.zastosowanie_label.grid(row=5, column=0, padx=5, pady=5, sticky=tk.E)

        self.zastosowanie_combobox = ttk.Combobox(self.create_frame, values=["Aplikacyjny", "Operacyjny", "Kubernetes", "Serwer DNS", "Do nauki", "Bazodanowy", "Webowy", "Host Maszyn Wirtualnych"])
        self.zastosowanie_combobox.grid(row=5, column=1, padx=5, pady=5, sticky=tk.W)

        # Numeracja
        self.numer_label = ttk.Label(self.create_frame, text="Numeracja:")
        self.numer_label.grid(row=6, column=0, padx=5, pady=5, sticky=tk.E)

        self.numer_entry = ttk.Entry(self.create_frame)
        self.numer_entry.grid(row=6, column=1, padx=5, pady=5, sticky=tk.W)

        # Przycisk tworzenia nazwy serwera
        self.create_button = ttk.Button(self.create_frame, text="Utwórz nazwę", command=self.create_server_name)
        self.create_button.grid(row=7, column=0, columnspan=2, padx=5, pady=5)

        # Przycisk dekodowania nazwy serwera
        self.decode_button = ttk.Button(self.result_frame, text="Dekoduj nazwę", command=self.decode_server_name)
        self.decode_button.pack(padx=10, pady=10)

    def create_server_name(self):
        rodzaj = self.rodzaj_combobox.get()
        typ = self.typ_combobox.get()
        miasto = self.miasto_combobox.get()
        wlasciciel = self.wlasciciel_combobox.get()
        system = self.system_combobox.get()
        zastosowanie = self.zastosowanie_combobox.get()
        numer = self.numer_entry.get()

        namer = ServerNamer()
        server_name = namer.encode_server_data(rodzaj, typ, miasto, wlasciciel, system, zastosowanie, numer)
        self.result_label.configure(text=server_name)

    def decode_server_name(self):
        server_name = self.result_label.cget("text")

        namer = ServerNamer()
        decoded_name = namer.decode_server_name(server_name)
        self.result_label.configure(text=decoded_name)


# Tworzenie okna głównego
root = tk.Tk()
app = ServerNamerGUI(root)
root.mainloop()
