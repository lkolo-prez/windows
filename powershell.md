
Krok 1: Uruchomienie programu PowerShell
- Aby uruchomić PowerShell, otwórz menu Start i wpisz "PowerShell" w polu wyszukiwania.
- Kliknij na aplikację "Windows PowerShell" lub "Windows PowerShell ISE" (Integrated Scripting Environment) - narzędzie z bardziej rozbudowanym interfejsem.

Krok 2: Poznanie podstawowej składni
- PowerShell wykorzystuje składnię opartą na komendach, zwanych cmdletami (czytaj: "command-let").
- Cmdlety mają strukturę "Verb-Noun", gdzie "Verb" oznacza działanie, a "Noun" określa na jakim obiekcie działa.
  Na przykład: Get-Process (pobierz procesy), Set-Location (ustaw lokalizację), Get-Help (uzyskaj pomoc), itd.

Krok 3: Wykonanie prostych poleceń
- Możesz wpisywać proste komendy, na przykład: Get-Date (pobierz aktualną datę), Get-Process (pobierz listę działających procesów), Get-Service (pobierz listę usług systemowych), itp.
- Aby wykonać polecenie, po prostu wpisz je i naciśnij klawisz Enter.
- Wyniki będą wyświetlane na ekranie.

Krok 4: Przekazywanie parametrów do cmdletów
- Cmdlety mogą przyjmować parametry, które zmieniają ich działanie.
- Na przykład, polecenie Get-Process może przyjąć parametr -Name, aby wyszukać procesy o określonej nazwie: Get-Process -Name "notepad".
- Parametry są określane przez myślnik (-) przed nazwą parametru, a następnie podajesz wartość po spacji.

Krok 5: Praca z zmiennymi
- W PowerShell można tworzyć zmienne, które przechowują dane.
- Aby przypisać wartość do zmiennej, użyj operatora przypisania (=). Na przykład: $mojaZmienna = "Hello, World!".
- Możesz używać zmiennych w późniejszych poleceniach, np. Write-Host $mojaZmienna.

Krok 6: Pisanie skryptów PowerShell
- PowerShell umożliwia pisanie skryptów, czyli zbioru poleceń zapisanych w pliku.
- Otwórz edytor tekstu (na przykład Notatnik) i zapisz plik ze skryptem z rozszerzeniem ".ps1".
- Wpisz swoje polecenia w pliku skryptowym, na przykład: Write-Host "To jest mój pierwszy skrypt PowerShell!".
- Aby uruchomić skrypt, wpisz ścieżkę do pliku skryptowego w PowerShell i naciśnij Enter.


Powodzenia w nauce PowerShell!
